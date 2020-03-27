import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2

import Mysthea.Models 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

ListView {
    id: _cardsList

    signal cardClicked(string clickedCode)

    clip: true

    delegate: Pane {
        id: categoryPane
        width: parent.width
        background: null
        topPadding: 25

        readonly property int numElementsInRow: 3
        readonly property int currentCellWidth: Math.floor(
                                                    categoryPane.availableWidth
                                                    / categoryPane.numElementsInRow)

        ColumnLayout {
            anchors.fill: parent
            spacing: 0
            anchors.margins: 0

            Loader {
                width: parent.width
                sourceComponent: model.type >= 1
                                 && model.type <= 4 ? _eraTypeText : _otherTypeText

                Layout.leftMargin: 16

                Component {
                    id: _otherTypeText
                    Label {
                        padding: 0

                        text: model.typeText
                        font.letterSpacing: 0.5
                        font.pixelSize: 28
                        color: Palette.white
                    }
                }

                Component {
                    id: _eraTypeText
                    Row {
                        id: row
                        spacing: 8
                        width: parent.width

                        Label {
                            height: parent.height
                            padding: 0
                            text: qsTr("Era")
                            font.pixelSize: 28
                            font.letterSpacing: 0.5
                            font.weight: Font.Bold
                            color: Palette.grayNurse
                            verticalAlignment: Text.AlignVCenter
                        }

                        Image {
                            fillMode: Image.PreserveAspectFit
                            sourceSize.height: 24
                            source: {
                                switch (model.type) {
                                case 1:
                                    return "qrc:/assets/icons/era_x.svg"
                                case 2:
                                    return "qrc:/assets/icons/era_1.svg"
                                case 3:
                                    return "qrc:/assets/icons/era_2.svg"
                                case 4:
                                    return "qrc:/assets/icons/era_3.svg"
                                default:
                                    return ""
                                }
                            }

                            verticalAlignment: Image.AlignVCenter
                        }
                    }
                }
            }

            GridView {
                id: gridCard
                interactive: false

                implicitHeight: Math.ceil(
                                    cards.size / categoryPane.numElementsInRow) * cellHeight

                cellHeight: cellWidth * 1.815533980582524
                cellWidth: categoryPane.currentCellWidth

                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
                Layout.topMargin: 16

                model: cards

                delegate: Pane {
                    height: gridCard.cellHeight
                    width: gridCard.cellWidth
                    topPadding: 16
                    bottomPadding: 16
                    leftPadding: 8
                    rightPadding: 8
                    background: null

                    ColumnLayout {
                        id: col
                        anchors.fill: parent
                        spacing: 0

                        Rectangle {

                            color: img.status === Image.Ready ? "transparent" : "dimgray"
                            opacity: img.status === Image.Ready ? 1 : 0.5
                            Layout.preferredHeight: parent.height - _cardCodeLabel.height
                            Layout.maximumWidth: parent.width
                            Layout.alignment: Qt.AlignHCenter
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            Image {
                                id: img
                                fillMode: Image.PreserveAspectFit
                                source: "qrc:/images/cards/" + image
                                asynchronous: true

                                anchors.fill: parent
                            }
                        }

                        Label {
                            id: _cardCodeLabel
                            text: code
                            font.weight: Font.Bold
                            font.letterSpacing: 0.5
                            font.pixelSize: 24

                            color: {
                                if (command === 1) {
                                    return Palette.flamingo
                                } else if (command === 2) {
                                    return Palette.goldenFizz
                                } else if (command === 3) {
                                    return Palette.apple
                                } else if (command === 4) {
                                    return Palette.cerulean
                                } else {
                                    return Palette.white
                                }
                            }

                            Layout.topMargin: 6
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            // Unfocuses search field so that keyboard is hidden
                            _cardsList.cardClicked(code)
                        }
                    }
                }
            }
        }
    }
}
