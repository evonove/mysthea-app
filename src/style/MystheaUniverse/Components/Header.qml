import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0

ToolBar {
    id: root
    height: 54

    property alias logo: _image.source
    property Action leftAction
    property Action rightAction

    ToolButton {
        anchors.left: parent.left
        text: qsTr("⋮")
        height: 54
    }
    Image {
        id: _image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }
    ToolButton {
        anchors.right: parent.right
        text: qsTr("⋮")
        height: 54
    }
}
