import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
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

    property CommandComboBoxModel commandComboBoxModel: null
    property TypeComboBoxModel typeComboBoxModel: null

    property var cards: null

    Flickable {
        anchors.fill: parent
        contentHeight: _layout.height
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
                    color: root.commandComboBoxModel.color(cards.command)
                }

                Label {
                    font.pixelSize: 25
                    font.letterSpacing: 0.38
                    font.capitalization: Font.AllUppercase

                    text: {
                        if (cards.command !== -1) {
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
                visible: cards.type >= 1 && cards.type <= 4
                Label {
                    text: qsTr("Era")
                    font.pixelSize: 18
                    color: Palette.white
                }

                Image {
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 16
                    source: root.typeComboBoxModel.iconUrl(cards.type)

                    Layout.rightMargin: 14
                }

                Image {
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 20
                    source: root.commandComboBoxModel.iconUrl(cards.command)
                }

                Label {
                    text: cards.commandText
                    font.pixelSize: 18
                    color: Palette.white
                }
            }

            Label {
                text: cards.description
                font.family: "Futura PT Book"
                font.pixelSize: 18
                color: Palette.white
                wrapMode: Text.Wrap

                Layout.fillWidth: true
                Layout.topMargin: 15
            }

            Loader {
                id: _frontCardLoader
                Layout.fillWidth: false
                Layout.fillHeight: false
                Layout.topMargin: 27
                Layout.preferredHeight: 334
                Layout.preferredWidth: 225
                Layout.alignment: Qt.AlignHCenter

                Rectangle {
                    anchors.fill: parent
                    border.color: "red"
                    color: "transparent"
                }

                sourceComponent: Item {
                    id: _frontCardItem
                    anchors.fill: parent

                    Rectangle {
                        anchors.fill: parent

                        color: _frontCardImage.status === Image.Ready ? "transparent" : "dimgray"
                        opacity: _frontCardImage.status === Image.Ready ? 1 : 0.5
                        radius: 5

                        property list<QtObject> rotationTransform: [
                            // Rotates image 90 degrees clockwise, then moves it to the right
                            Rotation {
                                origin.x: 0
                                origin.y: 0
                                angle: 90
                            },
                            Translate {
                                x: 334 - 6 - topPadding - bottomPadding
                            }
                        ]

                        transform: cards.type === 6
                                   || cards.type === 7 ? rotationTransform : []

                        Image {
                            id: _frontCardImage
                            anchors.fill: parent
                            visible: false
                            fillMode: Image.PreserveAspectFit
                            asynchronous: true
                            source: "qrc:/assets/images/cards/" + cards.image

                            rotation: 90
                        }

                        OpacityMask {
                            anchors.fill: _frontCardImage
                            source: _frontCardImage
                            maskSource: Rectangle {
                                width: _frontCardImage.width
                                height: _frontCardImage.height
                                radius: 5
                            }
                        }
                    }
                }
            }

            Loader {
                id: _backCardLoader
                active: cards.backImage.length > 0
                Layout.fillWidth: false
                Layout.fillHeight: false
                Layout.preferredHeight: _backCardLoader.active ? 334 : 0
                Layout.preferredWidth: _backCardLoader.active ? 225 : 0
                Layout.alignment: Qt.AlignHCenter

                Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    border.color: "red"
                }

                sourceComponent: Item {
                    id: _backCardItem
                    anchors.fill: parent

                    Rectangle {
                        id: _backRect
                        anchors.fill: parent

                        color: _backCardImage.status === Image.Ready ? "transparent" : "dimgray"
                        opacity: _backCardImage.status === Image.Ready ? 1 : 0.5
                        radius: 5

                        transform: [
                            // Rotates image 90 degrees clockwise, then moves it to the right
                            Rotation {
                                origin.x: 0
                                origin.y: 0
                                angle: 90
                            },
                            Translate {
                                x: 334 - 6 - topPadding - bottomPadding
                            }
                        ]

                        Image {
                            id: _backCardImage
                            anchors.fill: parent
                            visible: false
                            fillMode: Image.PreserveAspectFit
                            source: "qrc:/assets/images/cards/" + cards.backImage
                            asynchronous: true
                        }

                        OpacityMask {
                            anchors.fill: _backCardImage
                            source: _backCardImage
                            maskSource: Rectangle {
                                width: _backCardImage.width
                                height: _backCardImage.height
                                radius: 5
                            }
                        }
                    }
                }
            }
        }
    }
}