#include "artworksmodel.h"
#include <QFile>
#include <QGuiApplication>
#include <QJsonArray>
#include <QJsonObject>
#include <QVariant>

ArtworksModel::ArtworksModel(QObject *parent) : QAbstractListModel{parent} {}

void ArtworksModel::classBegin() {}

void ArtworksModel::componentComplete() {
  if (!m_configurationFile.isEmpty()) {
    this->processFile();
  }
}

void ArtworksModel::setConfigurationFilePath(const QUrl &url) {
  if (m_configurationFilePath != url) {
    m_configurationFilePath = url;

    auto filePath = convertUrlToFilePath(url);

    QFile file;
    file.setFileName(filePath);
    if (file.open(QIODevice::ReadOnly)) {
      QJsonDocument confFile;
      QJsonParseError error;
      confFile = QJsonDocument::fromJson(file.readAll(), &error);
      m_configurationFile = confFile;
    }

    this->processFile();
    emit configurationFilePathChanged();
  }
}

QString ArtworksModel::convertUrlToFilePath(const QUrl &url) {
  // This function convert the url passed from qml in a valid resource path.
  if (url.scheme().compare(QLatin1String("qrc"), Qt::CaseInsensitive) == 0) {
    if (url.authority().isEmpty()) {
      return QLatin1Char(':') + url.path();
    }
  }
  return QString();
}

QUrl ArtworksModel::configurationFilePath() const {
  return m_configurationFilePath;
}

QHash<int, QByteArray> ArtworksModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Type, "type"},
                                {Roles::Image, "image"},
                                {Roles::Name, "name"},
                                {Roles::Author, "author"}};
}

int ArtworksModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_artworks.size();
}

QVariant ArtworksModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();

  if (row < 0 || row > m_artworks.size() - 1) {
    return QVariant();
  }

  switch (role) {
  case Roles::Type:
    return m_artworks.at(row).type;
  case Roles::Image:
    return m_artworks.at(row).image;
  case Roles::Name:
    return m_artworks.at(row).name;
  case Roles::Author:
    return m_artworks.at(row).author;
  default:
    return QVariant();
  }
}

void ArtworksModel::processFile() {
  m_artworks.clear();
  //   Check the validity of file.
  if (!m_configurationFile.isNull()) {
    auto contentFile = m_configurationFile.object();
    if (contentFile.contains("artworks") && contentFile["artworks"].isArray()) {

      QJsonArray artworksArray = contentFile["artworks"].toArray();

      for (auto i = 0; i < artworksArray.size(); ++i) {
        if (artworksArray[i].isObject()) {
          auto artworkObject = artworksArray[i].toObject();

          Artwork artwork;
          artwork.name = artworkObject["name"].toString();
          artwork.type = artworkObject["type"].toInt();
          artwork.author = artworkObject["author"].toString();
          artwork.image = artworkObject["image"].toString();
          m_artworks.append(artwork);
        }
      }
    }
  }
}
