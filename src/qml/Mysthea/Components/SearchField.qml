import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Templates 2.4
import QtQuick.Layouts 1.3
import Mysthea.Theme 1.0

TextField {
    id: control

    implicitWidth: Math.max(
                       background ? background.implicitWidth : 0,
                                    placeholderText ? placeholder.implicitWidth
                                                      + leftPadding + rightPadding : 0)
                   || contentWidth + leftPadding + rightPadding
    implicitHeight: 48
    padding: 6
    leftPadding: padding + 4 + 50

    color: control.palette.text
    selectionColor: control.palette.highlight
    selectedTextColor: control.palette.highlightedText
    verticalAlignment: TextInput.AlignVCenter

    RowLayout {
        anchors.fill: parent
        Label {
            text: Icon.search
            font.pixelSize: 24
            font.family: "Material Icons"
            color: Palette.black
            opacity: 0.5

            Layout.leftMargin: 16
            Layout.rightMargin: 16
            horizontalAlignment: Text.AlignHCenter
        }

        PlaceholderText {
            id: placeholder
            x: control.leftPadding
            y: control.topPadding
            width: control.width - (control.leftPadding + control.rightPadding)
            height: control.height - (control.topPadding + control.bottomPadding)

            text: control.placeholderText
            font: control.font
            opacity: 0.5
            color: control.color
            verticalAlignment: control.verticalAlignment
            visible: !control.length && !control.preeditText
                     && (!control.activeFocus
                         || control.horizontalAlignment !== Qt.AlignHCenter)
            elide: Text.ElideRight
            renderType: control.renderType

            Layout.fillWidth: true
        }
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        radius: 3
        border.width: control.activeFocus ? 2 : 1
        color: control.palette.base
        border.color: control.activeFocus ? control.palette.highlight : control.palette.mid
    }
}
