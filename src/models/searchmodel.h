#ifndef SEARCHMODEL_H
#define SEARCHMODEL_H

#include <QSortFilterProxyModel>

class SearchModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    SearchModel(QObject* parent = Q_NULLPTR);
};

#endif // SEARCHMODEL_H
