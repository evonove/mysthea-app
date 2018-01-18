#ifndef SEARCHMODEL_H
#define SEARCHMODEL_H

#include <QSortFilterProxyModel>

class SearchModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    SearchModel(QObject* parent = Q_NULLPTR);

    Q_INVOKABLE void setCodeFilter(QString code);
    Q_INVOKABLE void setCategoryFilter(QString era);
    Q_INVOKABLE void setColorFilter(QString color);
    Q_INVOKABLE void resetFilters();

    bool filterAcceptsRow(int source_row, const QModelIndex& source_parent) const Q_DECL_OVERRIDE;

private:
    QString m_code;
    QString m_category;
    QString m_color;
};

#endif // SEARCHMODEL_H
