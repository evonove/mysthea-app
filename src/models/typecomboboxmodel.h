#pragma once

#include <QAbstractListModel>
#include <QJsonDocument>
#include <QQmlParserStatus>
#include <QUrl>

class TypeComboBoxModel : public QAbstractListModel, public QQmlParserStatus {
  Q_OBJECT
  Q_INTERFACES(QQmlParserStatus)
  Q_PROPERTY(QUrl configurationFilePath WRITE setConfigurationFilePath NOTIFY
                 configurationFilePathChanged)

public:
  explicit TypeComboBoxModel(QObject *parent = nullptr);
  ~TypeComboBoxModel() override;

  void classBegin() override;
  void componentComplete() override;

  enum Roles { Key = Qt::UserRole + 1, Type, IconUrl };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const override;
  int rowCount(const QModelIndex &parent = QModelIndex()) const override;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const override;

  Q_INVOKABLE QString getTypeFromIndex(int index) const;
  Q_INVOKABLE QUrl iconUrl(const int &type) const;

  void setConfigurationFilePath(const QUrl &url);

signals:
  void configurationFilePathChanged();

private:
  void processFile();
  QString convertUrlToFilePath(const QUrl &url);

  QHash<int, QString> m_types;
  QHash<int, QString> m_typesIcon;
  QUrl m_configurationFilePath;
  QJsonDocument m_configurationFile;
};
