#include "commandcomboboxmodel.h"
#include "card_data.h"

#include <QFile>
#include <QGuiApplication>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QVariant>

CommandComboBoxModel::CommandComboBoxModel(QObject *parent)
    : QAbstractListModel{parent} {}

CommandComboBoxModel::~CommandComboBoxModel() {}

void CommandComboBoxModel::classBegin() {}

void CommandComboBoxModel::componentComplete() {
  if (!m_configurationFilePath.isEmpty()) {
    this->processFile();
  }
}

QHash<int, QByteArray> CommandComboBoxModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Key, "key"},
                                {Roles::Command, "command"},
                                {Roles::IconUrl, "iconUrl"},
                                {Roles::Color, "color"}};
}

int CommandComboBoxModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_commands.size();
}

QVariant CommandComboBoxModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();
  if (row < 0 || row >= m_commands.size()) {
    return QVariant();
  }

  switch (role) {
  case Roles::Key:
    return row;
  case Roles::Command:
    return qGuiApp->translate("CardsData",
                              m_commands.value(row).toStdString().c_str());
  case Roles::IconUrl:
    return m_commandsIcon.value(row, "");
  case Roles::Color:
    return m_commandsColor.value(row, "#FFFFFF");

  default:
    return QVariant();
  }
}

QString CommandComboBoxModel::color(const int &command) const {
  return m_commandsColor.value(command, "#FFFFFF");
}

QUrl CommandComboBoxModel::iconUrl(const int &command) const {
  QUrl url(m_commandsIcon.value(command, ""));
  return url;
}

void CommandComboBoxModel::setConfigurationFilePath(const QUrl &url) {
  if (m_configurationFilePath != url) {
    m_configurationFilePath = url;

    this->processFile();
    emit configurationFilePathChanged();
  }
}

QString CommandComboBoxModel::convertUrlToFilePath(const QUrl &url) {
  // This function convert the url passed from qml in a valid resource path.
  if (url.scheme().compare(QLatin1String("qrc"), Qt::CaseInsensitive) == 0) {
    if (url.authority().isEmpty()) {
      return QLatin1Char(':') + url.path();
    }
  }
  return QString();
}

void CommandComboBoxModel::processFile() {
  auto filePath = convertUrlToFilePath(m_configurationFilePath);
  QFile file;
  file.setFileName(filePath);
  QJsonDocument confFile;

  if (file.open(QIODevice::ReadOnly)) {
    QJsonParseError error;
    confFile = QJsonDocument::fromJson(file.readAll(), &error);
  }

  this->beginResetModel();
  m_commands.clear();
  m_commandsIcon.clear();
  m_commandsColor.clear();
  // Check the validity of file.
  if (!confFile.isNull()) {
    auto contentFile = confFile.object();

    if (contentFile.contains("cards_commands") &&
        contentFile["cards_commands"].isArray()) {
      QJsonArray commandsArray = contentFile["cards_commands"].toArray();
      for (auto i = 0; i < commandsArray.size(); ++i) {
        if (commandsArray[i].isObject()) {
          auto commandObj = commandsArray[i].toObject();

          auto id = commandObj["id"].toInt();
          auto text = commandObj["text"].toString();
          auto icon = commandObj["icon"].toString();
          auto color = commandObj["color"].toString();

          m_commands.insert(id, text);
          m_commandsIcon.insert(id, icon);
          m_commandsColor.insert(id, color);
        }
      }
    }
  }
  this->endResetModel();
}
