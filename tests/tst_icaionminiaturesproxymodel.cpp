#include <QUrl>
#include <QtTest/QtTest>

#include <miniaturesfiltermodel.h>
#include <miniaturesmodel.h>

class TestIcaionMiniaturesProxyModel : public QObject {
  Q_OBJECT
private:
  MiniaturesFilterModel *m_miniaturesFilterModel;
  MiniaturesModel *m_miniatureModel;
private slots:
  void initTestCase() {
    QUrl url("qrc:/configurations/icaion_configuration.json");
    m_miniatureModel = new MiniaturesModel(this);
    m_miniatureModel->setConfigurationFilePath(url);
    m_miniaturesFilterModel = new MiniaturesFilterModel(this);

    m_miniaturesFilterModel->setSourceModel(m_miniatureModel);
  }

  void testMiniaturesModelReturnsAllImages() {
    // Test miniatures filters model returns all artwrorks.
    QCOMPARE(m_miniaturesFilterModel->rowCount(), 23);
  }

  void testColossusTypeFilterRetrunOnlyChampions() {
    // Test miniatures filters model returns only Colossus artwrorks.
    m_miniaturesFilterModel->setType(2);
    QCOMPARE(m_miniaturesFilterModel->rowCount(), 1);

    // Check the content of the first Artowork in the list.
    auto miniatureType =
        m_miniatureModel
            ->data(m_miniatureModel->index(0, 0), MiniaturesModel::Type)
            .toInt();
    QCOMPARE(miniatureType, 2);
    auto miniatureName =
        m_miniatureModel
            ->data(m_miniatureModel->index(0, 0), MiniaturesModel::Name)
            .toString();
    QCOMPARE(miniatureName, "Colossus");
    auto miniatureImage =
        m_miniatureModel
            ->data(m_miniatureModel->index(0, 0), MiniaturesModel::Image)
            .toString();
    QCOMPARE(miniatureImage,
             "qrc:/assets/images/extras/miniatures/icaion/mini_colossus.jpg");
  }

  void testSeekersTypeFilterRetrunOnlyChampions() {
    // Test miniatures filters model returns only Seekers artwrorks.
    m_miniaturesFilterModel->setType(3);
    QCOMPARE(m_miniaturesFilterModel->rowCount(), 7);
  }

  void testMachinesTypeFilterRetrunOnlyChampions() {
    // Test miniatures filters model returns only Machines artwrorks.
    m_miniaturesFilterModel->setType(4);
    QCOMPARE(m_miniaturesFilterModel->rowCount(), 3);
  }

  void testWondersTypeFilterRetrunOnlyChampions() {
    // Test miniatures filters model returns only Wonders artwrorks.
    m_miniaturesFilterModel->setType(5);
    QCOMPARE(m_miniaturesFilterModel->rowCount(), 7);
  }

  void testParasitesTypeFilterRetrunOnlyChampions() {
    // Test miniatures filters model returns only Parasites artwrorks.
    m_miniaturesFilterModel->setType(6);
    QCOMPARE(m_miniaturesFilterModel->rowCount(), 5);
  }
};

QTEST_MAIN(TestIcaionMiniaturesProxyModel)
#include "tst_icaionminiaturesproxymodel.moc"
