import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import Mysthea.Theme 1.0
import Mysthea.Models 1.0

Pane {
    id: root
    topPadding: 24
    bottomPadding: 24
    leftPadding: 20
    rightPadding: 20
    background: null

    property bool activeInSwipe: false

    BusyIndicator {
        anchors.centerIn: parent
        running: !loader.visible
    }

    //Since DetailDelegate is used in a Repeater it can access to its CardsModel. So we use CardsModel's roles
    //to access a card data.
    Loader {
        id: loader
        anchors.fill: parent
        asynchronous: true
        active: activeInSwipe
        visible: status === Loader.Ready
        sourceComponent: content
    }

    Component {
        id: content
        Flickable {
            anchors.fill: parent
            contentHeight: _layout.height
            contentWidth: parent.width

            ColumnLayout {
                id: _layout
                width: parent.width
                spacing: 24
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12
                        Label {
                            text: code
                            font.pixelSize: 32
                            font.letterSpacing: 0.5
                            font.weight: Font.Bold
                            color: {
                                if (command === 1) {
                                    return Palette.flamingo
                                } else if (command === 2) {
                                    return Palette.goldenFizz
                                } else if (command === 3) {
                                    return Palette.apple
                                } else if (command === 4) {
                                    return Palette.cerulean
                                } else {
                                    return Palette.grayNurse
                                }
                            }
                        }

                        Label {
                            text: "•"
                            font.pixelSize: 24
                            color: Palette.grayNurse
                        }

                        Label {
                            font.pixelSize: 32
                            font.letterSpacing: 0.5

                            text: {
                                if (command !== -1) {
                                    return qsTr("Command")
                                } else {
                                    return typeText
                                }
                            }
                            color: Palette.grayNurse
                        }
                    }
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 12
                        // Era text must only be visible for Command cards
                        visible: type >= 1 && type <= 4

                        Label {
                            text: qsTr("Era")
                            font.pixelSize: 24
                            font.letterSpacing: 0.5
                            font.weight: Font.Bold
                            color: Palette.grayNurse
                        }

                        Image {
                            fillMode: Image.PreserveAspectFit
                            sourceSize.height: 24
                            source: {
                                if (type === 1) {
                                    return "qrc:/assets/icons/era_x.svg"
                                } else if (type === 2) {
                                    return "qrc:/assets/icons/era_1.svg"
                                } else if (type === 3) {
                                    return "qrc:/assets/icons/era_2.svg"
                                } else if (type === 4) {
                                    return "qrc:/assets/icons/era_3.svg"
                                } else {
                                    return ""
                                }
                            }
                        }

                        Label {
                            text: "•"
                            font.pixelSize: 24
                            color: Palette.grayNurse
                        }

                        Image {
                            fillMode: Image.PreserveAspectFit
                            sourceSize.height: 24
                            source: {
                                if (command === 1) {
                                    return "qrc:/assets/icons/tactic.svg"
                                } else if (command === 2) {
                                    return "qrc:/assets/icons/objective.svg"
                                } else if (command === 3) {
                                    return "qrc:/assets/icons/accessory.svg"
                                } else if (command === 4) {
                                    return "qrc:/assets/icons/upgrade.svg"
                                } else {
                                    return ""
                                }
                            }
                        }

                        Label {
                            text: commandText
                            font.pixelSize: 24
                            font.letterSpacing: 0.5
                            font.weight: Font.Bold
                            color: Palette.grayNurse
                        }
                    }
                }

                Label {
                    text: description
                    font.pixelSize: 24
                    font.letterSpacing: 0.5
                    color: Palette.grayNurse
                    wrapMode: Text.Wrap

                    Layout.maximumWidth: parent.width
                }

                // Card's image, Attunements and Encounters are rotated since they're stored
                // vertically but should be read horizontally
                Image {
                    id: _cardImage
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/cards/" + image
                    sourceSize.width: type === 6 || type === 7 ? 0 : width
                    sourceSize.height: type === 6 || type === 7 ? parent.width : 0

                    property list<QtObject> rotationTransform: [
                        // Rotates image 90 degrees clockwise, then moves it to the right
                        Rotation { origin.x: 0; origin.y: 0; angle: 90 },
                        Translate { x: width }
                    ]

                    transform: type === 6 || type === 7 ? rotationTransform : []

                    Layout.maximumWidth: parent.width
                }

                // Encounter cards are front and back so we must show both
                Loader {
                    id: _backImageLoader
                    active: backImage.length > 0

                    sourceComponent: Component {
                        Image {
                            fillMode: Image.PreserveAspectFit
                            source: "qrc:/images/cards/" + backImage
                            sourceSize.height: _layout.width

                            transform: [
                                // Rotates image 90 degrees clockwise, then moves it to the right
                                Rotation { origin.x: 0; origin.y: 0; angle: 90 },
                                Translate { x: _layout.width; y: width - height }
                            ]
                        }
                    }
                }
            }
        }
    }
}
