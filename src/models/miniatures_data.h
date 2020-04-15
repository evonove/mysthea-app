#pragma once

#include <QMetaType>
#include <QString>

/*
 * GAME:
 * 1 - Mysthea
 * TYPES:
 * 1 - Champions
 *
 * GAME:
 * 2 - Icaion
 * TYPES:
 * 2 - Colossus
 * 3 - Seekers
 * 4 - Machines
 * 5 - Wonders
 * 6 - Parasites
 *
 * GAME:
 * 3 - TheFall
 */
struct Miniature {
  int type;
  QString name;
  QString image;
};

Q_DECLARE_METATYPE(Miniature)
