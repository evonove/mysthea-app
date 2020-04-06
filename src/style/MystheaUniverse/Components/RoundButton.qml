import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Material.impl 2.4
import MystheaUniverse.Theme 1.0

T.Button {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    // external vertical padding is 6 (to increase touch area)
    padding: 12
    leftPadding: padding - 4
    rightPadding: padding - 4
    spacing: 6
    font.pixelSize: 32
    font.weight: Font.Bold

    icon.width: 24
    icon.height: 24
    icon.color: !enabled ? Material.hintTextColor :
        flat && highlighted ? Material.accentColor :
        highlighted ? Material.primaryHighlightedTextColor : Material.foreground

    Material.elevation: 0
    Material.background: flat ? "transparent" : undefined

    contentItem: IconLabel {
        topPadding: 12
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: "white"
    }

    background: Rectangle {
        implicitWidth: 52
        implicitHeight: 52

        // external vertical padding is 6 (to increase touch area)
        y: 6
        width: parent.width
        height: parent.height
        radius: width / 2
        color:  Qt.hsla(Palette.black.hslHue, Palette.black.hslSaturation, Palette.black.hslLightness, 0.55)
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            border.color: Palette.snuff
            border.width: 4
            radius: width/2
        }


        // The layer is disabled when the button color is transparent so you can do
        // Material.background: "transparent" and get a proper flat button without needing
        // to set Material.elevation as well
        layer.enabled: control.enabled && control.Material.buttonColor.a > 0
        layer.effect: ElevationEffect {
            elevation: control.Material.elevation
        }

        Ripple {
            clipRadius: width / 2
            width: parent.width
            height: parent.height
            pressed: control.pressed
            anchor: control
            active: control.down || control.visualFocus || control.hovered
            color: control.Material.rippleColor
        }
    }
}


