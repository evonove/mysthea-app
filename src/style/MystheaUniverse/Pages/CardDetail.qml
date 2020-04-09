import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import MystheaUniverse.Components 1.0
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

    padding: 0
    background: Rectangle {
        color: Palette.black
    }

    SwipeView {
        id: _swipeView
        anchors.fill: parent
        currentIndex: root.index

        Repeater {
            id: _repeater
            model: root.model

            Loader {
                width: root.width
                height: root.height - _swipeView.topPadding
                active: SwipeView.isPreviousItem || SwipeView.isCurrentItem
                        || SwipeView.isNextItem
                asynchronous: true

                sourceComponent: Component {
                    CardDetailDelegate {
                        commandComboBoxModel: root.commandComboBoxModel
                        typeComboBoxModel: root.typeComboBoxModel

                        cards: model
                    }
                }
            }
        }
    }
}