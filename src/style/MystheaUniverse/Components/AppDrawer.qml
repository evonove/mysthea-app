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

    property alias activeBackgroundImageSource: _activeBackgroundImage.source
    property alias activeLogoImageSource: _activeLogoImage.source
    property alias activeColor: _activeBorder.color
    property alias mystheaButtonVisible: mystheaDelegate.visible
    property alias icaionButtonVisible: icaionDelegate.visible
    property alias theFallButtonVisible: theFallDelegate.visible

    signal mystheaClicked
    signal icaionClicked
    signal theFallClicked

    bottomPadding: 24

    Button {
        id: _closeButton
        height: 54
        width: 54
        x: root.width
        y: 0

        icon.source: "qrc:/assets/icons/drawer_close_icon.svg"
        icon.color: Palette.white
        icon.width: 54
        icon.height: 54

        background: Rectangle {
            color: Palette.black
            Rectangle {
                anchors.bottom: parent.bottom
                color: Palette.white
                width: parent.width
                height: 1
            }
        }

        onClicked: root.close()
    }

    M.LanguageListModel {
        id: _languageListModel
    }

    ObjectModel {
        id: drawerMenuElement

        Item {
            width: parent.width
            height: 135

            Image {
                id: _activeBackgroundImage
                fillMode: Image.PreserveAspectCrop
                anchors.fill: parent
            }
            Image {
                id: _activeLogoImage
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
            Rectangle {
                id: _activeBorder
                width: root.width
                anchors.bottom: parent.bottom
                height: 2
                opacity: 1
            }
        }

        Pane {
            width: root.width
            topPadding: 14
            leftPadding: 18
            rightPadding: 18
            bottomPadding: 32

            ColumnLayout {
                spacing: 14
                anchors.fill: parent

                ImageButton {
                    id: mystheaDelegate
                    disabled: true

                    mainColor: Palette.mystheaMain
                    onClicked: {
                        root.close()
                        root.mystheaClicked()
                    }
                    backgroundImageSource: "qrc:/assets/images/main_menu/mysthea_button_back.png"
                    indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
                    logoImageSource: "qrc:/assets/images/mysthea_logo.png"

                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredHeight: 100
                    Layout.fillWidth: true
                }
                ImageButton {
                    id: icaionDelegate
                    disabled: true

                    mainColor: Palette.icaionMain
                    onClicked: {
                        root.close()
                        root.icaionClicked()
                    }
                    backgroundImageSource: "qrc:/assets/images/main_menu/icaion_button_back.png"
                    indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
                    logoImageSource: "qrc:/assets/images/icaion_logo.png"

                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredHeight: 100
                    Layout.fillWidth: true
                }
                ImageButton {
                    id: theFallDelegate
                    disabled: true

                    mainColor: Palette.theFallMain
                    onClicked: {
                        root.close()
                        root.theFallClicked()
                    }
                    backgroundImageSource: "qrc:/assets/images/main_menu/the_fall_button_back.png"
                    indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
                    logoImageSource: "qrc:/assets/images/the_fall_logo.png"

                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredHeight: 100
                    Layout.fillWidth: true
                }
            }
        }

        Rectangle {
            width: root.width
            height: 2
            color: Palette.white
        }
        ItemDelegate {
            id: languageItemDelegate
            checkable: true
            width: root.width
            height: 52
            topPadding: 14

            contentItem: ColumnLayout {
                id: content
                spacing: 25
                RowLayout {
                    Layout.fillWidth: true
                    implicitHeight: 64
                    spacing: 16
                    Row {
                        Layout.fillWidth: true
                        Label {
                            id: labelLanguage
                            text: qsTr("Language - ")
                            font.family: "FuturaPTBold"
                            color: Palette.gallery
                        }

                        Label {
                            text: {
                                // Find name of current language
                                for (var i = 0; i < _languageListModel.count; i++) {
                                    var element = _languageListModel.get(i)
                                    if (element.translation
                                            === TranslationsManager.currentLanguage) {
                                        return element.language
                                    }
                                }
                            }
                            opacity: 0.5
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
            height: 2
            color: Palette.white
        }
        ColumnLayout {
            id: _layout
            width: root.width
            spacing: 8
            Label {
                text: qsTr("Game created and produced by")
                font.letterSpacing: 0.5
                font.pixelSize: 12
                topPadding: 24
                leftPadding: 16
                Layout.fillWidth: true
                color: Palette.white
            }
            Image {
                id: tabulaLogo
                source: "qrc:/assets/icons/tabula-logo.svg"
                sourceSize.width: 82

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
                font.pixelSize: 12
                topPadding: 8
                leftPadding: 16
                Layout.fillWidth: true
                color: Palette.white
            }
            Image {
                id: evonoveLogo
                Layout.leftMargin: 16
                source: "qrc:/assets/icons/evonove-logo.svg"
                sourceSize.width: 82
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
