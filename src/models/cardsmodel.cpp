#include "cardsmodel.h"
//#include "data.h"
#include "card_data.h"
#include <QDebug>
#include <QList>
#include <QVariant>

CardsModel::CardsModel(QObject *parent)
    : QAbstractListModel{parent}, m_cards{cards_data.size()} {
  // We create QVector<QVariantList> cards in constructor because
  // in this way it is created only once. While if we put this code in
  // data function it is created every time data is executed.
  for (auto i = 0; i < cards_data.size(); i++) {
    for (const auto &card : cards_data.value(i)) {
      QVariant v;
      v.setValue(card);
      m_cards[i].append(v);
    }
  }
}

QHash<int, QByteArray> CardsModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Category, "category"},
                                {Roles::Cards, "cards"}};
}

int CardsModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return cards_data.size();
}

QVariant CardsModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();
  if (row < 0 || row > cards_data.size() - 1) {
    return QVariant();
  }

  switch (role) {
  case Roles::Category:
    return category.value(row);
  case Roles::Cards: {
    return m_cards[row];
  }
  default:
    return QVariant();
  }
}
