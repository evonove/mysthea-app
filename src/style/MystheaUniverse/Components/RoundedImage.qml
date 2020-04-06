import QtQuick 2.14
import QtQuick.Controls 2.14

import QtGraphicalEffects 1.12

Rectangle {
    id: root

    property alias source: _image.source
    property alias fillMode: _image.fillMode

    color: "transparent"
    radius: 10
    border.width: 2
    border.color: "white"

    Image {
        id: _image
        anchors.fill: parent
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: _image.width
                height: _image.height
                radius: 10
            }
        }
    }
}
