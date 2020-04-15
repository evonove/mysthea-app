#include "cardsmodel.h"
#include <QGuiApplication>
#include <QList>
#include <QVariant>

CardsModel::CardsModel(QVector<Card> cards, QHash<int, QString> types,
                       QHash<int, QString> commands, QObject *parent)
    : QAbstractListModel{parent}, m_cards{cards} {

  m_types = types;
  m_commands = commands;
}

QHash<int, QByteArray> CardsModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Code, "code"},
                                {Roles::Name, "name"},
                                {Roles::Type, "type"},
                                {Roles::TypeText, "typeText"},
                                {Roles::Command, "command"},
                                {Roles::CommandText, "commandText"},
                                {Roles::Image, "image"},
                                {Roles::BackImage, "backImage"},
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
  case Roles::Name:
    return m_cards.at(row).name;
  case Roles::Type:
    return m_cards.at(row).type;
  case Roles::TypeText: {
    auto typeText = m_types.value(m_cards.at(row).type);
    return qGuiApp->translate("CardsData", typeText.toStdString().c_str());
  }
  case Roles::Command:
    return m_cards.at(row).command;
  case Roles::CommandText: {
    auto commandText = m_commands.value(m_cards.at(row).command);
    return qGuiApp->translate("CardsData", commandText.toStdString().c_str());
  }
  case Roles::Image:
    return m_cards.at(row).image;
  case Roles::BackImage:
    return m_cards.at(row).backImage;
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
