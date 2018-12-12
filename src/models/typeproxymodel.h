#ifndef SEARCHMODEL_H
#define SEARCHMODEL_H

#include "cardsmodel.h"
#include <QSortFilterProxyModel>

class TypeProxyModel : public QSortFilterProxyModel {
  Q_OBJECT
  Q_PROPERTY(int size READ rowCount NOTIFY filterChanged)
public:
  TypeProxyModel(QObject *parent = Q_NULLPTR);
  ~TypeProxyModel();

  Q_INVOKABLE void setTypeFilter(QString type);
  Q_INVOKABLE void setCodeFilter(QString code);
  Q_INVOKABLE void setCommandFilter(QString command);
  Q_INVOKABLE void resetFilters();
  Q_INVOKABLE CardsModel *visibleCards();

  bool filterAcceptsRow(int source_row,
                        const QModelIndex &source_parent) const Q_DECL_OVERRIDE;
signals:
  void filterChanged();

private:
  QString m_type;
  QString m_code;
  QString m_command;
  CardsModel *m_visibleCardsModel;
};

#endif // SEARCHMODEL_H
