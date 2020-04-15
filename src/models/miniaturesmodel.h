#pragma once

#include "miniatures_data.h"
#include <QAbstractListModel>
#include <QJsonDocument>
#include <QQmlParserStatus>
#include <QUrl>
#include <QVector>

class MiniaturesModel : public QAbstractListModel, public QQmlParserStatus {
  Q_OBJECT
  Q_INTERFACES(QQmlParserStatus)
  Q_PROPERTY(QUrl configurationFilePath READ configurationFilePath WRITE
                 setConfigurationFilePath NOTIFY configurationFilePathChanged)

public:
  explicit MiniaturesModel(QObject *parent = Q_NULLPTR);

  void classBegin();
  void componentComplete();

  enum Roles {
    Type = Qt::UserRole + 1,
    Image,
    Name,
  };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;

  QUrl configurationFilePath() const;
  void setConfigurationFilePath(const QUrl &url);

signals:
  void configurationFilePathChanged();

private:
  void processFile();
  QString convertUrlToFilePath(const QUrl &url);

  QVector<Miniature> m_miniatures;
  QUrl m_configurationFilePath;
  QJsonDocument m_configurationFile;
};
