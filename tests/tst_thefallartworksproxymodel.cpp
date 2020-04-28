#include <QUrl>
#include <QtTest/QtTest>

#include <artworksfiltermodel.h>
#include <artworksmodel.h>

class TestTheFallArtworksProxyModel : public QObject {
  Q_OBJECT
private:
  ArtworksFilterModel *m_artworksFilterModel;
  ArtworksModel *m_artworksModel;
private slots:
  void initTestCase() {
    m_artworksModel = new ArtworksModel(this);
    QUrl url("qrc:/configurations/the_fall_configuration.json");
    m_artworksModel->setConfigurationFilePath(url);
    m_artworksFilterModel = new ArtworksFilterModel(this);

    m_artworksFilterModel->setSourceModel(m_artworksModel);
  }

  void testArtworksModelReturnsAllImages() {
    // Test artworks filters model returns all artwrorks.
    QCOMPARE(m_artworksFilterModel->rowCount(), 5);
  }

  void testColossusTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Colossus artwrorks.
    m_artworksFilterModel->setType(15);
    QCOMPARE(m_artworksFilterModel->rowCount(), 1);

    //    // Check the content of the first Artowork in the list.
    auto artworkType =
        m_artworksModel->data(m_artworksModel->index(0, 0), ArtworksModel::Type)
            .toInt();
    QCOMPARE(artworkType, 15);
    auto artworkName =
        m_artworksModel->data(m_artworksModel->index(0, 0), ArtworksModel::Name)
            .toString();
    QCOMPARE(artworkName, "Mysthea: the Fall");
    auto artworkAuthor =
        m_artworksModel
            ->data(m_artworksModel->index(0, 0), ArtworksModel::Author)
            .toString();
    QCOMPARE(artworkAuthor, "Travis Anderson");
    auto artworkImage =
        m_artworksModel
            ->data(m_artworksModel->index(0, 0), ArtworksModel::Image)
            .toString();
    QCOMPARE(artworkImage,
             "qrc:/assets/images/extras/artworks/thefall/artwork_1.jpg");
  }

  void testSeekersTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Seekers artwrorks.
    m_artworksFilterModel->setType(16);
    QCOMPARE(m_artworksFilterModel->rowCount(), 4);
  }

  void cleanupTestCase() { m_artworksFilterModel->deleteLater(); }
};

QTEST_MAIN(TestTheFallArtworksProxyModel)
#include "tst_thefallartworksproxymodel.moc"
