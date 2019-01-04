#include "typeproxymodel.h"
#include "cardsmodel.h"
#include "typecomboboxmodel.h"

#include <QDebug>

TypeProxyModel::TypeProxyModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_type{0}, m_code{""}, m_command{0},
      m_allCardsModel{new CardsProxyModel(0)}, m_sourceModel{new TypeModel} {
  setSourceModel(m_sourceModel);
  m_allCardsModel->setSourceModel(m_sourceModel->allCardsModel());
}

TypeProxyModel::~TypeProxyModel() {
  m_allCardsModel->deleteLater();
  m_sourceModel->deleteLater();
}

void TypeProxyModel::setTypeFilter(int type) {
  if (m_type != type) {
    m_type = type;
    emit enableCommandChanged();
    if (type == 5 || type == 6) {
      invalidateFilter();
      emit filterChanged();
      setCommandFilter(0);
      return;
    }
    invalidateFilter();
    emit filterChanged();
  }
}

void TypeProxyModel::setCodeFilter(QString code) {
  code = code.toUpper();
  if (m_code != code) {
    m_code = code;
    for (int i = 0; i < m_sourceModel->rowCount(); i++) {
      m_sourceModel->data(createIndex(i, 0), TypeModel::Roles::Cards)
          .value<CardsProxyModel *>()
          ->setCodeFilter(code);
    }
    m_allCardsModel->setCodeFilter(code);
    invalidateFilter();
    emit filterChanged();
  }
}

void TypeProxyModel::setCommandFilter(int command) {
  if (m_command != command) {
    m_command = command;
    for (int i = 0; i < m_sourceModel->rowCount(); i++) {
      m_sourceModel->data(createIndex(i, 0), TypeModel::Roles::Cards)
          .value<CardsProxyModel *>()
          ->setCommandFilter(command);
    }
    m_allCardsModel->setCommandFilter(command);
    invalidateFilter();
    emit filterChanged();
  }
}

void TypeProxyModel::resetFilters() {
  for (int i = 0; i < m_sourceModel->rowCount(); i++) {
    m_sourceModel->data(createIndex(i, 0), TypeModel::Roles::Cards)
        .value<CardsProxyModel *>()
        ->resetFilters();
  }
  m_type = 0;
  m_allCardsModel->setCodeFilter("");
  m_allCardsModel->setCommandFilter(0);

  invalidateFilter();
  emit filterChanged();
}

// We use this function to see all the filtered cards current visible.
// In this way the swipe view allow us to slice between all filtered cards.
CardsProxyModel *TypeProxyModel::visibleCards() {

  if (m_type == 0) {
    return m_allCardsModel;
  } else {
    // If there is a type filter active returns the first index because
    // there can't be any other type visible.
    return data(index(0, 0), TypeModel::Roles::Cards)
        .value<CardsProxyModel *>();
  }
}

bool TypeProxyModel::filterAcceptsRow(int source_row,
                                      const QModelIndex &source_parent) const {
  Q_UNUSED(source_parent);

  auto acceptRow = true;

  // Gets all roles that can be filtered
  auto type =
      m_sourceModel->data(createIndex(source_row, 0), TypeModel::Roles::Type)
          .toInt();

  if (m_type == 0 || m_type == type) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  auto count =
      m_sourceModel->data(createIndex(source_row, 0), TypeModel::Roles::Cards)
          .value<CardsProxyModel *>()
          ->rowCount();
  if (count > 0) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  return acceptRow;
}

bool TypeProxyModel::enableCommand() const {
  return !(m_type == 5 || m_type == 6);
}
