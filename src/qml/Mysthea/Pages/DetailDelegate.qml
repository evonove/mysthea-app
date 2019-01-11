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

    property string code
    property int type
    property string typeText
    property int command
    property string commandText
    property string image
    property string backImage
    property string description

    Flickable {
        anchors.fill: parent
        contentHeight: _layout.height + _frontImageLoader.height + _backImageLoader.height + 24
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
                            switch (root.command) {
                                case 1: return Palette.flamingo;
                                case 2: return Palette.goldenFizz;
                                case 3: return Palette.apple;
                                case 4: return Palette.cerulean;
                                default: return Palette.grayNurse;
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
                            if (root.command !== -1) {
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
                    // Era text must only be visible for Command cards
                    visible: root.type >= 1 && root.type <= 4

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
                            switch (root.type) {
                                case 1: return "qrc:/assets/icons/era_x.svg";
                                case 2: return "qrc:/assets/icons/era_1.svg";
                                case 3: return "qrc:/assets/icons/era_2.svg";
                                case 4: return  "qrc:/assets/icons/era_3.svg";
                                default: return "";
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
                            switch (root.command) {
                                case 1: return "qrc:/assets/icons/tactic.svg";
                                case 2: return "qrc:/assets/icons/objective.svg";
                                case 3: return "qrc:/assets/icons/accessory.svg";
                                case 4: return "qrc:/assets/icons/upgrade.svg";
                                default: return "";
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
                text: description
                font.pixelSize: 24
                font.letterSpacing: 0.5
                color: Palette.grayNurse
                wrapMode: Text.Wrap

                Layout.maximumWidth: parent.width
            }
        }

        // Card's image, Attunements and Encounters are rotated since they're stored
        // vertically but should be read horizontally
        Loader {
            id: _frontImageLoader
            anchors.top: _layout.bottom
            anchors.topMargin: 24
            asynchronous: true
            width: root.type === 6 || root.type === 7 ? undefined : parent.width
            height: root.type === 6 || root.type === 7 ? parent.width : undefined

            sourceComponent: Component {
                Image {
                    id: _cardImage
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/cards/" + root.image

                    property list<QtObject> rotationTransform: [
                        // Rotates image 90 degrees clockwise, then moves it to the right
                        Rotation { origin.x: 0; origin.y: 0; angle: 90 },
                        Translate { x: height }
                    ]

                    transform: root.type === 6 || root.type === 7 ? rotationTransform : []
                }
            }
        }

        // Encounter cards are front and back so we must show both
        Loader {
            id: _backImageLoader
            anchors.top: _frontImageLoader.bottom
            anchors.topMargin: 24
            active: root.backImage.length > 0
            asynchronous: true
            height: active ? parent.width : 0

            sourceComponent: Component {
                Image {
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/cards/" + root.backImage

                    transform: [
                        // Rotates image 90 degrees clockwise, then moves it to the right
                        Rotation { origin.x: 0; origin.y: 0; angle: 90 },
                        Translate { x: _layout.width; y: width - height }
                    ]
                }
            }
        }
    }
}
