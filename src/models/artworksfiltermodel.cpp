#include "artworksfiltermodel.h"
#include "artworksmodel.h"

ArtworksFilterModel::ArtworksFilterModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_type{0}, m_game{0} {}

void ArtworksFilterModel::setType(int type) {
  if (m_type != type) {
    m_type = type;
    invalidateFilter();
    emit typeChanged();
  }
}

void ArtworksFilterModel::setGame(int game) {
  if (m_game != game) {
    m_game = game;
    invalidateFilter();
    emit gameChanged();
  }
}

int ArtworksFilterModel::type() const { return m_type; }

int ArtworksFilterModel::game() const { return m_game; }

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
  if (m_game != 0) {
    auto game =
        model->data(createIndex(source_row, 0), ArtworksModel::Roles::Game)
            .toInt();
    if (m_game != game) {
      return false;
    }
  }
  return true;
}
