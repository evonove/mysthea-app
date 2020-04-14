#include "miniaturesmodel.h"
#include "miniatures_data.h"
#include <QGuiApplication>
#include <QList>
#include <QVariant>

MiniaturesModel::MiniaturesModel(QObject *parent)
    : QAbstractListModel{parent}, m_miniatures{miniatures_data} {}

QHash<int, QByteArray> MiniaturesModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Game, "game"},
                                {Roles::Image, "image"},
                                {Roles::Name, "name"}};
}

int MiniaturesModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_miniatures.size();
}

QVariant MiniaturesModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();

  if (row < 0 || row > m_miniatures.size() - 1) {
    return QVariant();
  }

  switch (role) {
  case Roles::Game:
    return m_miniatures.at(row).game;
  case Roles::Image:
    return m_miniatures.at(row).image;
  case Roles::Name:
    return m_miniatures.at(row).name;
  default:
    return QVariant();
  }
}

