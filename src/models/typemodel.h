#ifndef TYPEMODEL_H
#define TYPEMODEL_H

#include "cardsproxymodel.h"
#include <QAbstractListModel>
#include <QVector>

class TypeModel : public QAbstractListModel {
  Q_OBJECT

public:
  TypeModel(QObject *parent = Q_NULLPTR);
  ~TypeModel() Q_DECL_OVERRIDE;

  enum Roles { Type = Qt::UserRole + 1, Cards };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

  QVector<CardsProxyModel *> m_types;
};

#endif // TYPEMODEL_H
