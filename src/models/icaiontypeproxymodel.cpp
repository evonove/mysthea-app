#include "icaiontypeproxymodel.h"

IcaionTypeProxyModel::IcaionTypeProxyModel(QObject *parent)
    : TypeProxyModel(parent), m_command{0} {}

IcaionTypeProxyModel::~IcaionTypeProxyModel() {
  m_sourceModel->deleteLater();
  m_allCardsModel->deleteLater();
}

void IcaionTypeProxyModel::setTypeFilter(int type) {
  if (m_type != type) {
    m_type = type;
    emit enableCommandChanged();
    if (type > 1) {
      invalidateFilter();
      emit filterChanged();
      setCommandFilter(0);
      return;
    }
    invalidateFilter();
    emit filterChanged();
  }
}

void IcaionTypeProxyModel::setCommandFilter(int command) {
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

void IcaionTypeProxyModel::resetFilters() {
  TypeProxyModel::resetFilters();
  m_allCardsModel->setCommandFilter(0);
}

bool IcaionTypeProxyModel::enableCommand() const {
  // Returns wether command combo box should be enabled or not.
  // Command combo box must be enabled when at least a command card is
  //  visible.
  return m_type == 0 || m_type == 1;
}
