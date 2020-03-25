import QtQuick 2.11
import QtQuick.Controls 2.3

import Mysthea.Theme 1.0

ToolBar {
    id: root
    height: 54

    property alias logo: _image.source

    Image {
        id: _image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
    }
    ToolButton {
        anchors.right: parent.right
        text: qsTr("⋮")
    }
}
