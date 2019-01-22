#ifndef TYPECOMBOBOXMODEL_CPP
#define TYPECOMBOBOXMODEL_CPP

#include "typecomboboxmodel.h"
#include "card_data.h"

#include <QGuiApplication>
#include <QList>
#include <QVariant>

TypeComboBoxModel::TypeComboBoxModel(QObject *parent)
    : QAbstractListModel{parent}, m_types{
                                      {0, ALL_TYPES_TEXT},  {1, ERAX_TEXT},
                                      {2, ERAI_TEXT},       {3, ERAII_TEXT},
                                      {4, ERAIII_TEXT},     {5, HERO_TEXT},
                                      {6, ATTUNEMENT_TEXT}, {7, ENCOUNTER_TEXT},
                                      {8, EVENT_TEXT}} {}

TypeComboBoxModel::~TypeComboBoxModel() {}

QHash<int, QByteArray> TypeComboBoxModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Key, "key"}, {Roles::Type, "type"}};
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
  default:
    return QVariant();
  }
}

QString TypeComboBoxModel::getTypeFromIndex(int index) const {
  return m_types.value(index);
}

#endif // TYPECOMBOBOXMODEL_CPP
