#ifndef CARDSMODEL_H
#define CARDSMODEL_H

#include <QAbstractListModel>
#include <QVector>

class CardsModel : public QAbstractListModel {
  Q_OBJECT

public:
  CardsModel(QObject *parent = Q_NULLPTR);

  enum Roles { Category = Qt::UserRole + 1, Cards };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

  QVector<QVariantList> m_cards;
};

#endif // CARDSMODEL_H
