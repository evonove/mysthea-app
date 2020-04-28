#include <QUrl>
#include <QtTest/QtTest>

#include <thefalltypeproxymodel.h>
#include <typemodel.h>

class TestTheFallTypeProxyModel : public QObject {
  Q_OBJECT
private:
  TheFallTypeProxyModel *m_typeProxyModel;
private slots:
  void initTestCase() {
    QUrl url("qrc:/configurations/the_fall_configuration.json");
    m_typeProxyModel = new TheFallTypeProxyModel(this);
    m_typeProxyModel->setConfigurationFilePath(url);
  }

  void testNoFilterSetup() {
    // Proxy model returns all cards if no filter is setted.
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 21);
  }

  void testTypeFilters() {
    // Proxy model returns only Curio cards.
    m_typeProxyModel->setTypeFilter(1);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);

    // Proxy model returns only Seeker cards.
    m_typeProxyModel->setTypeFilter(2);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);

    // Proxy model returns only Specialized gear cards.
    m_typeProxyModel->setTypeFilter(3);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 7);
  }

  void testMixedTypeCodeFilters() {
    // Sets proxy model to 'All types' to obtain all cards.
    m_typeProxyModel->setTypeFilter(0);
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 21);

    // Test that proxy model works correctly if we set code, type and command
    // filters.
    m_typeProxyModel->setTypeFilter(1);
    m_typeProxyModel->setCodeFilter("IN040");

    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 1);

    // Check the content card is correct.
    auto cardCode = m_typeProxyModel->visibleCards()
                        ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                               CardsModel::Code)
                        .toString();
    QCOMPARE(cardCode, "IN040");
    auto cardName = m_typeProxyModel->visibleCards()
                        ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                               CardsModel::Name)
                        .toString();
    QCOMPARE(cardName, "CR-2T1");
    auto cardTypeText =
        m_typeProxyModel->visibleCards()
            ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                   CardsModel::TypeText)
            .toString();
    QCOMPARE(cardTypeText, "Mysthea Champions");

    auto cardImageText =
        m_typeProxyModel->visibleCards()
            ->data(m_typeProxyModel->visibleCards()->index(0, 0),
                   CardsModel::Image)
            .toString();
    QCOMPARE(cardImageText, "thefall/in040.jpg");
  }

  void testUnexistingCodeFilter() {
    // Reset everything.
    m_typeProxyModel->resetFilters();
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 21);
    // Sets unexisting code.
    m_typeProxyModel->setCodeFilter("C200");
    QCOMPARE(m_typeProxyModel->visibleCards()->rowCount(), 0);
  }

  void cleanupTestCase() { m_typeProxyModel->deleteLater(); }
};

QTEST_MAIN(TestTheFallTypeProxyModel)
#include "tst_thefalltypeproxymodel.moc"
