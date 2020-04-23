import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import MystheaUniverse.Theme 1.0

Button {
    id: control
    //We use this property to take the y value of root page's container to draw correctly
    //the FastBlur in Button.
    property real containerY
    //We use this property to take the sourceItem that we have to Blur in Button.
    property alias sourceItem: effectSourceCard.sourceItem

    font.pixelSize: 24
    font.family: "FuturaPTMedium"
    font.letterSpacing: 1.5

    padding: 0
    implicitHeight: 55
    implicitWidth: 311

    contentItem: Label {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Image.AlignVCenter

        font: control.font
        text: control.text

        color: Palette.snuff
        opacity: control.pressed || !control.enabled ? 0.32 : 1
    }

    background: Item {

        ShaderEffectSource {
            id: effectSourceCard
            anchors.fill: parent
            sourceRect: Qt.rect(control.x, control.containerY + control.y,
                                control.width, control.height)
        }

        FastBlur {
            anchors.fill: effectSourceCard
            source: effectSourceCard
            radius: 32
        }

        Rectangle {
            anchors.fill: parent
            color: Palette.white
            opacity: 0.2
        }
    }
}
