import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import Mysthea.Theme 1.0

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
