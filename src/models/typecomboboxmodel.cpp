#include "typecomboboxmodel.h"
#include "card_data.h"

#include <QGuiApplication>
#include <QList>
#include <QVariant>

TypeComboBoxModel::TypeComboBoxModel(QObject *parent)
    : QAbstractListModel{parent},
      m_types{{0, ALL_TYPES_TEXT},  {1, ERA_TEXT},       {2, ERA_TEXT},
              {3, ERA_TEXT},        {4, ERA_TEXT},       {5, HERO_TEXT},
              {6, ATTUNEMENT_TEXT}, {7, ENCOUNTER_TEXT}, {8, EVENT_TEXT}},
      m_typesIcon{{1, "qrc:/assets/icons/era_x.svg"},
                  {2, "qrc:/assets/icons/era_1.svg"},
                  {3, "qrc:/assets/icons/era_2.svg"},
                  {4, "qrc:/assets/icons/era_3.svg"}} {}

TypeComboBoxModel::~TypeComboBoxModel() {}

QHash<int, QByteArray> TypeComboBoxModel::roleNames() const {
  return QHash<int, QByteArray>{
      {Roles::Key, "key"}, {Roles::Type, "type"}, {Roles::IconUrl, "iconUrl"}};
}

int TypeComboBoxModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_types.size();
}

QVariant TypeComboBoxModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();
  if (row < 0 || row >= m_types.size()) {
    return QVariant();
  }

  switch (role) {
  case Roles::Key:
    return row;
  case Roles::Type:
    return qGuiApp->translate("CardsData",
                              m_types.value(row).toStdString().c_str());
  case Roles::IconUrl:
    return m_typesIcon.value(row, "");
  default:
    return QVariant();
  }
}

QString TypeComboBoxModel::getTypeFromIndex(int index) const {
  return m_types.value(index);
}

QUrl TypeComboBoxModel::iconUrl(const int &type) const {
  QUrl url(m_typesIcon.value(type, ""));
  return url.path();
}
