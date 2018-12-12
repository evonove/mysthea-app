import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2

import Mysthea.Components 1.0
import Mysthea.Theme 1.0
import Mysthea.Models 1.0

ListView {
    id: _cardsList

    signal cardClicked(string clickedCode)

    clip: true

    ScrollIndicator.vertical: ScrollIndicator {
    }

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
            Label {
                id: categoryLabel
                width: parent.width
                padding: 0

                text: model.type
                font.letterSpacing: 0.5
                font.pixelSize: 24
                color: Palette.white

                Layout.leftMargin: 16
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

                        Image {

                            id: images
                            fillMode: Image.PreserveAspectFit
                            source: "qrc:/images/cards/" + image
                            sourceSize.height: height
                            sourceSize.width: width

                            Layout.preferredHeight: parent.height - codeCard.height
                            Layout.maximumWidth: parent.width
                            Layout.alignment: Qt.AlignHCenter
                        }

                        Label {
                            id: codeCard
                            text: code
                            font.weight: Font.Bold
                            font.letterSpacing: 0.5
                            font.pixelSize: 24

                            color: {
                                if (command === "Tactic") {
                                    return Palette.flamingo
                                } else if (command === "Objective") {
                                    return Palette.goldenFizz
                                } else if (command === "Accessory") {
                                    return Palette.apple
                                } else if (command === "Upgrade") {
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
                            _searchField.focus = false
                            _cardsList.cardClicked(code)
                        }
                    }
                }
            }
        }
    }
}
