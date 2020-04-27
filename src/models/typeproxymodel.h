#pragma once

#include "cardsmodel.h"
#include "cardsproxymodel.h"
#include "typemodel.h"

#include <QQmlParserStatus>
#include <QSortFilterProxyModel>
#include <QUrl>

class TypeProxyModel : public QSortFilterProxyModel, public QQmlParserStatus {
  Q_OBJECT
  Q_INTERFACES(QQmlParserStatus)
  Q_PROPERTY(int size READ rowCount NOTIFY filterChanged)
  Q_PROPERTY(
      CardsProxyModel *visibleCards READ visibleCards NOTIFY filterChanged)
  Q_PROPERTY(QUrl configurationFilePath WRITE setConfigurationFilePath NOTIFY
                 configurationFilePathChanged)

public:
  explicit TypeProxyModel(QObject *parent = nullptr);

  void classBegin() override;
  void componentComplete() override;

  Q_INVOKABLE virtual void setTypeFilter(int type) = 0;
  Q_INVOKABLE void setCodeFilter(QString code);
  Q_INVOKABLE virtual void resetFilters();
  CardsProxyModel *visibleCards();

  bool filterAcceptsRow(int source_row,
                        const QModelIndex &source_parent) const override;

  void setConfigurationFilePath(const QUrl &url);

signals:
  void filterChanged();
  void configurationFilePathChanged();

protected:
  QString convertUrlToFilePath(const QUrl &url);
  void processSource();

  int m_type;
  QString m_code;
  CardsProxyModel *m_allCardsModel;
  TypeModel *m_sourceModel;
  QUrl m_configurationFilePath;
};
