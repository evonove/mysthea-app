#include "miniaturesfiltermodel.h"
#include "miniaturesmodel.h"

MiniaturesFilterModel::MiniaturesFilterModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_type{0} {}

void MiniaturesFilterModel::setType(int type) {
  if (m_type != type) {
    m_type = type;
    invalidateFilter();
    emit typeChanged();
  }
}

int MiniaturesFilterModel::type() const { return m_type; }

bool MiniaturesFilterModel::filterAcceptsRow(
    int source_row, const QModelIndex &source_parent) const {
  Q_UNUSED(source_parent);
  auto model = sourceModel();
  if (m_type != 0) {
    auto type =
        model->data(createIndex(source_row, 0), MiniaturesModel::Roles::Type)
            .toInt();
    if (m_type != type) {
      return false;
    }
  }
  return true;
}
