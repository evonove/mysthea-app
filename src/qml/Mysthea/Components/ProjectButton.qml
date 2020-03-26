import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.impl 2.14

AbstractButton {
    id: root
    property alias backgroundImageSource: _backgroundImage.source
    property alias indicatorImageSource: _indicatorImage.icon.source
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
        IconLabel {
            id: _indicatorImage
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            icon.width: 16
            icon.height: 16
            icon.color: root.mainColor
        }
    }
}
