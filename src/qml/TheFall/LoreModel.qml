import QtQuick 2.14
import QtQml.Models 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0

ObjectModel {
    id: root

    property int width: 100
    property bool asynchronous: true

    // General Setting
    Label {
        width: root.width
        text: qsTr("General Setting")
        color: Palette.white
        font.pixelSize: 32

        topPadding: 20
        rightPadding: 20
        leftPadding: 20
        bottomPadding: 0
    }

}
