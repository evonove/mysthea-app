import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.5

import Mysthea.Theme 1.0
import Mysthea.Components 1.0

Page {
    id: root
    title: qsTr("LORE")
    objectName: PageName.lorePage
    padding: 0

    function scrollTo(element) {
        _contentLoader.item.positionViewAtIndex(element, ListView.Beginning)
    }

    BusyIndicator {
        anchors.centerIn: parent
        running: _contentLoader.status !== Loader.Ready
    }

    signal openTableOfContents

    property Action leftAction: null
    property Action rightActions: Action {
        id: indexAction
        text: Icon.index
        onTriggered: {
            root.openTableOfContents()
        }
        enabled: _contentLoader.status === Loader.Ready
    }
    property bool hasToolbarLine: true

    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignBottom

        Rectangle {
            anchors.fill: parent
            color: Palette.mineShaft
            opacity: 0.29
        }
    }

    Loader {
        id: _contentLoader
        anchors.fill: parent
        asynchronous: true
        sourceComponent: _listView
        visible: status === Loader.Ready
    }

    Component {
        id: _listView
        ListView {
            anchors.fill: parent
            clip: true
            spacing: 0
            model: LoreModel {
                width: root.availableWidth
            }
            ScrollIndicator.vertical: ScrollIndicator {
            }
        }
    }
}
