import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Page {
    id: root

    readonly property string apps: "\uE5C3"
    readonly property string menu: "\uE5D2"
    readonly property string navigateBefore: "\uE408"
    readonly property string navigateNext: "\uE409"

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: root.apps
                onClicked: _swipeView.currentIndex = 0
            }
            Text {
                text: _swipeView.currentIndex === 0 ? qsTr("Game Setup") : qsTr(
                                                          "Wizard %1 of 3").arg(
                                                          _swipeView.currentIndex)
                color: "white"
            }

            Item {
                Layout.fillWidth: true
            }

            ToolButton {
                text: root.navigateBefore
                onClicked: _swipeView.currentIndex > 0 ? _swipeView.decrementCurrentIndex() : _swipeView.currentIndex = 0
            }
            ToolButton {
                text: root.navigateNext
                onClicked: _swipeView.currentIndex < 3 ? _swipeView.incrementCurrentIndex() : _swipeView.currentIndex = 3
            }
            ToolButton {
                text: root.menu
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

        Item {
            id: _map
            Text {
                id: _mapText
                text: qsTr("map")
            }

            ColumnLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    id: _firstButton
                    text: qsTr("1")
                    onClicked: {
                        _swipeView.currentIndex = 1
                    }
                }
                Button {
                    id: _secondButton
                    text: qsTr("2")
                    onClicked: {
                        _swipeView.currentIndex = 2
                    }
                }
                Button {
                    id: _thirdButton
                    text: qsTr("3")
                    onClicked: {
                        _swipeView.currentIndex = 3
                    }
                }
            }
        }

        Item {
            id: _first
            Text {
                id: _firstText
                text: qsTr("first")
            }
        }
        Item {
            id: _second
            Text {
                id: _secondText
                text: qsTr("second")
            }
        }
        Item {
            id: _third
            Text {
                id: _thirdText
                text: qsTr("third")
            }
        }
    }
}
