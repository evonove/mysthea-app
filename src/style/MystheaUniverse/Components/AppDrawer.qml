import QtQuick 2.11
import QtQml.Models 2.11
import QtQuick.Controls.Material 2.4
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

import Mysthea.Models 1.0
import Mysthea 1.0
import MystheaUniverse.Pages 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0
import Translations 1.0

Drawer {
    id: menuDrawer

    signal mystheaClicked
    signal icaionClicked
    signal theFallClicked

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
                name: PageName.mystheaPage
                PropertyChanges {
                    target: mystheaDelegate
                    Material.foreground: Palette.gallery
                }
            },
            State {
                name: PageName.icaionPage
                PropertyChanges {
                    target: icaionDelegate
                    Material.foreground: Palette.gallery
                }
            },
            State {
                name: PageName.theFallPage
                PropertyChanges {
                    target: theFallDelegate
                    Material.foreground: Palette.gallery
                }
            }
        ]
    }

    ObjectModel {
        id: drawerMenuElement

        ColumnLayout {
            spacing: 18
            width: menuDrawer.width
            height: 512

            ImageButton {
                id: mystheaDelegate
                disabled: false
                mainColor: Palette.mystheaMain
                backgroundImageSource: "qrc:/assets/images/main_menu/mysthea_button_back.png"
                logoImageSource: "qrc:/assets/images/mysthea_logo.png"
                indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
                onClicked: menuDrawer.mystheaClicked()
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            ImageButton {
                id: icaionDelegate
                disabled: true
                mainColor: Palette.icaionMain
                backgroundImageSource: "qrc:/assets/images/main_menu/icaion_button_back.png"
                logoImageSource: "qrc:/assets/images/icaion_logo.png"
                indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
                onClicked: menuDrawer.icaionClicked()
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            ImageButton {
                id: theFallDelegate
                disabled: true
                mainColor: Palette.thefallMain
                backgroundImageSource: "qrc:/assets/images/main_menu/the_fall_button_back.png"
                logoImageSource: "qrc:/assets/images/the_fall_logo.png"
                indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
                onClicked: menuDrawer.theFallClicked()
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
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

