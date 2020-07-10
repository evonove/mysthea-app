import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQml.Models 2.14

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0
import Icaion 1.0

Page {
    id: root
    spacing: 8

    signal stepClicked(int step)

    background: null
    Flickable {
        id: _flickable
        anchors.fill: parent
        contentWidth: content.width
        contentHeight: content.height
        clip: true
        pixelAligned: true
        state: 'init'

        ScrollIndicator.vertical: ScrollIndicator {}

        states: [
            State {
                name: 'moved'
                when: _scrollButton.checked
                PropertyChanges {
                    target: _flickable
                    contentY: _presets.y - 37
                }
            }
        ]

        transitions: Transition {
            to: 'moved'
            animations: [
                NumberAnimation {
                    properties: "contentY"
                    easing.type: Easing.InOutQuad
                    duration: 400
                }
            ]
        }

        ColumnLayout {
            id: content
            width: root.width

            ItemDelegate {
                id: _scrollButton
                checkable: true
                Layout.fillWidth: true
                Layout.fillHeight: true

                contentItem: Item {
                    Text {
                        id: _text
                        anchors.centerIn: parent
                        text: qsTr("Looking for <font color='#C3DDE2'>Setup Presets</font>? Scroll to reveal")
                        font.family: "FuturaPTBold"
                        textFormat: Text.RichText
                        color: Palette.white
                    }
                    Image {
                        id: _icon
                        anchors.left: _text.right
                        anchors.leftMargin: 4
                        height: parent.height
                        source: "qrc:/assets/icons/chevron.svg"
                        sourceSize.height: 7
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Item {
                Layout.leftMargin: 40
                Layout.rightMargin: 40
                Layout.fillWidth: true
                Layout.fillHeight: true
                implicitHeight: imgBlockA.height
                Image {
                    id: imgBlockA
                    source: "qrc:/assets/images/game_setup/icaion/setup-map02.jpg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 80
                    anchors.verticalCenterOffset: -10
                    text: "1"
                    onClicked: root.stepClicked(1)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 100
                    anchors.verticalCenterOffset: 110
                    text: "2"
                    onClicked: root.stepClicked(2)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: -70
                    anchors.verticalCenterOffset: 110
                    text: "3"
                    onClicked: root.stepClicked(3)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    anchors.verticalCenterOffset: 60
                    text: "5"
                    onClicked: root.stepClicked(5)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: 100
                    anchors.verticalCenterOffset: -120
                    text: "9"
                    onClicked: root.stepClicked(9)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockA.verticalCenter
                    anchors.horizontalCenter: imgBlockA.horizontalCenter
                    anchors.horizontalCenterOffset: -100
                    anchors.verticalCenterOffset: -80
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
                    source: "qrc:/assets/images/game_setup/icaion/setup-map01.jpg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockB.verticalCenter
                    anchors.horizontalCenter: imgBlockB.horizontalCenter
                    anchors.horizontalCenterOffset: -20
                    anchors.verticalCenterOffset: 0
                    text: "4"
                    onClicked: root.stepClicked(4)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockB.verticalCenter
                    anchors.horizontalCenter: imgBlockB.horizontalCenter
                    anchors.horizontalCenterOffset: -120
                    anchors.verticalCenterOffset: 40
                    text: "10"
                    onClicked: root.stepClicked(10)
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
                    source: "qrc:/assets/images/game_setup/icaion/setup-map03.jpg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: parent.width
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockC.verticalCenter
                    anchors.horizontalCenter: imgBlockC.horizontalCenter
                    anchors.horizontalCenterOffset: 120
                    anchors.verticalCenterOffset: 0
                    text: "6"
                    onClicked: root.stepClicked(6)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockC.verticalCenter
                    anchors.horizontalCenter: imgBlockC.horizontalCenter
                    anchors.horizontalCenterOffset: -100
                    anchors.verticalCenterOffset: 30
                    text: "7"
                    onClicked: root.stepClicked(7)
                }
                RoundButton {
                    anchors.verticalCenter: imgBlockC.verticalCenter
                    anchors.horizontalCenter: imgBlockC.horizontalCenter
                    anchors.horizontalCenterOffset: 0
                    anchors.verticalCenterOffset: 0
                    text: "8"
                    onClicked: root.stepClicked(8)
                }
            }

            Label {
                id: _presets
                text: qsTr("Setup presets")
                font.capitalization: Font.AllUppercase
                font.pixelSize: 25
                color: Palette.white

                Layout.fillWidth: true
                Layout.topMargin: 37
                Layout.bottomMargin: 20
                Layout.leftMargin: 20
            }

            Rectangle {
                color: Palette.white
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.preferredHeight: 2
            }

            ListView {
                id: _predeterminedSteps
                spacing: 0
                interactive: false

                ObjectModel {
                    id: _accordions
                    AccordionItemDelegate {
                        width: parent.width
                        accordionText: qsTr("2 Player setup")
                        accordionContent: Component {
                            PredeterminedSteps {
                                title: qsTr("2 Players setup")
                                paragraph: qsTr("Choose a color not in play and place the machines as shown in one of the following presets.")
                                contentModel: ListModel {
                                    id: _2PlayerSetupSteps
                                    ListElement {
                                        subTitle: qsTr("Symmetry")
                                        subParagraph: qsTr("Every kind of Region is equally accessible, obstacles are well distributed all over the land.")
                                        imageSource: "qrc:assets/images/extras/menu/icaion/lore.jpg"
                                    }
                                    ListElement {
                                        subTitle: qsTr("Looted Mountains")
                                        subParagraph: qsTr("Players are more likely to run out of Brown Qoam, and they will struggle for the central Regions.")
                                        imageSource: "qrc:assets/images/extras/menu/icaion/lore.jpg"
                                    }
                                }
                            }
                        }
                    }
                    Rectangle {
                        color: Palette.white
                        width: parent.width
                        height: 2
                    }
                    AccordionItemDelegate {
                        width: parent.width
                        accordionText: qsTr("3 Player setup")
                        accordionContent: Component {
                            PredeterminedSteps {
                                title: qsTr("3 Players setup")
                                paragraph: qsTr("Choose a color not in play and place the machines as shown in one of the following presets.")
                                contentModel: ListModel {
                                    id: _2PlayerSetupSteps
                                    ListElement {
                                        subTitle: qsTr("Specialized Areas")
                                        subParagraph: qsTr("Some Regions are more coveted than others, the mightiest Seeker gets the highest Honor.")
                                        imageSource: "qrc:assets/images/extras/menu/icaion/lore.jpg"
                                    }
                                    ListElement {
                                        subTitle: qsTr("A Fragile Equilibrium")
                                        subParagraph: qsTr("All players have the same opportunities, but they must aim for the best settlements before the others.")
                                        imageSource: "qrc:assets/images/extras/menu/icaion/lore.jpg"
                                    }
                                }
                            }
                        }
                    }
                    Rectangle {
                        color: Palette.white
                        width: parent.width
                        height: 2
                    }
                    AccordionItemDelegate {
                        width: parent.width
                        accordionText: qsTr("4 Player setup")
                        accordionContent: Component {
                            PredeterminedSteps {
                                title: qsTr("4 Players setup")
                                paragraph: qsTr("Choose a color not in play and place the machines as shown in one of the following presets.")
                                contentModel: ListModel {
                                    id: _2PlayerSetupSteps
                                    ListElement {
                                        subTitle: qsTr("Crystal Attraction")
                                        subParagraph: qsTr("All the Crystal Fields have been taken, but the Pink Qoam is not a resource to do without.")
                                        imageSource: "qrc:assets/images/extras/menu/icaion/lore.jpg"
                                    }
                                    ListElement {
                                        subTitle: qsTr("A City Hard to Reach")
                                        subParagraph: qsTr("Building Machines around the core of the City is a strategy that repays, someone thought it first.")
                                        imageSource: "qrc:assets/images/extras/menu/icaion/lore.jpg"
                                    }
                                }
                            }
                        }
                    }
                    Rectangle {
                        color: Palette.white
                        width: parent.width
                        height: 2
                    }
                }

                model: _accordions

                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: root.width
                Layout.preferredHeight: contentItem.height
            }
        }
    }
}
