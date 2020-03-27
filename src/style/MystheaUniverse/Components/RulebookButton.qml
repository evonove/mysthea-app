import QtQuick 2.10
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import MystheaUniverse.Theme 1.0

Button {
    id: control
    height: 24
    property alias iconText: iconLabel.text

    contentItem: RowLayout {
        anchors.fill: parent
        spacing: 12
        Label {
            id: textLabel
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 0.5
            topPadding: 0
            text: control.text
            verticalAlignment: Text.AlignVCenter

            Layout.fillHeight: true

            background: Rectangle {
                anchors.fill: parent
                color: "transparent"

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: Palette.grayNurse
                }
            }
        }

        // Item is used to wrap label and to adjust its position.
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Label {
                // Set anchors offset to align icon with the background's
                // line of text button label.
                id: iconLabel
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 3
                text: control.iconText
                color: Palette.grayNurse
                font.family: "Material Icons"
                font.pixelSize: 24
                padding: 0
            }
        }
    }

    background: Rectangle {
        color: "transparent"
    }
}
