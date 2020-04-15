#pragma once

#include <QAbstractListModel>
#include <QQmlParserStatus>
#include <QUrl>

class CommandComboBoxModel : public QAbstractListModel,
                             public QQmlParserStatus {
  Q_OBJECT
  Q_INTERFACES(QQmlParserStatus)
  Q_PROPERTY(QUrl configurationFilePath WRITE setConfigurationFilePath NOTIFY
                 configurationFilePathChanged)
public:
  explicit CommandComboBoxModel(QObject *parent = nullptr);
  ~CommandComboBoxModel() override;

  void classBegin() override;
  void componentComplete() override;

  enum Roles { Key = Qt::UserRole + 1, Command, IconUrl, Color };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const override;
  int rowCount(const QModelIndex &parent = QModelIndex()) const override;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const override;
  Q_INVOKABLE QString color(const int &command) const;
  Q_INVOKABLE QUrl iconUrl(const int &command) const;

  void setConfigurationFilePath(const QUrl &url);

signals:
  void configurationFilePathChanged();

private:
  void processFile();
  QString convertUrlToFilePath(const QUrl &url);

  QHash<int, QString> m_commands;
  QHash<int, QString> m_commandsIcon;
  QHash<int, QString> m_commandsColor;
  QUrl m_configurationFilePath;
};
