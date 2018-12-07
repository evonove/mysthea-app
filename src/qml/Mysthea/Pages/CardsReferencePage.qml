import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2

import Mysthea.Components 1.0
import Mysthea.Pages 1.0
import Mysthea.Theme 1.0


//Beacause of Page is handle by a StackView we can access to it by his attached property.
//So we use root.StackView.view.[property] to use StackView properties.
Page {
    id: root

    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignBottom
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        ToolBar {
            id: toolbar
            z: 2
            height: 56
            position: ToolBar.Header
            background: null

            Layout.fillWidth: true

            ToolButton {
                id: toolButton
                height: parent.height
                text: Icon.menu
                font.pixelSize: 24
                font.family: "Material Icons"

                onClicked: {
                    typeProxyModel.resetFilters()
                    if (root.StackView.view.depth > 1) {
                        root.StackView.view.pop()
                    }
                }
            }

            Label {
                id: label
                width: parent.width
                height: parent.height
                anchors.topMargin: 16
                text: qsTr("CARDS REFERENCE")
                font.pixelSize: 20
                font.letterSpacing: 0.5
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
            }
        }

        ToolBar {
            id: comboBoxSection
            topPadding: 16
            Layout.fillWidth: true

            background: null
            padding: 0

            ColumnLayout {
                anchors.fill: parent
                spacing: 16

                RowLayout {
                    id: searchBar
                    Layout.leftMargin: 16
                    Layout.rightMargin: 16

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
                    Layout.fillWidth: true
                    spacing: 16

                    Layout.leftMargin: 16
                    Layout.rightMargin: 16

                    ComboBox {
                        id: typeCombo
                        padding: 0
                        model: ["All types", "Era X", "Era I", "Era II", "Era III", "Hero", "Attunement"]
                        font.letterSpacing: 0

                        Layout.minimumWidth: 150
                        Layout.fillWidth: true

                        onActivated: typeProxyModel.setTypeFilter(model[index])
                    }

                    ComboBox {
                        id: commandsCombo
                        padding: 0
                        model: ["All commands", "Tactic", "Objective", "Accessory", "Upgrade"]
                        font.letterSpacing: 0

                        enabled: !(typeCombo.currentText === "Hero"
                                   || typeCombo.currentText === "Attunement")

                        Layout.minimumWidth: 150
                        Layout.fillWidth: true

                        onActivated: typeProxyModel.setCommandFilter(
                                         model[index])
                        onEnabledChanged: {
                            if (!enabled) {
                                currentIndex = 0
                            }
                        }
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

        Loader {
            sourceComponent: typeProxyModel.size > 0 ? cardListComponent : emptyCardListComponent

            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    Component {
        id: cardListComponent
        CardsList {
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
