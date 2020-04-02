import QtQuick 2.10
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import MystheaUniverse.Theme 1.0

Button {
    id: control
    property alias label: textLabel.text
    property alias backgroundImageSource: _backgroundImage.source

    contentItem: Label {
        id: textLabel
        color: Palette.grayNurse
        font.pixelSize: 20
        font.letterSpacing: 0.5
        topPadding: 0
        verticalAlignment: Text.AlignVCenter
        anchors.fill: parent
    }

    background: Image {
        id: _backgroundImage
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }
}
