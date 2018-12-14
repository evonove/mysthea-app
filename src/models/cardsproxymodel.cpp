#include "cardsproxymodel.h"
#include "cardsmodel.h"

#include <QDebug>

CardsProxyModel::CardsProxyModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_code{""}, m_command{0} {}

void CardsProxyModel::setCodeFilter(QString code) {
  code = code.toUpper();
  if (m_code != code) {
    m_code = code;
    invalidateFilter();
    emit filterChanged();
  }
}

void CardsProxyModel::setCommandFilter(int command) {
  if (m_command != command) {
    m_command = command;
    invalidateFilter();
    emit filterChanged();
  }
}

void CardsProxyModel::resetFilters() {
  m_code = QString("");
  m_command = 0;
  invalidateFilter();
  emit filterChanged();
}

bool CardsProxyModel::filterAcceptsRow(int source_row,
                                       const QModelIndex &source_parent) const {
  Q_UNUSED(source_parent);

  auto model = static_cast<CardsModel *>(sourceModel());

  auto acceptRow = true;

  // Gets all roles that can be filtered

  auto code = model->data(createIndex(source_row, 0), CardsModel::Roles::Code)
                  .toString();

  auto command =
      model->data(createIndex(source_row, 0), CardsModel::Roles::Command)
          .toInt();

  if (m_code.isEmpty() || code.contains(m_code)) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  if (m_command == 0 || m_command == command) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  return acceptRow;
}
