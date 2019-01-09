#include "cardsmodel.h"
#include <QList>
#include <QVariant>
#include <QGuiApplication>

CardsModel::CardsModel(QVector<Card> cards, QObject *parent)
    : QAbstractListModel{parent}, m_cards{cards} {}

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
  case Roles::TypeText: {
    auto typeText = types_map.value(m_cards.at(row).type);
    return qGuiApp->translate("CardsData", typeText.toStdString().c_str());
  }
  case Roles::Command:
    return m_cards.at(row).command;
  case Roles::CommandText: {
    auto commandText = commands_map.value(m_cards.at(row).command);
    return qGuiApp->translate("CardsData", commandText.toStdString().c_str());
  }
  case Roles::Image:
    return m_cards.at(row).image;
  case Roles::Description: {
    auto description = m_cards.at(row).description;
    return qGuiApp->translate("CardsData", description.toStdString().c_str());
  }
  case Roles::CardRole:
    return QVariant::fromValue(m_cards.at(row));
  default:
    return QVariant();
  }
}
