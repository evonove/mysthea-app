import QtQuick 2.11
import QtQml.Models 2.11
import QtQuick.Controls.Material 2.4
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import Mysthea.Pages 1.0
import Mysthea.Theme 1.0
import Mysthea.Models 1.0
import Translations 1.0
import Mysthea.Components 1.0

Drawer {
    id: menuDrawer

    signal cardsReferenceClicked
    signal gameSetupClicked
    signal rulesbookClicked
    signal loreClicked

    background: Rectangle {
        width: menuDrawer.width
        height: menuDrawer.height
        color: Palette.mineShaft
    }

    ObjectModel {
        id: drawerMenuElement

        ItemDelegate {
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Cards Reference")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/cards-reference.svg"
            icon.color: Palette.silverChalice
            onClicked: menuDrawer.cardsReferenceClicked()
        }
        ItemDelegate {
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Game Setup")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/game-setup.svg"
            icon.color: Palette.silverChalice
            onClicked: menuDrawer.gameSetupClicked()
        }
        ItemDelegate {
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Rulebook")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/rulebook.svg"
            icon.color: Palette.silverChalice
            onClicked: menuDrawer.rulesbookClicked()
        }
        ItemDelegate {
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Lore")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/lore.svg"
            icon.color: Palette.silverChalice
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
                    }
                    Row {
                        Layout.fillWidth: true
                        Label {
                            id: labelLanguage
                            text: "Language - "
                        }
                        Label {
                            text: TranslationsManager.currentLanguageText
                            color: Palette.gallery
                        }
                    }

                    Image {
                        id: arrowImage
                        source: "qrc:/assets/icons/arrow.svg"
                    }
                }

                Loader {
                    id: loader
                    Layout.fillWidth: true
                    Layout.leftMargin: 64
                    sourceComponent: languagesRadio
                    active: false
                }

                Component {
                    id: languagesRadio
                    Column {
                        id: column
                        spacing: 0
                        padding: 0

                        ButtonGroup {
                            id: radioGroup
                            buttons: column.children

                            onCheckedButtonChanged: {
                                radioGroup.checkedButton.text.color = Palette.gallery
                                root.changed()
                            }
                        }

                        Repeater {
                            model: LanguageListModel {
                            }
                            RadioLanguage {
                                text: model.language
                                checked: TranslationsManager.currentLanguageText === model.language
                                onClicked: TranslationsManager.currentLanguage = model.translation
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
            width: menuDrawer.width
            height: 64
            topPadding: 21
            bottomPadding: 21
            text: qsTr("Tabula Games Newsletter")
            Material.foreground: Palette.silverChalice
            icon.source: "qrc:/assets/icons/newsletter.svg"
            icon.color: Palette.silverChalice
            onClicked: console.log("Newsletter clicked")
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

    ListView {
        anchors.fill: parent
        model: drawerMenuElement
    }
}
