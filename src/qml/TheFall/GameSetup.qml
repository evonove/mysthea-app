import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Pages 1.0 as MUPages
import MystheaUniverse.Components 1.0 as MUComponents
import MystheaUniverse.Theme 1.0
import TheFall 1.0 as TheFall

MUPages.GameSetup {
    id: root
    mainColor: Palette.theFallMain

    sourceComponent: Component {
        id: _component
        SwipeView {
            id: _swipeView
            currentIndex: root.currentIndex
            anchors.fill: parent
            clip: false

            MUComponents.BackAction {
                id: _backAction
                onTriggered: root.currentIndex = 0
            }

            property Action leftAction: _swipeView.currentIndex > 0 ? _backAction : null

            onLeftActionChanged: {
                root.leftAction = _swipeView.leftAction
            }

            Loader {
                asynchronous: true
                sourceComponent: TheFall.GameSetupMap {
                    onStepClicked: root.currentIndex = step
                }
            }

            Repeater {
                id: repeater
                model: TheFall.GameSetupModel {
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

