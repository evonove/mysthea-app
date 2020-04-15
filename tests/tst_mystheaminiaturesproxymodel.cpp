#pragma once
#include <QUrl>
#include <QtTest/QtTest>

#include <miniaturesfiltermodel.h>
#include <miniaturesmodel.h>

class TestMystheaMiniaturesProxyModel : public QObject {
  Q_OBJECT
private:
  MiniaturesFilterModel *m_miniaturesFilterModel;
  MiniaturesModel *m_miniatureModel;
private slots:
  void initTestCase() {
    QUrl url("qrc:/configurations/mysthea_configuration.json");
    m_miniatureModel = new MiniaturesModel(this);
    m_miniatureModel->setConfigurationFilePath(url);
    m_miniaturesFilterModel = new MiniaturesFilterModel(this);

    m_miniaturesFilterModel->setSourceModel(m_miniatureModel);
  }

  void testMiniaturesModelReturnsAllImages() {
    // Test miniatures filters model returns all artwrorks.
    QCOMPARE(m_miniaturesFilterModel->rowCount(), 7);
  }

  void testHeroesTypeFilterRetrunOnlyChampions() {
    // Test miniatures filters model returns only Heroes artwrorks.
    m_miniaturesFilterModel->setType(1);
    QCOMPARE(m_miniaturesFilterModel->rowCount(), 7);

    // Check the content of the first Artowork in the list.
    auto miniatureType =
        m_miniatureModel
            ->data(m_miniatureModel->index(0, 0), MiniaturesModel::Type)
            .toInt();
    QCOMPARE(miniatureType, 1);
    auto miniatureName =
        m_miniatureModel
            ->data(m_miniatureModel->index(0, 0), MiniaturesModel::Name)
            .toString();
    QCOMPARE(miniatureName, "Telron");
    auto miniatureImage =
        m_miniatureModel
            ->data(m_miniatureModel->index(0, 0), MiniaturesModel::Image)
            .toString();
    QCOMPARE(miniatureImage,
             "qrc:/assets/images/extras/miniatures/mysthea/mini_telron.jpg");
  }
};

QTEST_MAIN(TestMystheaMiniaturesProxyModel)
#include "tst_mystheaminiaturesproxymodel.moc"
