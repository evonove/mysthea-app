import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import MystheaUniverse.Pages 1.0 as MystheaUniverse
import MystheaUniverse.Theme 1.0
import Icaion 1.0 as Icaion

MystheaUniverse.GameSetup {
    id: root
    mainColor: Palette.icaionMain

    sourceComponent: Component {
        id: _component
        SwipeView {
            id: _swipeView
            currentIndex: root.currentIndex
            anchors.fill: parent
            clip: false

            Action {
                id: _backAction
                text: Icon.back
                onTriggered: root.currentIndex = 0
            }

            property Action leftAction: _swipeView.currentIndex > 0 ? _backAction : null

            onLeftActionChanged: {
                root.leftAction = _swipeView.leftAction
            }

            Loader {
                asynchronous: true
                sourceComponent: Icaion.GameSetupMap {
                    onStepClicked: root.currentIndex = step
                }
            }

            Repeater {
                id: repeater
                model: Icaion.GameSetupModel {
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
}

