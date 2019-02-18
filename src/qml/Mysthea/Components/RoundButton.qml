import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import Mysthea.Theme 1.0

Button {
    id: control
    //We use this property to take the y value of root page's container to draw correctly
    //the FastBlur in Button.
    property real containerY

    font.pixelSize: 27
    font.family: "Yanone Kaffeesatz"
    font.letterSpacing: 1.5
    font.bold: true

    padding: 0
    implicitHeight: 52
    implicitWidth: 52

    contentItem: Label {
        topPadding: 5
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Image.AlignVCenter

        font: control.font
        text: control.text

        color: Palette.snuff
        opacity: control.pressed || !control.enabled ? 0.7 : 1
    }

    background: Item {

        Rectangle {
            id: rect
            height: 52
            width: 52
            opacity: 0.2
            radius: width/2
            color: Palette.snuff
        }

        Rectangle {
            id: borderRect
            height: 52
            width: 52
            radius: width/2
            color: "transparent"
            border.color: Palette.snuff
            border.width: 4
        }
    }
}
