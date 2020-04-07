import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.14

import MystheaUniverse.Theme 1.0
import Mysthea.Models 1.0

Pane {
    id: root
    topPadding: 24
    bottomPadding: 24
    leftPadding: 20
    rightPadding: 20
    background: null

    property string code
    property int type
    property string typeText
    property int command
    property string commandText
    property string image
    property string backImage
    property string description

    Flickable {
        anchors.fill: parent
        contentHeight: _layout.height + _frontImageLoader.height + _backImageLoader.height + 48
        contentWidth: parent.width

        ColumnLayout {
            id: _layout
            width: parent.width
            spacing: 8

            RowLayout {
                Layout.fillWidth: true
                spacing: 14
                Label {
                    text: code
                    font.family: "Futura PT Bold"
                    font.pixelSize: 25
                    font.letterSpacing: 0.38
                    color: {
                        switch (root.command) {
                        case 1:
                            return Palette.flamingo
                        case 2:
                            return Palette.goldenFizz
                        case 3:
                            return Palette.apple
                        case 4:
                            return Palette.cerulean
                        default:
                            return Palette.grayNurse
                        }
                    }
                }

                Label {
                    font.pixelSize: 25
                    font.letterSpacing: 0.38
                    font.capitalization: Font.AllUppercase

                    text: {
                        if (root.command !== -1) {
                            return qsTr("Command")
                        } else {
                            return typeText
                        }
                    }
                    color: Palette.white
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 5
                // Era text must only be visible for Command cards
                visible: root.type >= 1 && root.type <= 4
                Label {
                    text: qsTr("Era")
                    font.pixelSize: 18
                    color: Palette.white
                }

                Image {
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 16
                    source: {
                        switch (root.type) {
                        case 1:
                            return "qrc:/assets/icons/era_x.svg"
                        case 2:
                            return "qrc:/assets/icons/era_1.svg"
                        case 3:
                            return "qrc:/assets/icons/era_2.svg"
                        case 4:
                            return "qrc:/assets/icons/era_3.svg"
                        default:
                            return ""
                        }
                    }

                    Layout.rightMargin: 14
                }

                Image {
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 20
                    source: {
                        switch (root.command) {
                        case 1:
                            return "qrc:/assets/icons/tactic.svg"
                        case 2:
                            return "qrc:/assets/icons/objective.svg"
                        case 3:
                            return "qrc:/assets/icons/accessory.svg"
                        case 4:
                            return "qrc:/assets/icons/upgrade.svg"
                        default:
                            return ""
                        }
                    }
                }

                Label {
                    text: root.commandText
                    font.pixelSize: 18
                    color: Palette.white
                }
            }

            Label {
                text: description
                font.family: "Futura PT Book"
                font.pixelSize: 18
                color: Palette.white
                wrapMode: Text.Wrap

                Layout.fillWidth: true
                Layout.topMargin: 15
            }
        }

        // Card's image, Attunements and Encounters are rotated since they're stored
        // vertically but should be read horizontally
        Loader {
            id: _frontImageLoader
            anchors.top: _layout.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            asynchronous: true
            width: 225
            height: 332

            sourceComponent: Component {
                Rectangle {
                    color: _cardImage.status === Image.Ready ? "transparent" : "dimgray"
                    opacity: _cardImage.status === Image.Ready ? 1 : 0.5
                    radius: 5

                    Image {
                        id: _cardImage
                        anchors.fill: parent
                        visible: false
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/assets/images/cards/" + root.image

                        property list<QtObject> rotationTransform: [
                            // Rotates image 90 degrees clockwise, then moves it to the right
                            Rotation {
                                origin.x: 0
                                origin.y: 0
                                angle: 90
                            },
                            Translate {
                                x: height
                            }
                        ]


                        transform: root.type === 6
                                   || root.type === 7 ? rotationTransform : []
                    }

                    OpacityMask {
                        anchors.fill: _cardImage
                        source: _cardImage
                        maskSource: Rectangle {
                            width: _cardImage.width
                            height: _cardImage.height
                            radius: 5
                        }
                    }
                }
            }
        }

        // Encounter cards are front and back so we must show both
        Loader {
            id: _backImageLoader
            anchors.top: _frontImageLoader.bottom
            anchors.topMargin: 24
            anchors.horizontalCenter: parent.horizontalCenter
            active: root.backImage.length > 0
            asynchronous: true
            width: 225
//            height: 332
            height: active ? 332 : 0

            sourceComponent: Component {
                Rectangle {
                    color: _backImage.status === Image.Ready ? "transparent" : "dimgray"
                    opacity: _backImage.status === Image.Ready ? 1 : 0.5
                    radius: 5
                    Image {
                        id: _backImage
                        anchors.fill: parent
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/assets/images/cards/" + root.backImage
                        visible: false

                        transform: [
                            // Rotates image 90 degrees clockwise, then moves it to the right
                            Rotation {
                                origin.x: 0
                                origin.y: 0
                                angle: 90
                            },
                            Translate {
                                x: _layout.width
                                y: width - height
                            }
                        ]
                    }
                    OpacityMask {
                        anchors.fill: _backImage
                        source: _backImage
                        maskSource: Rectangle {
                            width: _backImage.width
                            height: _backImage.height
                            radius: 5
                        }
                    }
                }
            }
        }
    }
}
