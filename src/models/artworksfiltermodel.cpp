#include "artworksfiltermodel.h"
#include "artworksmodel.h"

#include <QDebug>

ArtworksFilterModel::ArtworksFilterModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_type{0} {}

void ArtworksFilterModel::setType(int type) {
  if (m_type != type) {
    m_type = type;
    invalidateFilter();
    emit typeChanged();
  }
}

int ArtworksFilterModel::type() const { return m_type; }

bool ArtworksFilterModel::filterAcceptsRow(
    int source_row, const QModelIndex &source_parent) const {
  Q_UNUSED(source_parent);
  auto model = sourceModel();
  if (m_type != 0) {
    auto type =
        model->data(createIndex(source_row, 0), ArtworksModel::Roles::Type)
            .toInt();
    if (m_type != type) {
      return false;
    }
  }
  return true;
}
