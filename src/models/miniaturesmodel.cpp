#include "miniaturesmodel.h"
#include <QFile>
#include <QGuiApplication>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QVariant>

MiniaturesModel::MiniaturesModel(QObject *parent)
    : QAbstractListModel{parent} {}

void MiniaturesModel::classBegin() {}

void MiniaturesModel::componentComplete() {
  if (!m_configurationFilePath.isEmpty()) {
    this->processFile();
  }
}

QUrl MiniaturesModel::configurationFilePath() const {
  return m_configurationFilePath;
}

void MiniaturesModel::setConfigurationFilePath(const QUrl &url) {
  if (m_configurationFilePath != url) {
    m_configurationFilePath = url;

    this->processFile();
    emit configurationFilePathChanged();
  }
}

QHash<int, QByteArray> MiniaturesModel::roleNames() const {
  return QHash<int, QByteArray>{
      {Roles::Type, "type"}, {Roles::Image, "image"}, {Roles::Name, "name"}};
}

int MiniaturesModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_miniatures.size();
}

QVariant MiniaturesModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();

  if (row < 0 || row > m_miniatures.size() - 1) {
    return QVariant();
  }

  switch (role) {
  case Roles::Type:
    return m_miniatures.at(row).type;
  case Roles::Image:
    return m_miniatures.at(row).image;
  case Roles::Name: {
    auto nameText = m_miniatures.at(row).name;
    return qGuiApp->translate("CardsData", nameText.toStdString().c_str());
  }
  default:
    return QVariant();
  }
}

void MiniaturesModel::processFile() {

  auto filePath = convertUrlToFilePath(m_configurationFilePath);

  QFile file;
  file.setFileName(filePath);
  QJsonDocument confFile;

  if (file.open(QIODevice::ReadOnly)) {
    QJsonParseError error;
    confFile = QJsonDocument::fromJson(file.readAll(), &error);
  }

  this->beginResetModel();
  m_miniatures.clear();
  //   Check the validity of file.
  if (!confFile.isNull()) {
    auto contentFile = confFile.object();
    if (contentFile.contains("miniatures") &&
        contentFile["miniatures"].isArray()) {
      QJsonArray miniaturesArray = contentFile["miniatures"].toArray();
      for (auto i = 0; i < miniaturesArray.size(); ++i) {
        if (miniaturesArray[i].isObject()) {
          auto miniatureObject = miniaturesArray[i].toObject();

          Miniature miniature;
          miniature.name = miniatureObject["name"].toString();
          miniature.type = miniatureObject["type"].toInt();
          miniature.image = miniatureObject["image"].toString();
          m_miniatures.append(miniature);
        }
      }
    }
  }
  this->endResetModel();
}

QString MiniaturesModel::convertUrlToFilePath(const QUrl &url) {
  // This function convert the url passed from qml in a valid resource path.
  if (url.scheme().compare(QLatin1String("qrc"), Qt::CaseInsensitive) == 0) {
    if (url.authority().isEmpty()) {
      return QLatin1Char(':') + url.path();
    }
  }
  return QString();
}
