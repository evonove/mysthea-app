#ifndef CARDSPROXYMODEL_H
#define CARDSPROXYMODEL_H
#include "cardsmodel.h"
#include <QSortFilterProxyModel>

class CardsProxyModel : public QSortFilterProxyModel {
  Q_OBJECT
  Q_PROPERTY(int size READ rowCount NOTIFY filterChanged)
public:
  CardsProxyModel(int type, QObject *parent = Q_NULLPTR);

  Q_INVOKABLE void setCodeFilter(QString code);
  Q_INVOKABLE void setCommandFilter(int command);
  Q_INVOKABLE void resetFilters();
  Q_INVOKABLE int indexOf(const QString &code) const;

  bool filterAcceptsRow(int source_row,
                        const QModelIndex &source_parent) const Q_DECL_OVERRIDE;
signals:
  void filterChanged();

private:
  QString m_code;
  int m_command;
  int m_type;
};

#endif // CARDSPROXYMODEL_H
