#ifndef TYPESLISTMODEL_CPP
#define TYPESLISTMODEL_CPP

#include "typeslistmodel.h"
#include "card_data.h"

#include <QDebug>
#include <QList>
#include <QVariant>

TypesListModel::TypesListModel(QObject *parent)
    : QAbstractListModel{parent}, m_types{{0, ALL_TYPES_TEXT}, {1, ERAX_TEXT},
                                          {2, ERAI_TEXT},      {3, ERAII_TEXT},
                                          {4, ERAIII_TEXT},    {5, HERO_TEXT},
                                          {6, ATTUNEMENT_TEXT}} {}

TypesListModel::~TypesListModel() {}

QHash<int, QByteArray> TypesListModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Key, "key"}, {Roles::Type, "type"}};
}

int TypesListModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_types.size();
}

QVariant TypesListModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();
  if (row < 0 || row >= m_types.size()) {
    return QVariant();
  }

  switch (role) {
  case Roles::Key:
    return row;
  case Roles::Type:
    return m_types.value(row);
  default:
    return QVariant();
  }
}

QString TypesListModel::getTypeFromIndex(int index) const {
  return m_types.value(index);
}

#endif // TYPESLISTMODEL_CPP
