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
    leftPadding: 54
    bottomPadding: 8

    Material.theme: Material.Dark


    Label {
        id: iconSearch
        anchors.fill: parent
        text: Icon.search
        font.pixelSize: 24
        font.family: "Material Icons"
        color: control.Material.primaryTextColor
        opacity: 0.5
        leftPadding: 16
        rightPadding: 16
        verticalAlignment: control.verticalAlignment
    }

    PlaceholderText {
        id: placeholder
        anchors.left: iconSearch.right
        anchors.fill: parent
        color: control.activeFocus ? control.Material.accentColor : control.Material.primaryTextColor
        verticalAlignment: control.verticalAlignment
    }

    background: Rectangle {
        anchors.fill: control
        color:  control.Material.dialogColor
        radius: 3
    }
}
