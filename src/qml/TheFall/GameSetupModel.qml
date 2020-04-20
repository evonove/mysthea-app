import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQml.Models 2.14
import QtGraphicalEffects 1.14

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

ObjectModel {
    id: root
    property int width: 100

    Flickable {
        contentWidth: root.width
        contentHeight: step1.height

        ColumnLayout {
            id: step1
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_1.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "1"
                otherText: qsTr("Place the Game Board and the Event Board in the center of the table, one next to the other. Randomly place an Island on each Game Board crater. The Islands’ side without icons must be facing upwards.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step2.height
        ColumnLayout {
            id: step2
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_2.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "2"
                otherText: qsTr("Place 4 Golems on each Island, all in one Region. Choose a different kind of Region for each Island.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }
    Flickable {
        contentWidth: root.width
        contentHeight: step3.height
        ColumnLayout {
            id: step3
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_3.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "3"
                otherText: qsTr("Place 4 Troops on each remaining empty Region among all Islands.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }
    Flickable {
        contentWidth: root.width
        contentHeight: step4.height
        ColumnLayout {
            id: step4
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_4.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "4"
                otherText: qsTr("Place all Qoam crystals, Parasites, and Monsters in a common pool near the Game Board.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<strong>Note:</strong> Consider Qoam crystals and Parasites miniatures as infinite. In the rare case that a specific component supply is depleted, use other components as a temporary replacement.")
                color: Palette.theFallLight
                font.pixelSize: 14
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20
                Layout.topMargin: 10
            }
        }
    }
    Flickable {
        contentWidth: root.width
        contentHeight: step5.height
        ColumnLayout {
            id: step5
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup-5.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "5"
                otherText: qsTr("Choose the difficulty level for the game. Take 10 Primal Shards according to your choice and place them in an opaque container that they may be drawn from at random (like a bag or a cup).")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<strong><u>Easy:</u></strong><br>- 3 SHARDS “1”<br>- 5 SHARDS “2”<br>- 2 SHARDS “3”")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            Label {
                text: qsTr("<strong><u>Normal:</u></strong><br>- 2 SHARDS “1”<br>- 4 SHARDS “2”<br>- 4 SHARDS “3”")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            Label {
                text: qsTr("<strong><u>Difficult:</u></strong><br>- 1 SHARDS “1”<br>- 4 SHARDS “2”<br>- 5 SHARDS “3”")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            Label {
                text: qsTr("Take one of the remaining Primal Shards and use it as a score marker on the Game Board track, starting in the space labeled “99”. This serves as a counter for the City Defense Points. Put the remaining Primal Shards back into the game box.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }
    Flickable {
        contentWidth: root.width
        contentHeight: step6.height
        ColumnLayout {
            id: step6
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_6.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "6"
                otherText: qsTr("Draw at random 5 Primal Shards from the bag. Without looking at their values, plug them into the base of the Colossus’ miniature.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }
    Flickable {
        contentWidth: root.width
        contentHeight: step7.height
        ColumnLayout {
            id: step7
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_7.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "7"
                otherText: qsTr("Place the Colossus on one of the five external nodes, chosen at random. It will only move between these nodes during the game.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_7b.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
        }
    }
    Flickable {
        contentWidth: root.width
        contentHeight: step8.height
        ColumnLayout {
            id: step8
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_8.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "8"
                otherText: qsTr("Place Machinery on the Game Board: In each of its Regions, place three different Machines, all of the same color. Each kind of Region may only hold Machines of the same color (e.g., Black Machines in Forest Regions).")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }
    Flickable {
        contentWidth: root.width
        contentHeight: step9.height
        ColumnLayout {
            id: step9
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_9.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "9"
                otherText: qsTr("The oldest player is the first in turn order. Other players follow clockwise.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("Divide the Character Cards into two piles (Mysthea’s and Icaion’s) and shuffle them both. The first player gets to choose which pile they draw a Character from.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            Label {
                text: qsTr("Each following player must draw from a pile that is different from the player choosing before them. Each player then takes the corresponding miniature and the tile related to their Character (Mysthea’s Artefact or Icaion’s Emergency Power Supply).")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<strong>Note:</strong> From now on, we will refer to both kinds of tiles as Relics.")
                color: Palette.theFallLight
                font.pixelSize: 14
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("Place the Relic in front of you, with its charged side facing upwards.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            Label {
                text: qsTr("Finally, each player takes a colored base for their miniature, plus some Fortification Tokens depending on the number of players:<br><strong>- 5 players:</strong> 1 Fortification of your color.<br><strong>- 4 players:</strong> 2 Fortifications of your color.<br><strong>- 3 players:</strong> 3 Fortifications of your color.<br><strong>- 2 players:</strong> 3 Fortifications of your color, plus another 2 of a non-playing color.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }


            Label {
                text: qsTr("<strong>Solo variant</strong><br>Set up the game following the 2-player rules. Choose two Characters and alternate your turns between the two.")
                color: Palette.theFallLight
                font.pixelSize: 14
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step10.height
        ColumnLayout {
            id: step10
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_10.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "10"
                otherText: qsTr("In order of play, each player places their Character on an empty node of the Game Board, following the instructions below:")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<span style='color: #ED008C'><strong>Mysthea Character:</strong></span> Place them on one of the five nodes adjacent to a fallen Island and two Icaion Regions.<br><span style='color: #0094CC'><strong>Icaion Character:</strong></span> Place them on one of the five City nodes.")
                color: Palette.white
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            Label {
                text: qsTr("For each of the two Regions adjacent to your Character, take 1 Qoam crystal of the same type as the Region.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step11.height
        ColumnLayout {
            id: step11
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup-11.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "11"
                otherText: qsTr("Divide Command Cards into three decks: Era I, Era II, and Era III. Place the three decks, face down, on the Event Board.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step12.height
        ColumnLayout {
            id: step12
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/thefall/setup_12.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "12"
                otherText: qsTr("Prepare the Event Deck: shuffle together all Region Cards (both Mysthea’s and Icaion’s), the three Colossus Cards, and the Storm Card. <br><br>Place the deck face down on the Event Board. Also shuffle the Monster Cards to form another deck. Place it above the Event Board, face down.")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }

    Flickable {
        // TODO: There is a bug here, try to scroll to the bottom in the app
        contentWidth: root.width
        contentHeight: step12.height
        ColumnLayout {
            id: step13
            width: parent.width
            spacing: 20
            RowLayout {
                width: parent.width
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.topMargin: 20
                spacing: 20
                RoundedImage {
                    source: "qrc:/assets/images/game_setup/thefall/setup_13a.jpg"
                    fillMode: Image.PreserveAspectFit
                    Layout.fillWidth: true
                    Layout.preferredHeight: 230
                    Layout.alignment: Qt.AlignTop
                    borderWidth: 1
                }
                RoundedImage {
                    source: "qrc:/assets/images/game_setup/thefall/setup_13b.jpg"
                    fillMode: Image.PreserveAspectFit
                    Layout.fillWidth: true
                    Layout.preferredHeight: 230
                    Layout.alignment: Qt.AlignTop
                    borderWidth: 1
                }
            }

            DropCapLabel {
                dropLetter: "13"
                otherText: qsTr("Reveal a Monster from the appropriate deck, and place its miniature on the corresponding Island. Apply all effects related to that Monster (see p.12 of the rulebook).<br><br>Reveal an amount of Event Cards equal to the difficulty level you chose, then place them on the Event Board:<br>Easy: 2 Event Cards<br>Normal: 3 Event Cards<br>Hard: 4 Event Cards<br>Resolve them following the order in which they were revealed (see p.9 of the rulebook).")
                color: Palette.theFallLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<strong>Note:</strong> If a Storm Card is revealed, ignore it and draw another card instead. At the end of this step, shuffle the Storm Card back into the Event Deck.")
                color: Palette.theFallLight
                font.pixelSize: 14
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
        }
    }
}

