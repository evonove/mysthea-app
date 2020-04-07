#pragma once

#include "artworksmodel.h"
#include <QSortFilterProxyModel>

class ArtworksFilterModel : public QSortFilterProxyModel {
  Q_OBJECT
  Q_PROPERTY(int type READ type WRITE setType NOTIFY typeChanged)
  Q_PROPERTY(int game READ game WRITE setGame NOTIFY gameChanged)
public:
  ArtworksFilterModel(QObject *parent = Q_NULLPTR);
  int type() const;
  void setType(int type);
  int game() const;
  void setGame(int game);
  bool filterAcceptsRow(int source_row,
                        const QModelIndex &source_parent) const Q_DECL_OVERRIDE;

signals:
  void typeChanged();
  void gameChanged();

private:
  int m_type;
  int m_game;
};
