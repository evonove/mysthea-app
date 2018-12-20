
import QtQuick 2.11
import QtQuick.Controls.Material 2.4
import Mysthea.Theme 1.0

Rectangle {
    implicitWidth: 16
    implicitHeight: 16
    radius: width / 2
    border.width: 2
    border.color: !control.enabled ? control.Material.hintTextColor
        : control.checked || control.down ? Palette.gallery : Palette.silverChalice
    color: "transparent"

    property Item control

    Rectangle {
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 8
        height: 8
        radius: width / 2
        color: parent.border.color
        visible: control.checked || control.down
    }
}
