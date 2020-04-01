import QtQuick 2.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.14
import QtQuick.Layouts 1.14
import QtQml.Models 2.14

import Mysthea 1.0 as M
import MystheaUniverse.Pages 1.0
import MystheaUniverse.Theme 1.0
import Translations 1.0

Drawer {
    id: root

    property alias activeBackgroundImageSource: _activeBackground.backgroundImageSource
    property alias activeLogoImageSource: _activeBackground.logoImageSource
    property alias activeColor: _activeBorder.color
    property alias mystheaButtonVisible: mystheaDelegate.visible
    property alias icaionButtonVisible: icaionDelegate.visible
    property alias theFallButtonVisible: theFallDelegate.visible

    signal mystheaClicked
    signal icaionClicked
    signal theFallClicked

    bottomPadding: 24

    background: Rectangle {
        width: root.width
        height: root.height
        color: Palette.mineShaft
    }

    M.LanguageListModel {
        id: _languageListModel
    }

    ObjectModel {
        id: drawerMenuElement

        ImageButton {
            id: _activeBackground
            disabled: false
            rounded: false
            withBorder: false
            width: parent.width
            height: 150
        }
        Rectangle {
            id: _activeBorder
            width: root.width
            height: 1
            opacity: 1
        }

        ColumnLayout {
            spacing: 1
            width: root.width
            height: 256

            ImageButton {
                id: mystheaDelegate
                disabled: true
                rounded: true

                mainColor: Palette.mystheaMain
                onClicked: {
                    root.close()
                    root.mystheaClicked()
                }
                backgroundImageSource: "qrc:/assets/images/main_menu/mysthea_button_back.png"
                indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
                logoImageSource: "qrc:/assets/images/mysthea_logo.png"

                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 8
            }
            ImageButton {
                id: icaionDelegate
                disabled: true
                rounded: true

                mainColor: Palette.icaionMain
                onClicked: {
                    root.close()
                    root.icaionClicked()
                }
                backgroundImageSource: "qrc:/assets/images/main_menu/icaion_button_back.png"
                indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
                logoImageSource: "qrc:/assets/images/icaion_logo.png"

                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 8
            }
            ImageButton {
                id: theFallDelegate
                disabled: true
                rounded: true

                mainColor: Palette.theFallMain
                onClicked: {
                    root.close()
                    root.theFallClicked()
                }
                backgroundImageSource: "qrc:/assets/images/main_menu/the_fall_button_back.png"
                indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
                logoImageSource: "qrc:/assets/images/the_fall_logo.png"

                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 8
            }
        }
        Rectangle {
            width: root.width
            height: 1
            color: Palette.white
            opacity: 0.5
        }
        ItemDelegate {
            id: languageItemDelegate
            checkable: true
            width: root.width
            height: 64
            topPadding: 21

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
            width: root.width
            height: 1
            color: Palette.white
            opacity: 0.5
        }
        ColumnLayout {
            id: _layout
            width: root.width
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

