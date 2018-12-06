#include "typeproxymodel.h"
#include "typemodel.h"

#include <QDebug>

TypeProxyModel::TypeProxyModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_type{"All types"}, m_code{""},
      m_command{"All commands"} {}

void TypeProxyModel::setTypeFilter(QString type) {
  if (m_type != type) {
    m_type = type;
    invalidateFilter();
  }
}

void TypeProxyModel::setCodeFilter(QString code) {
  code = code.toUpper();
  if (m_code != code) {
    auto model = static_cast<TypeModel *>(sourceModel());
    m_code = code;
    for (int i = 0; i < model->rowCount(); i++) {
      model->data(createIndex(i, 0), TypeModel::Roles::Cards)
          .value<CardsProxyModel *>()
          ->setCodeFilter(code);
    }
    invalidateFilter();
  }
}

void TypeProxyModel::setCommandFilter(QString command) {
  if (m_command != command) {
    auto model = static_cast<TypeModel *>(sourceModel());
    m_command = command;
    for (int i = 0; i < model->rowCount(); i++) {
      model->data(createIndex(i, 0), TypeModel::Roles::Cards)
          .value<CardsProxyModel *>()
          ->setCommandFilter(command);
    }
    invalidateFilter();
  }
}

void TypeProxyModel::resetFilters() {
  auto model = static_cast<TypeModel *>(sourceModel());
  for (int i = 0; i < model->rowCount(); i++) {
    model->data(createIndex(i, 0), TypeModel::Roles::Cards)
        .value<CardsProxyModel *>()
        ->resetFilters();
  }
  m_type = QString("All types");
  invalidateFilter();
}

bool TypeProxyModel::filterAcceptsRow(int source_row,
                                      const QModelIndex &source_parent) const {
  Q_UNUSED(source_parent);

  auto model = static_cast<TypeModel *>(sourceModel());

  auto acceptRow = true;

  // Gets all roles that can be filtered
  auto type = model->data(createIndex(source_row, 0), TypeModel::Roles::Type)
                  .toString();
  if (m_type == "All types" || m_type == type) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }
  auto count = model->data(createIndex(source_row, 0), TypeModel::Roles::Cards)
                   .value<CardsProxyModel *>()
                   ->rowCount();
  if (count > 0) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  return acceptRow;
}
