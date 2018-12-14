#ifndef SEARCHMODEL_H
#define SEARCHMODEL_H

#include "cardsmodel.h"
#include <QSortFilterProxyModel>

class TypeProxyModel : public QSortFilterProxyModel {
  Q_OBJECT
  Q_PROPERTY(int size READ rowCount NOTIFY filterChanged)
  Q_PROPERTY(bool enableCommand READ enableCommand NOTIFY enableCommandChanged)
public:
  TypeProxyModel(QObject *parent = Q_NULLPTR);
  ~TypeProxyModel() override;

  Q_INVOKABLE void setTypeFilter(int type);
  Q_INVOKABLE void setCodeFilter(QString code);
  Q_INVOKABLE void setCommandFilter(int command);
  Q_INVOKABLE void resetFilters();
  Q_INVOKABLE CardsModel *visibleCards();

  bool filterAcceptsRow(int source_row,
                        const QModelIndex &source_parent) const Q_DECL_OVERRIDE;
  bool enableCommand() const;
signals:
  void filterChanged();
  void enableCommandChanged();

private:
  int m_type;
  QString m_code;
  int m_command;
  CardsModel *m_visibleCardsModel;
};

#endif // SEARCHMODEL_H
