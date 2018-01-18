#include "cardsmodel.h"
#include "searchmodel.h"


SearchModel::SearchModel(QObject* parent)
    : QSortFilterProxyModel(parent)
    , m_code{""}
    , m_category{"All Categories"}
    , m_color{"All Colors"}
{

}

void SearchModel::setCodeFilter(QString code)
{
    if (m_code != code) {
        m_code = code;
        invalidateFilter();
    }
}

void SearchModel::setCategoryFilter(QString category)
{
    if (m_category != category) {
        m_category = category;
        invalidateFilter();
    }
}

void SearchModel::setColorFilter(QString color)
{
    if (m_color != color) {
        m_color = color;
        invalidateFilter();
    }
}

void SearchModel::resetFilters()
{
    m_code = QString("");
    m_category = QString("All Categories");
    m_color = QString("All Colors");
    invalidateFilter();
}

bool SearchModel::filterAcceptsRow(int source_row, const QModelIndex& source_parent) const
{
    Q_UNUSED(source_parent);

    auto model = static_cast<CardsModel*>(sourceModel());

    auto acceptRow = true;

    // Gets all roles that can be filtered
    auto code = model->data(createIndex(source_row, 0), CardsModel::Roles::Code).toString();
    auto category = model->data(createIndex(source_row, 0), CardsModel::Roles::Category).toString();
    auto color = model->data(createIndex(source_row, 0), CardsModel::Roles::Color).toString();

    if (m_code.isEmpty() || code.contains(m_code)) {
        acceptRow = acceptRow && true;
    } else {
        acceptRow = acceptRow && false;
    }

    if (m_category == "All Categories" || m_category == category) {
        acceptRow = acceptRow && true;
    } else {
        acceptRow = acceptRow && false;
    }

    if (m_color == "All Colors" || m_color == color) {
        acceptRow = acceptRow && true;
    } else {
        acceptRow = acceptRow && false;
    }

    return acceptRow;
}
