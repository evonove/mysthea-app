#include <QUrl>
#include <QtTest/QtTest>

#include <artworksfiltermodel.h>
#include <artworksmodel.h>

class TestMystheaArtworksProxyModel : public QObject {
  Q_OBJECT
private:
  ArtworksFilterModel *m_artworksFilterModel;
  ArtworksModel *m_artworksModel;
private slots:
  void initTestCase() {
    m_artworksModel = new ArtworksModel(this);
    QUrl url("qrc:/configurations/mysthea_configuration.json");
    m_artworksModel->setConfigurationFilePath(url);
    m_artworksFilterModel = new ArtworksFilterModel(this);

    m_artworksFilterModel->setSourceModel(m_artworksModel);
  }

  void testArtworksModelReturnsAllImages() {
    // Test artworks filters model returns all artwrorks.
    QCOMPARE(m_artworksFilterModel->rowCount(), 45);
  }

  void testChampionsTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Champion artwrorks.
    m_artworksFilterModel->setType(1);
    QCOMPARE(m_artworksFilterModel->rowCount(), 7);

    // Check the content of the first Artowork in the list.
    auto artworkType =
        m_artworksModel->data(m_artworksModel->index(0, 0), ArtworksModel::Type)
            .toInt();
    QCOMPARE(artworkType, 1);
    auto artworkName =
        m_artworksModel->data(m_artworksModel->index(0, 0), ArtworksModel::Name)
            .toString();
    QCOMPARE(artworkName, "Telron");
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
             "qrc:/assets/images/extras/artworks/mysthea/champ_1.jpg");
  }

  void testAttunementsTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Attunements artwrorks.
    m_artworksFilterModel->setType(2);
    QCOMPARE(m_artworksFilterModel->rowCount(), 10);
  }

  void testEncounterTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Encounter artwrorks.
    m_artworksFilterModel->setType(3);
    QCOMPARE(m_artworksFilterModel->rowCount(), 10);
  }

  void testMonstersTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Monsters artwrorks.
    m_artworksFilterModel->setType(4);
    QCOMPARE(m_artworksFilterModel->rowCount(), 7);
  }

  void testRegionsTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Regions artwrorks.
    m_artworksFilterModel->setType(5);
    QCOMPARE(m_artworksFilterModel->rowCount(), 6);
  }

  void testGuildsTypeFilterRetrunOnlyChampions() {
    // Test artworks filters model returns only Guilds artwrorks.
    m_artworksFilterModel->setType(6);
    QCOMPARE(m_artworksFilterModel->rowCount(), 5);
  }

  void cleanupTestCase() { m_artworksFilterModel->deleteLater(); }
};

QTEST_MAIN(TestMystheaArtworksProxyModel)
#include "tst_mystheaartworksproxymodel.moc"
