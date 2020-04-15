#include "typemodel.h"
#include "card_data.h"
#include <QFile>
#include <QGuiApplication>
#include <QJsonArray>
#include <QJsonObject>
#include <QVariant>

TypeModel::TypeModel(QObject *parent) : QAbstractListModel{parent} {}

TypeModel::~TypeModel() {
  qDeleteAll(m_types);
  m_allCardsModel->deleteLater();
}

void TypeModel::setConfigurationFilePath(const QString &path) {
  if (m_configurationFilePath != path) {
    m_configurationFilePath = path;

    QFile file;
    file.setFileName(path);
    if (file.open(QIODevice::ReadOnly)) {
      QJsonDocument confFile;
      QJsonParseError error;
      confFile = QJsonDocument::fromJson(file.readAll(), &error);
      m_configurationFile = confFile;
    }

    this->processFile();

    emit configurationFileChanged();
  }
}
QHash<int, QByteArray> TypeModel::roleNames() const {
  return QHash<int, QByteArray>{{Roles::Type, "type"},
                                {Roles::TypeText, "typeText"},
                                {Roles::Cards, "cards"}};
}

int TypeModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);
  return m_types.size();
}

QVariant TypeModel::data(const QModelIndex &index, int role) const {
  auto row = index.row();
  if (row < 0 || row >= m_cards.size()) {
    return QVariant();
  }
  switch (role) {
  case Roles::Type:
    return row + 1;
  case Roles::TypeText: {
    auto typeText = m_typesMap.value(row + 1);
    return qGuiApp->translate("CardsData", typeText.toStdString().c_str());
  }
  case Roles::Cards: {
    return QVariant::fromValue(m_types.at(row));
  }
  default:
    return QVariant();
  }
}

void TypeModel::processFile() {
  m_cards.clear();
  m_typesMap.clear();
  m_commandsMap.clear();
  //   Check the validity of file.
  if (!m_configurationFile.isNull()) {
    auto contentFile = m_configurationFile.object();

    if (contentFile.contains("cards") && contentFile["cards"].isArray()) {
      QJsonArray cardsArray = contentFile["cards"].toArray();
      for (auto i = 0; i < cardsArray.size(); ++i) {
        if (cardsArray[i].isObject()) {
          auto cardObject = cardsArray[i].toObject();

          Card card;

          card.code = cardObject["code"].toString();
          card.name = cardObject["name"].toString();
          card.type = cardObject["type"].toInt();
          card.command = cardObject["command"].toInt();
          card.image = cardObject["image"].toString();
          card.backImage = cardObject["backImage"].toString();
          card.description = cardObject["description"].toString();

          m_cards.append(card);
        }
      }
    }

    if (contentFile.contains("cards_types") &&
        contentFile["cards_types"].isArray()) {
      auto cardsTypesArray = contentFile["cards_types"].toArray();
      for (auto i = 0; i < cardsTypesArray.size(); ++i) {
        if (cardsTypesArray[i].isObject()) {
          auto cardsTypesObj = cardsTypesArray[i].toObject();

          m_typesMap.insert(cardsTypesObj["id"].toInt(),
                            cardsTypesObj["text"].toString());
        }
      }
    }

    if (contentFile.contains("cards_commands") &&
        contentFile["cards_commands"].isArray()) {
      auto commandsArray = contentFile["cards_commands"].toArray();
      for (auto i = 0; i < commandsArray.size(); ++i) {
        if (commandsArray[i].isObject()) {
          auto commandObj = commandsArray[i].toObject();

          m_commandsMap.insert(commandObj["id"].toInt(),
                               commandObj["text"].toString());
        }
      }
    }

    m_allCardsModel = new CardsModel(m_cards, m_typesMap, m_commandsMap);

    for (auto i = 0; i < m_typesMap.size(); i++) {
      m_types.append(new CardsProxyModel(i + 1));
      m_types[i]->setSourceModel(m_allCardsModel);
    }
  }
}
