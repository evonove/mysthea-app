#pragma once

#include <QAbstractListModel>
#include <QUrl>
#include <QVector>

class CommandComboBoxModel : public QAbstractListModel {
  Q_OBJECT

public:
  CommandComboBoxModel(QObject *parent = Q_NULLPTR);
  ~CommandComboBoxModel() Q_DECL_OVERRIDE;

  enum Roles { Key = Qt::UserRole + 1, Command, IconUrl, Color };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;
  Q_INVOKABLE QString color(const int &command) const;
  Q_INVOKABLE QUrl iconUrl(const int &command) const;

private:
  QHash<int, QString> m_commands;
  QHash<int, QString> m_commandsIcon;
  QHash<int, QString> m_commandsColor;
};
