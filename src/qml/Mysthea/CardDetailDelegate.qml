import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.14

import MystheaUniverse.Components 1.0 as MUComponents
import MystheaUniverse.Theme 1.0
import Mysthea.Models 1.0

MUComponents.CardDetailDelegate {
    id: root

    Flickable {
        anchors.fill: parent
        contentHeight: _layout.height
        contentWidth: parent.width

        ColumnLayout {
            id: _layout
            width: parent.width
            spacing: 8

            RowLayout {
                spacing: 14
                Layout.fillWidth: true

                Label {
                    font.pixelSize: 25
                    font.letterSpacing: 0.38
                    font.capitalization: Font.AllUppercase
                    color: Palette.white
                    textFormat: Text.RichText

                    text: {
                        const start = cards.code
                        const textColor = root.commandComboBoxModel.color(cards.command)
                        const end = cards.command !== -1 ? qsTr("Command") : cards.typeText
                        return "<span style='font-family: FuturaPTBold; color: " + textColor + ";'>" + start + "</span>  " + end
                    }
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 5
                // Era text must only be visible for Command cards
                visible: cards.command !== -1
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
                font.family: "FuturaPTBook"
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

                sourceComponent: MUComponents.RoundedImage {
                    source: "qrc:/assets/images/cards/" + cards.image
                    fillMode: Image.PreserveAspectFit
                    borderRadius: 5
                    borderWidth: 0
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

                sourceComponent: Item {
                    id: _backCardItem
                    anchors.fill: parent
                    MUComponents.RoundedImage {
                        source: "qrc:/assets/images/cards/" + cards.backImage
                        fillMode: Image.PreserveAspectFit
                        borderRadius: 5
                        borderWidth: 0
                    }
                }
            }
        }
    }
}
