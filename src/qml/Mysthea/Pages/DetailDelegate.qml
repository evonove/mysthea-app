import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import Mysthea.Theme 1.0
import Mysthea.Models 1.0

Pane {
    id: root
    topPadding: 24
    bottomPadding: 24
    leftPadding: 20
    rightPadding: 20
    background: null

    property bool activeInSwipe: false

    BusyIndicator {
        anchors.centerIn: parent
        running: !loader.visible
    }

    //Since DetailDelegate is used in a Repeater it can access to its CardsModel. So we use CardsModel's roles
    //to access a card data.
    Loader {
        id: loader
        anchors.fill: parent
        asynchronous: true
        active: activeInSwipe
        visible: status === Loader.Ready
        sourceComponent: Component {
    Flickable {
        anchors.fill: parent
        contentHeight: _layout.height
        contentWidth: parent.width
        ColumnLayout {
            id: _layout
            width: parent.width
            spacing: 24
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 12
                    Label {
                        text: code
                        font.pixelSize: 32
                        font.letterSpacing: 0.5
                        font.weight: Font.Bold
                        color: {
                            if (command === 1) {
                                return Palette.flamingo
                            } else if (command === 2) {
                                return Palette.goldenFizz
                            } else if (command === 3) {
                                return Palette.apple
                            } else if (command === 4) {
                                return Palette.cerulean
                            } else {
                                return Palette.grayNurse
                            }
                        }
                    }

                    Label {
                        text: "•"
                        font.pixelSize: 24
                        color: Palette.grayNurse
                    }

                    Label {
                        font.pixelSize: 32
                        font.letterSpacing: 0.5

                        text: {
                            if (command !== -1) {
                                return qsTr("Command")
                            } else {
                                return typeText
                            }
                        }
                        color: Palette.grayNurse
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 12
                    visible: !(type === 5 || type === 6)

                    Label {
                        text: qsTr("Era")
                        font.pixelSize: 24
                        font.letterSpacing: 0.5
                        font.weight: Font.Bold
                        color: Palette.grayNurse
                    }

                    Image {
                        fillMode: Image.PreserveAspectFit
                        sourceSize.height: 24
                        source: {
                            if (type === 1) {
                                return "qrc:/assets/icons/era_x.svg"
                            } else if (type === 2) {
                                return "qrc:/assets/icons/era_1.svg"
                            } else if (type === 3) {
                                return "qrc:/assets/icons/era_2.svg"
                            } else if (type === 4) {
                                return "qrc:/assets/icons/era_3.svg"
                            } else {
                                return ""
                            }
                        }
                    }

                    Label {
                        text: "•"
                        font.pixelSize: 24
                        color: Palette.grayNurse
                    }

                    Image {
                        fillMode: Image.PreserveAspectFit
                        sourceSize.height: 24
                        source: {
                            if (command === 1) {
                                return "qrc:/assets/icons/tactic.svg"
                            } else if (command === 2) {
                                return "qrc:/assets/icons/objective.svg"
                            } else if (command === 3) {
                                return "qrc:/assets/icons/accessory.svg"
                            } else if (command === 4) {
                                return "qrc:/assets/icons/upgrade.svg"
                            } else {
                                return ""
                            }
                        }
                    }

                    Label {
                        text: commandText
                        font.pixelSize: 24
                        font.letterSpacing: 0.5
                        font.weight: Font.Bold
                        color: Palette.grayNurse
                    }
                }
            }

            Label {
                text: description
                font.pixelSize: 24
                font.letterSpacing: 0.5
                color: Palette.grayNurse
                wrapMode: Text.Wrap
                Layout.maximumWidth: parent.width
            }
            Image {
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/cards/" + image
                sourceSize.width: width
                Layout.fillWidth: true
            }
        }
    }
        }
    }

}
