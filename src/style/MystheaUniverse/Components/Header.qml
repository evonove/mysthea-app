import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0

ToolBar {
    id: root
    height: 54

    property alias logo: _image.source
    property alias separatorColor: root.separatorColor
    property Action leftAction
    property Action rightAction

    ToolButton {
        action: root.leftAction
        anchors.left: parent.left

        visible: root.leftAction !== null
        enabled: root.leftAction !== null
    }
    Image {
        id: _image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }
    ToolButton {
        action: root.rightAction
        anchors.right: parent.right

        visible: root.rightAction !== null
        enabled: root.rightAction !== null
    }
}
