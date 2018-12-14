#ifndef COMMANDLISTMODEL_H
#define COMMANDLISTMODEL_H

#include <QAbstractListModel>
#include <QVector>

class CommandListModel : public QAbstractListModel {
  Q_OBJECT

public:
  CommandListModel(QObject *parent = Q_NULLPTR);
  ~CommandListModel() Q_DECL_OVERRIDE;

  enum Roles { Key = Qt::UserRole + 1, Command };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

  Q_INVOKABLE QString getTypeFromIndex(int index) const;

private:
  QHash<int, QString> m_commands;
};

#endif // COMMANDLISTMODEL_H
