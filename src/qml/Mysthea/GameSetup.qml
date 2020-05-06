import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import MystheaUniverse.Pages 1.0 as MUPages
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0
import Mysthea 1.0 as Mysthea

MUPages.GameSetup {
    id: root
    mainColor: Palette.mystheaMain


    sourceComponent: Component {
        id: _component
        SwipeView {
            id: _swipeView

            BackAction {
                id: _backAction
                onTriggered: root.currentIndex = 0
            }

            property Action leftAction: _swipeView.currentIndex > 0 ? _backAction : null

            currentIndex: root.currentIndex
            anchors.fill: parent
            clip: false

            onLeftActionChanged: {
                root.leftAction = _swipeView.leftAction
            }

            Loader {
                asynchronous: true
                sourceComponent: Mysthea.GameSetupMap {
                    onStepClicked: root.currentIndex = step
                }
            }

            Repeater {
                id: repeater
                model: Mysthea.GameSetupModel {
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
