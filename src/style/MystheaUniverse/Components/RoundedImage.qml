import QtQuick 2.14
import QtQuick.Controls 2.14

import QtGraphicalEffects 1.12

Item {
    id: _item

    property alias source: _image.source
    property alias fillMode: _image.fillMode
    property alias borderWidth: _border.border.width
    property alias borderRadius: _border.radius

    implicitWidth: _image.implicitWidth
    implicitHeight: _image.implicitHeight

    Image {
        id: _image
        width: _item.width
        height: _item.height
        visible: false
    }

    OpacityMask {
        anchors.fill: _image
        source: _image
        maskSource: Rectangle {
            width: _image.width
            height: _image.height
            radius: 10
        }
    }

    Rectangle {
        id: _border
        anchors.fill: parent
        color: "transparent"
        radius: 10
        border.width: 2
        border.color: "white"
    }
}
