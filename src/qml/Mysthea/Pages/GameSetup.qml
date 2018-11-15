import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Page {
    id: root
    padding: 8

    property alias currentIndex: _swipeView.currentIndex

    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: _backButton

                readonly property string backIcon: "\uE5C4"

                text: _backButton.backIcon
                font.pixelSize: 22
                font.family: "Material Icons"

                visible: _mainStackView.depth > 1
                opacity: visible ? 1 : 0

                onClicked: {
                    if (_mainStackView.depth > 1) {
                        _mainStackView.pop()
                    }
                }

                Behavior on opacity {
                    PropertyAnimation {
                        duration: 200
                    }
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
                id: _beforeButton
                readonly property string navigateBefore: "\uE408"

                text: _beforeButton.navigateBefore
                font.pixelSize: 22
                font.family: "Material Icons"

                onClicked: root.currentIndex > 0 ? _swipeView.decrementCurrentIndex(
                                                       ) : root.currentIndex = 0
            }

            ToolButton {
                id: _nextButton
                readonly property string navigateNext: "\uE409"

                text: _nextButton.navigateNext
                font.pixelSize: 22
                font.family: "Material Icons"
                onClicked: root.currentIndex < 3 ? _swipeView.incrementCurrentIndex(
                                                       ) : root.currentIndex = 3
            }

            ToolButton {
                id: _appsButton
                readonly property string apps: "\uE5C3"

                text: _appsButton.apps
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
