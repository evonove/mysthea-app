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

    property url cardDetailDelegateUrl: ""

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
                width: root.width
                height: root.height - _swipeView.topPadding
                active: SwipeView.isPreviousItem || SwipeView.isCurrentItem
                        || SwipeView.isNextItem
                asynchronous: true

                Component.onCompleted: {
                    _loader.setSource(root.cardDetailDelegateUrl, {
                                          "commandComboBoxModel": root.commandComboBoxModel,
                                          "typeComboBoxModel": root.typeComboBoxModel,
                                          "cards": model
                                      })
                }
            }
        }
    }
}
