import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import Mysthea.Theme 1.0

Page {
    id: root

    signal backClicked

    padding: 8
    header: ToolBar {

        // Back button shown only if there is more than a page in the StackView
        ToolButton {
            text: Icon.back
            font.pixelSize: 22
            font.family: "Material Icons"

            onClicked: {
                root.backClicked()
            }
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
                active: SwipeView.isPreviousItem || SwipeView.isCurrentItem
                        || SwipeView.isNextItem
                asynchronous: true

                sourceComponent: DetailDelegate {
                    code: modelData.code
                    type: modelData.type
                    image: modelData.image
                    description: modelData.description
                }
            }
        }
    }
}
