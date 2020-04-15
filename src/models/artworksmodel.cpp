#include "artworksmodel.h"
#include "artworks_data.h"
#include <QGuiApplication>
#include <QList>
#include <QVariant>

ArtworksModel::ArtworksModel(QObject *parent)
    : QAbstractListModel{parent}, m_artworks{artworks_data} {}

QHash<int, QByteArray> ArtworksModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Type, "type"},
                                {Roles::Game, "game"},
                                {Roles::Image, "image"},
                                {Roles::Name, "name"},
                                {Roles::Author, "author"}};
}

int ArtworksModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_artworks.size();
}

QVariant ArtworksModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();

  if (row < 0 || row > m_artworks.size() - 1) {
    return QVariant();
  }

  switch (role) {
  case Roles::Game:
    return m_artworks.at(row).game;
  case Roles::Type:
    return m_artworks.at(row).type;
  case Roles::Image:
    return m_artworks.at(row).image;
  case Roles::Name:
    return m_artworks.at(row).name;
  case Roles::Author:
    return m_artworks.at(row).author;
  default:
    return QVariant();
  }
}
