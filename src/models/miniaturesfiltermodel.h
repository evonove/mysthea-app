#pragma once

#include "miniaturesmodel.h"
#include <QSortFilterProxyModel>

class MiniaturesFilterModel : public QSortFilterProxyModel {
  Q_OBJECT
  Q_PROPERTY(int type READ type WRITE setType NOTIFY typeChanged)
public:
  MiniaturesFilterModel(QObject *parent = Q_NULLPTR);
  int type() const;
  void setType(int type);
  bool filterAcceptsRow(int source_row,
                        const QModelIndex &source_parent) const Q_DECL_OVERRIDE;

signals:
  void typeChanged();

private:
  int m_type;
};
