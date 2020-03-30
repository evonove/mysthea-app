import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0

Page {
    id: root
    title: qsTr("CARDS REFERENCE")
    objectName: PageName.cardPage
    property Action leftAction: null
    property bool hasToolbarLine: true
    property color searchFieldBorderColor

    property alias sourceComponent: _contentLoader.sourceComponent

    background: Rectangle {
        color: Palette.black
    }

    BusyIndicator {
        anchors.centerIn: parent
        running: _contentLoader.status !== Loader.Ready
    }

    Loader {
        id: _contentLoader
        anchors.fill: parent
        asynchronous: true
    }
}
