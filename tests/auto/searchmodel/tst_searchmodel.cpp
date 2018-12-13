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

  void testIndexOf();
  void testVisibleCards();
};

void TestSearchModel::testDefaultFilters() {
  // Verifies all cards are shown when no filter is applied

  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto cardsX =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(cardsX, "Era X");
  auto cardsI =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::Type).toString();
  QCOMPARE(cardsI, "Era I");
  auto cardsII =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::Type).toString();
  QCOMPARE(cardsII, "Era II");
  auto cardsIII =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::Type).toString();
  QCOMPARE(cardsIII, "Era III");
  auto cardsHero =
      typeProxy->data(typeProxy->index(4, 0), TypeModel::Type).toString();
  QCOMPARE(cardsHero, "Hero");
  auto cardsAtt =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::Type).toString();
  QCOMPARE(cardsAtt, "Attunement");
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
  auto typeX =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(typeX, "Era X");

  auto cardsI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsI->rowCount(QModelIndex()), 20);
  auto typeI =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::Type).toString();
  QCOMPARE(typeI, "Era I");

  auto cardsII = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(cardsII->rowCount(QModelIndex()), 20);
  auto typeII =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::Type).toString();
  QCOMPARE(typeII, "Era II");

  auto cardsIII = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsIII->rowCount(QModelIndex()), 20);
  auto typeIII =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::Type).toString();
  QCOMPARE(typeIII, "Era III");

  typeProxy->setCodeFilter("H");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsHero = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                       .value<CardsProxyModel *>();
  QCOMPARE(cardsHero->rowCount(QModelIndex()), 4);
  auto typeHero =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(typeHero, "Hero");

  typeProxy->setCodeFilter("A");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsAttunement =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
          .value<CardsProxyModel *>();
  QCOMPARE(cardsAttunement->rowCount(QModelIndex()), 10);
  auto typeAtt =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(typeAtt, "Attunement");

  typeProxy->setCodeFilter("C01");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsC01 = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsC01->rowCount(QModelIndex()), 10);
  auto Xtype =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(Xtype, "Era X");

  typeProxy->setCodeFilter("H04");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsH04 = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsH04->rowCount(QModelIndex()), 1);
  auto heroType =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(heroType, "Hero");
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
  auto cardsX =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(cardsX, "Era X");

  typeProxy->setTypeFilter("Era I");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsI =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(cardsI, "Era I");

  typeProxy->setTypeFilter("Era II");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsII =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(cardsII, "Era II");

  typeProxy->setTypeFilter("Era III");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsIII =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(cardsIII, "Era III");

  typeProxy->setTypeFilter("Hero");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsHero =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(cardsHero, "Hero");

  typeProxy->setTypeFilter("Attunement");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsAtt =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(cardsAtt, "Attunement");
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
  auto typeX =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(typeX, "Era X");
  auto cardsI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                    .value<CardsProxyModel *>();
  QCOMPARE(cardsI->rowCount(QModelIndex()), 20);
  auto typeI =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::Type).toString();
  QCOMPARE(typeI, "Era I");
  auto cardsII = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(cardsII->rowCount(QModelIndex()), 20);
  auto typeII =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::Type).toString();
  QCOMPARE(typeII, "Era II");
  auto cardsIII = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                      .value<CardsProxyModel *>();
  QCOMPARE(cardsIII->rowCount(QModelIndex()), 20);
  auto typeIII =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::Type).toString();
  QCOMPARE(typeIII, "Era III");
  auto cardsHero = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                       .value<CardsProxyModel *>();
  QCOMPARE(cardsHero->rowCount(QModelIndex()), 4);
  auto typeHero =
      typeProxy->data(typeProxy->index(4, 0), TypeModel::Type).toString();
  QCOMPARE(typeHero, "Hero");
  auto cardsAttunement =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
          .value<CardsProxyModel *>();
  QCOMPARE(cardsAttunement->rowCount(QModelIndex()), 10);
  auto typeAtt =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::Type).toString();
  QCOMPARE(typeAtt, "Attunement");

  typeProxy->setCommandFilter("Tactic");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  auto X = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
               .value<CardsProxyModel *>();
  QCOMPARE(X->rowCount(QModelIndex()), 5);
  auto Xtype =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(Xtype, "Era X");
  auto I = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
               .value<CardsProxyModel *>();
  QCOMPARE(I->rowCount(QModelIndex()), 5);
  auto Itype =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::Type).toString();
  QCOMPARE(Itype, "Era I");
  auto II = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                .value<CardsProxyModel *>();
  QCOMPARE(II->rowCount(QModelIndex()), 5);
  auto IItype =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::Type).toString();
  QCOMPARE(IItype, "Era II");
  auto III = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                 .value<CardsProxyModel *>();
  QCOMPARE(III->rowCount(QModelIndex()), 5);
  auto IIItype =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::Type).toString();
  QCOMPARE(IIItype, "Era III");

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
  auto cardIII = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                     .value<CardsProxyModel *>();
  QCOMPARE(cardIII->rowCount(QModelIndex()), 5);

  auto tX = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(tX, "Era X");
  auto tI = typeProxy->data(typeProxy->index(1, 0), TypeModel::Type).toString();
  QCOMPARE(tI, "Era I");
  auto tII =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::Type).toString();
  QCOMPARE(tII, "Era II");
  auto tIII =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::Type).toString();
  QCOMPARE(tIII, "Era III");

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
  auto iii = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                 .value<CardsProxyModel *>();
  QCOMPARE(iii->rowCount(QModelIndex()), 5);

  auto Xt = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(Xt, "Era X");
  auto It = typeProxy->data(typeProxy->index(1, 0), TypeModel::Type).toString();
  QCOMPARE(tI, "Era I");
  auto IIt =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::Type).toString();
  QCOMPARE(IIt, "Era II");
  auto IIIt =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::Type).toString();
  QCOMPARE(IIIt, "Era III");

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
  auto eraIII = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
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

  auto Xty =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(Xty, "Era X");
  auto Ity =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::Type).toString();
  QCOMPARE(Ity, "Era I");
  auto IIty =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::Type).toString();
  QCOMPARE(IIty, "Era II");
  auto IIIty =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::Type).toString();
  QCOMPARE(IIIty, "Era III");
  auto Heroty =
      typeProxy->data(typeProxy->index(4, 0), TypeModel::Type).toString();
  QCOMPARE(Heroty, "Hero");
  auto attuTy =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::Type).toString();
  QCOMPARE(attuTy, "Attunement");
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
  auto Xty =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(Xty, "Era X");
  auto Ity =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::Type).toString();
  QCOMPARE(Ity, "Era I");
  auto IIty =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::Type).toString();
  QCOMPARE(IIty, "Era II");
  auto IIIty =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::Type).toString();
  QCOMPARE(IIIty, "Era III");
  auto Heroty =
      typeProxy->data(typeProxy->index(4, 0), TypeModel::Type).toString();
  QCOMPARE(Heroty, "Hero");
  auto attuTy =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::Type).toString();
  QCOMPARE(attuTy, "Attunement");

  // Applies filter with uppercase Code
  typeProxy->setCodeFilter("H");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto heroCards = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                       .value<CardsProxyModel *>();
  QCOMPARE(heroCards->rowCount(QModelIndex()), 4);
  auto typeHero =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(typeHero, "Hero");

  // Applies filter with lowercase code
  typeProxy->setCodeFilter("h");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto Hero = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                  .value<CardsProxyModel *>();
  QCOMPARE(Hero->rowCount(QModelIndex()), 4);
  auto typeH =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::Type).toString();
  QCOMPARE(typeH, "Hero");
}

void TestSearchModel::testIndexOf() {
  // Verfies indexOf function returns the correct position of clicked card.
  auto cardModel = new CardsModel();
  // create a mock vector of cards.
  QVector<Card> cards;
  cards.append({"C001", 0, "", "", ""});
  cards.append({"C002", 0, "", "", " "});
  cards.append({"C003", 0, "", "", " "});
  cards.append({"C004", 0, "", "", " "});
  cards.append({"H01", 0, "", "", " "});
  cards.append({"H02", 0, "", "", " "});
  cards.append({"A01", 0, "", "", " "});
  cardModel->setCards(cards);
  QCOMPARE(cardModel->indexOf("C003"), 2);
  QCOMPARE(cardModel->indexOf("X484373738"), -1);
}

void TestSearchModel::testVisibleCards() {
  // Verfies changing differents filters to check visibleCards
  // function return the correct number of filtered cards.
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 94);
  // Applies code filter.
  typeProxy->setCodeFilter("01");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 13);
  typeProxy->setCodeFilter("C01");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 10);
  typeProxy->setCodeFilter("A01");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 1);
  typeProxy->setCodeFilter("ASDFGH");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 0);

  typeProxy->resetFilters();
  // Applies type filters.
  typeProxy->setTypeFilter("Era X");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 20);
  typeProxy->setTypeFilter("Era II");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 20);

  // Applies mixed filters.
  typeProxy->setTypeFilter("Era I");
  typeProxy->setCommandFilter("Objective");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 5);

  typeProxy->setTypeFilter("Hero");
  typeProxy->setCommandFilter("All commands");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 4);
  typeProxy->setCodeFilter("01");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 1);
}

QTEST_MAIN(TestSearchModel)
#include "tst_searchmodel.moc"
