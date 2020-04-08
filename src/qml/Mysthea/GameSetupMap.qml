import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import MystheaUniverse.Components 1.0
import QtQuick.Controls.Material 2.12

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
                    source: "qrc:/assets/images/game_setup/mysthea/setup-map-1.jpg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 50
                    anchors.verticalCenterOffset: 30
                    text: "1"
                    onClicked: root.stepClicked(1)
                }
                RoundButton {
                    anchors.right: imgBlockA.right
                    anchors.rightMargin: 30
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.verticalCenterOffset: -90
                    text: "4"
                    onClicked: root.stepClicked(4)
                }
                RoundButton {
                    anchors.left: imgBlockA.left
                    anchors.leftMargin: -30
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.verticalCenterOffset: 20
                    text: "5"
                    onClicked: root.stepClicked(5)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.verticalCenterOffset: -50
                    anchors.horizontalCenterOffset: -40
                    text: "11"
                    onClicked: root.stepClicked(11)
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
                    source: "qrc:/assets/images/game_setup/mysthea/setup-map-2.jpg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width

                    RoundButton {
                        anchors.verticalCenter: imgBlockB.verticalCenter
                        anchors.verticalCenterOffset: -80
                        anchors.right: imgBlockB.right
                        anchors.rightMargin: -25
                        text: "2"
                        onClicked: root.stepClicked(2)
                    }
                    RoundButton {
                        anchors.left: imgBlockB.left
                        anchors.leftMargin: 20
                        anchors.verticalCenter: imgBlockB.verticalCenter
                        anchors.verticalCenterOffset: -10

                        text: "3"
                        onClicked: root.stepClicked(3)
                    }
                    RoundButton {
                        anchors.verticalCenter: imgBlockB.verticalCenter
                        anchors.horizontalCenter: imgBlockB.horizontalCenter
                        anchors.horizontalCenterOffset: 40
                        anchors.verticalCenterOffset: -10
                        text: "6"
                        onClicked: root.stepClicked(6)
                    }
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
                    source: "qrc:/assets/images/game_setup/mysthea/setup-map-3.jpg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width

                    RoundButton {
                        anchors.bottom: imgBlockC.bottom
                        anchors.right: imgBlockC.right
                        anchors.rightMargin: -10
                        text: "7"
                        onClicked: root.stepClicked(7)
                    }
                    RoundButton {
                        anchors.verticalCenter: imgBlockC.verticalCenter
                        anchors.horizontalCenter: imgBlockC.horizontalCenter
                        anchors.horizontalCenterOffset: 20
                        text: "8"
                        onClicked: root.stepClicked(8)
                    }
                    RoundButton {
                        anchors.left: imgBlockC.left
                        anchors.leftMargin: -10
                        anchors.verticalCenter: imgBlockC.verticalCenter
                        text: "9"
                        onClicked: root.stepClicked(9)
                    }
                    RoundButton {
                        anchors.right: imgBlockC.right
                        anchors.rightMargin: 30
                        text: "10"
                        onClicked: root.stepClicked(10)
                    }
                }
            }
        }
    }
}
