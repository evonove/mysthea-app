#ifndef SEARCHMODEL_H
#define SEARCHMODEL_H

#include <QSortFilterProxyModel>

class TypeProxyModel : public QSortFilterProxyModel {
  Q_OBJECT
public:
  TypeProxyModel(QObject *parent = Q_NULLPTR);

  Q_INVOKABLE void setTypeFilter(QString type);
  Q_INVOKABLE void setCodeFilter(QString code);
  Q_INVOKABLE void setCommandFilter(QString command);
  Q_INVOKABLE void resetFilters();

  bool filterAcceptsRow(int source_row,
                        const QModelIndex &source_parent) const Q_DECL_OVERRIDE;

private:
  QString m_type;
  QString m_code;
  QString m_command;
};

#endif // SEARCHMODEL_H
