#include "commandcomboboxmodel.h"
#include "card_data.h"

#include <QGuiApplication>
#include <QList>
#include <QVariant>

CommandComboBoxModel::CommandComboBoxModel(QObject *parent)
    : QAbstractListModel{parent}, m_commands{{0, ALL_COMMANDS_TEXT},
                                             {1, TACTIC_TEXT},
                                             {2, OBJECTIVE_TEXT},
                                             {3, ACCESSORY_TEXT},
                                             {4, UPGRADE_TEXT}},
      m_commandsIcon{{1, "qrc:/assets/icons/tactic.svg"},
                     {2, "qrc:/assets/icons/objective.svg"},
                     {3, "qrc:/assets/icons/accessory.svg"},
                     {4, "qrc:/assets/icons/upgrade.svg"}},
      m_commandsColor{
          {1, "#F04937"}, {2, "#FDEF30"}, {3, "#62BB46"}, {4, "#0099D8"}} {}

CommandComboBoxModel::~CommandComboBoxModel() {}

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
