import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQml.Models 2.12
import QtGraphicalEffects 1.12

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

ObjectModel {
    id: root
    property int width: 100

    Flickable {
        contentWidth: root.width
        contentHeight: step1.height

        ColumnLayout {
            id: step1
            width: parent.width
            spacing: 20

            RoundedImage {
                source: "qrc:/assets/images/game_setup/icaion/setup01.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 20
            }

            DropCapLabel {
                dropLetter: "1"
                otherText: qsTr("Place the Game Board and the Event Board in the center of the table, one next to the other")
                color: Palette.icaionLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
            }

            Label {
                text: qsTr("Flip the Event Board to the side corresponding to the number of players. Place all Qoam crystals and Parasites in a common pool near the Event Board.")
                color: Palette.grayNurse
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.topMargin: 10
            }
            Label {
                text: qsTr("<strong style=\"color: #C3DDE2;\">Note:</strong> Consider Qoam crystals and Parasites miniatures as infinite. In the rare case that a specific component supply is depleted, use other components as a temporary replacement.")
                color: Palette.grayNurse
                font.pixelSize: 14
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.1

                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: 20
                Layout.bottomMargin: 20
                Layout.topMargin: 10
            }

            RoundedImage {
                source: "qrc:/assets/images/game_setup/icaion/setup01b.jpg"
                fillMode: Image.PreserveAspectFit
                width: root.width
                borderWidth: 1
                Layout.fillWidth: true
                Layout.leftMargin: 20
                Layout.rightMargin: Layout.leftMargin
                Layout.topMargin: 10
            }

        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step2.height
        ColumnLayout {
            id: step2
            width: parent.width
            spacing: 20
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step3.height
        ColumnLayout {
            id: step3
            width: parent.width
            spacing: 20
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step4.height
        ColumnLayout {
            id: step4
            width: parent.width
            spacing: 20
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step5.height
        ColumnLayout {
            id: step5
            width: parent.width
            spacing: 20
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step6.height
        ColumnLayout {
            id: step6
            width: parent.width
            spacing: 20
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step7.height
        ColumnLayout {
            id: step7
            width: parent.width
            spacing: 20
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step8.height
        ColumnLayout {
            id: step8
            width: parent.width
            spacing: 20
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step9.height
        ColumnLayout {
            id: step9
            width: parent.width
            spacing: 20
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step10.height
        ColumnLayout {
            id: step10
            width: parent.width
            spacing: 20
        }
    }

    Flickable {
        contentWidth: root.width
        contentHeight: step11.height
        ColumnLayout {
            id: step11
            width: parent.width
            spacing: 20
        }
    }
}

