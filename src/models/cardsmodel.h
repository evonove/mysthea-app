#pragma once

#include "card_data.h"
#include <QAbstractListModel>
#include <QVector>

class CardsModel : public QAbstractListModel {
  Q_OBJECT

public:
  CardsModel(QVector<Card> cards, QHash<int, QString> types,
             QHash<int, QString> commands, QObject *parent = Q_NULLPTR);

  enum Roles {
    Code = Qt::UserRole + 1,
    Type,
    Name,
    TypeText,
    Command,
    CommandText,
    Image,
    BackImage,
    Description,
    CardRole
  };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

private:
  QVector<Card> m_cards;
  QHash<int, QString> m_types;
  QHash<int, QString> m_commands;
};
