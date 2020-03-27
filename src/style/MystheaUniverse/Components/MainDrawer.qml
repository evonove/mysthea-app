import QtQuick 2.11
import QtQml.Models 2.11
import QtQuick.Controls.Material 2.4
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import Mysthea.Models 1.0
import Mysthea 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0
import Translations 1.0

Drawer {
    id: menuDrawer
    signal homeClicked
    signal cardsReferenceClicked
    signal gameSetupClicked
    signal rulesbookClicked
    signal loreClicked

    bottomPadding: 24

    background: Rectangle {
        width: menuDrawer.width
        height: menuDrawer.height
        color: Palette.mineShaft
    }

    LanguageListModel {
        id: _languageListModel
    }

    property alias state: pagesDelegate.state

    StateGroup {
        id: pagesDelegate
        states: [
            State {
                name: PageName.homePage
                PropertyChanges {
                    target: homeDelegate
                    Material.foreground: Palette.gallery
                }
            },
            State {
                name: PageName.cardPage
                PropertyChanges {
                    target: cardsReferenceDelegate
                    Material.foreground: Palette.gallery
                }
            },
            State {
                name: PageName.gameSetupPage
                PropertyChanges {
                    target: gameSetupDelegate
                    Material.foreground: Palette.gallery
                }
            },
            State {
                name: PageName.rulebookPage
                PropertyChanges {
                    target: rulebookDelegate
                    Material.foreground: Palette.gallery
                }
            },
            State {
                name: PageName.lorePage
                PropertyChanges {
                    target: loreDelegate
                    Material.foreground: Palette.gallery
                }
            }
        ]
    }

    ObjectModel {
        id: drawerMenuElement

        ItemDelegate {
            id: homeDelegate
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Home")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/home.svg"
            onClicked: menuDrawer.homeClicked()
        }
        ItemDelegate {
            id: cardsReferenceDelegate
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Cards Reference")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/cards-reference.svg"
            onClicked: menuDrawer.cardsReferenceClicked()
        }
        ItemDelegate {
            id: gameSetupDelegate
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Game Setup")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/game-setup.svg"
            onClicked: menuDrawer.gameSetupClicked()
        }
        ItemDelegate {
            id: rulebookDelegate
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Rulebook")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/rulebook.svg"
            onClicked: menuDrawer.rulesbookClicked()
        }
        ItemDelegate {
            id: loreDelegate
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Lore")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/lore.svg"
            onClicked: menuDrawer.loreClicked()
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
            Material.foreground: Palette.silverChalice

            contentItem: ColumnLayout {
                id: content
                spacing: 25
                RowLayout {
                    Layout.fillWidth: true
                    implicitHeight: 64
                    spacing: 16
                    Image {
                        source: "qrc:/assets/icons/language.svg"
                        sourceSize: Qt.size(24, 24)
                    }
                    Row {
                        Layout.fillWidth: true
                        Label {
                            id: labelLanguage
                            text: qsTr("Language - ")
                        }

                        Label {
                            text: {
                                // Find name of current language
                                for (var i = 0; i < _languageListModel.count; i++) {
                                    var element = _languageListModel.get(i);
                                    if (element.translation === TranslationsManager.currentLanguage) {
                                        return element.language;
                                    }
                                }
                            }
                            color: Palette.gallery
                        }
                    }

                    Image {
                        id: arrowImage
                        source: "qrc:/assets/icons/arrow.svg"
                        sourceSize.height: 24
                    }
                }

                Loader {
                    id: loader
                    Layout.fillWidth: true
                    sourceComponent: languagesRadio
                    active: false
                    opacity: 0
                }

                Component {
                    id: languagesRadio
                    ColumnLayout {
                        id: column
                        spacing: 0

                        ButtonGroup {
                            id: radioGroup
                            buttons: column.children

                            onCheckedButtonChanged: {
                                radioGroup.checkedButton.text.color = Palette.gallery
                            }
                        }

                        Repeater {
                            model: _languageListModel
                            RadioLanguage {
                                id: radioLanguage
                                text: model.language
                                leftPadding: 64
                                checked: TranslationsManager.currentLanguage === model.translation
                                onClicked: TranslationsManager.currentLanguage = model.translation

                                Layout.fillWidth: true
                            }
                        }
                    }
                }
            }

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
                        height: languageItemDelegate.implicitHeight
                    }
                    PropertyChanges {
                        target: loader
                        active: true
                    }
                    PropertyChanges {
                        target: loader
                        opacity: 1
                    }
                }
            ]

            transitions: Transition {
                reversible: true
                to: 'expanded'
                animations: [
                    SequentialAnimation {
                        PropertyAnimation {
                            target: languageItemDelegate
                            property: "height"
                            duration: 100
                        }
                        NumberAnimation {
                            target: loader
                            property: "opacity"
                            duration: 100
                        }
                    },
                    PropertyAnimation {
                        target: arrowImage
                        property: "rotation"
                        duration: 100
                    }
                ]
            }
        }
        Rectangle {
            width: menuDrawer.width
            height: 1
            color: Palette.white
            opacity: 0.5
        }
        ItemDelegate {
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Tabula Games Newsletter")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/newsletter.svg"
            onClicked: Qt.openUrlExternally("https://mysthea.tabula.games/newsletter/")
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
                source: "qrc:/assets/icons/tabula-logo.svg"
                sourceSize.width: parent.width - 180

                Layout.leftMargin: 16

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
                topPadding: 8
                leftPadding: 16
                Layout.fillWidth: true
            }
            Image {
                id: evonoveLogo
                Layout.leftMargin: 16
                source: "qrc:/assets/icons/evonove-logo.svg"
                sourceSize.width: parent.width - 180
                MouseArea {
                    anchors.fill: parent
                    onClicked: Qt.openUrlExternally("https://evonove.it")
                }
            }
        }
    }

    ListView {
        anchors.fill: parent
        model: drawerMenuElement
    }

    onClosed: {
        languageItemDelegate.state = ""
        languageItemDelegate.checked = false
    }
}
