import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import Mysthea.Components 1.0

Page {
    id: root
    spacing: 8

    signal stepClicked(int step)

    background: null
    Flickable {
        anchors.fill: parent
        contentWidth: content.width
        contentHeight: content.height
        clip: true

        ScrollIndicator.vertical: ScrollIndicator {
        }

        ColumnLayout {
            id: content
            width: root.width
            Item {
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.topMargin: 16
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: img.height
                Image {
                    id: img
//                    anchors.fill: parent
                    source: "qrc:/images/game_setup/blocco1_a.png"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width
                }
                 RoundButton {
                     anchors.left: img.left
                     text: "1"
                     sourceItem: img
                     containerY: img.y
                 }
            }

            Image {
                source: "qrc:/images/game_setup/blocco1_b.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.width: width
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.fillWidth: true
            }
//            Image {
//                source: "qrc:/images/game_setup/blocco1_c.png"
//                fillMode: Image.PreserveAspectFit
//                sourceSize.width: width
//                Layout.leftMargin: 20
//                Layout.rightMargin: 20
//                Layout.bottomMargin: 20
//                Layout.fillWidth: true
//            }
        }
    }
}
