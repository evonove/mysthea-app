#include "typemodel.h"
#include "card_data.h"
#include <QGuiApplication>
#include <QList>
#include <QVariant>

TypeModel::TypeModel(QObject *parent)
    : QAbstractListModel{parent}, m_types{cards_data.size()} {
  // We create QVector<QVariantList> cards in constructor because
  // in this way it is created only once. While if we put this code in
  // data function it is created every time data is executed.auto
  QVector<Card> allCards;
  for (auto i = 0; i < cards_data.size(); i++) {
    allCards.append(cards_data[i]);
  }

  m_allCardsModel = new CardsModel(allCards);

  for (auto i = 0; i < cards_data.size(); i++) {
    m_types[i] = new CardsProxyModel(i + 1);
    m_types[i]->setSourceModel(m_allCardsModel);
  }
}

TypeModel::~TypeModel() {
  qDeleteAll(m_types);
  m_allCardsModel->deleteLater();
}

QHash<int, QByteArray> TypeModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Type, "type"},
                                {Roles::TypeText, "typeText"},
                                {Roles::Cards, "cards"}};
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
    return row + 1;
  case Roles::TypeText: {
    // added 1 to row value because our type_map ids started from 1.
    // the value 0 is reserved for "all types" string.
    auto typeText = types_map.value(row + 1);
    return qGuiApp->translate("CardsData", typeText.toStdString().c_str());
  }
  case Roles::Cards: {
    return QVariant::fromValue(m_types.at(row));
  }
  default:
    return QVariant();
  }
}
