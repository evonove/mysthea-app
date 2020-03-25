import QtQuick 2.11
import QtQuick.Templates 2.4
import QtQuick.Controls.Material 2.4
import MystheaUniverse.Theme 1.0
import Mysthea.Components 1.0

RadioButton {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             Math.max(contentItem.implicitHeight,
                                      indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    spacing: 12
    padding: 0
    bottomPadding: 12

    indicator: RadioIndicatorLanguage {
        x: text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        control: control
    }

    contentItem: Text {
        padding: 0
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: control.checked ? Palette.gallery : Palette.silverChalice
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }
}
