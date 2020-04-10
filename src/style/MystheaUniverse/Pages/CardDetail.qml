import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0
import Mysthea.Models 1.0

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

        Repeater {
            id: _repeater
            model: root.model

            Loader {
                id: _loader
                property var modelCards: model

                width: root.width
                height: root.height - _swipeView.topPadding
                asynchronous: true

                sourceComponent: root.sourceComponent
            }
        }
    }
}
