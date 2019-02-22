import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2

import Mysthea.Components 1.0
import Mysthea.Pages 1.0
import Mysthea.Theme 1.0
import Mysthea.Models 1.0
import Translations 1.0

Page {
    id: root
    title: qsTr("CARDS REFERENCE")
    objectName: PageName.cardPage
    property Action leftAction: null
    property bool hasToolbarLine: true

    signal cardClicked(CardsProxyModel cards, int index)

    TypeProxyModel {
        id: typeProxyModel
    }

    // We created this connection because the currentText of combobox doesn't change when changing
    // language and its displayText will not update.
    Connections {
        target: TranslationsManager
        onCurrentLanguageChanged: {
            typeCombo.displayText = typeComboModel.data(
                        typeComboModel.index(typeCombo.currentIndex, 0),
                        TypeComboBoxModel.Type)
            commandsCombo.displayText = commandComboModel.data(
                        commandComboModel.index(commandsCombo.currentIndex, 0),
                        CommandComboBoxModel.Command)
        }
    }

    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignBottom
    }

    Flickable {
        anchors.fill: parent
        contentWidth: width
        contentHeight: content.height
        clip: true

        ScrollIndicator.vertical: ScrollIndicator {
        }

        Column {
            id: content
            width: parent.width
            height: comboBoxSection.height + spacing + _listLoader.item.contentHeight

            ToolBar {
                id: comboBoxSection
                padding: 16

                width: parent.width
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
                            iconRole: "iconUrl"
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

                        TextIconComboBox {
                            id: commandsCombo
                            padding: 0
                            textRole: "command"
                            iconRole: "iconUrl"
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
                                    displayIcon = ""
                                }
                            }
                        }
                    }
                }
            }

            Loader {
                id: _listLoader
                width: parent.width
                sourceComponent: typeProxyModel.size
                                 > 0 ? cardListComponent : emptyCardListComponent
            }
        }
    }

    Component {
        id: cardListComponent
        CardsList {
            height: contentHeight
            width: parent.width
            model: typeProxyModel
            interactive: false
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
