import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import Mysthea.Theme 1.0

Page {
    id: root

    signal backClicked

    padding: 8

    property alias currentIndex: _swipeView.currentIndex

    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: Icon.back
                font.pixelSize: 22
                font.family: "Material Icons"

                onClicked: {
                    root.backClicked()
                }
            }

            Text {
                text: root.currentIndex === 0 ? qsTr("Game Setup") : qsTr(
                                                    "Wizard %1 of 3").arg(
                                                    root.currentIndex)
                font.pixelSize: 16
                color: "white"
            }

            Item {
                Layout.fillWidth: true
            }

            ToolButton {
                text: Icon.navigateBefore
                font.pixelSize: 22
                font.family: "Material Icons"

                onClicked: root.currentIndex > 0 ? _swipeView.decrementCurrentIndex(
                                                       ) : root.currentIndex = 0
            }

            ToolButton {
                text: Icon.navigateNext
                font.pixelSize: 22
                font.family: "Material Icons"
                onClicked: root.currentIndex < 3 ? _swipeView.incrementCurrentIndex(
                                                       ) : root.currentIndex = 3
            }

            ToolButton {
                text: Icon.apps
                font.pixelSize: 22
                font.family: "Material Icons"

                onClicked: root.currentIndex = 0
            }
        }
    }

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
