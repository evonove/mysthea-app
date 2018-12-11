#ifndef CARD_DATA_H
#define CARD_DATA_H

#include <QHash>
#include <QList>
#include <QString>

struct Card {
  QString code;
  int type;
  QString command;
  QString image;
  QString description;
};

Q_DECLARE_METATYPE(Card)

// const QVector<QString> types{
//    {"Era X", "Era I", "Era II", "Era III", "Hero", "Attunement"}};

const QHash<int, QString> types_map{
    {0, QT_TR_NOOP("Era X")},  {1, QT_TR_NOOP("Era I")},
    {2, QT_TR_NOOP("Era II")}, {3, QT_TR_NOOP("Era III")},
    {4, QT_TR_NOOP("Hero")},   {5, QT_TR_NOOP("Attunement")}};

// clang-format off
const QVector<QVector<Card>> cards_data = {
    // category EraX
    {
        // List of cards
         {"C001", 0,      "Tactic",      "c001.jpg", "Pay 2 Energy Points to execute a Travel operation with your Champion in any region. Your other units cannot Travel."},
         {"C002", 0,      "Tactic",      "c002.jpg", "Pay 2 Energy Points to gain 2 Experience Points and perform the Develop action."},
         {"C003", 0,      "Tactic",      "c003.jpg", "Pay 2 Energy Points to Act."},
         {"C004", 0,      "Tactic",      "c004.jpg", "Pay 2 Energy Points to Start a Battle in any region with at least 1 Opponent and add 2 to your Strength. It doesn't matter if your Artefact tile is turned discharged side or charged side up (if it is charged side up, don't turn it discharged side up)."},
         {"C005", 0,      "Tactic",      "c005.jpg", "Pay 2 Energy Points to Meditate."},
         {"C006", 0,      "Objective",   "c006.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each Forest you control."},
         {"C007", 0,      "Objective",   "c007.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each Land of Mist you control."},
         {"C008", 0,      "Objective",   "c008.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each River you control."},
         {"C009", 0,      "Objective",   "c009.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each Crystal Field you control."},
         {"C010", 0,      "Objective",   "c010.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each Mountain you control."},
         {"C011", 0,      "Accessory",   "c011.jpg", "Discard 1 Tactic Card to Act."},
         {"C012", 0,      "Accessory",   "c012.jpg", "Discard 1 Objective Card to Develop."},
         {"C013", 0,      "Accessory",   "c013.jpg", "Discard 1 Accessory Card to Meditate."},
         {"C014", 0,      "Accessory",   "c014.jpg", "Discard 1 Development Card to Recharge your Artefact and gain 4 Glory Points. You can also choose only one of the two effects."},
         {"C015", 0,      "Accessory",   "c015.jpg", "Discard 1 any Card to gain X Command Points, where X is equal to the number of Command Points of the discarded card (you must spend immediately the gained Command Points)."},
         {"C016", 0,      "Upgrade",     "c016.jpg", "As long as this card is on your player board, when you Deploy a Fortification, you may deploy it in any region (also in regions where you are not present)."},
         {"C017", 0,      "Upgrade",     "c017.jpg", "As long as this card is on your playerboard, when you Deploy 1 Troop, you may gain 1 Experience Point."},
         {"C018", 0,      "Upgrade",     "c018.jpg", "As long as this card is on your playerboard, when you Recruit 1 Golem, you may Deploy it at no cost."},
         {"C019", 0,      "Upgrade",     "c019.jpg", "As long as this card is on your playerboard, add 2 to the Strengh of your Champion."},
         {"C020", 0,      "Upgrade",     "c020.jpg", "As long as this card is on your playerboard, when you play a Development Card, you won't have to spend its placing cost."},
     },

    //Category: EraI
    {
    //List of cards EraI
        {"C021", 1,      "Tactic",      "c021.jpg", "Pay 1 Energy Point to Recharge your Artefact."},
        {"C022", 1,      "Tactic",      "c022.jpg", "Pay 1 Energy Point to execute a Travel operation with 1 Golem to any region (also in regions where you are not present). The Golem cannot carry any unit."},
        {"C023", 1,      "Tactic",      "c023.jpg", "Pay 2 Energy Points to choose any region and remove 1 Fortification from each Opponent present in that region."},
        {"C024", 1,      "Tactic",      "c024.jpg", "Pay 3 Energy Points to Recruit 1 Troop and 1 Golem. You can also choose only one of two effects."},
        {"C025", 1,      "Tactic",      "c025.jpg", "Pay 3 Energy Points to Deploy 1 Troop and 1 Golem. You can also choose only one of two effects."},
        {"C026", 1,      "Objective",   "c026.jpg", "Pay 1 Energy Point to gain 3 Glory Points."},
        {"C027", 1,      "Objective",   "c027.jpg", "Pay 1 Energy Point and remove from the game 1 Tactic Card to gain X Command Points and X Experience Points, where X is equal to the number of Command Points of the removed Tactic Card."},
        {"C028", 1,      "Objective",   "c028.jpg", "Pay 2 Energy Points to gain 2 Glory Points for each of your Fortifications currently deployed."},
        {"C029", 1,      "Objective",   "c029.jpg", "Pay 3 Energy Points to gain 1 Glory Point and 1 Energy Point, for each of your Golems currently deployed."},
        {"C030", 1,      "Objective",   "c030.jpg", "Pay 3 Energy Points to gain 3 Glory Points for each Encounter you have faced."},
        {"C031", 1,      "Accessory",   "c031.jpg", "Pay 0 Energy Points to gain 1 Energy Point."},
        {"C032", 1,      "Accessory",   "c032.jpg", "Pay 1 Energy Point to execute a Travel operation with your Champion to any region (also in regions where you are not present). The Champion cannot carry any unit."},
        {"C033", 1,      "Accessory",   "c033.jpg", "Pay 1 Energy Point to gain 2 Glory Points."},
        {"C034", 1,      "Accessory",   "c034.jpg", "Pay 1 Energy Point to Recruit 1 Golem, or execute a Travel operation with 1 Golem."},
        {"C035", 1,      "Accessory",   "c035.jpg", "Pay 1 Energy Point to Recruit or execute a Travel operation with 1 Troop."},
        {"C036", 1,      "Upgrade",     "c036.jpg", "As long as this card is on your playerboard, when you Deploy 1 Fortification, you may gain 1 Experience Point."},
        {"C037", 1,      "Upgrade",     "c037.jpg", "As long as this card is on your playerboard, when you Deploy 1 Golem, you may gain 3 Glory Points."},
        {"C038", 1,      "Upgrade",     "c038.jpg", "As long as this card is on your player board, when your Champion Travels, you may carry 1 of any unit. The carried unit has to start in the same region as your Champion. (You cannot carry a unit that has already Travelled this turn. If your Champion Travels several times, you can carry a different unit each time.)"},
        {"C039", 1,      "Upgrade",     "c039.jpg", "As long as this card is on your playerboard, when you Recruit 1 Troop, you may Deploy it without cost."},
        {"C040", 1,      "Upgrade",     "c040.jpg", "As long as this card is on your playerboard, when you play a Accessory Card, you won't have to spend its placing cost."},
    },
    //Category: EraII
    {
    //List of cards EraII
        {"C041", 2,     "Tactic",      "c041.jpg", "Pay 1 Energy Point to draw up to 2 cards from the top of Command Deck of the current Era at no cost."},
        {"C042", 2,     "Tactic",      "c042.jpg", "Pay 2 Energy Points to execute a Travel operation with up to 2 Troops to any region (also in regions where you are not present). The Troops cannot carry any units. The 2 Troops can Travel to 2 different regions, independently."},
        {"C043", 2,     "Tactic",      "c043.jpg", "Pay 3 Energy Points to Start a Battle in any region with at least 1 Opponent and add 3 to your Stength. (To perform this effect your Artefact keeps the current state. The Artefact does not discharge.)"},
        {"C044", 2,     "Tactic",      "c044.jpg", "Pay 3 Energy Points to choose any region and remove 1 Troop for each Opponent present from the region."},
        {"C045", 2,     "Tactic",      "c045.jpg", "Pay 4 Energy Points to choose a region and execute a Travel operation with all the units from that region to any other region (also in a region where you are not present). Units that have already Traveled this turn cannot Travel again."},
        {"C046", 2,     "Objective",   "c046.jpg", "Pay 1 Energy Point and remove from the game 1 Objective Card to gain X Glory Points and X Command Points, where X is equal to the number of Command Points of the removed Objective Card."},
        {"C047", 2,     "Objective",   "c047.jpg", "Pay 2 Energy Points to gain 5 Glory Points."},
        {"C048", 2,     "Objective",   "c048.jpg", "Pay 3 Energy Points to gain 7 Glory Points."},
        {"C049", 2,     "Objective",   "c049.jpg", "Pay 3 Energy Points to gain 1 Glory Point for each Troop currently deployed ."},
        {"C050", 2,     "Objective",   "c050.jpg", "Pay 4 Energy Points to gain 2 Glory Points for each Island where you are with at least 1 unit."},
        {"C051", 2,     "Accessory",   "c051.jpg", "Pay 0 Energy Points to gain 1 Experience Point and 1 Glory Point."},
        {"C052", 2,     "Accessory",   "c052.jpg", "Pay 1 Energy Point to Recruit or Deploy 1 Golem."},
        {"C053", 2,     "Accessory",   "c053.jpg", "Pay 1 Energy Point to Recruit or Deploy 1 Troop."},
        {"C054", 2,     "Accessory",   "c054.jpg", "Pay 1 Experience Point to gain 4 Glory Points."},
        {"C055", 2,     "Accessory",   "c055.jpg", "Pay 1 Energy Point to Deploy 1 Fortification."},
        {"C056", 2,     "Upgrade",     "c056.jpg", "As long as this card is on your playerboard, when you Deploy 1 unit, you may Deploy it in any region of the Island where your Champion is."},
        {"C057", 2,     "Upgrade",     "c057.jpg", "As long as this card is on your playerboard, when you play a Tactic Card, you won't have to spend its Energy cost."},
        {"C058", 2,     "Upgrade",     "c058.jpg", "As long as this card is on your playerboard, add 1 to the Strengh of your Golems."},
        {"C059", 2,     "Upgrade",     "c059.jpg", "As long as this card is on your player board, when 1 Troop Travels, it can carry another unit to the same region. The carried unit has to start in the same region as your Troop. (You cannot carry a unit that has already Traveled this turn.)"},
        {"C060", 2,     "Upgrade",     "c060.jpg", "As long as this card is on your playerboard, add 1 to the Strengh of your Fortifications."},
    },
    //Category: EraIII
    {
    //List of cards EraIII
        {"C061", 3,    "Tactic",      "c061.jpg", "Pay 1 Energy Point to gain 12 Energy Points."},
        {"C062", 3,    "Tactic",      "c062.jpg", "Pay 2 Energy Points to choose any region and remove 1 Golem from each Opponent present in that region."},
        {"C063", 3,    "Tactic",      "c063.jpg", "Pay 3 Energy Points to choose a Monster. You can only choose a Monster whose card has already been placed in the Event Board during this Era. The chosen Monster attacks immediately."},
        {"C064", 3,    "Tactic",      "c064.jpg", "Pay 4 Energy Points to wound 1 Champion from each Opponent present in that region."},
        {"C065", 3,    "Tactic",      "c065.jpg", "Pay 5 Energy Points to Start a Battle in any region with at least 1 Opponent and add 5 to your Stength. (To perform this effect your Artefact keeps the current state. The Artefact does not discharge.)"},
        {"C066", 3,    "Objective",   "c066.jpg", "Pay 1 Energy Point and remove from the game 1 Accessory Card to gain X Energy Points and X Glory Points, where X is equal to the number of Command Points of the removed Accessory Card."},
        {"C067", 3,    "Objective",   "c067.jpg", "Pay 1 Energy Point and remove from the game 1 Development Card to gain X Glory Points and X Experience Points, where X is equal to the number of Command Points of the removed Development Card."},
        {"C068", 3,    "Objective",   "c068.jpg", "Pay 2 Energy Points and Discharge your Artefact to gain 13 Glory Points."},
        {"C069", 3,    "Objective",   "c069.jpg", "Pay 4 Energy Points to gain 9 Glory Points."},
        {"C070", 3,    "Objective",   "c070.jpg", "Pay 5 Energy Points and remove from the game 1 Development Card, 1 Accessory Card, 1 Objective Card and 1 Tactic Card to gain 16 glory Points."},
        {"C071", 3,    "Accessory",   "c071.jpg", "Discharge your Artefact to choose a Monster or Meditate twice. You can only choose a Monster whose its card has already been placed in the Event Board during this Era. The chosen Monster attacks immediately."},
        {"C072", 3,    "Accessory",   "c072.jpg", "Pay 1 Energy Point to Deploy 1 Golem or execute a Travel operation with 1 Golem."},
        {"C073", 3,    "Accessory",   "c073.jpg", "Pay 1 Energy Point to Deploy 1 Troop or execute a Travel operation with 1 Troop."},
        {"C074", 3,    "Accessory",   "c074.jpg", "Pay 1 Experience Point to gain 6 Glory Points."},
        {"C075", 3,    "Accessory",   "c075.jpg", "Discard 1 any Card to gain two times X Glory Points, where X is equal to the number of Command Points of the discarded Card."},
        {"C076", 3,    "Upgrade",     "c076.jpg", "As long as this card is on your playerboard, add 3 to the Strengh of your Champion."},
        {"C077", 3,    "Upgrade",     "c077.jpg", "As long as this card is on your player board, when 1 Golem Travels, it can carry another unit to the same region. The carried unit has to start in the same region as your Golem. (You cannot carry a unit that has already Traveled this turn.)"},
        {"C078", 3,    "Upgrade",     "c078.jpg", "As long as this card is on your playerboard, when you play a Objective Card, you won't have to spend its Energy cost."},
        {"C079", 3,    "Upgrade",     "c079.jpg", "As long as this card is on your playerboard, when you Deploy 1 Fortification, you may gain 4 Glory Points."},
        {"C080", 3,    "Upgrade",     "c080.jpg", "As long as this card is on your playerboard, add 1 to the Strengh of your Troops."},
    },
    //Category: Hero
    {
    //List of cards Hero
        {"H01",  4,       "",        "h01.jpg",  "When you start a Battle in the region where Anuth is, or if Anuth is in an island attacked by a Monster, Anuth receive 3 Strength Points until the end of the Battle or Monster attack."},
        {"H02",  4,       "",        "h02.jpg",  "When Celethe is on an island attacked by a Monster, if the Monster loses, the player holding Celethe doubles their reward."},
        {"H03",  4,       "",        "h03.jpg",  "When you Start a Battle, yout receive 1 extra Glory Point for each unit, including your and enemy units, that is removed or retreats."},
        {"H04",  4,       "",        "h04.jpg",  "At the beginning of each Era, you will receive 4 extra Energy Points. If Telron is wounded, you won't receive the 4 extra Energy Points at the beginning of the next Era."},
    },
    //Category: Attunement
    {
    //List of cards Attunement
        {"A01",  5, "",        "a01.jpg",  "When you attune to the illustrated anomaly, receive 3 Glory Points for each Development card in play on your player board."},
        {"A02",  5, "",        "a02.jpg",  "When you attune to the illustrated anomaly, receive 4 Glory Points for each Encounter card you have faced."},
        {"A03",  5, "",        "a03.jpg",  "When you attune to the illustrated anomaly, receive 3 Glory Points for each region you control."},
        {"A04",  5, "",        "a04.jpg",  "When you attune to the illustrated anomaly, receive 2 Glory Points for each Troop you have placed."},
        {"A05",  5, "",        "a05.jpg",  "When you attune to the illustrated anomaly, receive 2 Glory Points for each card in your pile."},
        {"A06",  5, "",        "a06.jpg",  "When you attune to the illustrated anomaly, receive 4 Glory Points for each Accessory card in play on your player board."},
        {"A07",  5, "",        "a07.jpg",  "When you attune to the illustrated anomaly, receive 2 Glory Points for each Experience you have had."},
        {"A08",  5, "",        "a08.jpg",  "When you attune to the illustrated anomaly, receive 1 Glory Point for each region where you have at least one unit."},
        {"A09",  5, "",        "a09.jpg",  "When you attune to the illustrated anomaly, receive 3 Glory Points for each Golem you have deployed."},
        {"A10",  5, "",        "a10.jpg",  "When you attune to the illustrated anomaly, at the end of this Era, receive 8 Glory Points for each Monster defeated (even if you didn't take part in the attack)."},
    }
   };
    // clang format on
#endif // CARD_DATA_H
