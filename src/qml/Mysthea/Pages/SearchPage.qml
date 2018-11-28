import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2

import Mysthea.Components 1.0
import Mysthea.Theme 1.0


//Beacause of Page is handle by a StackView we can access to it by his attached property.
//So we use root.StackView.view.[property] to use StackView properties.
Page {
    id: root

    background: Image {
        source: "qrc:/assets/images/home-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignBottom

        Rectangle {
            anchors.fill: parent
            color: Palette.mineShaft
            opacity: 0.29
        }
    }

    header: ToolBar {

        // Back button shown only if there is more than a page in the StackView
        ToolButton {
            text: Icon.back
            font.pixelSize: 22
            font.family: "Material Icons"

            onClicked: {
                if (root.StackView.view.depth > 1) {
                    root.StackView.view.pop()
                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent

        Pane {
            Layout.fillWidth: true
            Material.elevation: 1

            ColumnLayout {
                anchors.fill: parent

                RowLayout {
                    Label {
                        text: Icon.search
                        font.pixelSize: 24
                        font.family: "Material Icons"
                        horizontalAlignment: Text.AlignHCenter
                    }

                    TextField {
                        id: _searchField
                        placeholderText: qsTr("Search code…")
                        Layout.fillWidth: true

                        onTextEdited: cardsModel.setCodeFilter(
                                          _searchField.text)
                    }
                }

                RowLayout {
                    ComboBox {
                        model: ["All Categories", "Era X", "Era I", "Era II", "Era III", "Hero", "Attunement"]

                        Layout.minimumWidth: 150

                        onActivated: cardsModel.setCategoryFilter(model[index])
                    }

                    ColorComboBox {
                        Layout.minimumWidth: 150

                        onActivated: cardsModel.setColorFilter(
                                         model.get(index).colorName)
                    }
                }
            }
        }

        ListView {
            id: _cardsList
            model: MockList {
                id: myMockList
            }

            clip: true

            Layout.fillWidth: true
            Layout.fillHeight: true

            ScrollIndicator.vertical: ScrollIndicator {
            }

            delegate: Pane {
                id: categoryPane
                width: parent.width
                background: null

                readonly property int numElementsInRow: 3
                readonly property int currentCellWidth: Math.floor(
                                                            categoryPane.availableWidth
                                                            / categoryPane.numElementsInRow)

                ColumnLayout {
                    anchors.fill: parent

                    Label {
                        id: categoryLabel
                        width: parent.width
                        text: category
                        color: Palette.white
                    }

                    GridView {
                        id: gridCard
                        interactive: false
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignCenter

                        implicitHeight: Math.ceil(
                                            cards.count / categoryPane.numElementsInRow)
                                        * cellHeight

                        cellHeight: cellWidth * 1.815533980582524
                        cellWidth: categoryPane.currentCellWidth

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
                                    //                                    sourceSize.width: width

                                    //                                    Layout.preferredHeight: parent.height - codeCard.height
                                    Layout.fillHeight: true
                                    Layout.maximumWidth: parent.width
                                    Layout.alignment: Qt.AlignHCenter
                                }

                                Label {
                                    id: codeCard
                                    text: code
                                    color: if (command == "Tactic") {
                                               return Palette.flamingo
                                           } else if (command == "Objective") {
                                               return Palette.goldenFizz
                                           } else if (command == "Accessory") {
                                               return Palette.apple
                                           } else if (command == "Upgrade") {
                                               return Palette.cerulean
                                           } else {
                                               return Palette.white
                                           }

                                    Layout.alignment: Qt.AlignHCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    // Unfocuses search field so that keyboard is hidden
                                    _searchField.focus = false
                                    root.StackView.view.push(
                                                "qrc:/qml/Mysthea/Pages/DetailPage.qml",
                                                {
                                                    "model": cards,
                                                    "index": index
                                                })
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
