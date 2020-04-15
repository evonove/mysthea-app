#pragma once

#include <QMetaType>
#include <QString>

/*
 * GAME:
 * 1 - Mysthea
 * TYPES:
 * 1 - Champions
 * 2 - Attunements
 * 3 - Encounters
 * 4 - Monsters
 * 5 - Regions
 * 6 - Guilds
 *
 * GAME:
 * 2 - Icaion
 * TYPES:
 * 7 - Colossus
 * 8 - Seekers
 * 9 - Machines
 * 10 - Specialized Gear
 * 11 - Wonders
 * 12 - Events
 * 13 - Parasites
 * 14 - Playerboards
 *
 * GAME:
 * 1 - The Fall
 * TYPES:
 * 15 - Mysthea: the Fall
 * 16 - Seekers
 */

struct Artwork {
  int type;
  QString name;
  QString author;
  QString image;
};

Q_DECLARE_METATYPE(Artwork)
