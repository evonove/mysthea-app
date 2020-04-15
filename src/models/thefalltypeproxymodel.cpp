#include "thefalltypeproxymodel.h"

TheFallTypeProxyModel::TheFallTypeProxyModel(QObject *parent)
    : TypeProxyModel(parent) {}

TheFallTypeProxyModel::~TheFallTypeProxyModel() {
  m_sourceModel->deleteLater();
  m_allCardsModel->deleteLater();
}

void TheFallTypeProxyModel::setTypeFilter(int type) {
  if (m_type != type) {
    m_type = type;
    invalidateFilter();
    emit filterChanged();
  }
}
