#pragma once

#include <QList>
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
  int game;
  int type;
  QString name;
  QString image;
};

Q_DECLARE_METATYPE(Miniature)

// clang-format off
const QVector<Miniature> miniatures_data = {
    // Game: MYSTHEA
    // Type: Champions
    {1, 1, "Telron",           "qrc:/assets/images/extras/miniatures/mysthea/mini_telron.jpg"},
    {1, 1, "Anuth",            "qrc:/assets/images/extras/miniatures/mysthea/mini_anuth.jpg"},
    {1, 1, "Celethe",          "qrc:/assets/images/extras/miniatures/mysthea/mini_celethe.jpg"},
    {1, 1, "Leheir",           "qrc:/assets/images/extras/miniatures/mysthea/mini_leheir.jpg"},
    {1, 1, "Sanya",            "qrc:/assets/images/extras/miniatures/mysthea/mini_sanya.jpg"},
    {1, 1, "Kolbor & Malabor", "qrc:/assets/images/extras/miniatures/mysthea/mini_kolbormalabor.jpg"},
    {1, 1, "CR-2T1",           "qrc:/assets/images/extras/miniatures/mysthea/mini_cr.jpg"},
    // Game: ICAION
    // colossus
    {2, 2, "Colossus",         "qrc:/assets/images/extras/miniatures/icaion/mini_colossus.jpg"},
    // Seekers
    {2, 3, "The Lone Survivor","qrc:/assets/images/extras/miniatures/icaion/mini_seeker1.jpg"},
    {2, 3, "The Criminal",     "qrc:/assets/images/extras/miniatures/icaion/mini_seeker2.jpg"},
    {2, 3, "The Heir",         "qrc:/assets/images/extras/miniatures/icaion/mini_seeker3.jpg"},
    {2, 3, "The Outsider",     "qrc:/assets/images/extras/miniatures/icaion/mini_seeker4.jpg"},
    {2, 3, "The Cursed",       "qrc:/assets/images/extras/miniatures/icaion/mini_seeker5.jpg"},
    {2, 3, "The Machine",      "qrc:/assets/images/extras/miniatures/icaion/mini_seeker6.jpg"},
    {2, 3, "The Creature",     "qrc:/assets/images/extras/miniatures/icaion/mini_seeker7.jpg"},
    // Machines
    {2, 4, "Harvester",        "qrc:/assets/images/extras/miniatures/icaion/mini_machine1.jpg"},
    {2, 4, "Scavenger",        "qrc:/assets/images/extras/miniatures/icaion/mini_machine2.jpg"},
    {2, 4, "Refiner",          "qrc:/assets/images/extras/miniatures/icaion/mini_machine3.jpg"},
    // Wonders
    {2, 5, "Parasite Colony",  "qrc:/assets/images/extras/miniatures/icaion/mini_wonder1.jpg"},
    {2, 5, "Pulsar",           "qrc:/assets/images/extras/miniatures/icaion/mini_wonder2.jpg"},
    {2, 5, "Transmuter",       "qrc:/assets/images/extras/miniatures/icaion/mini_wonder3.jpg"},
    {2, 5, "Qoamcopia",        "qrc:/assets/images/extras/miniatures/icaion/mini_wonder4.jpg"},
    {2, 5, "Curio Hub",        "qrc:/assets/images/extras/miniatures/icaion/mini_wonder5.jpg"},
    {2, 5, "Living Altar",     "qrc:/assets/images/extras/miniatures/icaion/mini_wonder6.jpg"},
    {2, 5, "Dark Bell",        "qrc:/assets/images/extras/miniatures/icaion/mini_wonder7.jpg"},
    // Parasites
    {2, 6, "Parasite",         "qrc:/assets/images/extras/miniatures/icaion/mini_parasite1.jpg"},
    {2, 6, "Parasite",         "qrc:/assets/images/extras/miniatures/icaion/mini_parasite2.jpg"},
    {2, 6, "Parasite",         "qrc:/assets/images/extras/miniatures/icaion/mini_parasite3.jpg"},
    {2, 6, "Parasite",         "qrc:/assets/images/extras/miniatures/icaion/mini_parasite4.jpg"},
    {2, 6, "Parasite",         "qrc:/assets/images/extras/miniatures/icaion/mini_parasite5.jpg"},
};
// clang-format on
