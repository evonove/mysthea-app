#include <QtTest/QtTest>

#include "models/cardsmodel.h"
#include "models/typemodel.h"
#include "models/typeproxymodel.h"

class TestSearchModel : public QObject {
  Q_OBJECT

private slots:
  void testDefaultFilters();
  void testCodeFilter();
  void testTypeFilter();
  void testCommandFilter();
  void testMixedFilters();
  void testResetFilter();
  void testCaseInsensitiveFilter();
};

void TestSearchModel::testDefaultFilters() {
  // Verifies all cards are shown when no filter is applied

  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
}

void TestSearchModel::testCodeFilter() {
  // Verifies that changing only Code to filter rows are filtered correctly
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Applies various Code filters and verifies expected number of rows is
  //  shown
  typeProxy->setCodeFilter("C");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  auto cardsX = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsX->rowCount(QModelIndex()), 20);
  auto cardsI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsI->rowCount(QModelIndex()), 20);
  auto cardsII = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(cardsII->rowCount(QModelIndex()), 20);
  auto cardsIII = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsIII->rowCount(QModelIndex()), 20);

  typeProxy->setCodeFilter("H");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsHero = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                       .value<CardsProxyModel *>();
  QCOMPARE(cardsHero->rowCount(QModelIndex()), 4);

  typeProxy->setCodeFilter("A");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsAttunement =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
          .value<CardsProxyModel *>();
  QCOMPARE(cardsAttunement->rowCount(QModelIndex()), 10);

  typeProxy->setCodeFilter("C01");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsC01 = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsC01->rowCount(QModelIndex()), 10);

  typeProxy->setCodeFilter("H04");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsH04 = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsH04->rowCount(QModelIndex()), 1);
}

void TestSearchModel::testTypeFilter() {
  // Verifies that changing only Category to filter rows are filtered
  // correctly
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Applies various Category filters and verifies expected number of rows is
  // shown
  typeProxy->setTypeFilter("All types");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);

  typeProxy->setTypeFilter("Era X");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);

  typeProxy->setTypeFilter("Era I");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);

  typeProxy->setTypeFilter("Era II");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);

  typeProxy->setTypeFilter("Era III");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);

  typeProxy->setTypeFilter("Hero");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);

  typeProxy->setTypeFilter("Attunement");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
}

void TestSearchModel::testCommandFilter() {
  // Verifies that changing only Color to filter rows are filtered correctly
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Applies various Color filters and verifies expected number of rows is
  //  shown
  typeProxy->setCommandFilter("All commands");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto cardsX = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsX->rowCount(QModelIndex()), 20);
  auto cardsI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsI->rowCount(QModelIndex()), 20);
  auto cardsII = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(cardsII->rowCount(QModelIndex()), 20);
  auto cardsIII = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsIII->rowCount(QModelIndex()), 20);
  auto cardsHero = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                       .value<CardsProxyModel *>();
  QCOMPARE(cardsHero->rowCount(QModelIndex()), 4);
  auto cardsAttunement =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
          .value<CardsProxyModel *>();
  QCOMPARE(cardsAttunement->rowCount(QModelIndex()), 10);

  typeProxy->setCommandFilter("Tactic");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  auto X = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
               .value<CardsProxyModel *>();
  QCOMPARE(X->rowCount(QModelIndex()), 5);
  auto I = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
               .value<CardsProxyModel *>();
  QCOMPARE(I->rowCount(QModelIndex()), 5);
  auto II = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                .value<CardsProxyModel *>();
  QCOMPARE(II->rowCount(QModelIndex()), 5);
  auto III = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                 .value<CardsProxyModel *>();
  QCOMPARE(III->rowCount(QModelIndex()), 5);

  typeProxy->setCommandFilter("Objective");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  auto cardX = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardX->rowCount(QModelIndex()), 5);
  auto cardI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardI->rowCount(QModelIndex()), 5);
  auto cardII = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardII->rowCount(QModelIndex()), 5);
  auto cardIII = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(cardIII->rowCount(QModelIndex()), 5);

  typeProxy->setCommandFilter("Accessory");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  auto x = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
               .value<CardsProxyModel *>();
  QCOMPARE(x->rowCount(QModelIndex()), 5);
  auto i = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
               .value<CardsProxyModel *>();
  QCOMPARE(i->rowCount(QModelIndex()), 5);
  auto ii = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                .value<CardsProxyModel *>();
  QCOMPARE(ii->rowCount(QModelIndex()), 5);
  auto iii = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                 .value<CardsProxyModel *>();
  QCOMPARE(iii->rowCount(QModelIndex()), 5);

  typeProxy->setCommandFilter("Upgrade");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  auto eraX = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                  .value<CardsProxyModel *>();
  QCOMPARE(eraX->rowCount(QModelIndex()), 5);
  auto eraI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                  .value<CardsProxyModel *>();
  QCOMPARE(eraI->rowCount(QModelIndex()), 5);
  auto eraII = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(eraII->rowCount(QModelIndex()), 5);
  auto eraIII = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(eraIII->rowCount(QModelIndex()), 5);
}

void TestSearchModel::testMixedFilters() {
  // Verifies changing differents filters row are filtered correctly
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Applies various filters and verifies expected number of rows is shown
  typeProxy->setTypeFilter("Hero");
  typeProxy->setCommandFilter("");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto Hero = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                  .value<CardsProxyModel *>();
  QCOMPARE(Hero->rowCount(QModelIndex()), 4);

  typeProxy->setTypeFilter("Era III");
  typeProxy->setCommandFilter("Tactic");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsTac = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsTac->rowCount(QModelIndex()), 5);

  typeProxy->setTypeFilter("Hero");
  typeProxy->setCommandFilter("Tactic");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 0);

  typeProxy->setTypeFilter("Attunement");
  typeProxy->setCommandFilter("");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto attCard = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(attCard->rowCount(QModelIndex()), 10);

  typeProxy->setTypeFilter("All types");
  typeProxy->setCommandFilter("All commands");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto cardsX = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsX->rowCount(QModelIndex()), 20);
  auto cardsI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsI->rowCount(QModelIndex()), 20);
  auto cardsII = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(cardsII->rowCount(QModelIndex()), 20);
  auto cardsIII = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsIII->rowCount(QModelIndex()), 20);
  auto cardsHero = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                       .value<CardsProxyModel *>();
  QCOMPARE(cardsHero->rowCount(QModelIndex()), 4);
  auto cardsAtt = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsAtt->rowCount(QModelIndex()), 10);

  typeProxy->setTypeFilter("All types");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto xCard = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(xCard->rowCount(QModelIndex()), 20);
  auto Icard = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(Icard->rowCount(QModelIndex()), 20);
  auto IIcard = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(IIcard->rowCount(QModelIndex()), 20);
  auto IIIcard = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(IIIcard->rowCount(QModelIndex()), 20);
  auto heroCard = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(heroCard->rowCount(QModelIndex()), 4);
  auto attCards = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(attCards->rowCount(QModelIndex()), 10);
}

void TestSearchModel::testResetFilter() {
  // Verifies filters are reset to default values
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Verifies default number of rows
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto xCard = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(xCard->rowCount(QModelIndex()), 20);
  auto Icard = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(Icard->rowCount(QModelIndex()), 20);
  auto IIcard = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(IIcard->rowCount(QModelIndex()), 20);
  auto IIIcard = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(IIIcard->rowCount(QModelIndex()), 20);
  auto heroCard = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(heroCard->rowCount(QModelIndex()), 4);
  auto attCards = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(attCards->rowCount(QModelIndex()), 10);

  // Applies various filters and verifies expected number of rows is shown
  typeProxy->setCodeFilter("H");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto att = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                 .value<CardsProxyModel *>();
  QCOMPARE(att->rowCount(QModelIndex()), 4);

  // Resets filters and verifies rows shown are back to default
  typeProxy->resetFilters();
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto cardsX = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsX->rowCount(QModelIndex()), 20);
  auto cardsI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsI->rowCount(QModelIndex()), 20);
  auto cardsII = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(cardsII->rowCount(QModelIndex()), 20);
  auto cardsIII = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsIII->rowCount(QModelIndex()), 20);
  auto cardsHero = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                       .value<CardsProxyModel *>();
  QCOMPARE(cardsHero->rowCount(QModelIndex()), 4);
  auto cardsAtt = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsAtt->rowCount(QModelIndex()), 10);
}

void TestSearchModel::testCaseInsensitiveFilter() {
  // Verifies Code filter is case insensitive
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Verifies default number of rows
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto cardsX = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsX->rowCount(QModelIndex()), 20);
  auto cardsI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsI->rowCount(QModelIndex()), 20);
  auto cardsII = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(cardsII->rowCount(QModelIndex()), 20);
  auto cardsIII = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsIII->rowCount(QModelIndex()), 20);
  auto cardsHero = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                       .value<CardsProxyModel *>();
  QCOMPARE(cardsHero->rowCount(QModelIndex()), 4);
  auto cardsAtt = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsAtt->rowCount(QModelIndex()), 10);

  // Applies filter with uppercase Code
  typeProxy->setCodeFilter("H");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto heroCards = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                       .value<CardsProxyModel *>();
  QCOMPARE(heroCards->rowCount(QModelIndex()), 4);

  // Applies filter with lowercase code
  typeProxy->setCodeFilter("h");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto Hero = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                  .value<CardsProxyModel *>();
  QCOMPARE(Hero->rowCount(QModelIndex()), 4);
}

QTEST_MAIN(TestSearchModel)
#include "tst_searchmodel.moc"
