import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import Mysthea.Theme 1.0
import Mysthea.Models 1.0

Page {
    id: root

    signal backClicked
    property CardsModel model: null
    property string typeText: ""
    property int index: -1

    padding: 0
    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignBottom
    }

    ToolBar {
        id: toolbar
        padding: 0
        z: 2
        width: root.width
        height: 56
        position: ToolBar.Header

        background: Rectangle {
            anchors.bottom: parent.bottom
            width: root.width
            height: 0.5
            color: Palette.white
            opacity: 0.5
        }

        ToolButton {
            id: toolButton
            height: parent.height
            text: Icon.back
            font.pixelSize: 24
            font.family: "Material Icons"

            onClicked: {
                root.backClicked()
            }
        }

        Label {
            id: label
            width: parent.width
            height: parent.height
            anchors.topMargin: 16
            text: qsTr("CARD DETAIL")
            font.pixelSize: 20
            font.letterSpacing: 0.5
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
    }


    SwipeView {
        id: _swipeView
        width: root.width
        height: root.height - toolbar.height
        anchors.top: toolbar.bottom
        currentIndex: root.index
        clip: true

        Repeater {
            model: root.model

            Loader {
                active: SwipeView.isPreviousItem || SwipeView.isCurrentItem
                        || SwipeView.isNextItem
                asynchronous: true
                sourceComponent: DetailDelegate {
                    code: model.code
                    type: model.type
                    typeText: root.typeText
                    command: model.command
                    image: model.image
                    description: model.description
                }
            }
        }
    }
}
