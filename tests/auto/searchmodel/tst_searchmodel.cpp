#include <QtTest/QtTest>

#include "models/cardsmodel.h"
#include "models/searchmodel.h"
#include "models/typemodel.h"

class TestSearchModel : public QObject {
  Q_OBJECT

private slots:
  void testDefaultFilters();
  //    void testCodeFilter();
  void testTypeFilter();
  //    void testColorFilter();
  //    void testMixedFilters();
  //    void testResetFilter();
  //    void testCaseInsensitiveFilter();
};

void TestSearchModel::testDefaultFilters() {
  // Verifies all cards are shown when no filter is applied

  auto searchModel = new SearchModel();
  searchModel->setSourceModel(new TypeModel);

  QCOMPARE(searchModel->rowCount(QModelIndex()), 6);
}

// void TestSearchModel::testCodeFilter() {
//  // Verifies that changing only Code to filter rows are filtered correctly
//  auto searchModel = new SearchModel();
//  searchModel->setSourceModel(new CardsModel);

//  // Applies various Code filters and verifies expected number of rows is
//  shown searchModel->setCodeFilter("C");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 80);

//  searchModel->setCodeFilter("H");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 4);

//  searchModel->setCodeFilter("A");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 10);

//  searchModel->setCodeFilter("C01");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 10);

//  searchModel->setCodeFilter("H04");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 1);
//}

void TestSearchModel::testTypeFilter() {
  // Verifies that changing only Category to filter rows are filtered
  // correctly
  auto searchModel = new SearchModel();
  searchModel->setSourceModel(new TypeModel);

  // Applies various Category filters and verifies expected number of rows is
  // shown
  searchModel->setTypeFilter("All types");
  QCOMPARE(searchModel->rowCount(QModelIndex()), 6);

  searchModel->setTypeFilter("Era X");
  QCOMPARE(searchModel->rowCount(QModelIndex()), 1);

  searchModel->setTypeFilter("Era I");
  QCOMPARE(searchModel->rowCount(QModelIndex()), 1);

  searchModel->setTypeFilter("Era II");
  QCOMPARE(searchModel->rowCount(QModelIndex()), 1);

  searchModel->setTypeFilter("Era III");
  QCOMPARE(searchModel->rowCount(QModelIndex()), 1);

  searchModel->setTypeFilter("Hero");
  QCOMPARE(searchModel->rowCount(QModelIndex()), 1);

  searchModel->setTypeFilter("Attunement");
  QCOMPARE(searchModel->rowCount(QModelIndex()), 1);
}

// void TestSearchModel::testColorFilter() {
//  // Verifies that changing only Color to filter rows are filtered correctly
//  auto searchModel = new SearchModel();
//  searchModel->setSourceModel(new CardsModel);

//  // Applies various Color filters and verifies expected number of rows is
//  shown searchModel->setColorFilter("All Colors");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 94);

//  searchModel->setColorFilter("Red");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 20);

//  searchModel->setColorFilter("Green");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 20);

//  searchModel->setColorFilter("Blue");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 20);

//  searchModel->setColorFilter("Yellow");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 20);

//  searchModel->setColorFilter("Gray");
//  QCOMPARE(searchModel->rowCount(QModelIndex()), 14);
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
