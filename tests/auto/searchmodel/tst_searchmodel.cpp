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
  //  void testCommandFilter();
  //    void testMixedFilters();
  //    void testResetFilter();
  //    void testCaseInsensitiveFilter();
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

// void TestSearchModel::testCommandFilter() {
//  // Verifies that changing only Color to filter rows are filtered correctly
//  auto typeProxy = new TypeProxyModel();
//  typeProxy->setSourceModel(new TypeModel);

//  // Applies various Color filters and verifies expected number of rows is
//  //  shown
//  typeProxy->setCommandFilter("All commands");
//  QCOMPARE(typeProxy->rowCount(QModelIndex()), 94);

//  typeProxy->setCommandFilter("Tactic");
//  QCOMPARE(typeProxy->rowCount(QModelIndex()), 20);

//  typeProxy->setCommandFilter("Objective");
//  QCOMPARE(typeProxy->rowCount(QModelIndex()), 20);

//  typeProxy->setCommandFilter("Accessory");
//  QCOMPARE(typeProxy->rowCount(QModelIndex()), 20);

//  typeProxy->setCommandFilter("Upgrade");
//  QCOMPARE(typeProxy->rowCount(QModelIndex()), 20);

//  typeProxy->setCommandFilter("");
//  QCOMPARE(typeProxy->rowCount(QModelIndex()), 14);
//}

// void TestSearchModel::testMixedFilters() {
//  // Verifies changing differents filters row are filtered correctly
//  auto searchModel = new SearchModel();
//  searchModel->setSourceModel(new CardsModel);

//  // Applies various filters and verifies expected number of rows is shown
//  searchModel->setCategoryFilter("Hero");
//  searchModel->setColorFilter("Gray");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 4);

//  searchModel->setCategoryFilter("All Categories");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 14);

//  searchModel->setCategoryFilter("Era III");
//  searchModel->setColorFilter("Red");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 5);

//  searchModel->setCategoryFilter("Hero");
//  searchModel->setColorFilter("Red");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 0);

//  searchModel->setCategoryFilter("Attunement");
//  searchModel->setColorFilter("Gray");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 10);
//}

// void TestSearchModel::testResetFilter() {
//  // Verifies filters are reset to default values
//  auto searchModel = new SearchModel();
//  searchModel->setSourceModel(new CardsModel);

//  // Verifies default number of rows
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 94);

//  // Applies various filters and verifies expected number of rows is shown
//  searchModel->setCodeFilter("H");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 4);

//  // Resets filters and verifies rows shown are back to default
//  searchModel->resetFilters();
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 94);
//}

// void TestSearchModel::testCaseInsensitiveFilter() {
//  // Verifies Code filter is case insensitive
//  auto searchModel = new SearchModel();
//  searchModel->setSourceModel(new CardsModel);

//  // Verifies default number of rows
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 94);

//  // Applies filter with uppercase Code
//  searchModel->setCodeFilter("H");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 4);

//  // Applies filter with lowercase code
//  searchModel->setCodeFilter("h");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 4);
//}

QTEST_MAIN(TestSearchModel)
#include "tst_searchmodel.moc"
