#include "cardsmodel.h"
#include <QDebug>
#include <QList>
#include <QVariant>

CardsModel::CardsModel(QVector<Card> cards, QObject *parent)
    : QAbstractListModel{parent}, m_cards{cards} {}

CardsModel::CardsModel(QObject *parent) : QAbstractListModel{parent} {}

QHash<int, QByteArray> CardsModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Code, "code"},
                                {Roles::Type, "type"},
                                {Roles::TypeText, "typeText"},
                                {Roles::Command, "command"},
                                {Roles::CommandText, "commandText"},
                                {Roles::Image, "image"},
                                {Roles::Description, "description"},
                                {Roles::CardRole, "card"}};
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
  case Roles::TypeText:
    return types_map.value(m_cards.at(row).type);
  case Roles::Command:
    return m_cards.at(row).command;
  case Roles::CommandText:
    return commands_map.value(m_cards.at(row).command);
  case Roles::Image:
    return m_cards.at(row).image;
  case Roles::Description:
    return m_cards.at(row).description;
  case Roles::CardRole:
    return QVariant::fromValue(m_cards.at(row));
  default:
    return QVariant();
  }
}

int CardsModel::indexOf(const QString &code) const {
  for (auto i = 0; i < m_cards.size(); i++) {
    if (m_cards.at(i).code == code) {
      return i;
    }
  }
  return -1;
}

void CardsModel::setCards(QVector<Card> cards) { m_cards = cards; }
