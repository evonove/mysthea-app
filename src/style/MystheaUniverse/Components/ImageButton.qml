import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.impl 2.14
import QtGraphicalEffects 1.12

AbstractButton {
    id: root
    property alias backgroundImageSource: _backgroundImage.source
    property alias indicatorImageSource: _indicatorImage.icon.source
    property alias logoImageSource: _logoImage.source
    property alias label: _label.text
    property color mainColor: "white"
    property bool disabled: false

    padding: 18

    background: Item {
        id: _item
        Image {
            id: _backgroundImage
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            visible: false
        }

        Desaturate {
            id: _desaturate
            anchors.fill: _backgroundImage
            source: _backgroundImage
            desaturation: disabled ? 1.0 : 0.0
            visible: false
        }

        OpacityMask {
            anchors.fill: _desaturate
            source: _desaturate
            maskSource: Rectangle {
                width: _desaturate.width
                height: _desaturate.height
                radius: 10
            }
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
        Label {
            id: _label
            color: "white"
            font.pixelSize: 25
            font.family: "FuturaPTBold"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }
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
