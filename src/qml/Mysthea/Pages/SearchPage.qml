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
    padding: 0

    font.family: "Yanone Kaffeesatz"
    font.letterSpacing: 0.5

    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignBottom
    }

    ToolBar {
        id: toolbar
        z: 2
        width: parent.width
        position: ToolBar.Header
        padding: 0
        background: null
        RowLayout {
            anchors.fill: parent
            ToolButton {
                anchors.leftMargin: 16
                anchors.topMargin: 16

                text: Icon.menu
                font.pixelSize: 24
                font.family: "Material Icons"

                onClicked: {
                    if (root.StackView.view.depth > 1) {
                        root.StackView.view.pop()
                    }
                }
            }

            Label {
                text: qsTr("CARDS REFERENCE")
                font.pixelSize: 18
                font.letterSpacing: 0.5
            }
        }
    }

    ColumnLayout {
        width: parent.width
        height: parent.height
        spacing: 0

        Pane {
            id: comboBoxSection
            background: null
            padding: 0

            Layout.fillWidth: true
            Layout.topMargin: 72

            ColumnLayout {
                anchors.fill: parent
                spacing: 16

                RowLayout {
                    id: searchBar
                    Layout.leftMargin: 16
                    Layout.rightMargin: 16

                    Rectangle {
                        width: searchBar.width
                        height: searchBar.height
                        color: Palette.white
                        radius: 3
                    }

                    Label {
                        text: Icon.search
                        font.pixelSize: 17
                        font.family: "Material Icons"

                        Layout.leftMargin: 19
                        Layout.rightMargin: 14
                        horizontalAlignment: Text.AlignHCenter
                    }

                    TextField {
                        id: _searchField

                        placeholderText: qsTr("Search cards by code")
                        font.pixelSize: 18
                        font.letterSpacing: 0

                        Layout.leftMargin: 14
                        Layout.fillWidth: true

                        onTextEdited: cardsModel.setCodeFilter(
                                          _searchField.text)
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 0

                    Layout.leftMargin: 16
                    Layout.rightMargin: 16

                    ComboBox {
                        model: ["All Categories", "Era X", "Era I", "Era II", "Era III", "Hero", "Attunement"]

                        Layout.minimumWidth: 150
                        Layout.fillWidth: true
                        Layout.rightMargin: 8

                        onActivated: cardsModel.setCategoryFilter(model[index])
                    }

                    ColorComboBox {
                        Layout.minimumWidth: 150
                        Layout.fillWidth: true
                        Layout.leftMargin: 8

                        onActivated: cardsModel.setColorFilter(
                                         model.get(index).colorName)
                    }
                }

                Rectangle {
                    width: root.width
                    height: 1
                    color: Palette.white
                    border.color: Palette.white

                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignBottom
                    Layout.topMargin: 16

                }
            }
        }

        ListView {
            id: _cardsList

            model: MockList {
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
                font.pixelSize: 24
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

                        text: model.category
                        color: Palette.white

                        Layout.leftMargin: 16
                    }

                    GridView {
                        id: gridCard
                        interactive: false

                        implicitHeight: Math.ceil(
                                            cards.count / categoryPane.numElementsInRow)
                                        * cellHeight
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
                                    Layout.fillHeight: true
                                    Layout.maximumWidth: parent.width
                                    Layout.alignment: Qt.AlignHCenter
                                }

                                Label {
                                    id: codeCard
                                    text: code
                                    font.weight: Font.Bold

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
