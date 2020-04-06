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
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.topMargin: 16
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: imgBlockA.height
                RoundedImage {
                    id: imgBlockA
                    source: "qrc:/images/game_setup/blocco1_a.png"
                    fillMode: Image.PreserveAspectFit
                    width: parent.width
                    height: 100
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 60
                    text: "1"
                    onClicked: root.stepClicked(1)
                }
                RoundButton {
                    anchors.right: imgBlockA.right
                    anchors.rightMargin: 50
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.verticalCenterOffset: -100
                    text: "4"
                    onClicked: root.stepClicked(4)
                }
                RoundButton {
                    anchors.left: imgBlockA.left
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.verticalCenterOffset: 20
                    text: "5"
                    onClicked: root.stepClicked(5)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.verticalCenterOffset: -10
                    anchors.horizontalCenterOffset: -20
                    text: "11"
                    onClicked: root.stepClicked(11)
                }
            }
            Item {
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.topMargin: 16
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: imgBlockB.height
                Image {
                    id: imgBlockB
                    source: "qrc:/images/game_setup/blocco1_b.png"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width

                    RoundButton {
                        anchors.verticalCenter: imgBlockB.verticalCenter
                        anchors.right: imgBlockB.right
                        text: "2"
                        onClicked: root.stepClicked(2)
                    }
                    RoundButton {
                        anchors.left: imgBlockB.left
                        anchors.leftMargin: 20
                        anchors.verticalCenter: imgBlockB.verticalCenter
                        anchors.verticalCenterOffset: -20

                        text: "3"
                        onClicked: root.stepClicked(3)
                    }
                    RoundButton {
                        anchors.verticalCenter: imgBlockB.verticalCenter
                        anchors.horizontalCenter: imgBlockB.horizontalCenter
                        anchors.horizontalCenterOffset: 70
                        anchors.verticalCenterOffset: -10
                        text: "6"
                        onClicked: root.stepClicked(6)
                    }
                }
            }
            Item {
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.topMargin: 16
                Layout.bottomMargin: 20
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: imgBlockC.height
                Image {
                    id: imgBlockC
                    source: "qrc:/images/game_setup/blocco1_c.png"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width

                    RoundButton {
                        anchors.bottom: imgBlockC.bottom
                        anchors.right: imgBlockC.right
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
