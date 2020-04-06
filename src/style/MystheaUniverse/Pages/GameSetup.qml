import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import Mysthea 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

Page {
    id: root
    title: root.currentIndex === 0 ? qsTr("GAME SETUP") : qsTr( "GAME SETUP - %1 of 11").arg( root.currentIndex)
    objectName: PageName.gameSetupPage
    padding: 0

    property bool hasToolbarLine: true
    property Action leftAction
    property int currentIndex
    property int numberSteps: 0
    property alias sourceComponent: _componentLoader.sourceComponent

    BusyIndicator {
        anchors.centerIn: parent
        running: _componentLoader.status !== Loader.Ready
    }
    Loader {
        id: _componentLoader
        anchors.fill: parent
        asynchronous: true
        visible: _componentLoader.status === Loader.Ready
    }

    footer: Pane {
        width: parent.width
        height: 56
        visible: root.currentIndex >= 1

        PageIndicator {
            anchors.centerIn: parent
            currentIndex: root.currentIndex - 1
            count: root.numberSteps
            visible: root.currentIndex >= 1
        }
    }
}
