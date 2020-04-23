import QtQuick 2.10
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12

import MystheaUniverse.Theme 1.0

Button {
    id: control
    property alias label: textLabel.text
    property alias backgroundImageSource: _backgroundImage.source

    contentItem: Label {
        id: textLabel
        color: "white"
        font.pixelSize: 32
        font.letterSpacing: 0.5
        font.family: "FuturaPTBold"
        topPadding: 0
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
    }

    background: Item {
        Image {
            id: _backgroundImage
            anchors.fill: parent
            anchors.top: parent.top
            fillMode: Image.PreserveAspectCrop
            visible: false
        }

        Desaturate {
            id: _desaturate
            anchors.fill: _backgroundImage
            source: _backgroundImage
            desaturation: enabled ? 0.0 : 1.0
            visible: false
        }

        ColorOverlay {
            id: _colorOverlay
            anchors.fill: _desaturate
            source: _desaturate
            color: enabled ? "#80000000" : "#AA000000"
            visible: false
        }
        OpacityMask {
            anchors.fill: _colorOverlay
            source: _colorOverlay
            maskSource: Rectangle {
                width: _backgroundImage.width
                height: _backgroundImage.height
                radius: 10
            }
        }
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: 10
            border.width: 2
            border.color: "white"
        }
    }
}
