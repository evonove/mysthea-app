#include <QUrl>
#include <QtTest/QtTest>

#include <artworksfiltermodel.h>
#include <artworksmodel.h>

class TestIcaionArtworksProxyModel : public QObject {
  Q_OBJECT
private:
  ArtworksFilterModel *m_artworksFilterModel;
  ArtworksModel *m_artworksModel;
private slots:
  void initTestCase() {
    m_artworksModel = new ArtworksModel(this);
    QUrl url("qrc:/configurations/icaion_configuration.json");
    m_artworksModel->setConfigurationFilePath(url);
    m_artworksFilterModel = new ArtworksFilterModel(this);

    m_artworksFilterModel->setSourceModel(m_artworksModel);
  }

  void testArtworksModelReturnsAllImages() {
    // Test artworks filters model returns all artwrorks.
    QCOMPARE(m_artworksFilterModel->rowCount(), 41);
  }

  void testColossusTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Colossus artwrorks.
    m_artworksFilterModel->setType(7);
    QCOMPARE(m_artworksFilterModel->rowCount(), 2);

    //    // Check the content of the first Artowork in the list.
    auto artworkType =
        m_artworksModel->data(m_artworksModel->index(0, 0), ArtworksModel::Type)
            .toInt();
    QCOMPARE(artworkType, 7);
    auto artworkName =
        m_artworksModel->data(m_artworksModel->index(0, 0), ArtworksModel::Name)
            .toString();
    QCOMPARE(artworkName, "Colossus");
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
             "qrc:/assets/images/extras/artworks/icaion/colossus_1.jpg");
  }

  void testSeekersTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Seekers artwrorks.
    m_artworksFilterModel->setType(8);
    QCOMPARE(m_artworksFilterModel->rowCount(), 7);
  }

  void testMachinesTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Machines artwrorks.
    m_artworksFilterModel->setType(9);
    QCOMPARE(m_artworksFilterModel->rowCount(), 3);
  }

  void testSpecializedGearTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Specialized Gear artwrorks.
    m_artworksFilterModel->setType(10);
    QCOMPARE(m_artworksFilterModel->rowCount(), 10);
  }

  void testWondersTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Wonders artwrorks.
    m_artworksFilterModel->setType(11);
    QCOMPARE(m_artworksFilterModel->rowCount(), 7);
  }

  void testEventsTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Events artwrorks.
    m_artworksFilterModel->setType(12);
    QCOMPARE(m_artworksFilterModel->rowCount(), 5);
  }

  void testParasitesTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Parasites artwrorks.
    m_artworksFilterModel->setType(13);
    QCOMPARE(m_artworksFilterModel->rowCount(), 2);
  }

  void testPlayerboardsTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Playerboards artwrorks.
    m_artworksFilterModel->setType(14);
    QCOMPARE(m_artworksFilterModel->rowCount(), 5);
  }

  void cleanupTestCase() { m_artworksFilterModel->deleteLater(); }
};

QTEST_MAIN(TestIcaionArtworksProxyModel)
#include "tst_icaionartworksproxymodel.moc"
