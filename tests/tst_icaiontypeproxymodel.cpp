#pragma once
#include <QUrl>
#include <QtTest/QtTest>

#include <icaiontypeproxymodel.h>
#include <typemodel.h>

class TestIcaionTypeProxyModel : public QObject {
  Q_OBJECT
private:
  IcaionTypeProxyModel *m_typeProxyModel;
private slots:
  void initTestCase() {
    QUrl url("qrc:/configurations/icaion_configuration.json");
    m_typeProxyModel = new IcaionTypeProxyModel(this);
    m_typeProxyModel->setConfigurationFilePath(url);
  }

  void testNoFilterSetup() {
    // Proxy model returns all cards if no filter is setted.
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 82);
  }

  void testTypeFilters() {
    // Proxy model returns only Curio cards.
    m_typeProxyModel->setTypeFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 50);

    // Proxy model returns only Seeker cards.
    m_typeProxyModel->setTypeFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);

    // Proxy model returns only Specialized gear cards.
    m_typeProxyModel->setTypeFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 10);

    // Proxy model returns only Event cards.
    m_typeProxyModel->setTypeFilter(4);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 8);

    // Proxy model returns only Wonder cards.
    m_typeProxyModel->setTypeFilter(5);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);
  }

  void testOneShotCommandsFilters() {
    // Sets proxy model to 'All types' to obtain all cards.
    m_typeProxyModel->setTypeFilter(0);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 82);

    // Test 'OneShot' command returns the correct number of cards.

    m_typeProxyModel->setCommandFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 35);

    // Checks that model returns the correct number of cards even if we set the
    // type.
    m_typeProxyModel->setTypeFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 35);
    m_typeProxyModel->setTypeFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);
    m_typeProxyModel->setTypeFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 10);
    m_typeProxyModel->setTypeFilter(4);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 8);
    m_typeProxyModel->setTypeFilter(5);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);
  }

  void testUpgradeCommandsFilters() {
    // Sets proxy model to 'All types' to obtain all cards.
    m_typeProxyModel->setTypeFilter(0);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 82);

    // Test 'Upgrade' command returns the correct number of cards.
    m_typeProxyModel->setCommandFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 15);

    // Checks the models return the correct number of card even if we set the
    // type.
    m_typeProxyModel->setTypeFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 15);
    m_typeProxyModel->setTypeFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);
    m_typeProxyModel->setTypeFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 10);
    m_typeProxyModel->setTypeFilter(4);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 8);
    m_typeProxyModel->setTypeFilter(5);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);

    auto command =
        m_typeProxyModel
            ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
            .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);
  }

  void testMixedTypeCommandCodeFilters() {
    // Sets proxy model to 'All types' to obtain all cards.
    m_typeProxyModel->setTypeFilter(0);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 82);

    // Test that proxy model works correctly if we set code, type and command
    // filters.
    m_typeProxyModel->setTypeFilter(1);
    m_typeProxyModel->setCommandFilter(2);
    m_typeProxyModel->setCodeFilter("IN224");

    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 1);

    // Check the content card is correct.
    auto cardCode = m_typeProxyModel->visibleCards()
                        ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                               CardsModel::Code)
                        .toString();
    QCOMPARE(cardCode, "IN224");
    auto cardName = m_typeProxyModel->visibleCards()
                        ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                               CardsModel::Name)
                        .toString();
    QCOMPARE(cardName, "");
    auto cardTypeText =
        m_typeProxyModel->visibleCards()
            ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                   CardsModel::TypeText)
            .toString();
    QCOMPARE(cardTypeText, "Curio");

    auto cardCommandText =
        m_typeProxyModel->visibleCards()
            ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                   CardsModel::CommandText)
            .toString();
    QCOMPARE(cardCommandText, "Upgrade");
  }

  void testUnexistingCodeFilter() {
    // Reset everything.
    m_typeProxyModel->resetFilters();
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 82);
    // Sets unexisting code.
    m_typeProxyModel->setCodeFilter("C200");
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 0);
  }

  void cleanupTestCase() { m_typeProxyModel->deleteLater(); }
};

QTEST_MAIN(TestIcaionTypeProxyModel)
#include "tst_icaiontypeproxymodel.moc"
