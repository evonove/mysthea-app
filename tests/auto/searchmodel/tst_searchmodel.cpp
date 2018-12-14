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
  auto typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  auto type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 1);

  typeText =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era I");
  type = typeProxy->data(typeProxy->index(1, 0), TypeModel::Type);
  QCOMPARE(type, 2);

  typeText =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era II");
  type = typeProxy->data(typeProxy->index(2, 0), TypeModel::Type);
  QCOMPARE(type, 3);

  typeText =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era III");
  type = typeProxy->data(typeProxy->index(3, 0), TypeModel::Type);
  QCOMPARE(type, 4);

  typeText =
      typeProxy->data(typeProxy->index(4, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
  type = typeProxy->data(typeProxy->index(4, 0), TypeModel::Type);
  QCOMPARE(type, 5);

  typeText =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Attunement");
  type = typeProxy->data(typeProxy->index(5, 0), TypeModel::Type);
  QCOMPARE(type, 6);
}

void TestSearchModel::testCodeFilter() {
  // Verifies that changing only Code to filter rows are filtered correctly
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Applies various Code filters and verifies expected number of rows is
  //  shown
  typeProxy->setCodeFilter("C");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  auto cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                        .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  auto typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  auto type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 1);

  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  typeText =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era I");
  type = typeProxy->data(typeProxy->index(1, 0), TypeModel::Type);
  QCOMPARE(type, 2);

  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  typeText =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era II");
  type = typeProxy->data(typeProxy->index(2, 0), TypeModel::Type);
  QCOMPARE(type, 3);

  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  typeText =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era III");
  type = typeProxy->data(typeProxy->index(3, 0), TypeModel::Type);
  QCOMPARE(type, 4);

  typeProxy->setCodeFilter("H");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 5);

  typeProxy->setCodeFilter("A");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 10);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Attunement");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 6);

  typeProxy->setCodeFilter("C01");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 10);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 1);

  typeProxy->setCodeFilter("H04");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 1);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 5);
}

void TestSearchModel::testTypeFilter() {
  // Verifies that changing only Category to filter rows are filtered
  // correctly
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Applies various Type filters and verifies expected number of rows is
  // shown
  typeProxy->setTypeFilter(0);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);

  typeProxy->setTypeFilter(1);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  auto type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 1);

  typeProxy->setTypeFilter(2);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era I");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 2);

  typeProxy->setTypeFilter(3);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era II");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 3);

  typeProxy->setTypeFilter(4);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era III");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 4);

  typeProxy->setTypeFilter(5);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 5);

  typeProxy->setTypeFilter(6);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Attunement");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 6);
}

void TestSearchModel::testCommandFilter() {
  // Verifies that changing only Color to filter rows are filtered correctly
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Applies various Color filters and verifies expected number of rows is
  //  shown
  typeProxy->setCommandFilter(0);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                        .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  auto typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  auto type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 1);

  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  typeText =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era I");
  type = typeProxy->data(typeProxy->index(1, 0), TypeModel::Type);
  QCOMPARE(type, 2);

  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  typeText =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era II");
  type = typeProxy->data(typeProxy->index(2, 0), TypeModel::Type);
  QCOMPARE(type, 3);

  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  typeText =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era III");
  type = typeProxy->data(typeProxy->index(3, 0), TypeModel::Type);
  QCOMPARE(type, 4);

  cardsModel = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);
  typeText =
      typeProxy->data(typeProxy->index(4, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
  type = typeProxy->data(typeProxy->index(4, 0), TypeModel::Type);
  QCOMPARE(type, 5);

  cardsModel = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 10);
  typeText =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Attunement");
  type = typeProxy->data(typeProxy->index(5, 0), TypeModel::Type);
  QCOMPARE(type, 6);

  typeProxy->setCommandFilter(1);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 1);

  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  typeText =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era I");
  type = typeProxy->data(typeProxy->index(1, 0), TypeModel::Type);
  QCOMPARE(type, 2);

  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  typeText =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era II");
  type = typeProxy->data(typeProxy->index(2, 0), TypeModel::Type);
  QCOMPARE(type, 3);

  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  typeText =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era III");
  type = typeProxy->data(typeProxy->index(3, 0), TypeModel::Type);
  QCOMPARE(type, 4);

  typeProxy->setCommandFilter(2);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);

  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 1);
  typeText =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era I");
  type = typeProxy->data(typeProxy->index(1, 0), TypeModel::Type);
  QCOMPARE(type, 2);
  typeText =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era II");
  type = typeProxy->data(typeProxy->index(2, 0), TypeModel::Type);
  QCOMPARE(type, 3);
  typeText =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era III");
  type = typeProxy->data(typeProxy->index(3, 0), TypeModel::Type);
  QCOMPARE(type, 4);

  typeProxy->setCommandFilter(3);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);

  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  typeText =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era I");
  typeText =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era II");
  typeText =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era III");

  typeProxy->setCommandFilter(4);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 4);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);
}

void TestSearchModel::testMixedFilters() {
  // Verifies changing differents filters row are filtered correctly
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Applies various filters and verifies expected number of rows is shown
  typeProxy->setTypeFilter(5);
  auto typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
  auto type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 5);
  typeProxy->setCommandFilter(-1);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  auto cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                        .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);

  typeProxy->setTypeFilter(4);
  typeProxy->setCommandFilter(1);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 5);

  typeProxy->setTypeFilter(5);
  typeProxy->setCommandFilter(1);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 0);

  typeProxy->setTypeFilter(6);
  typeProxy->setCommandFilter(-1);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 10);

  typeProxy->setTypeFilter(0);
  typeProxy->setCommandFilter(0);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);
  cardsModel = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 10);

  typeProxy->setTypeFilter(0);
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);
  cardsModel = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 10);
}

void TestSearchModel::testResetFilter() {
  // Verifies filters are reset to default values
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Verifies default number of rows
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                        .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);
  cardsModel = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 10);

  // Applies various filters and verifies expected number of rows is shown
  typeProxy->setCodeFilter("H");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);

  // Resets filters and verifies rows shown are back to default
  typeProxy->resetFilters();
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);
  cardsModel = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 10);

  auto typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  typeText =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era I");
  typeText =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era II");
  typeText =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era III");
  typeText =
      typeProxy->data(typeProxy->index(4, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
  typeText =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Attunement");
}

void TestSearchModel::testCaseInsensitiveFilter() {
  // Verifies Code filter is case insensitive
  auto typeProxy = new TypeProxyModel();
  typeProxy->setSourceModel(new TypeModel);

  // Verifies default number of rows
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 6);
  auto cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                        .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(1, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(2, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(3, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 20);
  cardsModel = typeProxy->data(typeProxy->index(4, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);
  cardsModel = typeProxy->data(typeProxy->index(5, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 10);
  auto typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era X");
  auto type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 1);
  typeText =
      typeProxy->data(typeProxy->index(1, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era I");
  type = typeProxy->data(typeProxy->index(1, 0), TypeModel::Type);
  QCOMPARE(type, 2);
  typeText =
      typeProxy->data(typeProxy->index(2, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era II");
  type = typeProxy->data(typeProxy->index(2, 0), TypeModel::Type);
  QCOMPARE(type, 3);
  typeText =
      typeProxy->data(typeProxy->index(3, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Era III");
  type = typeProxy->data(typeProxy->index(3, 0), TypeModel::Type);
  QCOMPARE(type, 4);
  typeText =
      typeProxy->data(typeProxy->index(4, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
  type = typeProxy->data(typeProxy->index(4, 0), TypeModel::Type);
  QCOMPARE(type, 5);
  typeText =
      typeProxy->data(typeProxy->index(5, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Attunement");
  type = typeProxy->data(typeProxy->index(5, 0), TypeModel::Type);
  QCOMPARE(type, 6);

  // Applies filter with uppercase Code
  typeProxy->setCodeFilter("H");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
  type = typeProxy->data(typeProxy->index(0, 0), TypeModel::Type);
  QCOMPARE(type, 5);

  // Applies filter with lowercase code
  typeProxy->setCodeFilter("h");
  QCOMPARE(typeProxy->rowCount(QModelIndex()), 1);
  cardsModel = typeProxy->data(typeProxy->index(0, 0), TypeModel::Cards)
                   .value<CardsProxyModel *>();
  QCOMPARE(cardsModel->rowCount(QModelIndex()), 4);
  typeText =
      typeProxy->data(typeProxy->index(0, 0), TypeModel::TypeText).toString();
  QCOMPARE(typeText, "Hero");
}

void TestSearchModel::testIndexOf() {
  // Verfies indexOf function returns the correct position of clicked card.
  auto cardModel = new CardsModel();
  // create a mock vector of cards.
  QVector<Card> cards;
  cards.append({"C001", 0, -1, "", ""});
  cards.append({"C002", 0, -1, "", " "});
  cards.append({"C003", 0, -1, "", " "});
  cards.append({"C004", 0, -1, "", " "});
  cards.append({"H01", 0, -1, "", " "});
  cards.append({"H02", 0, -1, "", " "});
  cards.append({"A01", 0, -1, "", " "});
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
  typeProxy->setTypeFilter(1);
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 20);
  typeProxy->setTypeFilter(3);
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 20);

  // Applies mixed filters.
  typeProxy->setTypeFilter(2);
  typeProxy->setCommandFilter(2);
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 5);

  typeProxy->setTypeFilter(5);
  typeProxy->setCommandFilter(0);
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 4);
  typeProxy->setCodeFilter("01");
  QCOMPARE(typeProxy->visibleCards()->rowCount(), 1);
}

QTEST_MAIN(TestSearchModel)
#include "tst_searchmodel.moc"
