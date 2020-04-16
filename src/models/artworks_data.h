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
    // Game: ICAION
    // Type: Colossus
    {2, 7, "Colossus", "Travis Anderson", "qrc:/assets/images/extras/artworks/icaion/colossus_1.jpg"},
    {2, 7, "Colossus", "Travis Anderson", "qrc:/assets/images/extras/artworks/icaion/colossus_2.jpg"},
    // Game: ICAION
    // Type: Seekers
    {2, 8, "The Lone Survivor","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/seeker1.jpg"},
    {2, 8, "The Criminal","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/seeker2.jpg"},
    {2, 8, "The Heir","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/seeker3.jpg"},
    {2, 8, "The Outsider","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/seeker4.jpg"},
    {2, 8, "The Machine","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/seeker5.jpg"},
    {2, 8, "The Cursed","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/seeker6.jpg"},
    {2, 8, "The Creature","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/seeker7.jpg"},
    // Game: ICAION
    // Type: Machines
    {2, 9, "Harvester","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/machine1.jpg"},
    {2, 9, "Scavenger","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/machine2.jpg"},
    {2, 9, "Refiner","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/mchine3.jpg"},
    // Game: ICAION
    // Type: Specialized Gear
    {2, 10, "Hyper Boots","Eren Tuncer","qrc:/assets/images/extras/artworks/icaion/gear1.jpg"},
    {2, 10, "Multifunctional Belt","Eren Tuncer","qrc:/assets/images/extras/artworks/icaion/gear2.jpg"},
    {2, 10, "Primal Armor","Eren Tuncer","qrc:/assets/images/extras/artworks/icaion/gear3.jpg"},
    {2, 10, "Exploration Case","Eren Tuncer","qrc:/assets/images/extras/artworks/icaion/gear4.jpg"},
    {2, 10, "Vertebra Crown","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/gear5.jpg"},
    {2, 10, "Mechanic Gloves","Eren Tuncer","qrc:/assets/images/extras/artworks/icaion/gear6.jpg"},
    {2, 10, "Energy Harness","Eren Tuncer","qrc:/assets/images/extras/artworks/icaion/gear7.jpg"},
    {2, 10, "Empowered Tools","Eren Tuncer","qrc:/assets/images/extras/artworks/icaion/gear8.jpg"},
    {2, 10, "Parasite Sword","Eren Tuncer","qrc:/assets/images/extras/artworks/icaion/gear9.jpg"},
    {2, 10, "Energy Stabilizer","Eren Tuncer","qrc:/assets/images/extras/artworks/icaion/gear10.jpg"},
    // Game: ICAION
    // Type: Wonders
    {2, 11, "Parasite Colony","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/WONDER-1.jpg"},
    {2, 11, "Pulsar","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/WONDER-2.jpg"},
    {2, 11, "Transmuter","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/WONDER-3.jpg"},
    {2, 11, "Qoamcopia","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/WONDER-4.jpg"},
    {2, 11, "Curio Hub","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/WONDER-5.jpg"},
    {2, 11, "Living Altar","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/WONDER-6.jpg"},
    {2, 11, "Dark Bell","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/WONDER-7.jpg"},
    // Game: ICAION
    // Type: Events
    {2, 12, "River","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/event1.jpg"},
    {2, 12, "Mountain","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/event2.jpg"},
    {2, 12, "Forest","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/event3.jpg"},
    {2, 12, "Land of Myst","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/event4.jpg"},
    {2, 12, "Crystal Field","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/event5.jpg"},
    // Game: ICAION
    // Type: Parasites
    {2, 13, "Aberration","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/parasite1.jpg"},
    {2, 13, "Parasite","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/parasite2.jpg"},
    // Game: ICAION
    // Type: playerboards
    {2, 14, "Black playerboard","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/Pboard1_ica.jpg"},
    {2, 14, "Purple playerboard","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/Pboard2_ica.jpg"},
    {2, 14, "Red playerboard","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/Pboard3_ica.jpg"},
    {2, 14, "Yellow playerboard","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/Pboard4_ica.jpg"},
    {2, 14, "Blue playerboard","Travis Anderson","qrc:/assets/images/extras/artworks/icaion/Pboard5-ica.jpg"},
};
// clang-format on
