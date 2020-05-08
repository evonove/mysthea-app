import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0
import MystheaUniverse.Models 1.0

Page {
    id: root
    title: qsTr("CARD DETAIL")
    property Action leftAction: null

    property CommandComboBoxModel commandComboBoxModel: null
    property TypeComboBoxModel typeComboBoxModel: null
    property CardsProxyModel model: null
    property int index: -1
    property Component sourceComponent

    padding: 0

    SwipeView {
        id: _swipeView
        anchors.fill: parent
        currentIndex: root.index
        clip: true

        Repeater {
            id: _repeater
            model: root.model

            Loader {
                id: _loader
                property var modelCards: model

                width: root.width
                height: root.height - _swipeView.topPadding
                asynchronous: true
                active: SwipeView.isCurrentItem || SwipeView.isNextItem
                        || SwipeView.isPreviousItem

                sourceComponent: root.sourceComponent

                BusyIndicator {
                    anchors.centerIn: parent
                    running: _loader.status !== Loader.Ready
                }
            }
        }
    }
}
