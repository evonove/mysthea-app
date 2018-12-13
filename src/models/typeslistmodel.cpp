#ifndef TYPESLISTMODEL_CPP
#define TYPESLISTMODEL_CPP

#include "typeslistmodel.h"

#include <QDebug>
#include <QList>
#include <QVariant>

TypesListModel::TypesListModel(QObject *parent) : QAbstractListModel{parent} {
  m_types.insert(0, "All types");
  m_types.insert(1, "Era X");
  m_types.insert(2, "Era I");
  m_types.insert(3, "Era II");
  m_types.insert(4, "Era III");
  m_types.insert(5, "Hero");
  m_types.insert(6, "Attunement");
}

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

#endif // TYPESLISTMODEL_CPP
