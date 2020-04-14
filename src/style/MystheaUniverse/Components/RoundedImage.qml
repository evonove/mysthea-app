import QtQuick 2.14
import QtQuick.Controls 2.14

import QtGraphicalEffects 1.12

Item {
    id: _item

    property alias source: _image.source
    property alias fillMode: _image.fillMode
    property alias borderWidth: _border.border.width
    property int borderRadius: 10

    implicitWidth: _image.implicitWidth
    implicitHeight: _image.implicitHeight

    Image {
        id: _image
        width: _item.width
        height: _item.height
        visible: false
        asynchronous: true
    }

    OpacityMask {
        anchors.fill: _image
        source: _image
        maskSource: Rectangle {
            width: _image.width
            height: _image.height
            radius: _item.borderRadius
        }
    }

    Rectangle {
        id: _border
        anchors.fill: parent
        color: _image.status === Image.Ready ? "transparent" : "dimgray"
        opacity: _image.status === Image.Ready ? 1 : 0.5
        radius: _item.borderRadius
        border.width: 2
        border.color: "white"
    }
}
