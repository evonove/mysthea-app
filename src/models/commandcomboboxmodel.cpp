#ifndef COMMANDCOMBOBOXMODEL_CPP
#define COMMANDCOMBOBOXMODEL_CPP

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
                     {4, "qrc:/assets/icons/upgrade.svg"}} {}

CommandComboBoxModel::~CommandComboBoxModel() {}

QHash<int, QByteArray> CommandComboBoxModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Key, "key"},
                                {Roles::Command, "command"},
                                {Roles::IconUrl, "iconUrl"}};
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
  default:
    return QVariant();
  }
}

#endif // COMMANDCOMBOBOXMODEL_CPP
