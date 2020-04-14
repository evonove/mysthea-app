#pragma once

#include <QList>
#include <QMetaType>
#include <QString>

/*
 * Games:
 * 1 - Mysthea
 * 2 - Icaion
 * 3 - TheFall
 *
 * Types:
 * 1 - Champions
 * 2 - Attunements
 * 3 - Encounters
 * 4 - Monsters
 * 5 - Regions
 * 6 - Guilds
 */

struct Artwork {
  int game;
  int type;
  QString name;
  QString author;
  QString image;
};

Q_DECLARE_METATYPE(Artwork)

// clang-format off
const QVector<Artwork> artworks_data = {
    // Game: MYSTHEA
    // Type: Champions
    {1, 1, "Telron",           "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/champ_1.jpg"},
    {1, 1, "Anuth",            "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/champ_2.jpg"},
    {1, 1, "Celethe",          "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/champ_3.jpg"},
    {1, 1, "Leheir",           "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/champ_4.jpg"},
    {1, 1, "Sanya",            "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/champ_5.jpg"},
    {1, 1, "Kolbor & Malabor", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/champ_6.jpg"},
    {1, 1, "CR-2T1",           "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/champ_7.jpg"},
    // Game: MYSTHEA
    // Type: Attunements
    {1, 2, "Attunement, Daylight", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement01.jpg"},
    {1, 2, "Attunement, Night",    "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement02.jpg"},
    {1, 2, "Attunement, Daylight", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement03.jpg"},
    {1, 2, "Attunement, Night",    "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement04.jpg"},
    {1, 2, "Attunement, Daylight", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement05.jpg"},
    {1, 2, "Attunement, Night",    "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement06.jpg"},
    {1, 2, "Attunement, Daylight", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement07.jpg"},
    {1, 2, "Attunement, Night",    "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement08.jpg"},
    {1, 2, "Attunement, Daylight", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement09.jpg"},
    {1, 2, "Attunement, Night",    "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Attunement10.jpg"},
    // Game: MYSTHEA
    // Type: Encounters
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart01.jpg"},
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart02.jpg"},
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart03.jpg"},
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart04.jpg"},
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart05.jpg"},
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart06.jpg"},
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart07.jpg"},
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart08.jpg"},
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart09.jpg"},
    {1, 3, "Encounter", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Enart10.jpg"},
    // Game: MYSTHEA
    // Type: Monsters
    {1, 4, "Caeruleas",  "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Monster01.jpg"},
    {1, 4, "Onygauros",  "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Monster02.jpg"},
    {1, 4, "Boulron",    "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Monster03.jpg"},
    {1, 4, "Kodror",     "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Monster04.jpg"},
    {1, 4, "Obsidusa",   "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Monster05.jpg"},
    {1, 4, "Cannibarok", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Monster06.jpg"},
    {1, 4, "Utcoro",     "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Monster07.jpg"},
    // Game: MYSTHEA
    // Type: Regions
    {1, 5, "Land of Myst",  "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Event1.jpg"},
    {1, 5, "Crystal Field", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Event2.jpg"},
    {1, 5, "River",         "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Event3.jpg"},
    {1, 5, "Mountain",      "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Event4.jpg"},
    {1, 5, "Forest",        "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Event5.jpg"},
    {1, 5, "Storm",         "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Event6.jpg"},
    // Game: MYSTHEA
    // Type: Guilds
    {1, 6, "Varorin",  "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Pboard1.jpg"},
    {1, 6, "Lusma",    "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Pboard2.jpg"},
    {1, 6, "Volarees", "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Pboard3.jpg"},
    {1, 6, "Magista",  "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Pboard4.jpg"},
    {1, 6, "Kaetur",   "Travis Anderson", "qrc:/assets/images/extras/artworks/mysthea/Pboard5.jpg"},
};
// clang-format on
