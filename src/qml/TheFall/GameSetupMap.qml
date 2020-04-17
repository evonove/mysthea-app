import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import MystheaUniverse.Components 1.0

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
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.topMargin: 16
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: imgBlockA.height
                Image {
                    id: imgBlockA
                    source: "qrc:/assets/images/game_setup/thefall/gameboard.jpg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width
                }
            }
            Item {
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.topMargin: 16
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: imgBlockB.height
                Image {
                    id: imgBlockB
                    source: "qrc:/assets/images/game_setup/thefall/eventboard_setup-general.jpg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width
                }
            }
            Item {
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.topMargin: 16
                Layout.bottomMargin: 20
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: imgBlockC.height
                Image {
                    id: imgBlockC
                    source: "qrc:/assets/images/game_setup/thefall/player_setup-general.jpg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width
                }
            }
        }
    }
}


