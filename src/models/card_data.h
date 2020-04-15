#pragma once

#include <QMetaType>
#include <QString>

struct Card {
  QString code;
  QString name;
  int type;
  int command;
  QString image;
  QString backImage;
  QString description;
};

Q_DECLARE_METATYPE(Card)

struct CardType {
  int id;
  QString text;
  QString icon;
};
Q_DECLARE_METATYPE(CardType)

struct CardCommand {
  int id;
  QString text;
  QString icon;
  QString color;
};
Q_DECLARE_METATYPE(CardCommand)
