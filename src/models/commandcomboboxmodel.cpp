#ifndef COMMANDCOMBOBOXMODEL_CPP
#define COMMANDCOMBOBOXMODEL_CPP

#include "commandcomboboxmodel.h"
#include "card_data.h"

#include <QDebug>
#include <QList>
#include <QVariant>

CommandComboBoxModel::CommandComboBoxModel(QObject *parent)
    : QAbstractListModel{parent}, m_commands{{0, ALL_COMMANDS_TEXT},
                                             {1, TACTIC_TEXT},
                                             {2, OBJECTIVE_TEXT},
                                             {3, ACCESSORY_TEXT},
                                             {4, UPGRADE_TEXT}} {}

CommandComboBoxModel::~CommandComboBoxModel() {}

QHash<int, QByteArray> CommandComboBoxModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Key, "key"},
                                {Roles::Command, "command"}};
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
    return m_commands.value(row);
  default:
    return QVariant();
  }
}

#endif // COMMANDCOMBOBOXMODEL_CPP