import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import Mysthea.Theme 1.0
import Mysthea.Models 1.0

Page {
    id: root
    title: qsTr("CARD DETAIL")
    property Action leftAction: null
    property bool hasToolbarLine: true

    property CardsModel model: null
    property int index: -1

    padding: 0
    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignBottom
    }

    SwipeView {
        id: _swipeView
        width: root.width
        height: root.height
        topPadding: 56
        currentIndex: root.index

        Repeater {
            model: root.model
            DetailDelegate {
                width: root.width
                height: root.height - _swipeView.topPadding
                clip: true
                activeInSwipe: SwipeView.isPreviousItem
                               || SwipeView.isCurrentItem
                               || SwipeView.isNextItem
            }
        }
    }
}
