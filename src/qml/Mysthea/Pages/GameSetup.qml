import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import Mysthea.Theme 1.0
import Mysthea.Components 1.0

Page {
    id: root
    title: root.currentIndex === 0 ? qsTr("GAME SETUP") : qsTr(
                                         "GAME SETUP - %1 of 11").arg(
                                         root.currentIndex)
    objectName: PageName.gameSetupPage
    padding: 0

    property bool hasToolbarLine: true
    property Action leftAction
    property alias currentIndex: _swipeView.currentIndex

    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    SwipeView {
        id: _swipeView
        currentIndex: 0
        anchors.fill: parent
        clip: true

        Loader {
            asynchronous: true
            sourceComponent: GameSetupMap {
                onStepClicked: root.currentIndex = step
            }
        }

        Repeater {
            id: repeater
            model: GameSetupModel {
                id: _gameSetupModel
                width: root.availableWidth
            }
        }
    }

    footer: Pane {
        width: parent.width
        height: 56
        visible: root.currentIndex >= 1
        background: Rectangle {
            anchors.top: parent.top
            width: parent.width
            height: 1
            color: Palette.white
            opacity: 0.5
        }

        PageIndicator {
            anchors.centerIn: parent
            currentIndex: root.currentIndex - 1
            count: repeater.model.count
            visible: _swipeView.currentIndex >= 1
        }
    }
}
