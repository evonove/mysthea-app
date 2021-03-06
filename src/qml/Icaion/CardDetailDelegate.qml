import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.14

import MystheaUniverse.Components 1.0 as MystheaUniverse
import MystheaUniverse.Theme 1.0
import Mysthea.Models 1.0

MystheaUniverse.CardDetailDelegate {
    id: root

    Flickable {
        anchors.fill: parent
        contentHeight: _layout.height
        contentWidth: parent.width

        ColumnLayout {
            id: _layout
            width: parent.width
            spacing: 8

            Label {
                text: "<span style='font-family: FuturaPTBold'>" + cards.code
                      + "</span>    " + cards.typeText
                font.pixelSize: 25
                font.capitalization: Font.AllUppercase
                textFormat: Text.RichText
                wrapMode: Text.Wrap

                color: Palette.white
                Layout.fillWidth: true
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 5
                Label {
                    text: cards.command !== -1 ? cards.commandText : cards.name
                    font.pixelSize: 18
                    color: Palette.white
                }

                Label {
                    visible: cards.command !== -1
                    text: cards.typeText
                    font.pixelSize: 18
                    color: Palette.white
                }
            }

            Label {
                visible: cards.description !== ""
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

                transform: cards.type === 2
                           || cards.type === 3 ? rotationTransform : []

                sourceComponent: MystheaUniverse.RoundedImage {
                    source: "qrc:/assets/images/cards/" + cards.image
                    fillMode: Image.PreserveAspectFit
                    borderRadius: 5
                    borderWidth: 0
                }
            }
        }
    }
}
