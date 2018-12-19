import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.4
import QtQml.Models 2.1
import QtGraphicalEffects 1.0

import Mysthea.Pages 1.0
import Mysthea.Theme 1.0
import Mysthea.Models 1.0
import Translations 1.0

ApplicationWindow {
    id: root

    signal changed

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
            implicitWidth: menuDrawer.width
            implicitHeight: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Cards Reference")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/cards-reference.svg"
            icon.color: Palette.silverChalice
            display: AbstractButton.TextBesideIcon
            onClicked: console.log("cards reference clicked")
        }
        ItemDelegate {
            implicitWidth: menuDrawer.width
            implicitHeight: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Game Setup")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/game-setup.svg"
            icon.color: Palette.silverChalice
            onClicked: console.log("game setup clicked")
        }
        ItemDelegate {
            implicitWidth: menuDrawer.width
            implicitHeight: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Rulebook")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/rulebook.svg"
            icon.color: Palette.silverChalice
            onClicked: console.log("rulebook clicked")
        }
        ItemDelegate {
            implicitWidth: menuDrawer.width
            implicitHeight: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Lore")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/lore.svg"
            icon.color: Palette.silverChalice
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
            height: 64
            topPadding: 21
            bottomPadding: 21
            Material.foreground: Palette.silverChalice

            contentItem: ColumnLayout {
                id: content
                spacing: 0
                Layout.margins: 0
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 16
                    Image {
                        source: "qrc:/assets/icons/language.svg"
                    }
                    Label {
                        id: labelLanguage
                        Layout.fillWidth: true
                        text: "Language - " + TranslationsManager.currentLanguageText
                    }
                    Image {
                        id: arrowImage
                        source: "qrc:/assets/icons/arrow.svg"
                    }
                }

                Loader {
                    id: loader
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.leftMargin: 64
                    sourceComponent: languagesRadio
                    active: false
                }
                Component {
                    id: languagesRadio
                    ButtonGroup {
                        id: radioGroup
                        buttons: column.children
                        onCheckedButtonChanged: {
                            radioGroup.checkedButton.text.color = Palette.gallery
                            root.changed();
                        }
                    }
                }

                Column {
                    id: column
                    visible: false
                    spacing: 0
                    padding: 0
                    leftPadding: 32
                    Material.foreground: Palette.silverChalice
                    Material.accent: Palette.gallery
                    RadioButton {
                        padding: 0
                        checked: true
                        text: "English"
                        onClicked: TranslationsManager.currentLanguage = TranslationsManager.English
                    }
                    RadioButton {
                        padding: 0
                        text: "Français"
                        onClicked: TranslationsManager.currentLanguage = TranslationsManager.French
                    }
                    RadioButton {
                        padding: 0
                        text: "Español"
                        onClicked: TranslationsManager.currentLanguage = TranslationsManager.Spanish
                    }

                    RadioButton {
                        padding: 0
                        text: "Duitse"
                        onClicked: TranslationsManager.currentLanguage = TranslationsManager.German
                    }
                    RadioButton {
                        padding: 0
                        text: "Italiano"
                        onClicked: TranslationsManager.currentLanguage = TranslationsManager.Italian
                    }
                    RadioButton {
                        padding: 0
                        text: "日本人"
                        onClicked: TranslationsManager.currentLanguage = TranslationsManager.Japanese
                    }
                }
            }

            onClicked: { }

            states: [
                State {
                    name: 'expanded'
                    when: languageItemDelegate.checked
                    PropertyChanges {
                        target: arrowImage
                        rotation: 90
                    }
                    PropertyChanges {
                        target: languageItemDelegate
                        height: 268
                    }
                    PropertyChanges {
                        target: loader
                        active: true
                    }
                    PropertyChanges {
                        target: column
                        visible: true
                    }
                }
            ]
        }

        Rectangle {
            implicitWidth: menuDrawer.width
            height: 1
            color: Palette.white
            opacity: 0.5
        }

        ItemDelegate {
            implicitWidth: menuDrawer.width
            implicitHeight: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Tabula Games Newsletter")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/newsletter.svg"
            icon.color: Palette.silverChalice
            onClicked: console.log("lore clicked")
        }

        Rectangle {
            implicitWidth: menuDrawer.width
            height: 1
            color: Palette.white
            opacity: 0.5
        }
        ColumnLayout {
            id: _layout
            implicitWidth: menuDrawer.width
            Material.foreground: Palette.silverChalice
            spacing: 8
            Label {
                text: qsTr("Game created and produced by")
                font.letterSpacing: 0.5
                opacity: 0.5
                topPadding: 24
                leftPadding: 16
                Layout.fillWidth: true
            }
            Image {
                id: tabulaLogo
                Layout.leftMargin: 16
                source: "qrc:/assets/icons/tabula-logo.svg"
                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.openUrlExternally("https://tabula.games")
                }
                // this color tabula logo with white color.
                ColorOverlay {
                    anchors.fill: tabulaLogo
                    source: tabulaLogo
                    color: Palette.white
                }
            }

            Label {
                text: qsTr("App designed and developed by")
                font.letterSpacing: 0.5
                opacity: 0.5
                leftPadding: 16
                Layout.fillWidth: true
            }
            Image {
                id: evonoveLogo
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
        bottomPadding: 32
        background: Rectangle {
            width: parent.width
            height: parent.height
            color: Palette.mineShaft
        }

        ListView {
            anchors.fill: parent
            model: drawerMenuElement
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
        padding: 0

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
