#pragma once

#include "artworks_data.h"
#include <QAbstractListModel>
#include <QJsonDocument>
#include <QQmlParserStatus>
#include <QUrl>
#include <QVector>

class ArtworksModel : public QAbstractListModel, public QQmlParserStatus {
  Q_OBJECT
  Q_INTERFACES(QQmlParserStatus)
  Q_PROPERTY(QUrl configurationFilePath READ configurationFilePath WRITE
                 setConfigurationFilePath NOTIFY configurationFilePathChanged)

public:
  explicit ArtworksModel(QObject *parent = nullptr);

  void classBegin();
  void componentComplete();

  enum Roles {
    Type = Qt::UserRole + 1,
    Image,
    Name,
    Author,
  };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const override;
  int rowCount(const QModelIndex &parent = QModelIndex()) const override;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const override;

  QUrl configurationFilePath() const;
  void setConfigurationFilePath(const QUrl &url);

signals:
  void configurationFilePathChanged();

private:
  void processFile();
  QString convertUrlToFilePath(const QUrl &url);

  QVector<Artwork> m_artworks;
  QUrl m_configurationFilePath;
  QJsonDocument m_configurationFile;
};
