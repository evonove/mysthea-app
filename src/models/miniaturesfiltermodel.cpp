#include "miniaturesfiltermodel.h"
#include "miniaturesmodel.h"

MiniaturesFilterModel::MiniaturesFilterModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_game{0} {}

void MiniaturesFilterModel::setGame(int game) {
  if (m_game != game) {
    m_game = game;
    invalidateFilter();
    emit gameChanged();
  }
}

int MiniaturesFilterModel::game() const { return m_game; }

bool MiniaturesFilterModel::filterAcceptsRow(
    int source_row, const QModelIndex &source_parent) const {
  Q_UNUSED(source_parent);
  if (m_game != 0) {
    auto game =
        sourceModel()->data(createIndex(source_row, 0), MiniaturesModel::Roles::Game)
            .toInt();
    if (m_game != game) {
      return false;
    }
  }
  return true;
}

