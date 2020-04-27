#include "mystheatypeproxymodel.h"

MystheaTypeProxyModel::MystheaTypeProxyModel(QObject *parent)
    : TypeProxyModel(parent), m_command{0} {}

MystheaTypeProxyModel::~MystheaTypeProxyModel() {
  m_sourceModel->deleteLater();
  m_allCardsModel->deleteLater();
}

void MystheaTypeProxyModel::setTypeFilter(int type) {
  if (m_type != type) {
    m_type = type;
    emit enableCommandChanged();
    invalidateFilter();
    if (type == 5 || type == 6 || type == 7 || type == 8) {
      emit filterChanged();
      setCommandFilter(0);
      return;
    }
    emit filterChanged();
  }
}

void MystheaTypeProxyModel::setCommandFilter(int command) {
  if (m_command != command) {
    m_command = command;
    for (int i = 0; i < m_sourceModel->rowCount(); i++) {
      m_sourceModel->data(createIndex(i, 0), TypeModel::Roles::Cards)
          .value<CardsProxyModel *>()
          ->setCommandFilter(command);
    }
    m_allCardsModel->setCommandFilter(command);
    invalidateFilter();
    emit filterChanged();
  }
}

void MystheaTypeProxyModel::resetFilters() {
  TypeProxyModel::resetFilters();
  m_allCardsModel->setCommandFilter(0);
}

bool MystheaTypeProxyModel::enableCommand() const {
  // Returns wether command combo box should be enabled or not.
  // Command combo box must be enabled when at least a command card is
  //  visible.
  return m_type >= 0 && m_type <= 4;
}
