#include "typeproxymodel.h"
#include "cardsmodel.h"
#include "typecomboboxmodel.h"

TypeProxyModel::TypeProxyModel(QObject *parent)
    : QSortFilterProxyModel(parent), m_type{0}, m_code{""},
      m_allCardsModel{new CardsProxyModel(0)}, m_sourceModel{new TypeModel} {}

void TypeProxyModel::classBegin() {}

void TypeProxyModel::componentComplete() { this->processSource(); }

void TypeProxyModel::setCodeFilter(QString code) {
  code = code.toUpper();
  if (m_code != code) {
    m_code = code;
    for (int i = 0; i < m_sourceModel->rowCount(); i++) {
      m_sourceModel->data(createIndex(i, 0), TypeModel::Roles::Cards)
          .value<CardsProxyModel *>()
          ->setCodeFilter(code);
    }
    m_allCardsModel->setCodeFilter(code);
    invalidateFilter();
    emit filterChanged();
  }
}

void TypeProxyModel::resetFilters() {
  for (int i = 0; i < m_sourceModel->rowCount(); i++) {
    m_sourceModel->data(createIndex(i, 0), TypeModel::Roles::Cards)
        .value<CardsProxyModel *>()
        ->resetFilters();
  }
  m_type = 0;
  m_allCardsModel->setCodeFilter("");

  invalidateFilter();
  emit filterChanged();
}

// We use this function to see all the filtered cards current visible.
// In this way the swipe view allow us to slice between all filtered cards.
CardsProxyModel *TypeProxyModel::visibleCards() {

  if (m_type == 0) {
    return m_allCardsModel;
  } else {
    // If there is a type filter active returns the first index because
    // there can't be any other type visible.
    return m_sourceModel->data(createIndex(m_type - 1, 0), TypeModel::Cards)
        .value<CardsProxyModel *>();
  }
}

void TypeProxyModel::setConfigurationFilePath(const QUrl &url) {
  if (m_configurationFilePath != url) {
    m_configurationFilePath = url;

    this->processSource();
    emit configurationFilePathChanged();
  }
}

QString TypeProxyModel::convertUrlToFilePath(const QUrl &url) {
  // This function convert the url passed from qml in a valid resource path.
  if (url.scheme().compare(QLatin1String("qrc"), Qt::CaseInsensitive) == 0) {
    if (url.authority().isEmpty()) {
      return QLatin1Char(':') + url.path();
    }
  }
  return QString();
}

void TypeProxyModel::processSource() {
  auto filePath = convertUrlToFilePath(m_configurationFilePath);
  m_sourceModel->setConfigurationFilePath(filePath);
  setSourceModel(m_sourceModel);
  m_allCardsModel->setSourceModel(m_sourceModel->allCardsModel());
}

bool TypeProxyModel::filterAcceptsRow(int source_row,
                                      const QModelIndex &source_parent) const {
  Q_UNUSED(source_parent);

  auto acceptRow = true;

  // Gets all roles that can be filtered
  auto type =
      m_sourceModel->data(createIndex(source_row, 0), TypeModel::Roles::Type)
          .toInt();

  if (m_type == 0 || m_type == type) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  auto count =
      m_sourceModel->data(createIndex(source_row, 0), TypeModel::Roles::Cards)
          .value<CardsProxyModel *>()
          ->rowCount();
  if (count > 0) {
    acceptRow = acceptRow && true;
  } else {
    acceptRow = acceptRow && false;
  }

  return acceptRow;
}
