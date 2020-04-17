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

            RowLayout {
                spacing: 14
                Layout.fillWidth: true
                Label {
                    text: cards.code
                    font.family: "Futura PT Bold"
                    font.pixelSize: 25
                    color: Palette.white
                }

                Label {
                    font.pixelSize: 25
                    font.capitalization: Font.AllUppercase
                    text: cards.typeText

                    color: Palette.white
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 5
                Label {
                    text: cards.name
                    font.pixelSize: 18
                    color: Palette.white
                }
            }

            Loader {
                id: _frontCardLoader
                Layout.fillWidth: false
                Layout.fillHeight: false
                Layout.topMargin: 27
                Layout.preferredHeight: 334
                Layout.preferredWidth: 225
                Layout.alignment: Qt.AlignHCenter

                sourceComponent: MystheaUniverse.RoundedImage {
                    source: "qrc:/assets/images/cards/" + cards.image
                    fillMode: Image.PreserveAspectFit
                    borderRadius: 5
                    borderWidth: 0
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
        }
    }
}
