import QtQuick 2.11
import QtQuick.Templates 2.4
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.3

import Mysthea.Theme 1.0

TextField {
    id: control

    implicitHeight: 48
    topPadding: 8
    leftPadding: padding + 4 + 50
    bottomPadding: 8

    color: Palette.black

    RowLayout {
        anchors.fill: parent
        Label {
            text: Icon.search
            font.pixelSize: 24
            font.family: "Material Icons"
            color: Palette.black
            opacity: 0.5
            verticalAlignment: control.verticalAlignment
            Layout.leftMargin: 16
            Layout.rightMargin: 16
        }

        PlaceholderText {
            id: placeholder
            color: Palette.black
            verticalAlignment: control.verticalAlignment
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    background: Rectangle {
        anchors.fill: control
        color: Palette.white
        radius: 3
    }
}
