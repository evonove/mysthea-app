import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.14

import MystheaUniverse.Models 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

ListView {
    id: root

    property CommandComboBoxModel commandComboBoxModel: null
    property TypeComboBoxModel typeComboBoxModel: null

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

            Row {
                id: _typeTextRow
                spacing: 8
                width: parent.width
                Layout.leftMargin: 16

                Label {
                    height: parent.height
                    padding: 0
                    text: typeComboBoxModel.getTypeFromIndex(model.type)
                    font.pixelSize: 18
                    font.letterSpacing: 0
                    color: Palette.white
                    verticalAlignment: Text.AlignVCenter
                }
            }

            GridView {
                id: _gridCard
                interactive: false

                implicitHeight: Math.ceil(
                                    cards.size / categoryPane.numElementsInRow) * cellHeight

                cellHeight: cellWidth * 1.9
                cellWidth: categoryPane.currentCellWidth

                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
                Layout.topMargin: 16

                model: cards

                delegate: Pane {
                    height: _gridCard.cellHeight
                    width: _gridCard.cellWidth
                    topPadding: 16
                    bottomPadding: 16
                    leftPadding: 8
                    rightPadding: 8
                    background: null

                    ColumnLayout {
                        id: _col
                        anchors.fill: parent
                        spacing: 0

                        RoundedImage {
                            fillMode: Image.PreserveAspectFit
                            source: "qrc:/assets/images/cards/" + image
                            borderWidth: 0
                            borderRadius: 5
                            Layout.preferredHeight: parent.height - _cardCodeLabel.height
                            Layout.maximumWidth: parent.width
                            Layout.alignment: Qt.AlignHCenter
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }

                        Label {
                            id: _cardCodeLabel
                            text: code
                            font.family: "FuturaPTBold"
                            font.letterSpacing: 0
                            font.pixelSize: 25

                            color: root.commandComboBoxModel !== null ? commandComboBoxModel.color(model.command) : "#FFFFFF"

                            Layout.topMargin: 6
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            // Unfocuses search field so that keyboard is hidden
                            root.cardClicked(code)
                        }
                    }
                }
            }
        }
    }
}
