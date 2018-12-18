import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.4
import QtQml.Models 2.1

import Mysthea.Pages 1.0
import Mysthea.Theme 1.0
import Mysthea.Models 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 375
    height: 667
    title: qsTr("Mysthea")

    font.family: "Yanone Kaffeesatz"
    font.pixelSize: 18
    Material.accent: Palette.maroonFlush

    Action {
        id: drawerAction
        text: Icon.menu
        onTriggered: menuDrawer.open()
    }

    Action {
        id: backAction
        text: Icon.back
        onTriggered: _mainStackView.pop()
    }

    ObjectModel {
        id: drawerMenuElement

        ItemDelegate {
            width: menuDrawer.width
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Cards Reference")
            Material.foreground: Palette.white
            icon.source: "qrc:/assets/icons/cards-reference.svg"
            icon.color: Palette.white
            opacity: 0.8
            display: AbstractButton.TextBesideIcon
            onClicked: console.log("cards reference clicked")
        }
        ItemDelegate {
            width: menuDrawer.width
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Game Setup")
            Material.foreground: Palette.white
            icon.source: "qrc:/assets/icons/game-setup.svg"
            icon.color: Palette.white
            opacity: 0.8
            onClicked: console.log("game setup clicked")
        }
        ItemDelegate {
            width: menuDrawer.width
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Rulebook")
            Material.foreground: Palette.white
            icon.source: "qrc:/assets/icons/rulebook.svg"
            icon.color: Palette.white
            opacity: 0.8
            onClicked: console.log("rulebook clicked")
        }
        ItemDelegate {
            width: menuDrawer.width
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Lore")
            Material.foreground: Palette.white
            icon.source: "qrc:/assets/icons/lore.svg"
            icon.color: Palette.white
            opacity: 0.8
            onClicked: console.log("lore clicked")
        }

        Rectangle {
            width: menuDrawer.width
            height: 1
            color: Palette.white
            opacity: 0.5
        }

        ItemDelegate {
            id: languageItemDelegate
            checkable: true
            width: menuDrawer.width
            topPadding: 21
            bottomPadding: 21
            contentItem: RowLayout {
                width: parent.width
                spacing: 16
                Image {
                    source: "qrc:/assets/icons/language.svg"
                }
                Label {
                    Layout.fillWidth: true
                    text: "Langauge"
                }
                Image {
                    id: arrowImage
                    source: "qrc:/assets/icons/arrow.svg"
                }
                Loader {
                    id: loader
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    sourceComponent: languagesRadio
                    active: false
                }

                Component {
                    id: languagesRadio
                    ListView {
                        model: [qsTr("English"), qsTr("French"), qsTr(
                                "Spanish"), qsTr("German"), qsTr(
                                "Italian"), qsTr("Japanese")]
                        delegate: RadioButton {
                            text: modelData
                            checked: index == 0
                            Material.accent: Palette.white
                        }
                    }
                }
            }
            Material.foreground: Palette.white

            onClicked: {
                console.log(languageItemDelegate.pressed)
////                loader.active == true ? loader.active = false : loader.active = true
////                languageItemDelegate.expanded == true ? languageItemDelegate.expanded = false : languageItemDelegate.expanded = true
            }

            states: [
                State {
                    name: 'open'
                    when: languageItemDelegate.checked
                    PropertyChanges {
                        target: arrowImage
                        rotation: 90
                    }
                }
            ]

        }

        Rectangle {
            width: menuDrawer.width
            height: 1
            color: Palette.white
            opacity: 0.5
        }

        ItemDelegate {
            width: menuDrawer.width
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Tabula Games Newsletter")
            Material.foreground: Palette.white
            icon.source: "qrc:/assets/icons/newsletter.svg"
            icon.color: Palette.white
            opacity: 0.8
            onClicked: console.log("lore clicked")
        }

        Rectangle {
            width: menuDrawer.width
            height: 1
            color: Palette.white
            opacity: 0.5
        }
        ColumnLayout {
            id: _layout
            width: menuDrawer.width
            Material.foreground: Palette.white
            spacing: 8
            Label {
                text: qsTr("Game created and produced by")
                font.letterSpacing: 0.5
                opacity: 0.8
                topPadding: 24
                leftPadding: 16
                Layout.fillWidth: true
            }
            Image {
                Layout.leftMargin: 16
                source: "qrc:/assets/icons/tabula-logo.svg"
                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.openUrlExternally("https://tabula.games")
                }
            }
            Label {
                text: qsTr("App designed and developed by")
                font.letterSpacing: 0.5
                opacity: 0.8
                leftPadding: 16
                Layout.fillWidth: true
            }
            Image {
                Layout.leftMargin: 16
                source: "qrc:/assets/icons/evonove-logo.svg"
                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.openUrlExternally("https://evonove.it")
                }
            }
        }
    }

    Drawer {
        id: menuDrawer
        width: 0.8 * root.width
        height: root.height
        background: Rectangle {
            width: parent.width
            height: parent.height
            color: Palette.mineShaft
        }

        ColumnLayout {
            anchors.fill: parent
            spacing: 0
            ListView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                model: drawerMenuElement
            }
        }
    }

    ToolBar {
        id: toolbar
        padding: 0
        z: 2
        width: parent.width
        height: 56
        position: ToolBar.Header

        background: Rectangle {
            visible: _mainStackView.currentItem.hasToolbarLine
            anchors.bottom: parent.bottom
            width: parent.width
            height: 0.5
            color: Palette.white
            opacity: 0.5
        }
        ToolButton {
            id: toolButton
            height: parent.height
            font.pixelSize: 24
            font.family: "Material Icons"
            action: _mainStackView.currentItem.leftAction
        }
        RowLayout {
            anchors.fill: parent
            Label {
                id: label
                Layout.fillWidth: true
                Layout.fillHeight: true
                anchors.topMargin: 16
                text: _mainStackView.currentItem.title
                font.pixelSize: 20
                font.letterSpacing: 0.5
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
            }

            Repeater {
                model: _mainStackView.currentItem.rightActions
                ToolButton {
                    height: parent.height
                    font.pixelSize: 24
                    font.family: "Material Icons"
                    action: modelData
                }
            }
        }
    }

    // Loads Material icons font
    FontLoader {
        source: "qrc:/assets/fonts/MaterialIcons-Regular.ttf"
    }
    FontLoader {
        source: "qrc:/assets/fonts/YanoneKaffeesatz-Regular.ttf"
    }
    FontLoader {
        source: "qrc:/assets/fonts/YanoneKaffeesatz-Bold.ttf"
    }

    StackView {
        id: _mainStackView
        anchors.fill: parent
        focus: true

        background: Rectangle {
            color: Palette.mineShaft
        }

        // Handles click of back button by popping current page from StackView
        Keys.onPressed: {
            if (event.key === Qt.Key_Escape || event.key === Qt.Key_Back) {
                if (_mainStackView.depth > 1) {
                    _mainStackView.pop()
                    event.accepted = true
                }
            }
        }

        initialItem: MainMenu {
            leftAction: drawerAction
            onCardsReferenceClicked: _mainStackView.push(_cardReference)
            onGameSetupClicked: _mainStackView.push(_gameSetup)
            onRulesbookClicked: _mainStackView.push(_rulebook)
            onLoreClicked: _mainStackView.push(_lore)
            onLanguageClicked: _mainStackView.push(_language)
            onCreditsClicked: _mainStackView.push(_credits)
        }

        Component {
            id: _cardReference
            CardsReferencePage {
                leftAction: drawerAction
                onCardClicked: _mainStackView.push(_detailPage, {
                                                       "model": cards,
                                                       "index": index
                                                   })
            }
        }
        Component {
            id: _detailPage
            DetailPage {
                leftAction: backAction
            }
        }

        Component {
            id: _gameSetup
            GameSetup {
                leftAction: drawerAction
            }
        }

        Component {
            id: _rulebook
            Rulebook {
                leftAction: backAction
            }
        }

        Component {
            id: _lore
            Lore {
                leftAction: backAction
            }
        }

        Component {
            id: _language
            Language {
                leftAction: backAction
            }
        }

        Component {
            id: _credits
            Credits {
                leftAction: backAction
            }
        }
    }
}
