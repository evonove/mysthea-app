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
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 110
                    anchors.verticalCenterOffset: 0
                    text: "1"
                    onClicked: root.stepClicked(1)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: -105
                    anchors.verticalCenterOffset: -35
                    text: "2"
                    onClicked: root.stepClicked(2)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: -45
                    anchors.verticalCenterOffset: 40
                    text: "3"
                    onClicked: root.stepClicked(3)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: -10
                    anchors.verticalCenterOffset: 110
                    text: "5"
                    onClicked: root.stepClicked(5)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 35
                    anchors.verticalCenterOffset: 50
                    text: "6"
                    onClicked: root.stepClicked(6)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 70
                    anchors.verticalCenterOffset: 105
                    text: "7"
                    onClicked: root.stepClicked(7)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 10
                    anchors.verticalCenterOffset: -50
                    text: "8"
                    onClicked: root.stepClicked(8)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: -110
                    anchors.verticalCenterOffset: 100
                    text: "10"
                    onClicked: root.stepClicked(10)
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
                RoundButton {
                    anchors.verticalCenter: imgBlockB.verticalCenter
                    anchors.horizontalCenter: imgBlockB.horizontalCenter
                    anchors.horizontalCenterOffset: 60
                    anchors.verticalCenterOffset: 40
                    text: "4"
                    onClicked: root.stepClicked(4)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockB.verticalCenter
                    anchors.horizontalCenter: imgBlockB.horizontalCenter
                    anchors.horizontalCenterOffset: -90
                    anchors.verticalCenterOffset: -10
                    text: "11"
                    onClicked: root.stepClicked(11)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockB.verticalCenter
                    anchors.horizontalCenter: imgBlockB.horizontalCenter
                    anchors.horizontalCenterOffset: 90
                    anchors.verticalCenterOffset: -50
                    text: "12"
                    onClicked: root.stepClicked(12)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockB.verticalCenter
                    anchors.horizontalCenter: imgBlockB.horizontalCenter
                    anchors.horizontalCenterOffset: -20
                    anchors.verticalCenterOffset: 10
                    text: "13"
                    onClicked: root.stepClicked(13)
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
                RoundButton {
                    anchors.verticalCenter: imgBlockC.verticalCenter
                    anchors.horizontalCenter: imgBlockC.horizontalCenter
                    anchors.horizontalCenterOffset: -120
                    anchors.verticalCenterOffset: 20
                    text: "9"
                    onClicked: root.stepClicked(9)
                }
            }
        }
    }
}


