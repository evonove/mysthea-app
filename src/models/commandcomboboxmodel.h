#ifndef COMMANDCOMBOBOXMODEL_H
#define COMMANDCOMBOBOXMODEL_H

#include <QAbstractListModel>
#include <QVector>

class CommandComboBoxModel : public QAbstractListModel {
  Q_OBJECT

public:
  CommandComboBoxModel(QObject *parent = Q_NULLPTR);
  ~CommandComboBoxModel() Q_DECL_OVERRIDE;

  enum Roles { Key = Qt::UserRole + 1, Command, IconUrl };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

private:
  QHash<int, QString> m_commands;
  QHash<int, QString> m_commandsIcon;
};

#endif // COMMANDCOMBOBOXMODEL_H
