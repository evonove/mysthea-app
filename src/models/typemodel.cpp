#include "typemodel.h"
#include "card_data.h"
#include "cardsmodel.h"
#include <QDebug>
#include <QList>
#include <QVariant>

TypeModel::TypeModel(QObject *parent)
    : QAbstractListModel{parent}, m_types{cards_data.size()} {
  // We create QVector<QVariantList> cards in constructor because
  // in this way it is created only once. While if we put this code in
  // data function it is created every time data is executed.
  for (auto i = 0; i < cards_data.size(); i++) {
    m_types[i] = new CardsProxyModel();
    m_types[i]->setSourceModel(new CardsModel(cards_data[i].toVector()));
  }
}

TypeModel::~TypeModel() { qDeleteAll(m_types); }

QHash<int, QByteArray> TypeModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Type, "type"}, {Roles::Cards, "cards"}};
}

int TypeModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return cards_data.size();
}

QVariant TypeModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();
  if (row < 0 || row >= cards_data.size()) {
    return QVariant();
  }

  switch (role) {
  case Roles::Type:
    return types.at(row);
  case Roles::Cards: {
    return QVariant::fromValue(m_types.at(row));
  }
  default:
    return QVariant();
  }
}
