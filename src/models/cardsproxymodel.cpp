#include "cardsproxymodel.h"
#include "card_data.h"
#include "cardsmodel.h"

#include <QDebug>

CardsProxyModel::CardsProxyModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_code{""}, m_command{"All commands"} {}

void CardsProxyModel::setCodeFilter(QString code) {
  code = code.toUpper();
  if (m_code != code) {
    m_code = code;
    invalidateFilter();
  }
}

void CardsProxyModel::setCommandFilter(QString command) {
  if (m_command != command) {
    m_command = command;
    invalidateFilter();
  }
}

void CardsProxyModel::resetFilters() {
  m_code = QString("");
  m_command = QString("All commands");
  invalidateFilter();
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
          .toString();

  if (m_code.isEmpty() || code.contains(m_code)) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  if (m_command == "All commands" || m_command == command) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  return acceptRow;
}
