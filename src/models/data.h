#ifndef CARDSDATA_H
#define CARDSDATA_H

#include <QString>

struct Card {
    QString code;
    QString type;
    QString category;
    QString image;
    QString description;
};

constexpr int CARDS_NUMBER = 80;

const Card CARDS_DATA[CARDS_NUMBER] = {
    {"C001", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to Move your Hero in any Zone."},
    {"C002", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to gain 2 Experience Points and Develop."},
    {"C003", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to Act."},
    {"C004", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to Unleash a Battle in any Zone with at least 1 Opponent and add 2 to your Stength."},
    {"C005", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to Meditate."},
    {"C006", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to gain 3 Glory Points for each your controlled Forest."},
    {"C007", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to gain 3 Glory Points for each your controlled Land of Mist."},
    {"C008", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to gain 3 Glory Points for each your controlled River."},
    {"C009", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to gain 3 Glory Points for each your controlled Crystal Field."},
    {"C010", "Minieuro", "Era X", "card.png", "Pay 2 Energy Points to gain 3 Glory Points for each your controlled Mountain."},
    {"C011", "Minieuro", "Era X", "card.png", "Discard 1 Tactic Card to Act."},
    {"C012", "Minieuro", "Era X", "card.png", "Discard 1 Objective Card to Develop."},
    {"C013", "Minieuro", "Era X", "card.png", "Discard 1 Gadget Card to Meditate."},
    {"C014", "Minieuro", "Era X", "card.png", "Discard 1 Development Card to Recharge your Artifact and gain 4 Glory Points. You may choose one of two effects."},
    {"C015", "Minieuro", "Era X", "card.png", "Discard 1 any type Card to gain X Command Points, where X is equal to the number of Command Points of the discarded card (you have to spend immediately the gained Command Points)."},
    {"C016", "Minieuro", "Era X", "card.png", "As long as this card is on your playerboard, when you Deploy a Fortification, you may depoy it in any Zone (also in zones where you are not)."},
    {"C017", "Minieuro", "Era X", "card.png", "As long as this card is on your playerboard, when you Recruit 1 Minion, you may gain 1 Experience Point."},
    {"C018", "Minieuro", "Era X", "card.png", "As long as this card is on your playerboard, when you Recruit 1 Golem, you may Deploy it at no cost."},
    {"C019", "Minieuro", "Era X", "card.png", "As long as this card is on your playerboard, add 2 to the Strengh of your Hero."},
    {"C020", "Minieuro", "Era X", "card.png", "As long as this card is on your playerboard, when you play a Development Card, you may not pay its placing cost."},
    {"C021", "Minieuro", "Era I", "card.png", "Pay 1 Energy Point to Recharge your Artifact."},
    {"C022", "Minieuro", "Era I", "card.png", "Pay 1 Energy Point to Move 1 Golem in any Zone (also in zones where you are not). The Golem can not carry any unit."},
    {"C023", "Minieuro", "Era I", "card.png", "Pay 2 Energy Points to remove 1 Fortification for each Opponent in only 1 Zone at your choice (also a zone where you are not)."},
    {"C024", "Minieuro", "Era I", "card.png", "Pay 3 Energy Points to Recruit 1 Minion and 1 Golem. You may choose one of two effects."},
    {"C025", "Minieuro", "Era I", "card.png", "Pay 3 Energy Points to Deploy 1 Minion and 1 Golem. You may choose one of two effects."},
    {"C026", "Minieuro", "Era I", "card.png", "Pay 1 Energy Point to gain 3 Glory Points."},
    {"C027", "Minieuro", "Era I", "card.png", "Pay 1 Energy Points and remove from the game 1 Tactic Card to gain X Command Points and X Experience Points, where X is equal to the number of Command Points of the removed Tactic Card."},
    {"C028", "Minieuro", "Era I", "card.png", "Pay 2 Energy Points To gain 2 Glory Points for each your Fortification currently deployed."},
    {"C029", "Minieuro", "Era I", "card.png", "Pay 3 Energy Points to gain 1 Glory Point and 1 Energy Point, for each your Golem currently deployed."},
    {"C030", "Minieuro", "Era I", "card.png", "Pay 3 Energy Points to gain 3 Glory Points for each your faced Encounter."},
    {"C031", "Minieuro", "Era I", "card.png", "Pay 0 Energy Point to gain 1 Energy Point."},
    {"C032", "Minieuro", "Era I", "card.png", "Pay 1 Energy Point to Move your Hero in any Zone (also in zones where you are not). The Hero can not carry any unit."},
    {"C033", "Minieuro", "Era I", "card.png", "Pay 1 Energy Point to gain 2 Glory Points."},
    {"C034", "Minieuro", "Era I", "card.png", "Pay 1 Energy Point to Recruit or Move 1 your Golem."},
    {"C035", "Minieuro", "Era I", "card.png", "Pay 1 Energy Point to Recruit or Move 1 your Minion."},
    {"C036", "Minieuro", "Era I", "card.png", "As long as this card is on your playerboard, when you Deploy 1 Fortification, you may gain 1 Experience Point."},
    {"C037", "Minieuro", "Era I", "card.png", "As long as this card is on your playerboard, when you Deploy 1 Golem, you may gain 3 Glory Points."},
    {"C038", "Minieuro", "Era I", "card.png", "As long as this card is on your playerboard, when you Move your Hero, you may carry 1 any unit. The carried unit have to be in the same Zone of your Hero. (You can not carry a unit that has already moved this turn. If you move the Hero several times, you can move a different unit each time.)"},
    {"C039", "Minieuro", "Era I", "card.png", "As long as this card is on your playerboard, when you Recruit 1 Minion, you may Deploy it without cost."},
    {"C040", "Minieuro", "Era I", "card.png", "As long as this card is on your playerboard, when you play a Gadget Card, you may not pay its placing cost."},
    {"C041", "Minieuro", "Era II", "card.png", "Pay 1 Energy Point to draw up to 2 cards from the top of Command Deck of the current Era at no cost."},
    {"C042", "Minieuro", "Era II", "card.png", "Pay 2 Energy Points to Move up to 2 Minions in any Zone (also in zones where you are not). The Minions can not carry any unit. You can move 2 Minions from 2 different Zones and you can move them to other 2 different Zones."},
    {"C043", "Minieuro", "Era II", "card.png", "Pay 3 Energy Points to Unleash a Battle in any Zone with at least 1 Opponent and add 3 to your Stength. (To perform this effect your Artifact keeps the current state. The Artifact does not discharge.)"},
    {"C044", "Minieuro", "Era II", "card.png", "Pay 3 Energy Points to remove 1 Minion for each Opponent in only 1 Zone at your choice (also a zone where you are not)."},
    {"C045", "Minieuro", "Era II", "card.png", "Pay 4 Energy Points to Move all the units from 1 Zone to another Zone (also in a Zone where you are not). You can not Move units that have already moved this turn."},
    {"C046", "Minieuro", "Era II", "card.png", "Pay 1 Energy Point and remove from game 1 Objective Card to gain X Glory Points and X Command Points, where X is equal to the number of Command Points of the removed Objective Card."},
    {"C047", "Minieuro", "Era II", "card.png", "Pay 2 Energy Points to gain 5 Glory Points."},
    {"C048", "Minieuro", "Era II", "card.png", "Pay 3 Energy Points to gain 7 Glory Points."},
    {"C049", "Minieuro", "Era II", "card.png", "Pay 3 Energy Points to gain 1 Glory Point for each your deployed Minion."},
    {"C050", "Minieuro", "Era II", "card.png", "Pay 4 Energy Points to gain 2 Glory Points for each Island where you are with at least 1 unit."},
    {"C051", "Minieuro", "Era II", "card.png", "Pay 0 Energy Point to gain 1 Experience Point and 1 Glory Point."},
    {"C052", "Minieuro", "Era II", "card.png", "Pay 1 Energy Point to Recruit or Deploy 1 your Golem."},
    {"C053", "Minieuro", "Era II", "card.png", "Pay 1 Energy Point to Recruit or Deploy 1 your Minion."},
    {"C054", "Minieuro", "Era II", "card.png", "Pay 1 Experience Point to gain 4 Glory Points."},
    {"C055", "Minieuro", "Era II", "card.png", "Pay 1 Energy Point to Deploy 1 Fortification."},
    {"C056", "Minieuro", "Era II", "card.png", "As long as this card is on your playerboard, when you Deploy 1 unit, you may Deploy it in any Zone of the Island where your Hero is."},
    {"C057", "Minieuro", "Era II", "card.png", "As long as this card is on your playerboard, when you play a Tactic Card, you may not pay its Energy cost."},
    {"C058", "Minieuro", "Era II", "card.png", "As long as this card is on your playerboard, add 1 to the Strengh of your Golems."},
    {"C059", "Minieuro", "Era II", "card.png", "As long as this card is on your playerboard, when you Move 1 your Minion, you may carry 1 any unit. The carried unit have to be in the same Zone of your Minion. (You can not carry a unit that has already moved this turn.)"},
    {"C060", "Minieuro", "Era II", "card.png", "As long as this card is on your playerboard, add 1 to the Strengh of your Fortifications."},
    {"C061", "Minieuro", "Era III", "card.png", "Pay 1 Energy Point to gain 12 Energy Points."},
    {"C062", "Minieuro", "Era III", "card.png", "Pay 2 Energy Points to remove 1 Golem for each Opponent in only 1 Zone at your choice (also a zone where you are not)."},
    {"C063", "Minieuro", "Era III", "card.png", "Pay 3 Energy Points to Activate 1 Monster. You can only choose a Monster whose its card has already been placed in the Event Board during this Era. Activate the Monster immediately."},
    {"C064", "Minieuro", "Era III", "card.png", "Pay 4 Energy Points to wound 1 Hero for each Opponent in only 1 Zone at your choice (also a zone where you are not)."},
    {"C065", "Minieuro", "Era III", "card.png", "Pay 5 Energy Points to Unleash a Battle in any Zone with at least 1 Opponent and add 5 to your Stength. (To perform this effect your Artifact keeps the current state. The Artifact does not discharge.)"},
    {"C066", "Minieuro", "Era III", "card.png", "Pay 1 Energy Point and remove from game 1 Gadget Card to gain X Energy Points and X Glory Points, where X is equal to the number of Command Points of the removed Gadget Card."},
    {"C067", "Minieuro", "Era III", "card.png", "Pay 1 Energy Point and remove from game 1 Development Card to gain X Glory Points and X Experience Points, where X is equal to the number of Command Points of the removed Development Card."},
    {"C068", "Minieuro", "Era III", "card.png", "Pay 2 Energy Points and Discharge your Artifact to gain 13 Glory Points."},
    {"C069", "Minieuro", "Era III", "card.png", "Pay 4 Energy Points to gain 9 Glory Points."},
    {"C070", "Minieuro", "Era III", "card.png", "Pay 5 Energy Points and remove from the game 1 Development Card, 1 Gadget Card, 1 Objective Card and 1 Tactic Card to gain 16 glory Points."},
    {"C071", "Minieuro", "Era III", "card.png", "Discharge your Artifact to Activate 1 Monster or Meditate twice. You can only choose a Monster whose its card has already been placed in the Event Board during this Era. Activate the Monster immediately."},
    {"C072", "Minieuro", "Era III", "card.png", "Pay 1 Energy Point to Deploy or Move 1 your Golem."},
    {"C073", "Minieuro", "Era III", "card.png", "Pay 1 Energy Point to Deploy or Move 1 your Minion."},
    {"C074", "Minieuro", "Era III", "card.png", "Pay 1 Experience Point to gain 6 Glory Points."},
    {"C075", "Minieuro", "Era III", "card.png", "Discard 1 any type Card to gain two times X Glory Points, where X is equal to the number of Command Points of the removed Card."},
    {"C076", "Minieuro", "Era III", "card.png", "As long as this card is on your playerboard, add 3 to the Strengh of your Hero."},
    {"C077", "Minieuro", "Era III", "card.png", "As long as this card is on your playerboard, when you Move 1 your Golem, you may carry 1 any unit. The carried unit have to be in the same Zone of your Golem. (You can not carry a unit that has already moved this turn.)"},
    {"C078", "Minieuro", "Era III", "card.png", "As long as this card is on your playerboard, when you play a Objective Card, you may not pay its Energy cost."},
    {"C079", "Minieuro", "Era III", "card.png", "As long as this card is on your playerboard, when you Deploy 1 Fortification, you may gain 4 Glory Points."},
    {"C080", "Minieuro", "Era III", "card.png", "As long as this card is on your playerboard, add 1 to the Strengh of your Minions."},
};

#endif // CARDSDATA_H
