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

    clip: true

    property bool hasToolbarLine: true
    property Action leftAction: null
    property int currentIndex
    property int numberSteps: 0
    property alias sourceComponent: _componentLoader.sourceComponent
    property alias mainColor: _pageIndicator.mainColor

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
        height: 72
        visible: root.currentIndex >= 1

        background: Rectangle {
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.6; color: "#000000" }
            }
        }

        PageIndicator {
            id: _pageIndicator
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            currentIndex: root.currentIndex - 1
            count: root.numberSteps
            visible: root.currentIndex >= 1
        }
    }
}
