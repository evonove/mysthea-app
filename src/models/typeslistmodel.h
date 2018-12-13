#ifndef TYPESLISTMODEL_H
#define TYPESLISTMODEL_H

#include <QAbstractListModel>
#include <QVector>

class TypesListModel : public QAbstractListModel {
  Q_OBJECT

public:
  TypesListModel(QObject *parent = Q_NULLPTR);
  ~TypesListModel() Q_DECL_OVERRIDE;

  enum Roles { Key = Qt::UserRole + 1, Type };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

private:
  QHash<int, QString> m_types;
};

#endif // TYPESLISTMODEL_H
