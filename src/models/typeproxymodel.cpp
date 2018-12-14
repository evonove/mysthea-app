#include "typeproxymodel.h"
#include "cardsmodel.h"
#include "typemodel.h"
#include "typeslistmodel.h"

#include <QDebug>

TypeProxyModel::TypeProxyModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_type{0}, m_code{""},
      m_command{"All commands"}, m_visibleCardsModel{new CardsModel} {
  setSourceModel(new TypeModel);
}

TypeProxyModel::~TypeProxyModel() { m_visibleCardsModel->deleteLater(); }

void TypeProxyModel::setTypeFilter(int type) {
  if (m_type != type) {
    m_type = type;
    emit enableCommandChanged();
    if (type == 5 || type == 6) {
      invalidateFilter();
      emit filterChanged();
      setCommandFilter("All commands");
      return;
    }
    invalidateFilter();
    emit filterChanged();
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
    emit filterChanged();
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
    emit filterChanged();
  }
}

void TypeProxyModel::resetFilters() {
  auto model = static_cast<TypeModel *>(sourceModel());
  for (int i = 0; i < model->rowCount(); i++) {
    model->data(createIndex(i, 0), TypeModel::Roles::Cards)
        .value<CardsProxyModel *>()
        ->resetFilters();
  }
  m_type = 0;
  invalidateFilter();
  emit filterChanged();
}

// We use this function to see all the filtered cards current visible.
// In this way the swipe view allow us to slice between all filtered cards.
CardsModel *TypeProxyModel::visibleCards() {
  QVector<Card> cards;
  for (int i = 0; i < rowCount(); i++) {
    auto cardsModel =
        data(index(i, 0), TypeModel::Roles::Cards).value<CardsProxyModel *>();
    for (int j = 0; j < cardsModel->rowCount(); j++) {
      auto card =
          cardsModel->data(cardsModel->index(j, 0), CardsModel::Roles::CardRole)
              .value<Card>();
      cards.append(card);
    }
  }
  m_visibleCardsModel->setCards(cards);
  return m_visibleCardsModel;
}

bool TypeProxyModel::filterAcceptsRow(int source_row,
                                      const QModelIndex &source_parent) const {
  Q_UNUSED(source_parent);

  auto model = static_cast<TypeModel *>(sourceModel());

  auto acceptRow = true;

  // Gets all roles that can be filtered
  auto type = model->data(createIndex(source_row, 0), TypeModel::Roles::Type);

  if (m_type == 0 || m_type == type) {
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

bool TypeProxyModel::enableCommand() const {
  return !(m_type == 5 || m_type == 6);
}
