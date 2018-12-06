#ifndef CARDSPROXYMODEL_H
#define CARDSPROXYMODEL_H
#include <QSortFilterProxyModel>

class CardsProxyModel : public QSortFilterProxyModel {
  Q_OBJECT
  Q_PROPERTY(int size READ rowCount NOTIFY filterChanged)
public:
  CardsProxyModel(QObject *parent = Q_NULLPTR);

  Q_INVOKABLE void setCodeFilter(QString code);
  Q_INVOKABLE void setCommandFilter(QString command);
  Q_INVOKABLE void resetFilters();

  bool filterAcceptsRow(int source_row,
                        const QModelIndex &source_parent) const Q_DECL_OVERRIDE;
signals:
  void filterChanged();

private:
  QString m_code;
  QString m_command;
};

#endif // CARDSPROXYMODEL_H