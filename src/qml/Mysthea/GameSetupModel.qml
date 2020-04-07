import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
import QtGraphicalEffects 1.12

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
                source: "qrc:/images/game_setup/d1.png"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">1</strong> Place the 5 Floating Islands at " + "random in the spaces marked on the board. The side showing the icons must be face up.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"color: #FFEDF5;\">In a 2-player game:</strong><br> Place one Mirage Token on each Island. Make sure each Mirage Token is placed on a different region (Forest, River, Land of Myst, Crystal Field, or Mountain). Regions containing Mirage Tokens cannot be used by players for moving or deploying units for the entire game.")
                color: Palette.grayNurse
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
        contentHeight: step2.height
        ColumnLayout {
            id: step2
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/images/game_setup/d2.png"
                fillMode: Image.PreserveAspectFit
                width: width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">2</strong> Shuffle the Monster Cards and randomly place three of them face up on the indicated spaces of the Events Board. Put the leftover Monster Cards back into the box. Now take the 3 matching Monster Miniatures and place each one on its corresponding card.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20
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
                source: "qrc:/images/game_setup/d3.png"
                fillMode: Image.PreserveAspectFit
                width: width
                borderWidth: 1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">3</strong> Shuffle the 5 Region Cards and the Storm Card together and place them face up as an Events Deck on the appropriate space of the Events Board.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20
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
                source: "qrc:/images/game_setup/d4.png"
                fillMode: Image.PreserveAspectFit
                width: width
                borderWidth: 1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">4</strong> Shuffle the Encounter Cards and place them face up as an Encounter Deck on the appropriate space of the Game Board.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20
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
                source: "qrc:/images/game_setup/d5.png"
                fillMode: Image.PreserveAspectFit
                width: width
                borderWidth: 1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">5</strong> Choose whether to play with all the Attunements on the Day side, the Night side, or mixed. Place the Attunement Cards on the Game Board, with the chosen side up. Once you have chosen, Attunements must be kept the same side up for the entire game.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20
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
                source: "qrc:/images/game_setup/d6.png"
                fillMode: Image.PreserveAspectFit
                width: width
                borderWidth: 1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">6</strong> Sort the Command Cards by Era (<span style=\"font-family:EraIcons; font-size: 15px;\">0</span>/ <span style=\"font-family:EraIcons; font-size: 15px;\">1</span>/ <span style=\"font-family:EraIcons; font-size: 15px;\">2</span> or <span style=\"font-family:EraIcons; font-size: 17px;\">3</span> in the top-right hand corner). Shuffle the 20 Era <span style=\"font-family:EraIcons; font-size: 15px;\">1</span> cards, 20 Era <span style=\"font-family:EraIcons; font-size: 15px;\">2</span> cards, and 20 Era <span style=\"font-family:EraIcons; font-size: 17px;\">3</span> cards separately, and place the three decks face down on the Events Board, as Era Decks.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20
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
                source: "qrc:/images/game_setup/d7.png"
                fillMode: Image.PreserveAspectFit
                width: width
                borderWidth: 1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">7</strong> Take the 20 starting Command Cards and divide them by color. Shuffle each pile separately and then deal 1 card of each color face down to each player. Players keep their Command Cards in their hand but must keep them secret from other players. Return any leftover cards from the starting Era back to the box.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"color: #FFEDF5;\">Expert Players Mode:</strong><br> Skip steps 7. and 8. above. After dealing the Artefacts, randomly choose 1 Champion Card and 1 starting Command Card of each color and place them face up on the table. In order of play, players take turns picking up a card from the table. Each time you take a card, replace it with another of the same type, chosen at random, so there are always exactly 1 Champion Card and 1 starting card of each color on the table. Continue this way until everyone has exactly 1 Champion and 1 starting card of each color (blue, green, yellow, red). Put any leftover cards back into the box.")
                color: Palette.grayNurse
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
        contentHeight: step8.height
        ColumnLayout {
            id: step8
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/images/game_setup/d8.png"
                fillMode: Image.PreserveAspectFit
                width: width
                borderWidth: 1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">8</strong> ∙ Shuffle the Champion Cards and randomly deal one to each player. Each player must keep their Champion Card face up in front of them. Put the leftover Champion Cards back into the box.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"color: #FFEDF5;\">Expert Players Mode:</strong><br> Skip steps 7. and 8. above. After dealing the Artefacts, randomly choose 1 Champion Card and 1 starting Command Card of each color and place them face up on the table. In order of play, players take turns picking up a card from the table. Each time you take a card, replace it with another of the same type, chosen at random, so there are always exactly 1 Champion Card and 1 starting card of each color on the table. Continue this way until everyone has exactly 1 Champion and 1 starting card of each color (blue, green, yellow, red). Put any leftover cards back into the box.")
                color: Palette.grayNurse
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
        contentHeight: step9.height
        ColumnLayout {
            id: step9
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/images/game_setup/d9.png"
                fillMode: Image.PreserveAspectFit
                width: width
                borderWidth: 1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">9</strong> ∙ Each player chooses a color and takes the matching:")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<b><u>Player Board</u></b> <br> To be placed in front of you, next to your Champion Card.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<b><u>1 Energy Token and 1 Experience Token</u></b><br> Place both of them on the “0” space of your Player Board. Keep track of Energy and Experience Points by moving the tokens on your Player Board.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr(" Note: During the game, you can never have more than 12 or less than 0 Energy or Experience Points. If you would ever gain Energy or Experience Points that would cause you to have more than 12 or less than 0, leave the token on 12 or 0 respectively. ")
                color: Palette.silverChalice
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<b><u>Glory Token</u></b><br> Place it on the “1” space of the Game Board. Keep track of your Glory Points by moving the token along the Glory Track around the Game Board. You cannot have less than 1 Glory Point. Whenever your Glory Token completes a lap around the Glory Track, use the “+100 / +200 Glory Points” markers to keep track of your total amount of Glory Points.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<b><u>Encounter Token</u></b><br> Place this on your Champion Card.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<b><u>Your units</u></b><br> The area of your Player Board showing the illustration of your Guild Banner is referred to as your constructed unit space and is where you place all of your constructed units.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            RowLayout {
                width: root.width
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                spacing: 12
                Image {
                    id: heroIcon
                    source: "qrc:/images/game_setup/hero.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 18
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    // this color icon troop with white color.
                    ColorOverlay {
                        anchors.fill: heroIcon
                        source: heroIcon
                        color: Palette.white
                    }
                }

                Label {
                    text: qsTr("- <b><u>1 Champion</u></b> (the miniature corresponding to your Champion Card) Place it on your constructed unit space.")
                    color: Palette.grayNurse
                    font.pixelSize: 18
                    font.letterSpacing: 1
                    wrapMode: Text.Wrap
                    textFormat: Text.RichText
                    lineHeight: 1.1

                    Layout.fillWidth: true
                }
            }
            RowLayout {
                width: root.width
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                spacing: 12
                Image {
                    id: troopIcon
                    source: "qrc:/images/game_setup/icon_troop.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 18
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    // this color icon troop with white color.
                    ColorOverlay {
                        anchors.fill: troopIcon
                        source: troopIcon
                        color: Palette.white
                    }
                }

                Label {
                    text: qsTr("- <b><u>8 Troops</u></b><br> Place 2 on your constructed unit space, and keep the other 6 next to your Player Board.")
                    color: Palette.grayNurse
                    font.pixelSize: 18
                    font.letterSpacing: 1
                    wrapMode: Text.Wrap
                    textFormat: Text.RichText
                    lineHeight: 1.1

                    Layout.fillWidth: true
                }
            }
            RowLayout {
                width: root.width
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                spacing: 12
                Image {
                    id: golemIcon
                    source: "qrc:/images/game_setup/icon_golem.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 18
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    // this color icon troop with white color.
                    ColorOverlay {
                        anchors.fill: golemIcon
                        source: golemIcon
                        color: Palette.white
                    }
                }

                Label {
                    text: qsTr("- <b><u>4 Golems</u></b><br> Place 1 on your constructed unit space, and keep the other 3 next to your Player Board.")
                    color: Palette.grayNurse
                    font.pixelSize: 18
                    font.letterSpacing: 1
                    wrapMode: Text.Wrap
                    textFormat: Text.RichText
                    lineHeight: 1.1

                    Layout.fillWidth: true
                }
            }
            RowLayout {
                width: root.width
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                spacing: 12
                Image {
                    id: fortificationIcon
                    source: "qrc:/images/game_setup/fortification.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 18
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    // this color icon troop with white color.
                    ColorOverlay {
                        anchors.fill: fortificationIcon
                        source: fortificationIcon
                        color: Palette.white
                    }
                }

                Label {
                    text: qsTr("- <b><u>4 Fortifications</u></b><br> Keep all 4 next to your Player Board.")
                    color: Palette.grayNurse
                    font.pixelSize: 18
                    font.letterSpacing: 1
                    wrapMode: Text.Wrap
                    textFormat: Text.RichText
                    lineHeight: 1.1

                    Layout.fillWidth: true
                }
            }

            Label {
                text: qsTr("<b><u>13 Colored Rings</u></b><br> Attach these onto the base of all your miniatures, matching your Guild’s color.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20
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
            Image {
                source: "qrc:/images/game_setup/d10.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.width: width

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">10</strong> ∙ Shuffle the Artefact Tokens and give each player one of them at random.<br>Players place their Artefacts in front of them with the charged side (bright side) face up. With fewer than 5 players, return any unused Player Boards, tokens, and units back into the box.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("The Artefacts show the order of play: the player with Artefact “I” goes first, and the other players follow according to the Roman Numeral on their Artefact.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.topMargin: 10
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20
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
            Image {
                source: "qrc:/images/game_setup/d11.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.width: width

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }
            Label {
                text: qsTr("<strong style=\"font-size: 57px;\">11</strong> ∙ In reverse order of play (i.e. from the last player to the first), each player chooses an Island without a Champion and places their own Champion Miniature on one of the Island’s three regions. After placing your Champion, place your Encounter Token on any other Island of your choice, in the appropriate space. At any time, there can be any number of Encounter Tokens in the appropriate space of an Island.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                wrapMode: Text.Wrap
                textFormat: Text.RichText
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("<strong style=\"color:#FFEDF5;\">In a 2-player game:</strong><br> You cannot place your Champion in a region containing a Mirage Token. After both players have placed their Champions, remove the 3 Mirage Tokens belonging to the Islands where no Champion has been placed.")
                color: Palette.grayNurse
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
}

