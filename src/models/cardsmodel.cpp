#include "cardsmodel.h"
#include "data.h"


CardsModel::CardsModel(QObject* parent)
    : QAbstractListModel{parent}
{

}

QHash<int, QByteArray> CardsModel::roleNames() const
{
    return QHash<int, QByteArray>{
        {Roles::Code, "code"},
        {Roles::Type, "type"},
        {Roles::Category, "category"},
        {Roles::Color, "color"},
        {Roles::Image, "image"},
        {Roles::Description, "description"}
    };
}

int CardsModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent);
    return CARDS_NUMBER;
}

QVariant CardsModel::data(const QModelIndex& index, int role) const
{
    auto row = index.row();
    if (row < 0 || row > CARDS_NUMBER - 1) {
        return QVariant();
    }

    switch(role) {
        case Roles::Code:
            return CARDS_DATA[row].code;
        case Roles::Type:
            return CARDS_DATA[row].type;
        case Roles::Category:
            return CARDS_DATA[row].category;
        case Roles::Color:
            return CARDS_DATA[row].color;
        case Roles::Image:
            return CARDS_DATA[row].image;
        case Roles::Description:
            return CARDS_DATA[row].description;
        default:
            return QVariant();
    }
}
