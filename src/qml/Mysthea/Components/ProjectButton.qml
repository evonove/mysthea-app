import QtQuick 2.0
import QtQuick.Controls 2.4

AbstractButton {
    id: root
    property alias imageSource: _backgroundImage.source
    property alias indicatorSource: _indicator.source
    property color mainColor: "white"

    padding: 10

    background: Rectangle {
        color: "transparent"
        radius: 10
        border.width: 2
        border.color: root.mainColor
        Image {
            id: _backgroundImage
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }

    contentItem: Item {
        Image {
            id: _indicator
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            width: 40
            height: 40
            fillMode: Image.PreserveAspectFit
        }
    }
}
