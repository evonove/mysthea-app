#include "cardsmodel.h"
#include <QDebug>
#include <QList>
#include <QVariant>

CardsModel::CardsModel(QVector<Card> cards, QObject *parent)
    : QAbstractListModel{parent}, m_cards{cards} {}

QHash<int, QByteArray> CardsModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Code, "code"},
                                {Roles::Type, "type"},
                                {Roles::Command, "command"},
                                {Roles::Image, "image"}};
}

int CardsModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_cards.size();
}

QVariant CardsModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();
  if (row < 0 || row > m_cards.size() - 1) {
    return QVariant();
  }

  switch (role) {
  case Roles::Code:
    return m_cards.at(row).code;
  case Roles::Type:
    return m_cards.at(row).type;
  case Roles::Command:
    return m_cards.at(row).command;
  case Roles::Image:
    return m_cards.at(row).image;
  case Roles::Description:
    return m_cards.at(row).description;
  default:
    return QVariant();
  }
}
