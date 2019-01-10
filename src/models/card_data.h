#ifndef CARD_DATA_H
#define CARD_DATA_H

#include <QHash>
#include <QList>
#include <QString>
// types
static constexpr auto ALL_TYPES_TEXT =
    QT_TRANSLATE_NOOP("CardsData", "All types");
static constexpr auto ERAX_TEXT = QT_TRANSLATE_NOOP("CardsData", "Era X");
static constexpr auto ERAI_TEXT = QT_TRANSLATE_NOOP("CardsData", "Era I");
static constexpr auto ERAII_TEXT = QT_TRANSLATE_NOOP("CardsData", "Era II");
static constexpr auto ERAIII_TEXT = QT_TRANSLATE_NOOP("CardsData", "Era III");
static constexpr auto HERO_TEXT = QT_TRANSLATE_NOOP("CardsData", "Hero");
static constexpr auto ATTUNEMENT_TEXT =
    QT_TRANSLATE_NOOP("CardsData", "Attunement");
static constexpr auto ENCOUNTER_TEXT =
    QT_TRANSLATE_NOOP("CardsData", "Encounter");
static constexpr auto EVENT_TEXT = QT_TRANSLATE_NOOP("CardsData", "Event");
// commands
static constexpr auto ALL_COMMANDS_TEXT =
    QT_TRANSLATE_NOOP("CardsData", "All commands");
static constexpr auto TACTIC_TEXT = QT_TRANSLATE_NOOP("CardsData", "Tactic");
static constexpr auto OBJECTIVE_TEXT =
    QT_TRANSLATE_NOOP("CardsData", "Objective");
static constexpr auto ACCESSORY_TEXT =
    QT_TRANSLATE_NOOP("CardsData", "Accessory");
static constexpr auto UPGRADE_TEXT = QT_TRANSLATE_NOOP("CardsData", "Upgrade");

struct Card {
  QString code;
  int type;
  int command;
  QString image;
  QString backImage;
  QString description;
};

Q_DECLARE_METATYPE(Card)

const QHash<int, QString> types_map{
    {1, ERAX_TEXT}, {2, ERAI_TEXT},       {3, ERAII_TEXT},     {4, ERAIII_TEXT},
    {5, HERO_TEXT}, {6, ATTUNEMENT_TEXT}, {7, ENCOUNTER_TEXT}, {8, EVENT_TEXT}};

const QHash<int, QString> commands_map{{1, TACTIC_TEXT},
                                       {2, OBJECTIVE_TEXT},
                                       {3, ACCESSORY_TEXT},
                                       {4, UPGRADE_TEXT}};

// clang-format off
const QVector<QVector<Card>> cards_data = {
    // Era X
    {
        {"C001",    1,  1,      "c001.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to Travel with your Champion to any region. The Champion cannot carry any other unit.")},
        {"C002",    1,  1,      "c002.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to gain 2 Experience Points and Develop.")},
        {"C003",    1,  1,      "c003.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to Act.")},
        {"C004",    1,  1,      "c004.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to Start a Battle in any region with at least 1 Opponent and add 2 to your Strength total. Starting a Battle this way does not Discharge your Artefact.")},
        {"C005",    1,  1,      "c005.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to Meditate.")},
        {"C006",    1,  2,      "c006.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to gain 3 Glory Points for each Forest region you control.")},
        {"C007",    1,  2,      "c007.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to gain 3 Glory Points for each Land of Myst region you control.")},
        {"C008",    1,  2,      "c008.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to gain 3 Glory Points for each River region you control.")},
        {"C009",    1,  2,      "c009.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to gain 3 Glory Points for each Crystal Field region you control.")},
        {"C010",    1,  2,      "c010.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to gain 3 Glory Points for each Mountain region you control.")},
        {"C011",    1,  3,      "c011.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may discard 1 Tactic Card to Act.")},
        {"C012",    1,  3,      "c012.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may discard 1 Objective Card to Develop.")},
        {"C013",    1,  3,      "c013.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may discard 1 Accessory Card to Meditate.")},
        {"C014",    1,  3,      "c014.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may discard 1 Upgrade Card to Recharge your Artefact and/or gain 4 Glory Points.")},
        {"C015",    1,  3,      "c015.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may discard any Command Card to gain X Command Points, where X is equal to the number of Command Points of the discarded card.")},
        {"C016",    1,  4,      "c016.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Whenever you Deploy a Fortification, you gain 1 Glory Point and 1 Energy Point.")},
        {"C017",    1,  4,      "c017.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you Construct a Troop, gain 1 Experience Point.")},
        {"C018",    1,  4,      "c018.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you Construct a Golem, you may Deploy it at no cost.")},
        {"C019",    1,  4,      "c019.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, add 2 Strength Points to your Champion.")},
        {"C020",    1,  4,      "c020.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you play an Upgrade Card, you do not have to spend Energy Points to place it."}
    )},
    // Era I
    {
        {"C021",    2,  1,      "c021.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 1 Energy Point to Recharge your Artefact.")},
        {"C022",    2,  1,      "c022.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 1 Energy Point to Travel with 1 Golem to any region. The Golem cannot carry any other unit.")},
        {"C023",    2,  1,      "c023.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to choose any region. Remove 1 Fortification from each Opponent in that region.")},
        {"C024",    2,  1,      "c024.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy Points to Construct 1 Troop and/or 1 Golem.")},
        {"C025",    2,  1,      "c025.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy Points to Deploy 1 Troop and/or 1 Golem.")},
        {"C026",    2,  2,      "c026.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 1 Energy Point to gain 3 Glory Points.")},
        {"C027",    2,  2,      "c027.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 1 Energy Point and remove from the game 1 Tactic Card from your hand to gain X Command Points and X Experience Points, where X is equal to the number of Command Points of the removed card.")},
        {"C028",    2,  2,      "c028.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to gain 2 Glory Points for each of your Fortifications currently deployed.")},
        {"C029",    2,  2,      "c029.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy Points to gain 1 Glory Point and 1 Energy Point for each of your Golems currently deployed.")},
        {"C030",    2,  2,      "c030.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy Points to gain 3 Glory Points for each Encounter you faced.")},
        {"C031",    2,  3,      "c031.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to gain 2 Energy Points.")},
        {"C032",    2,  3,      "c032.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to Travel with your Champion to any region. The Champion cannot carry any other unit.")},
        {"C033",    2,  3,      "c033.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Experience Point to gain 2 Glory Points.")},
        {"C034",    2,  3,      "c034.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to Construct 1 Troop or Travel with 1 Troop.")},
        {"C035",    2,  3,      "c035.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to Construct 1 Golem or Travel with 1 Golem.")},
        {"C036",    2,  4,      "c036.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you Deploy a Fortification, you may gain 1 Experience Point.")},
        {"C037",    2,  4,      "c037.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you Deploy a Golem, you may gain 3 Glory Points.")},
        {"C038",    2,  4,      "c038.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever your Champion Travels, they may carry one of your units from the same region that has not yet traveled this turn. If your Champion Travels several times, they can carry a different unit each time.")},
        {"C039",    2,  4,      "c039.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you Construct a Troop, you may Deploy it at no cost.")},
        {"C040",    2,  4,      "c040.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you play an Accessory Card, you do not have to spend Energy Points to place it.")}
    },
    // Era II
    {
        {"C041",    3,  1,      "c041.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 1 Energy Point to draw up to 2 cards from the top of the Era Deck of the current Era at no cost.")},
        {"C042",    3,  1,      "c042.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to Travel with up to 2 Troops to any region. Chosen units cannot carry any other unit but they can Travel to two different regions, independently.")},
        {"C043",    3,  1,      "c043.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy Points to Start a Battle in any region with at least one Opponent and add 3 to your Strength total. Starting a Battle this way does not Discharge your Artefact.")},
        {"C044",    3,  1,      "c044.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy Points to choose any region. Remove 1 Troop from each Opponent in that region.")},
        {"C045",    3,  1,      "c045.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 4 Energy Points to choose any region where you are present. Travel with all your units (except Fortifications) from that region to any other region. Units that have already traveled this turn cannot Travel again.")},
        {"C046",    3,  2,      "c046.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 1 Energy Point and remove from the game 1 Objective Card from your hand to gain X Glory Points and X Command Points, where X is equal to the number of Command Points of the removed card.")},
        {"C047",    3,  2,      "c047.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to gain 5 Glory Points.")},
        {"C048",    3,  2,      "c048.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy Points to gain 7 Glory Points.")},
        {"C049",    3,  2,      "c049.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy Points to gain 1 Glory Point for each of your Troops currently deployed.")},
        {"C050",    3,  2,      "c050.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 4 Energy Points to Recharge your Artefact and/or Meditate.")},
        {"C051",    3,  3,      "c051.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to gain 1 Experience Point and 1 Glory Point.")},
        {"C052",    3,  3,      "c052.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to Construct or Deploy 1 Golem.")},
        {"C053",    3,  3,      "c053.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to Construct or Deploy 1 Troop.")},
        {"C054",    3,  3,      "c054.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Experience Point to gain 4 Glory Points.")},
        {"C055",    3,  3,      "c055.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to Deploy 1 Fortification.")},
        {"C056",    3,  4,      "c056.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you Face an Encounter, you may gain 3 Energy Points.")},
        {"C057",    3,  4,      "c057.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you play a Tactic Card, you do not have to pay its Energy cost.")},
        {"C058",    3,  4,      "c058.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, add 1 Strength Point to each of your Golems.")},
        {"C059",    3,  4,      "c059.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever one of your Troops Travels, it may carry one of your other units that has not yet traveled this turn. The carried unit must start in the same region as your Troop.")},
        {"C060",    3,  4,      "c060.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, add 1 Strength to each of your Fortifications.")}
    },
    // Era III
    {
        {"C061",    4,  1,      "c061.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 1 Energy Point to gain 12 Energy Points.")},
        {"C062",    4,  1,      "c062.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points to choose any region. Remove 1 Golem from each Opponent in that region.")},
        {"C063",    4,  1,      "c063.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy Points to choose a Monster whose card has already been placed on the Events Board during this Era. The Monster attacks immediately.")},
        {"C064",    4,  1,      "c064.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 4 Energy Points to choose any region. Wound all Opponents’ Champions in that region.")},
        {"C065",    4,  1,      "c065.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 5 Energy Points to Start a Battle in any region with at least 1 Opponent and add 5 to your Strength total. Starting a Battle this way does not Discharge your Artefact.")},
        {"C066",    4,  2,      "c066.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 1 Energy Point and remove from the game 1 Accessory Card from your hand to gain X Energy Points and X Glory Points, where X is equal to the number of Command Points of the removed card.")},
        {"C067",    4,  2,      "c067.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 2 Energy Points and remove from the game 1 Upgrade Card from your hand to gain X Glory Points and X Experience Points, where X is equal to the number of Command Points of the removed card.")},
        {"C068",    4,  2,      "c068.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 3 Energy points to Recharge your Artefact and gain 4 Glory Points.")},
        {"C069",    4,  2,      "c069.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 4 Energy Points to gain 9 Glory Points.")},
        {"C070",    4,  2,      "c070.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Pay 5 Energy Points and remove from the game 1 Tactic Card, 1 Objective Card, 1 Accessory Card, and 1 Upgrade Card from your hand to gain 16 Glory Points.")},
        {"C071",    4,  3,      "c071.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may remove from the game 2 Accessory Cards from your hand to choose a Monster whose card has already been placed on the Events Board during this Era. The Monster attacks immediately.")},
        {"C072",    4,  3,      "c072.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to Deploy 1 Golem or Travel with 1 Golem.")},
        {"C073",    4,  3,      "c073.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Energy Point to Deploy 1 Troop or Travel with 1 Troop.")},
        {"C074",    4,  3,      "c074.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may pay 1 Experience Point to gain 6 Glory Points.")},
        {"C075",    4,  3,      "c075.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, once per turn you may remove from the game any card from your hand to gain X Glory Points twice, where X is equal to the number of Command Points of the removed card.")},
        {"C076",    4,  4,      "c076.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, add 3 Strength Points to your Champion.")},
        {"C077",    4,  4,      "c077.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever one of your Golems Travels, it may carry one of your other units that has not yet traveled this turn. The carried unit must start in the same region as your Golem.")},
        {"C078",    4,  4,      "c078.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you play an Objective Card, you do not have to pay its Energy cost.")},
        {"C079",    4,  4,      "c079.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, whenever you Deploy a Fortification, gain 4 Glory Points.")},
        {"C080",    4,  4,      "c080.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "While this card is on your Player Board, add 1 Strength Point to each of your Troops.")}
    },
    // Hero
    {
        {"H01",     5,  -1,     "h01.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Anuth: When you Start a Battle in the region where Anuth is, or if Anuth is on an Island attacked by a Monster, he receives 2 additional Strength Points until the end of the Battle or the end of the Monster’s attack.")},
        {"H02",     5,  -1,     "h02.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Celethe: When Celethe is on an Island attacked by a Monster, if the Monster loses, the player controlling Celethe doubles their reward.")},
        {"H03",     5,  -1,     "h03.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Leheir: When you Start a Battle, Leheir gives you 1 extra Glory Point for each unit which are removed or retreat (including your own), and for each Champion that becomes wounded.")},
        {"H04",     5,  -1,     "h04.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Telron: At the very beginning of each Era (before Champions are restored), Telron gives you 4 extra Energy Points if not wounded.")},
        {"H05",     5,  -1,     "h05.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "CR-2T1: At the end of each Era, you receive 3 extra Glory Points for each 2 regions you control.")},
        {"H06",     5,  -1,     "h06.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Sanya: When you Start a Battle or Face an Encounter, you may first choose to take the card on top of the Era Deck of the current Era and add it to your hand, at no cost.")},
        {"H07",     5,  -1,     "h07.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Kolbor & Malabor: When you Move an Island, you can perform one of any of the Attunements available, regardless of which Island you moved.")}
    },
    // Attunenement
    {
        {"A01",     6,  -1,     "a01.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. Receive 3 Glory Points for each Upgrade Card in play on your Player Board.")},
        {"A02",     6,  -1,     "a02.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. Receive 4 Glory Points for each Encounter you faced.")},
        {"A03",     6,  -1,     "a03.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. Receive 3 Glory Points for each region you control.")},
        {"A04",     6,  -1,     "a04.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. Receive 2 Glory Points for each of your Troops currently deployed.")},
        {"A05",     6,  -1,     "a05.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. Receive 2 Glory Points for each Command Card in your discard pile.")},
        {"A06",     6,  -1,     "a06.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. Receive 4 Glory Points for each Accessory Card in play on your Player Board.")},
        {"A07",     6,  -1,     "a07.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. Receive 2 Glory Points for each Experience Point you currently possess.")},
        {"A08",     6,  -1,     "a08.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. Receive 1 Glory Point for each region where you have at least one unit.")},
        {"A09",     6,  -1,     "a09.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. Receive 3 Glory Points for each of your Golems currently deployed.")},
        {"A10",     6,  -1,     "a10.jpg", "",       QT_TRANSLATE_NOOP("CardsData", "Attune to the anomaly. At the end of this Era, receive 8 Glory Points for each Monster defeated (even if you did not take part in the attack).")}
    },
    // Encounter
    {
        {"EN01",    7,  -1,     "en01.jpg", "en_b01.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Axe: Remove a Fortification from each Opponent / Boots: Gain 2 Experience Points.")},
        {"EN02",    7,  -1,     "en02.jpg", "en_b02.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Dialogue: Gain 3 Command Points / Chest: Meditate.")},
        {"EN03",    7,  -1,     "en03.jpg", "en_b03.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Boots: Construct 1 Troop and 1 Golem / Chest: Gain 3 Glory Points for each Crystal Field region you control.")},
        {"EN04",    7,  -1,     "en04.jpg", "en_b04.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Axe: Gain 3 Glory Points for each Forest region you control / Dialogue: Gain 1 Experience Point and Travel with your Champion.")},
        {"EN05",    7,  -1,     "en05.jpg", "en_b05.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Boots: Gain 2 Command Points / Chest: Gain 1 Energy Point and Develop.")},
        {"EN06",    7,  -1,     "en06.jpg", "en_b06.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Chest: Gain 3 Energy Points / Boots: Draw 1 card from the top of the Era Deck.")},
        {"EN07",    7,  -1,     "en07.jpg", "en_b07.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 8 Glory Points. Axe: Gain 1 Glory Point and Start a Battle in any region with at least 1 Opponent / Boots: Construct 1 Troop or Travel with 1 Troop you control.")},
        {"EN08",    7,  -1,     "en08.jpg", "en_b08.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 8 Glory Points. Dialogue: Gain 1 Energy Point and 1 Command Point / Boots: Remove 1 Troop from each Opponent.")},
        {"EN09",    7,  -1,     "en09.jpg", "en_b09.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 8 Glory Points. Chest: Discard a Tactic Card to gain X Glory Points, where X is equal to the number of Command Points of the discarded card / Dialogue: Construct or Deploy 1 Troop.")},
        {"EN10",    7,  -1,     "en10.jpg", "en_b10.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Dialogue: Gain 3 Glory Points for each Land of Myst region you control / Boots: Choose 1 Golem and 1 Troop you control, then Travel to any region.")},
        {"EN11",    7,  -1,     "en11.jpg", "en_b11.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Axe: Remove 1 Golem from each Opponent / Chest: Gain 3 Glory Points.")},
        {"EN12",    7,  -1,     "en12.jpg", "en_b12.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Chest: Gain 1 Energy Point / Axe: Recharge your Artefact or gain 1 Command Point.")},
        {"EN13",    7,  -1,     "en13.jpg", "en_b13.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Chest: Develop / Boots: Construct 1 Golem or Travel with 1 Golem you control.")},
        {"EN14",    7,  -1,     "en14.jpg", "en_b14.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Boots: Gain 1 Command Point and 2 Glory Points / Axe: Remove 1 Golem from each Opponent.")},
        {"EN15",    7,  -1,     "en15.jpg", "en_b15.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Chest: Draw 1 card from the top of the Era Deck / Dialogue: Gain 1 Glory Point for each of your Golem currently deployed.")},
        {"EN16",    7,  -1,     "en16.jpg", "en_b16.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Dialogue: Deploy 1 Troop or Construct 1 Golem / Chest: Pay 1 Energy Point to gain 3 Glory Points.")},
        {"EN17",    7,  -1,     "en17.jpg", "en_b17.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Axe: Gain 1 Glory Point and Start a Battle in any region with at least 1 Opponent / Boots: Draw 1 card from the top of the Era Deck.")},
        {"EN18",    7,  -1,     "en18.jpg", "en_b18.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Chest: Construct 1 Troop or Construct 1 Golem / Axe: Discard an Accessory Card to gain X Glory Points, where X is equal to the number of Command Points of the discarded card.")},
        {"EN19",    7,  -1,     "en19.jpg", "en_b19.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Chest: Gain 2 Energy Points or gain 2 Command Points / Dialogue: Gain 2 Experience Points.")},
        {"EN20",    7,  -1,     "en20.jpg", "en_b20.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Boots: Travel to any region with your Champion / Axe: Choose a Monster placed on the Events Board. The Monster attacks immediately.")},
        {"EN21",    7,  -1,     "en21.jpg", "en_b21.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Dialogue: Construct or Deploy 1 Golem / Boots: Gain 3 Glory Points and Start a Battle in any region with at least 1 Opponent.")},
        {"EN22",    7,  -1,     "en22.jpg", "en_b22.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 8 Glory Points. Chest: Pay 1 Energy Point to gain 3 Glory Points / Boots: Travel to any region with 2 Troops you control.")},
        {"EN23",    7,  -1,     "en23.jpg", "en_b23.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 8 Glory Points. Dialogue: Draw 1 card from the top of the Era Deck / Axe: Discard an Upgrade Card to gain X Glory Points, where X is equal to the number of Command Points of the discarded card.")},
        {"EN24",    7,  -1,     "en24.jpg", "en_b24.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 8 Glory Points. Boots: Deploy 1 Golem or Travel with 1 Golem / Dialogue: Gain 3 Glory Points for each River region you control.")},
        {"EN25",    7,  -1,     "en25.jpg", "en_b25.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Axe: Pay 1 Energy Point to gain 2 Glory Points and 1 Experience Point / Boots: Choose a region with at least 1 Troop or 1 Golem you control. Travel with all Troops and Golems you control in the chosen region to any other region.")},
        {"EN26",    7,  -1,     "en26.jpg", "en_b26.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Boots: Recharge your Artefact and gain 1 Experience Point / Dialogue: Gain 4 Glory Points.")},
        {"EN27",    7,  -1,     "en27.jpg", "en_b27.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 6 Glory Points. Chest: Meditate / Axe: Choose a Monster placed on the Events Board. The Monster attacks immediately.")},
        {"EN28",    7,  -1,     "en28.jpg", "en_b28.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Boots: Travel with 2 Troops / Axe: Deploy a Fortification or 1 Golem.")},
        {"EN29",    7,  -1,     "en29.jpg", "en_b29.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Axe: Recharge your Artefact and Start a Battle in any region with at least 1 Opponent / Boots: Discard an Objective Card to gain X Glory Points, where X is equal to the number of Command Points of the discarded card.")},
        {"EN30",    7,  -1,     "en30.jpg", "en_b30.jpg",      QT_TRANSLATE_NOOP("CardsData", "Gain 7 Glory Points. Dialogue: Act / Chest: Gain 3 Glory Points for each Mountain region you control.")}
    },
    // Event
    {
        {"EV01",    8,  -1,     "ev01.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "River")},
        {"EV02",    8,  -1,     "ev02.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Mountain")},
        {"EV03",    8,  -1,     "ev03.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Forest")},
        {"EV04",    8,  -1,     "ev04.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Land of Myst")},
        {"EV05",    8,  -1,     "ev05.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Crystal Field")},
        {"EV06",    8,  -1,     "ev06.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Storm")},
        {"EV07",    8,  -1,     "ev07.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Boulron the Reaper:\nStrength 11\nRewards:\nGold - Gain 9 Glory Points.\nSilver - Gain 4 Glory Points.\nBronze - Gain 2 Glory Points.\nBehaviour: When Boulron attacks, due to its swift and elegant movements, players do not benefit from the Strength provided by Fortifications on the attacked Island.")},
        {"EV08",    8,  -1,     "ev08.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Onygauros the Collector:\nStrength 13\nRewards:\nGold - Gain 4 Command Points and 4 Glory Points.\nSilver - Gain 3 Command Points and 3 Glory Points.\nBronze - Gain 2 Command Points and 2 Glory Points.\nBehaviour: When Onygauros attacks, every player in turn order (including players with no units on the attacked Island) must randomly choose a card from their discard pile and remove it from the game — Onygauros has collected it. As an alternative to removing a card, players may choose to lose 5 Glory Points instead, but this decision must be made before seeing the card that would be discarded.")},
        {"EV09",    8,  -1,     "ev09.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Caerulas the Inhabitant from Below:\nStrength 15\nRewards:\nGold - Gain 5 Experience Points and 5 Glory Points.\nSilver - Gain 4 Experience Points and 4 Glory Points.\nBronze - Gain 3 Experience Points and 3 Glory Points.\nBehaviour: When Caerulas attacks but is not defeated, it becomes enraged. It then moves to the next Island clockwise, and attacks again.\nNote: After this second attack, it stops and does not move onto the next Island clockwise until its next activation.")},
        {"EV10",    8,  -1,     "ev10.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Utcoro the Swarmer:\nStrength 10\nRewards:\nGold - Gain 3 Glory Points. You may also Face an Encounter.\nSilver - Gain 2 Glory Points. You may also Face an Encounter.\nBronze - Gain 1 Glory Point. You may also Face an Encounter.\nYou can Face these Encounters even if your Champion and your Encounter token are on different Islands. In addition, you do not have to spend any Experience Points. All other rules regarding facing Encounters apply.\nBehaviour: When Utcoro attacks, all players that do not take part in the battle (cowards!) immediately lose 5 Glory Points.")},
        {"EV11",    8,  -1,     "ev11.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Cannibarok the Qoam Eater:\nStrength 12\nRewards:\nGold - Gain 6 Energy Points and 6 Glory Points.\nSilver - Gain 4 Energy Points and 4 Glory Points.\nBronze - Gain 2 Energy Points and 2 Glory Points.\nBehaviour: When Cannibarok attacks an Island that has a Crystal Field region, it is reinvigorated by the erupting energies and gains +2 Strength until the end of this attack.")},
        {"EV12",    8,  -1,     "ev12.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Obsidusa The Devourer:\nStrength 14\nRewards:\nGold - Gain 7 Glory Points and draw 1 Command card.\nSilver - Gain 5 Glory Points and draw 1 Command card.\nBronze - Gain 3 Glory Points and draw 1 Command card.\nCommand cards are drawn from the Era Deck of the current Era.\nBehaviour: When Obsidusa attacks but is not defeated, he does not move to the next Island, but remains instead on the attacked Island to feast on the fallen enemies.")},
        {"EV13",    8,  -1,     "ev13.jpg", "",      QT_TRANSLATE_NOOP("CardsData", "Kodror the Infestation:\nStrength 16\nRewards:\nGold - Gain 16 Glory Points.\nSilver - Gain 12 Glory Points.\nBronze - Gain 8 Glory Points.\nBehaviour: When Kodror moves, the Island it is currently located on gets moved along with it, grappled by its infested roots (swap the Island with the next one clockwise). When Kodror attacks and is defeated, remove its miniature from the game and flip its Event Card face down to show that Kodror is no longer in play. At the end of the current Era, remove Kodror’s Event Card from the game.")}


    }
};
// clang-format on

#endif // CARD_DATA_H
