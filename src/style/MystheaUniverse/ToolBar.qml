import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T

import MystheaUniverse.Theme 1.0

T.ToolBar {
    id: control

    property alias separatorColor: _separator.color

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    background: Rectangle {
        implicitHeight: 40
        color: Palette.background

        Rectangle {
            id: _separator
            width: parent.width
            height: 1
            anchors.bottom: parent.bottom
        }
    }
}
