#pragma once

#include <QAbstractListModel>
#include <QUrl>
#include <QVector>

class TypeComboBoxModel : public QAbstractListModel {
  Q_OBJECT

public:
  TypeComboBoxModel(QObject *parent = Q_NULLPTR);
  ~TypeComboBoxModel() Q_DECL_OVERRIDE;

  enum Roles { Key = Qt::UserRole + 1, Type, IconUrl };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

  Q_INVOKABLE QString getTypeFromIndex(int index) const;
  Q_INVOKABLE QUrl iconUrl(const int &type) const;

private:
  QHash<int, QString> m_types;
  QHash<int, QString> m_typesIcon;
};
