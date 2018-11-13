import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Page {
    id: root
    padding: 8

    readonly property string apps: "\uE5C3"
    readonly property string menu: "\uE5D2"
    readonly property string navigateBefore: "\uE408"
    readonly property string navigateNext: "\uE409"

    property alias currentIndex: _swipeView.currentIndex

    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                text: root.apps
                font.pixelSize: 22
                font.family: "Material Icons"
                onClicked: root.currentIndex = 0
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
                text: root.navigateBefore
                font.pixelSize: 22
                font.family: "Material Icons"

                onClicked: root.currentIndex > 0 ? _swipeView.decrementCurrentIndex(
                                                       ) : root.currentIndex = 0
            }
            ToolButton {
                text: root.navigateNext
                font.pixelSize: 22
                font.family: "Material Icons"
                onClicked: root.currentIndex < 3 ? _swipeView.incrementCurrentIndex(
                                                       ) : root.currentIndex = 3
            }
            ToolButton {
                text: root.menu
                font.pixelSize: 22
                font.family: "Material Icons"
                onClicked: _mainStackView.pop()
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
