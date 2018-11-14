import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Page {
    id: root

    padding: 8
    header: ToolBar {

        // Back button shown only if there is more than a page in the StackView
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

        Image {
            anchors.centerIn: parent
            sourceSize.height: 48
            source: "qrc:/images/logo.png"
        }
    }


    property var model: null
    property int index: -1

    SwipeView {
        id: _swipeView
        anchors.fill: parent
        currentIndex: root.index

        Repeater {
            model: root.model

            Loader {
                active: SwipeView.isPreviousItem || SwipeView.isCurrentItem || SwipeView.isNextItem
                asynchronous: true

                sourceComponent: DetailDelegate {
                    code: model.code
                    type: model.type
                    category: model.category
                    image: model.image
                    description: model.description
                }
            }
        }
    }
}
