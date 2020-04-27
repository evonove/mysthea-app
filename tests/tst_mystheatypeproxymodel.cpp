#pragma once
#include <QUrl>
#include <QtTest/QtTest>

#include <mystheatypeproxymodel.h>
#include <typemodel.h>

class TestMystheaTypeProxyModel : public QObject {
  Q_OBJECT
private:
  MystheaTypeProxyModel *m_typeProxyModel;
private slots:
  void initTestCase() {
    QUrl url("qrc:/configurations/mysthea_configuration.json");
    m_typeProxyModel = new MystheaTypeProxyModel(this);
    m_typeProxyModel->setConfigurationFilePath(url);
  }

  void testNoFilterSetup() {
    // Proxy model returns all cards if no filter is setted.
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 140);
  }

  void testTypeFilters() {
    // Proxy model returns only EraX cards.
    m_typeProxyModel->setTypeFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 20);

    // Proxy model returns only EraI cards.
    m_typeProxyModel->setTypeFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 20);

    // Proxy model returns only EraII cards.
    m_typeProxyModel->setTypeFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 20);

    // Proxy model returns only EraII cards.
    m_typeProxyModel->setTypeFilter(4);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 20);

    // Proxy model returns only Champion cards.
    m_typeProxyModel->setTypeFilter(5);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);

    // Proxy model returns only Attunement cards.
    m_typeProxyModel->setTypeFilter(6);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 10);

    // Proxy model returns only Encounter cards.
    m_typeProxyModel->setTypeFilter(7);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 30);

    // Proxy model returns only Event cards.
    m_typeProxyModel->setTypeFilter(8);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 13);
  }

  void testTacticsCommandsFilters() {
    // Sets proxy model to 'All types' to obtain all cards.
    m_typeProxyModel->setTypeFilter(0);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 140);

    // Test 'Tactic' command returns the correct number of cards.
    // 'Tactic' command is enabled only for Eras types.

    m_typeProxyModel->setCommandFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 20);

    // Checks that there are 5 cards for each Eras' types.
    m_typeProxyModel->setTypeFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(4);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    // Test that if we click on Champion the command will be resetted to 0.
    m_typeProxyModel->setTypeFilter(5);
    auto command =
        m_typeProxyModel
            ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
            .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);

    // Test that if we click on Attunement the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(6);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 10);

    // Test that if we click on Encounter the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(7);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 30);

    // Test that if we click on Event the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(8);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 13);
  }

  void testObjectiveCommandsFilters() {
    // Sets proxy model to 'All types' to obtain all cards.
    m_typeProxyModel->setTypeFilter(0);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 140);

    // Test 'Objective' command returns the correct number of cards.
    // 'Objective' command is enabled only for Eras types.

    m_typeProxyModel->setCommandFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 20);

    // Checks that there are 5 cards for each Eras' types.
    m_typeProxyModel->setTypeFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(4);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);

    // Test that if we click on Champion the command will be resetted to 0.
    m_typeProxyModel->setTypeFilter(5);
    auto command =
        m_typeProxyModel
            ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
            .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);

    // Test that if we click on Attunement the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(6);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 10);

    // Test that if we click on Encounter the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(7);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 30);

    // Test that if we click on Event the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(8);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 13);
  }

  void testAccessoryCommandsFilters() {
    // Sets proxy model to 'All types' to obtain all cards.
    m_typeProxyModel->setTypeFilter(0);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 140);

    // Test 'Accessory' command returns the correct number of cards.
    // 'Accessory' command is enabled only for Eras types.

    m_typeProxyModel->setCommandFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 20);

    // Checks that there are 5 cards for each Eras' types.
    m_typeProxyModel->setTypeFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(4);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);

    // Test that if we click on Champion the command will be resetted to 0.
    m_typeProxyModel->setTypeFilter(5);
    auto command =
        m_typeProxyModel
            ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
            .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);

    // Test that if we click on Attunement the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(6);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 10);

    // Test that if we click on Encounter the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(7);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 30);

    // Test that if we click on Event the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(8);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 13);
  }

  void testUpgradeCommandsFilters() {
    // Sets proxy model to 'All types' to obtain all cards.
    m_typeProxyModel->setTypeFilter(0);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 140);

    // Test 'Upgrade' command returns the correct number of cards.
    // 'Upgrade' command is enabled only for Eras types.

    m_typeProxyModel->setCommandFilter(4);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 20);

    // Checks that there are 5 cards for each Eras' types.
    m_typeProxyModel->setTypeFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);
    m_typeProxyModel->setTypeFilter(4);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 5);

    // Test that if we click on Champion the command will be resetted to 0.
    m_typeProxyModel->setTypeFilter(5);
    auto command =
        m_typeProxyModel
            ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
            .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);

    // Test that if we click on Attunement the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(6);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 10);

    // Test that if we click on Encounter the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(7);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 30);

    // Test that if we click on Event the command will be resetted to 0.
    m_typeProxyModel->setCommandFilter(1);
    m_typeProxyModel->setTypeFilter(8);
    command = m_typeProxyModel
                  ->data(m_typeProxyModel->index(0, 0), CardsModel::Command)
                  .toInt();

    QCOMPARE(command, 0);
    QCOMPARE(m_typeProxyModel->enableCommand(), false);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 13);
  }

  void testMixedTypeCommandCodeFilters() {
    // Sets proxy model to 'All types' to obtain all cards.
    m_typeProxyModel->setTypeFilter(0);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 140);

    // Test that proxy model works correctly if we set code, type and command
    // filters.
    m_typeProxyModel->setTypeFilter(1);
    m_typeProxyModel->setCommandFilter(2);
    m_typeProxyModel->setCodeFilter("C01");

    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 1);

    // Check the content card is correct.
    auto cardCode = m_typeProxyModel->visibleCards()
                        ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                               CardsModel::Code)
                        .toString();
    QCOMPARE(cardCode, "C010");
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
    QCOMPARE(cardTypeText, "Era");

    auto cardCommandText =
        m_typeProxyModel->visibleCards()
            ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                   CardsModel::CommandText)
            .toString();
    QCOMPARE(cardCommandText, "Objective");
  }

  void testUnexistingCodeFilter() {
    // Reset everything.
    m_typeProxyModel->resetFilters();
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 140);
    // Sets unexisting code.
    m_typeProxyModel->setCodeFilter("C200");
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 0);
  }

  void cleanupTestCase() { m_typeProxyModel->deleteLater(); }
};

QTEST_MAIN(TestMystheaTypeProxyModel)
#include "tst_mystheatypeproxymodel.moc"
