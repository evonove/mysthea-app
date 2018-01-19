import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Page {
    id: root

    padding: 8

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
