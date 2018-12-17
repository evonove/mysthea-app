import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import Mysthea.Theme 1.0

Page {
    id: root
    title: root.currentIndex === 0 ? qsTr("GAME SETUP") : qsTr(
                                         "Wizard %1 of 3").arg(
                                         root.currentIndex)

    property bool hasToolbarLine: false
    property Action leftAction
    property list<Action> rightActions: [
        Action {
            id: beforeAction
            text: Icon.navigateBefore
            onTriggered: root.currentIndex > 0 ? _swipeView.decrementCurrentIndex(
                                                     ) : root.currentIndex = 0
        },
        Action {
            id: nextAction
            text: Icon.navigateNext
            onTriggered: root.currentIndex < 3 ? _swipeView.incrementCurrentIndex(
                                                     ) : root.currentIndex = 3
        },
        Action {
            id: mainAction
            text: Icon.apps
            onTriggered: root.currentIndex = 0
        }
    ]

    property alias currentIndex: _swipeView.currentIndex

    padding: 8
    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    SwipeView {
        id: _swipeView
        currentIndex: 0
        anchors.fill: parent

        Loader {
            asynchronous: true
            sourceComponent: GameSetupMap {
                onStepClicked: root.currentIndex = step
            }
        }

        Repeater {
            model: GameSetupModel {
            }
            Loader {
                asynchronous: true
                active: SwipeView.isCurrentItem || SwipeView.isNextItem
                        || SwipeView.isPreviousItem
                sourceComponent: GameSetupStep {
                    title: model.title
                    mainImageSource: model.image
                    content: model.content
                }
            }
        }
    }
}
