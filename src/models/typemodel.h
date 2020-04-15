#pragma once

#include "cardsmodel.h"
#include "cardsproxymodel.h"
#include <QAbstractListModel>
#include <QJsonDocument>
#include <QVector>

class TypeModel : public QAbstractListModel {
  Q_OBJECT

public:
  TypeModel(QObject *parent = Q_NULLPTR);
  ~TypeModel() Q_DECL_OVERRIDE;

  enum Roles { Type = Qt::UserRole + 1, TypeText, Cards };
  Q_ENUM(Roles)

  QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
  int rowCount(const QModelIndex &parent = QModelIndex()) const Q_DECL_OVERRIDE;
  QVariant data(const QModelIndex &index,
                int role = Qt::DisplayRole) const Q_DECL_OVERRIDE;
  CardsModel *allCardsModel() const { return m_allCardsModel; }

  void setConfigurationFilePath(const QString &path);

signals:
  void configurationFileChanged();

private:
  void processFile();

  QVector<CardsProxyModel *> m_types;
  CardsModel *m_allCardsModel;
  QVector<Card> m_cards;
  QHash<int, QString> m_typesMap;
  QHash<int, QString> m_commandsMap;

  QString m_configurationFilePath;
  QJsonDocument m_configurationFile;
};
