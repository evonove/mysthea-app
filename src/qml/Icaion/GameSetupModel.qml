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
                source: "qrc:/assets/images/game_setup/icaion/setup01.jpg"
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
                otherText: qsTr("Place the Game Board and the Event Board in the center of the table, one next to the other")
                color: Palette.icaionLight
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
                text: qsTr("Flip the Event Board to the side corresponding to the number of players. Place all Qoam crystals and Parasites in a common pool near the Event Board.")
                color: Palette.icaionLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.topMargin: 10
            }
            Label {
                text: qsTr("<strong>Note:</strong> Consider Qoam crystals and Parasites miniatures as infinite. In the rare case that a specific component supply is depleted, use other components as a temporary replacement.")
                color: Palette.icaionLight
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

            RoundedImage {
                source: "qrc:/assets/images/game_setup/icaion/setup01b.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
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
                source: "qrc:/assets/images/game_setup/icaion/setup02.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "2"
                otherText: qsTr("Place the Colossus on a random crater of the Game Board. Place 1 Parasite on each region adjacent to the Colossus’ crater.")
                color: Palette.icaionLight
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
                text: qsTr("<strong>2-3 players -</strong> Matching the colors of both crystals and Regions, place 1 Qoam on each of the ten external Regions and 2 Qoam on each of the five internal Regions (those adjacent to the City). ")
                color: Palette.icaionLight
                font.pixelSize: 14
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.topMargin: 10
            }
            Label {
                text: qsTr("<strong>4-5 players -</strong> Matching the colors of both crystals and Regions, place 2 Qoam on each Region of the Game Board. Then, place 1 Parasite on each of the five internal Regions.")
                color: Palette.icaionLight
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
                text: qsTr("<strong>Note:</strong> Regions can only hold Qoam of the corresponding color (see p.18 of the rulebook).")
                color: Palette.icaionLight
                font.pixelSize: 14
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
                source: "qrc:/assets/images/game_setup/icaion/setup03.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "3"
                otherText: qsTr("Shuffle the Colossus’ Primal Shards without looking at their values.")
                color: Palette.icaionLight
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
                source: "qrc:/assets/images/game_setup/icaion/setup04.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "4"
                otherText: qsTr("4 Shuffle the five Region Cards and place them face down in the appropriate space on the Event Board")
                color: Palette.icaionLight
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
                text: qsTr("Randomly place the three Colossus Cards in the Year I, Year II, and Year III spaces on the Event Board face up.")
                color: Palette.icaionLight
                font.pixelSize: 14
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
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
                source: "qrc:/assets/images/game_setup/icaion/setup05.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "5"
                otherText: qsTr("Take all 15 Apparatus Tiles. Sort them by color into 5 piles of three tiles each. Decide whether to play with piles on their Day side, their Night Side, or a mix of both. A pile may only contain tiles showing the same side. Tiles with the Roman numeral “III” are put at the bottom of each pile, while “I” at the top. Then place a pile on each City slot, all with the Roman numeral “I” visible.")
                color: Palette.icaionLight
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
                source: "qrc:/assets/images/game_setup/icaion/setup06.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "6"
                otherText: qsTr("Each player chooses a color and takes their respective Division Board, Reputation Marker, colored base ring, and 9 Machines (3 Harvesters, 3 Scavengers, 3 Refiners). Keep the Division Board in front of you and place the Machines as shown in the figure:")
                color: Palette.icaionLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

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
                    id: harvesterIcon
                    source: "qrc:/assets/images/game_setup/icaion/icon_harvester.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 18
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    ColorOverlay {
                        anchors.fill: harvesterIcon
                        source: harvesterIcon
                        color: Palette.white
                    }
                }

                Label {
                    text: qsTr("<b><u>Harvesters</u></b>")
                    color: Palette.icaionLight
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
                    id: scavengerIcon
                    source: "qrc:/assets/images/game_setup/icaion/icon_scavenger.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 18
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    ColorOverlay {
                        anchors.fill: harvesterIcon
                        source: harvesterIcon
                        color: Palette.white
                    }
                }

                Label {
                    text: qsTr("<b><u>Scavengers</u></b>")
                    color: Palette.icaionLight
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
                    id: refinersIcon
                    source: "qrc:/assets/images/game_setup/icaion/icon_refiners.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 18
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    ColorOverlay {
                        anchors.fill: refinersIcon
                        source: refinersIcon
                        color: Palette.white
                    }
                }

                Label {
                    text: qsTr("<b><u>Refiners</u></b>")
                    color: Palette.icaionLight
                    font.pixelSize: 18
                    font.letterSpacing: 1
                    wrapMode: Text.Wrap
                    textFormat: Text.RichText
                    lineHeight: 1.1

                    Layout.fillWidth: true
                }
            }
            Label {
                text: qsTr("<strong>2 players -</strong> Each player then takes turns placing 1 Machine at a time of a third, non-player color in any Region on the board until all 3 Machines of each type have been placed.")
                color: Palette.icaionLight
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
                text: qsTr("<strong>3 players -</strong> Each player then takes turns placing 1 Machine at a time of a fourth, non-player color in any Region on the board until 2 Machines of each type have been placed.")

                color: Palette.icaionLight
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
                text: qsTr("<strong>4 players -</strong> Players then place 1 Machine at a time of the fifth, non-player color in any Region on the board until 1 Machine of each type has been placed.")

                color: Palette.icaionLight
                font.pixelSize: 14
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 10
            }
            Label {
                text: qsTr("<strong>Note:</strong> There is a limit of 3 Machines for each Region. All Machines in the same Region must be different both in color and type.")

                color: Palette.icaionLight
                font.pixelSize: 14
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
        contentHeight: step7.height
        ColumnLayout {
            id: step7
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/icaion/setup07.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "7"
                otherText: qsTr("Randomly deal to each player a Seeker Card and a Specialized Gear Card. Each player takes the corresponding miniature and attaches the colored ring to its base. Keep your character’s cards next to your Division Board.")
                color: Palette.icaionLight
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
                text: qsTr("The number of icons on your Seeker and Specialized Gear Cards determines your card-limits and resources.")
                color: Palette.icaionLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 10
            }
            RowLayout {
                width: root.width
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                spacing: 12
                Image {
                    id: maximumHandsIcon
                    source: "qrc:/assets/images/game_setup/icaion/icon_max_hands.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 18
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    ColorOverlay {
                        anchors.fill: refinersIcon
                        source: refinersIcon
                        color: Palette.white
                    }
                }

                Label {
                    text: qsTr(" = Maximum hand size")
                    color: Palette.icaionLight
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
                    id: maximumUpgradeIcon
                    source: "qrc:/assets/images/game_setup/icaion/icon_max_curio_upgrades.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: 18
                    Layout.alignment: Qt.AlignTop
                    Layout.fillWidth: true
                    ColorOverlay {
                        anchors.fill: refinersIcon
                        source: refinersIcon
                        color: Palette.white
                    }
                }

                Label {
                    text: qsTr("= Maximum number of Upgrade Curio Cards X that you have in play at the same time.")
                    color: Palette.icaionLight
                    font.pixelSize: 18
                    font.letterSpacing: 1
                    wrapMode: Text.Wrap
                    textFormat: Text.RichText
                    lineHeight: 1.1

                    Layout.fillWidth: true
                }
            }
            RoundedImage {
                source: "qrc:/assets/images/game_setup/icaion/setup07b.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            Label {
                text: qsTr("= Number of starting Qoam crystals. Take from the supply as many Qoam crystals as shown on your character’s cards. Place these resources on one of the Null Cage slots initially available (those with no Machines on them).")
                color: Palette.icaionLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 10
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
                source: "qrc:/assets/images/game_setup/icaion/setup08.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "8"
                otherText: qsTr("Take as many Emergency Power Supply tiles as the number of players, following the Roman numerals from I to V. Randomly deal one to each player.")
                color: Palette.icaionLight
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
                text: qsTr("Roman numerals from I to V. Randomly deal one to each player. Keep the Emergency Power Supply tile on your Player Board, flipped on its “Charged” side. Emergency Power Supply tiles determine the order of play. The first player is whoever possesses tile number “I”; the other players follow according to the numeration.")
                color: Palette.icaionLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 10
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
                source: "qrc:/assets/images/game_setup/icaion/setup09.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "9"
                otherText: qsTr("Each player places their Reputation Marker on the scoring track, in the space labeled “0”")
                color: Palette.icaionLight
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
        contentHeight: step10.height
        ColumnLayout {
            id: step10
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/icaion/setup10.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "10"
                otherText: qsTr("Shuffle all Curio Cards, then place the deck face down onto the Event Board. Deal each player three cards from the Curio Deck. Curio Cards are kept hidden from the other players.")
                color: Palette.icaionLight
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
                text: qsTr("<strong>Note:</strong> If the Curio Deck is depleted, shuffle all discarded cards to form a new deck.")
                color: Palette.icaionLight
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
        contentHeight: step11.height
        ColumnLayout {
            id: step11
            width: parent.width
            spacing: 20
            RoundedImage {
                source: "qrc:/assets/images/game_setup/icaion/setup11.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }
            DropCapLabel {
                dropLetter: "11"
                otherText: qsTr("In reverse order of play (i.e. from the last player to the first), each player chooses one of the five external nodes shown below to place their Seeker miniature on. Players cannot choose a node already occupied by an opponent.")
                color: Palette.icaionLight
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
}

