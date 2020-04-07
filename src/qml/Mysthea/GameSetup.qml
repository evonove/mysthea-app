import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import MystheaUniverse.Pages 1.0
import Mysthea 1.0 as Mysthea

GameSetup {
    id: root

    // Here I have to set z to a negative value
    // otherwise the SwipeView with clip: false
    // gets rendered on top of other pages
    z: -10

    sourceComponent: Component {
        id: _component
        SwipeView {
            id: _swipeView
            currentIndex: root.currentIndex
            anchors.fill: parent
            clip: false

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
