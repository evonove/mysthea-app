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

    property string code: ""
    property int type: -1
    property string typeText: ""
    property int command: -1
    property string commandText: ""
    property string image: ""
    property string description: ""

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
                        text: root.code
                        font.pixelSize: 32
                        font.letterSpacing: 0.5
                        font.weight: Font.Bold
                        color: {
                            if (root.command === 1) {
                                return Palette.flamingo
                            } else if (root.command === 2) {
                                return Palette.goldenFizz
                            } else if (root.command === 3) {
                                return Palette.apple
                            } else if (root.command === 4) {
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
                            if (root.command != -1) {
                                return qsTr("Command")
                            } else {
                                return root.typeText
                            }
                        }
                        color: Palette.grayNurse
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 12
                    visible: !(root.type === 5
                               || root.type === 6)

                    Label {
                        text: qsTr("Era")
                        font.pixelSize: 24
                        font.letterSpacing: 0.5
                        font.weight: Font.Bold
                        color: Palette.grayNurse
                    }

                    Image {
                        fillMode: Image.PreserveAspectFit
                        source: {
                            if (root.type === 1) {
                                return "qrc:/assets/icons/era_x.svg"
                            } else if (root.type === 2) {
                                return "qrc:/assets/icons/era_1.svg"
                            } else if (root.type === 3) {
                                return "qrc:/assets/icons/era_2.svg"
                            } else if (root.type === 4) {
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
                        source: {
                            if (root.command === 1) {
                                return "qrc:/assets/icons/tactic.svg"
                            } else if (root.command === 2) {
                                return "qrc:/assets/icons/objective.svg"
                            } else if (root.command === 3) {
                                return "qrc:/assets/icons/accessory.svg"
                            } else if (root.command === 4) {
                                return "qrc:/assets/icons/upgrade.svg"
                            } else {
                                return ""
                            }
                        }
                    }

                    Label {
                        text: root.commandText
                        font.pixelSize: 24
                        font.letterSpacing: 0.5
                        font.weight: Font.Bold
                        color: Palette.grayNurse
                    }
                }
            }

            Label {
                text: root.description
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
