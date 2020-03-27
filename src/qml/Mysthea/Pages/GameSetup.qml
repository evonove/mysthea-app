import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

Page {
    id: root
    title: root.currentIndex === 0 ? qsTr("GAME SETUP") : qsTr(
                                         "GAME SETUP - %1 of 11").arg(
                                         root.currentIndex)
    objectName: PageName.gameSetupPage
    padding: 0

    property bool hasToolbarLine: true
    property Action leftAction
    property int currentIndex
    property int numberSteps: 0

    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    BusyIndicator {
        anchors.centerIn: parent
        running: _componentLoader.status !== Loader.Ready
    }
    Loader {
        id: _componentLoader
        anchors.fill: parent
        asynchronous: true
        sourceComponent: _component
        visible: _componentLoader.status === Loader.Ready
    }

    Component {
        id: _component

        SwipeView {
            id: _swipeView
            currentIndex: root.currentIndex
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
                    Component.onCompleted: {
                        root.numberSteps = _gameSetupModel.count
                    }
                }
            }

            onCurrentIndexChanged: {
                root.currentIndex = currentIndex
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
            count: root.numberSteps
            visible: root.currentIndex >= 1
        }
    }
}
