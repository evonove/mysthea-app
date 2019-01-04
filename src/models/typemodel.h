#ifndef TYPEMODEL_H
#define TYPEMODEL_H

#include "cardsmodel.h"
#include "cardsproxymodel.h"
#include <QAbstractListModel>
#include <QVector>

class TypeModel : public QAbstractListModel {
  Q_OBJECT

public:
  TypeModel(QObject *parent = Q_NULLPTR);
  ~TypeModel() Q_DECL_OVERRIDE;

  enum Roles { Type = Qt::UserRole + 1, TypeText, Cards };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;
  CardsModel *allCardsModel() const { return m_allCardsModel; }

private:
  QVector<CardsProxyModel *> m_types;
  CardsModel *m_allCardsModel;
};

#endif // TYPEMODEL_H
