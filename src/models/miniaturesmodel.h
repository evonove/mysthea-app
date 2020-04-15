#pragma once

#include "miniatures_data.h"
#include <QAbstractListModel>
#include <QVector>

class MiniaturesModel : public QAbstractListModel {
  Q_OBJECT

public:
  MiniaturesModel(QObject *parent = Q_NULLPTR);

  enum Roles {
    Game = Qt::UserRole + 1,
    Image,
    Name,
  };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

private:
  QVector<Miniature> m_miniatures;
};

