#include "searchmodel.h"
#include "card_data.h"
#include "typemodel.h"

#include <QDebug>

SearchModel::SearchModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_code{""}, m_type{"All types"},
      m_command{"All commands"} {}

void SearchModel::setCodeFilter(QString code) {
  code = code.toUpper();
  if (m_code != code) {
    m_code = code;
    invalidateFilter();
  }
}

void SearchModel::setTypeFilter(QString type) {
  if (m_type != type) {
    m_type = type;
    invalidateFilter();
  }
}

void SearchModel::setCommandFilter(QString command) {
  if (m_command != command) {
    m_command = command;
    invalidateFilter();
  }
}

void SearchModel::resetFilters() {
  m_code = QString("");
  m_type = QString("All types");
  m_command = QString("All commands");
  invalidateFilter();
}

bool SearchModel::filterAcceptsRow(int source_row,
                                   const QModelIndex &source_parent) const {
  Q_UNUSED(source_parent);

  auto model = static_cast<TypeModel *>(sourceModel());

  auto acceptRow = true;

  // Gets all roles that can be filtered
  auto type = model->data(createIndex(source_row, 0), TypeModel::Roles::Type)
                  .toString();

  auto cards =
      model->data(createIndex(source_row, 0), TypeModel::Roles::Cards).toList();

  //      auto code = cards[i].value<Card>().m_code;

  //  qDebug() << m_category;

  //  if (m_code.isEmpty() || code.contains(m_code)) {
  //    acceptRow = acceptRow && true;
  //  } else {
  //    acceptRow = acceptRow && false;
  //  }

  if (m_type == "All types" || m_type == type) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  /* if (m_command == "All commands" || m_command == command) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }*/

  return acceptRow;
}
