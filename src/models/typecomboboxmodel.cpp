#include "typecomboboxmodel.h"
#include "card_data.h"

#include <QFile>
#include <QGuiApplication>
#include <QJsonArray>
#include <QJsonObject>
#include <QList>
#include <QVariant>

TypeComboBoxModel::TypeComboBoxModel(QObject *parent)
    : QAbstractListModel{parent} {}

TypeComboBoxModel::~TypeComboBoxModel() {}

void TypeComboBoxModel::classBegin() {}

void TypeComboBoxModel::componentComplete() {
  if (!m_configurationFile.isEmpty()) {
    this->processFile();
  }
}

QHash<int, QByteArray> TypeComboBoxModel::roleNames() const {
  return QHash<int, QByteArray>{
      {Roles::Key, "key"}, {Roles::Type, "type"}, {Roles::IconUrl, "iconUrl"}};
}

int TypeComboBoxModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_types.size();
}

QVariant TypeComboBoxModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();
  if (row < 0 || row >= m_types.size()) {
    return QVariant();
  }

  switch (role) {
  case Roles::Key:
    return row;
  case Roles::Type:
    return qGuiApp->translate("CardsData",
                              m_types.value(row).toStdString().c_str());
  case Roles::IconUrl:
    return m_typesIcon.value(row, "");
  default:
    return QVariant();
  }
}

QString TypeComboBoxModel::getTypeFromIndex(int index) const {
  return m_types.value(index);
}

QUrl TypeComboBoxModel::iconUrl(const int &type) const {
  QUrl url(m_typesIcon.value(type, ""));
  return url;
}

void TypeComboBoxModel::setConfigurationFilePath(const QUrl &url) {
  if (m_configurationFilePath != url) {
    m_configurationFilePath = url;
    auto filePath = convertUrlToFilePath(url);
    QFile file;
    file.setFileName(filePath);
    if (file.open(QIODevice::ReadOnly)) {
      QJsonDocument confFile;
      QJsonParseError error;
      confFile = QJsonDocument::fromJson(file.readAll(), &error);
      m_configurationFile = confFile;
    }

    this->processFile();
    emit configurationFilePathChanged();
  }
}

QString TypeComboBoxModel::convertUrlToFilePath(const QUrl &url) {
  // This function convert the url passed from qml in a valid resource path.
  if (url.scheme().compare(QLatin1String("qrc"), Qt::CaseInsensitive) == 0) {
    if (url.authority().isEmpty()) {
      return QLatin1Char(':') + url.path();
    }
  }
  return QString();
}

void TypeComboBoxModel::processFile() {
  m_types.clear();
  m_typesIcon.clear();
  // Check the validity of file.
  if (!m_configurationFile.isNull()) {
    auto contentFile = m_configurationFile.object();

    if (contentFile.contains("cards_types") &&
        contentFile["cards_types"].isArray()) {
      QJsonArray typesArray = contentFile["cards_types"].toArray();
      for (auto i = 0; i < typesArray.size(); ++i) {
        if (typesArray[i].isObject()) {
          auto typeObj = typesArray[i].toObject();

          m_types.insert(typeObj["id"].toInt(), typeObj["text"].toString());
          m_typesIcon.insert(typeObj["id"].toInt(), typeObj["icon"].toString());
        }
      }
    }
  }
}
