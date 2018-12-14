#ifndef CARDSMODEL_H
#define CARDSMODEL_H

#include "card_data.h"
#include <QAbstractListModel>
#include <QVector>

class CardsModel : public QAbstractListModel {
  Q_OBJECT

public:
  CardsModel(QVector<Card> cards, QObject *parent = Q_NULLPTR);
  CardsModel(QObject *parent = Q_NULLPTR);

  enum Roles {
    Code = Qt::UserRole + 1,
    Type,
    TypeText,
    Command,
    Image,
    Description,
    CardRole
  };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

  Q_INVOKABLE int indexOf(const QString &code) const;
  void setCards(QVector<Card> cards);

private:
  QVector<Card> m_cards;
};

#endif // CARDSMODEL_H
