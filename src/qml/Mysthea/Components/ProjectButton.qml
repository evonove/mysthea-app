import QtQuick 2.0
import QtQuick.Controls 2.4

AbstractButton {
    id: root
    property alias backgroundImageSource: _backgroundImage.source
    property alias indicatorImageSource: _indicatorImage.source
    property alias logoImageSource: _logoImage.source
    property color mainColor: "white"

    padding: 18

    background: Item {
        Image {
            id: _backgroundImage
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
        Image {
            id: _logoImage
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: 10
            border.width: 2
            border.color: root.mainColor
        }
    }

    contentItem: Item {
        Image {
            id: _indicatorImage
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            smooth: false
            sourceSize.width: 16
            sourceSize.height: 16
        }
    }
}
