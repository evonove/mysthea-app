#ifndef CARDSMODEL_H
#define CARDSMODEL_H

#include <QAbstractListModel>


class CardsModel : public QAbstractListModel
{
    Q_OBJECT

public:
    CardsModel(QObject* parent = Q_NULLPTR);

    enum Roles {
        Code = Qt::UserRole + 1,
        Type,
        Category,
        Color,
        Image,
        Description
    };
    Q_ENUM(Roles)

    QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
    int rowCount(const QModelIndex& parent = QModelIndex()) const Q_DECL_OVERRIDE;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;
};

#endif // CARDSMODEL_H
