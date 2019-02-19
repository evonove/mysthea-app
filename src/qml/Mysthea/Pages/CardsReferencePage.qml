import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2

import Mysthea.Components 1.0
import Mysthea.Pages 1.0
import Mysthea.Theme 1.0
import Mysthea.Models 1.0

Page {
    id: root
    title: qsTr("CARDS REFERENCE")
    objectName: PageName.cardPage
    property Action leftAction: null
    property bool hasToolbarLine: false

    signal cardClicked(CardsProxyModel cards, int index)

    BusyIndicator {
        anchors.centerIn: parent
        running: _contentLoader.status !== Loader.Ready
    }

    TypeProxyModel {
        id: typeProxyModel
    }

    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignBottom
    }

    Loader {
        id: _contentLoader
        anchors.fill: parent
        asynchronous: true
        sourceComponent: content
        visible: status === Loader.Ready
    }

    Component {
        id: content
        ColumnLayout {
            spacing: 0

            ToolBar {
                id: comboBoxSection
                padding: 16

                Layout.fillWidth: true

                background: Rectangle {
                    anchors.bottom: parent.bottom
                    width: root.width
                    height: 1
                    color: Palette.white
                }
                ColumnLayout {
                    anchors.fill: parent
                    spacing: 16

                    RowLayout {
                        id: searchBar

                        SearchField {
                            id: _searchField

                            placeholderText: qsTr("Search cards by code")
                            font.pixelSize: 18
                            font.letterSpacing: 0
                            Layout.fillWidth: true

                            onTextEdited: typeProxyModel.setCodeFilter(
                                              _searchField.text)
                        }
                    }

                    RowLayout {
                        spacing: 16

                        Layout.fillWidth: true

                        TextIconComboBox {
                            id: typeCombo
                            padding: 0
                            textRole: "type"
                            model: TypeComboBoxModel {
                                id: typeComboModel
                            }

                            font.letterSpacing: 0

                            Layout.fillWidth: true
                            onActivated: {
                                typeProxyModel.setTypeFilter(
                                            typeComboModel.data(
                                                typeComboModel.index(index, 0),
                                                TypeComboBoxModel.Key))

                                // In loader we don't have only listView so we check if the item has this property
                                if (_listLoader.item.hasOwnProperty(
                                            'positionViewAtBeginning')) {
                                    _listLoader.item.positionViewAtBeginning()
                                }
                            }
                        }

                        ComboBox {
                            id: commandsCombo
                            padding: 0
                            textRole: "command"
                            model: CommandComboBoxModel {
                                id: commandComboModel
                            }
                            font.letterSpacing: 0

                            enabled: typeProxyModel.enableCommand

                            Layout.fillWidth: true

                            onActivated: {
                                typeProxyModel.setCommandFilter(
                                            commandComboModel.data(
                                                commandComboModel.index(index,
                                                                        0),
                                                CommandComboBoxModel.Key))
                                // In loader we don't have only listView so we check if the item has this property
                                if (_listLoader.item.hasOwnProperty(
                                            'positionViewAtBeginning')) {
                                    _listLoader.item.positionViewAtBeginning()
                                }
                            }

                            onEnabledChanged: {
                                if (!enabled) {
                                    currentIndex = 0
                                }
                            }
                        }
                    }
                }
            }

            Loader {
                id: _listLoader
                sourceComponent: typeProxyModel.size
                                 > 0 ? cardListComponent : emptyCardListComponent

                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    Component {
        id: cardListComponent
        CardsList {
            model: typeProxyModel
            onCardClicked: {
                var cardsModel = typeProxyModel.visibleCards
                root.cardClicked(cardsModel, cardsModel.indexOf(clickedCode))
            }
        }
    }

    Component {
        id: emptyCardListComponent
        Pane {
            background: null
            padding: 16
            topPadding: 32
            bottomPadding: 32

            ColumnLayout {
                width: parent.width
                spacing: 8

                Label {
                    text: qsTr("Ooops! Card not found.")
                    font.pixelSize: 24
                    color: Palette.white
                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("Please try to type a different code or to change filter options.")
                    color: Palette.white
                    opacity: 0.5
                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }
            }
        }
    }
}
