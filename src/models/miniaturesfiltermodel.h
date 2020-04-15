#pragma once

#include "miniaturesmodel.h"
#include <QSortFilterProxyModel>

class MiniaturesFilterModel : public QSortFilterProxyModel {
  Q_OBJECT
  Q_PROPERTY(int game READ game WRITE setGame NOTIFY gameChanged)
public:
  MiniaturesFilterModel(QObject *parent = Q_NULLPTR);
  int game() const;
  void setGame(int game);
  bool filterAcceptsRow(int source_row,
                        const QModelIndex &source_parent) const Q_DECL_OVERRIDE;

signals:
  void gameChanged();

private:
  int m_game;
};

