#ifndef CARD_DATA_H
#define CARD_DATA_H

#include <QHash>
#include <QList>
#include <QString>

struct Card {
  Q_GADGET

public:
  Card() {}
  Card(QString code, QString type, QString command, QString image,
       QString description)
      : m_code{code}, m_type{type}, m_command{command}, m_image{image},
        m_description{description} {}

  QString m_code;
  QString m_type;
  QString m_command;
  QString m_image;
  QString m_description;

  Q_PROPERTY(QString code MEMBER m_code)
  Q_PROPERTY(QString type MEMBER m_type)
  Q_PROPERTY(QString command MEMBER m_command)
  Q_PROPERTY(QString image MEMBER m_image)
  Q_PROPERTY(QString description MEMBER m_description)
};

Q_DECLARE_METATYPE(Card)

struct CategoryList {
  QString category;
  QList<Card> cards;
};

const QHash<int, QString> category = {{0, "Era X"},  {1, "Era I"},
                                      {2, "Era II"}, {3, "Era III"},
                                      {4, "Hero"},   {5, "Attunement"}};

const QHash<int, QList<Card>> cards_data = {
    {// category EraX
     0,
     {
         // List of cards
         // clang-format off
         {"C001", "Era X",      "Tactic",      "c001.jpg", "Pay 2 Energy Points to execute a Travel operation with your Champion in any region. Your other units cannot Travel."},
         {"C002", "Era X",      "Tactic",      "c002.jpg", "Pay 2 Energy Points to gain 2 Experience Points and perform the Develop action."},
         {"C003", "Era X",      "Tactic",      "c003.jpg", "Pay 2 Energy Points to Act."},
         {"C004", "Era X",      "Tactic",      "c004.jpg", "Pay 2 Energy Points to Start a Battle in any region with at least 1 Opponent and add 2 to your Strength. It doesn't matter if your Artefact tile is turned discharged side or charged side up (if it is charged side up, don't turn it discharged side up)."},
         {"C005", "Era X",      "Tactic",      "c005.jpg", "Pay 2 Energy Points to Meditate."},
         {"C006", "Era X",      "Objective",   "c006.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each Forest you control."},
         {"C007", "Era X",      "Objective",   "c007.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each Land of Mist you control."},
         {"C008", "Era X",      "Objective",   "c008.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each River you control."},
         {"C009", "Era X",      "Objective",   "c009.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each Crystal Field you control."},
         {"C010", "Era X",      "Objective",   "c010.jpg", "Pay 2 Energy Points to gain 3 Glory Points for each Mountain you control."},
         {"C011", "Era X",      "Accessory",   "c011.jpg", "Discard 1 Tactic Card to Act."},
         {"C012", "Era X",      "Accessory",   "c012.jpg", "Discard 1 Objective Card to Develop."},
         {"C013", "Era X",      "Accessory",   "c013.jpg", "Discard 1 Accessory Card to Meditate."},
         {"C014", "Era X",      "Accessory",   "c014.jpg", "Discard 1 Development Card to Recharge your Artefact and gain 4 Glory Points. You can also choose only one of the two effects."},
         {"C015", "Era X",      "Accessory",   "c015.jpg", "Discard 1 any Card to gain X Command Points, where X is equal to the number of Command Points of the discarded card (you must spend immediately the gained Command Points)."},
         {"C016", "Era X",      "Upgrade",     "c016.jpg", "As long as this card is on your player board, when you Deploy a Fortification, you may deploy it in any region (also in regions where you are not present)."},
         {"C017", "Era X",      "Upgrade",     "c017.jpg", "As long as this card is on your playerboard, when you Deploy 1 Troop, you may gain 1 Experience Point."},
         {"C018", "Era X",      "Upgrade",     "c018.jpg", "As long as this card is on your playerboard, when you Recruit 1 Golem, you may Deploy it at no cost."},
         {"C019", "Era X",      "Upgrade",     "c019.jpg", "As long as this card is on your playerboard, add 2 to the Strengh of your Champion."},
         {"C020", "Era X",      "Upgrade",     "c020.jpg", "As long as this card is on your playerboard, when you play a Development Card, you won't have to spend its placing cost."},
     }
    },
    {
    //Category: EraI
    1,
    {
    //List of cards EraI
    // clang-format off
        {"C021", "Era I",      "Tactic",      "c021.jpg", "Pay 1 Energy Point to Recharge your Artefact."},
        {"C022", "Era I",      "Tactic",      "c022.jpg", "Pay 1 Energy Point to execute a Travel operation with 1 Golem to any region (also in regions where you are not present). The Golem cannot carry any unit."},
        {"C023", "Era I",      "Tactic",      "c023.jpg", "Pay 2 Energy Points to choose any region and remove 1 Fortification from each Opponent present in that region."},
        {"C024", "Era I",      "Tactic",      "c024.jpg", "Pay 3 Energy Points to Recruit 1 Troop and 1 Golem. You can also choose only one of two effects."},
        {"C025", "Era I",      "Tactic",      "c025.jpg", "Pay 3 Energy Points to Deploy 1 Troop and 1 Golem. You can also choose only one of two effects."},
        {"C026", "Era I",      "Objective",   "c026.jpg", "Pay 1 Energy Point to gain 3 Glory Points."},
        {"C027", "Era I",      "Objective",   "c027.jpg", "Pay 1 Energy Point and remove from the game 1 Tactic Card to gain X Command Points and X Experience Points, where X is equal to the number of Command Points of the removed Tactic Card."},
        {"C028", "Era I",      "Objective",   "c028.jpg", "Pay 2 Energy Points to gain 2 Glory Points for each of your Fortifications currently deployed."},
        {"C029", "Era I",      "Objective",   "c029.jpg", "Pay 3 Energy Points to gain 1 Glory Point and 1 Energy Point, for each of your Golems currently deployed."},
        {"C030", "Era I",      "Objective",   "c030.jpg", "Pay 3 Energy Points to gain 3 Glory Points for each Encounter you have faced."},
        {"C031", "Era I",      "Accessory",   "c031.jpg", "Pay 0 Energy Points to gain 1 Energy Point."},
        {"C032", "Era I",      "Accessory",   "c032.jpg", "Pay 1 Energy Point to execute a Travel operation with your Champion to any region (also in regions where you are not present). The Champion cannot carry any unit."},
        {"C033", "Era I",      "Accessory",   "c033.jpg", "Pay 1 Energy Point to gain 2 Glory Points."},
        {"C034", "Era I",      "Accessory",   "c034.jpg", "Pay 1 Energy Point to Recruit 1 Golem, or execute a Travel operation with 1 Golem."},
        {"C035", "Era I",      "Accessory",   "c035.jpg", "Pay 1 Energy Point to Recruit or execute a Travel operation with 1 Troop."},
        {"C036", "Era I",      "Upgrade",     "c036.jpg", "As long as this card is on your playerboard, when you Deploy 1 Fortification, you may gain 1 Experience Point."},
        {"C037", "Era I",      "Upgrade",     "c037.jpg", "As long as this card is on your playerboard, when you Deploy 1 Golem, you may gain 3 Glory Points."},
        {"C038", "Era I",      "Upgrade",     "c038.jpg", "As long as this card is on your player board, when your Champion Travels, you may carry 1 of any unit. The carried unit has to start in the same region as your Champion. (You cannot carry a unit that has already Travelled this turn. If your Champion Travels several times, you can carry a different unit each time.)"},
        {"C039", "Era I",      "Upgrade",     "c039.jpg", "As long as this card is on your playerboard, when you Recruit 1 Troop, you may Deploy it without cost."},
        {"C040", "Era I",      "Upgrade",     "c040.jpg", "As long as this card is on your playerboard, when you play a Accessory Card, you won't have to spend its placing cost."},
    // clang format on
    }
    },
    {
    //Category: EraII
    2,
    {
    //List of cards EraII
    // clang-format off
        {"C041", "Era II",     "Tactic",      "c041.jpg", "Pay 1 Energy Point to draw up to 2 cards from the top of Command Deck of the current Era at no cost."},
        {"C042", "Era II",     "Tactic",      "c042.jpg", "Pay 2 Energy Points to execute a Travel operation with up to 2 Troops to any region (also in regions where you are not present). The Troops cannot carry any units. The 2 Troops can Travel to 2 different regions, independently."},
        {"C043", "Era II",     "Tactic",      "c043.jpg", "Pay 3 Energy Points to Start a Battle in any region with at least 1 Opponent and add 3 to your Stength. (To perform this effect your Artefact keeps the current state. The Artefact does not discharge.)"},
        {"C044", "Era II",     "Tactic",      "c044.jpg", "Pay 3 Energy Points to choose any region and remove 1 Troop for each Opponent present from the region."},
        {"C045", "Era II",     "Tactic",      "c045.jpg", "Pay 4 Energy Points to choose a region and execute a Travel operation with all the units from that region to any other region (also in a region where you are not present). Units that have already Traveled this turn cannot Travel again."},
        {"C046", "Era II",     "Objective",   "c046.jpg", "Pay 1 Energy Point and remove from the game 1 Objective Card to gain X Glory Points and X Command Points, where X is equal to the number of Command Points of the removed Objective Card."},
        {"C047", "Era II",     "Objective",   "c047.jpg", "Pay 2 Energy Points to gain 5 Glory Points."},
        {"C048", "Era II",     "Objective",   "c048.jpg", "Pay 3 Energy Points to gain 7 Glory Points."},
        {"C049", "Era II",     "Objective",   "c049.jpg", "Pay 3 Energy Points to gain 1 Glory Point for each Troop currently deployed ."},
        {"C050", "Era II",     "Objective",   "c050.jpg", "Pay 4 Energy Points to gain 2 Glory Points for each Island where you are with at least 1 unit."},
        {"C051", "Era II",     "Accessory",   "c051.jpg", "Pay 0 Energy Points to gain 1 Experience Point and 1 Glory Point."},
        {"C052", "Era II",     "Accessory",   "c052.jpg", "Pay 1 Energy Point to Recruit or Deploy 1 Golem."},
        {"C053", "Era II",     "Accessory",   "c053.jpg", "Pay 1 Energy Point to Recruit or Deploy 1 Troop."},
        {"C054", "Era II",     "Accessory",   "c054.jpg", "Pay 1 Experience Point to gain 4 Glory Points."},
        {"C055", "Era II",     "Accessory",   "c055.jpg", "Pay 1 Energy Point to Deploy 1 Fortification."},
        {"C056", "Era II",     "Upgrade",     "c056.jpg", "As long as this card is on your playerboard, when you Deploy 1 unit, you may Deploy it in any region of the Island where your Champion is."},
        {"C057", "Era II",     "Upgrade",     "c057.jpg", "As long as this card is on your playerboard, when you play a Tactic Card, you won't have to spend its Energy cost."},
        {"C058", "Era II",     "Upgrade",     "c058.jpg", "As long as this card is on your playerboard, add 1 to the Strengh of your Golems."},
        {"C059", "Era II",     "Upgrade",     "c059.jpg", "As long as this card is on your player board, when 1 Troop Travels, it can carry another unit to the same region. The carried unit has to start in the same region as your Troop. (You cannot carry a unit that has already Traveled this turn.)"},
        {"C060", "Era II",     "Upgrade",     "c060.jpg", "As long as this card is on your playerboard, add 1 to the Strengh of your Fortifications."},
    // clang format on
    }
    },
    {
    //Category: EraIII
    3,
    {
    //List of cards EraIII
    // clang-format off
        {"C061", "Era III",    "Tactic",      "c061.jpg", "Pay 1 Energy Point to gain 12 Energy Points."},
        {"C062", "Era III",    "Tactic",      "c062.jpg", "Pay 2 Energy Points to choose any region and remove 1 Golem from each Opponent present in that region."},
        {"C063", "Era III",    "Tactic",      "c063.jpg", "Pay 3 Energy Points to choose a Monster. You can only choose a Monster whose card has already been placed in the Event Board during this Era. The chosen Monster attacks immediately."},
        {"C064", "Era III",    "Tactic",      "c064.jpg", "Pay 4 Energy Points to wound 1 Champion from each Opponent present in that region."},
        {"C065", "Era III",    "Tactic",      "c065.jpg", "Pay 5 Energy Points to Start a Battle in any region with at least 1 Opponent and add 5 to your Stength. (To perform this effect your Artefact keeps the current state. The Artefact does not discharge.)"},
        {"C066", "Era III",    "Objective",   "c066.jpg", "Pay 1 Energy Point and remove from the game 1 Accessory Card to gain X Energy Points and X Glory Points, where X is equal to the number of Command Points of the removed Accessory Card."},
        {"C067", "Era III",    "Objective",   "c067.jpg", "Pay 1 Energy Point and remove from the game 1 Development Card to gain X Glory Points and X Experience Points, where X is equal to the number of Command Points of the removed Development Card."},
        {"C068", "Era III",    "Objective",   "c068.jpg", "Pay 2 Energy Points and Discharge your Artefact to gain 13 Glory Points."},
        {"C069", "Era III",    "Objective",   "c069.jpg", "Pay 4 Energy Points to gain 9 Glory Points."},
        {"C070", "Era III",    "Objective",   "c070.jpg", "Pay 5 Energy Points and remove from the game 1 Development Card, 1 Accessory Card, 1 Objective Card and 1 Tactic Card to gain 16 glory Points."},
        {"C071", "Era III",    "Accessory",   "c071.jpg", "Discharge your Artefact to choose a Monster or Meditate twice. You can only choose a Monster whose its card has already been placed in the Event Board during this Era. The chosen Monster attacks immediately."},
        {"C072", "Era III",    "Accessory",   "c072.jpg", "Pay 1 Energy Point to Deploy 1 Golem or execute a Travel operation with 1 Golem."},
        {"C073", "Era III",    "Accessory",   "c073.jpg", "Pay 1 Energy Point to Deploy 1 Troop or execute a Travel operation with 1 Troop."},
        {"C074", "Era III",    "Accessory",   "c074.jpg", "Pay 1 Experience Point to gain 6 Glory Points."},
        {"C075", "Era III",    "Accessory",   "c075.jpg", "Discard 1 any Card to gain two times X Glory Points, where X is equal to the number of Command Points of the discarded Card."},
        {"C076", "Era III",    "Upgrade",     "c076.jpg", "As long as this card is on your playerboard, add 3 to the Strengh of your Champion."},
        {"C077", "Era III",    "Upgrade",     "c077.jpg", "As long as this card is on your player board, when 1 Golem Travels, it can carry another unit to the same region. The carried unit has to start in the same region as your Golem. (You cannot carry a unit that has already Traveled this turn.)"},
        {"C078", "Era III",    "Upgrade",     "c078.jpg", "As long as this card is on your playerboard, when you play a Objective Card, you won't have to spend its Energy cost."},
        {"C079", "Era III",    "Upgrade",     "c079.jpg", "As long as this card is on your playerboard, when you Deploy 1 Fortification, you may gain 4 Glory Points."},
        {"C080", "Era III",    "Upgrade",     "c080.jpg", "As long as this card is on your playerboard, add 1 to the Strengh of your Troops."},
    // clang format on
    }
    },
    {
    //Category: Hero
    4,
    {
    //List of cards Hero
    // clang-format off
        {"H01",  "Hero",       "",        "h01.jpg",  "When you start a Battle in the region where Anuth is, or if Anuth is in an island attacked by a Monster, Anuth receive 3 Strength Points until the end of the Battle or Monster attack."},
        {"H02",  "Hero",       "",        "h02.jpg",  "When Celethe is on an island attacked by a Monster, if the Monster loses, the player holding Celethe doubles their reward."},
        {"H03",  "Hero",       "",        "h03.jpg",  "When you Start a Battle, yout receive 1 extra Glory Point for each unit, including your and enemy units, that is removed or retreats."},
        {"H04",  "Hero",       "",        "h04.jpg",  "At the beginning of each Era, you will receive 4 extra Energy Points. If Telron is wounded, you won't receive the 4 extra Energy Points at the beginning of the next Era."},
    // clang format on
    }
    },
    {
    //Category: Attunement
    5,
    {
    //List of cards Attunement
    // clang-format off
        {"A01",  "Attunement", "",        "a01.jpg",  "When you attune to the illustrated anomaly, receive 3 Glory Points for each Development card in play on your player board."},
        {"A02",  "Attunement", "",        "a02.jpg",  "When you attune to the illustrated anomaly, receive 4 Glory Points for each Encounter card you have faced."},
        {"A03",  "Attunement", "",        "a03.jpg",  "When you attune to the illustrated anomaly, receive 3 Glory Points for each region you control."},
        {"A04",  "Attunement", "",        "a04.jpg",  "When you attune to the illustrated anomaly, receive 2 Glory Points for each Troop you have placed."},
        {"A05",  "Attunement", "",        "a05.jpg",  "When you attune to the illustrated anomaly, receive 2 Glory Points for each card in your pile."},
        {"A06",  "Attunement", "",        "a06.jpg",  "When you attune to the illustrated anomaly, receive 4 Glory Points for each Accessory card in play on your player board."},
        {"A07",  "Attunement", "",        "a07.jpg",  "When you attune to the illustrated anomaly, receive 2 Glory Points for each Experience you have had."},
        {"A08",  "Attunement", "",        "a08.jpg",  "When you attune to the illustrated anomaly, receive 1 Glory Point for each region where you have at least one unit."},
        {"A09",  "Attunement", "",        "a09.jpg",  "When you attune to the illustrated anomaly, receive 3 Glory Points for each Golem you have deployed."},
        {"A10",  "Attunement", "",        "a10.jpg",  "When you attune to the illustrated anomaly, at the end of this Era, receive 8 Glory Points for each Monster defeated (even if you didn't take part in the attack)."},
    // clang format on
    }
    },

   };


#endif // CARD_DATA_H
