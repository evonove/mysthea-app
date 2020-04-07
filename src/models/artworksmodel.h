#pragma once

#include "artworks_data.h"
#include <QAbstractListModel>
#include <QVector>

class ArtworksModel : public QAbstractListModel {
  Q_OBJECT

public:
  ArtworksModel(QObject *parent = Q_NULLPTR);

  enum Roles {
    Type = Qt::UserRole + 1,
    Game,
    Image,
    Name,
    Author,
  };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

private:
  QVector<Artwork> m_artworks;
};
