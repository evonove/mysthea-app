import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.5

import Mysthea.Theme 1.0
import Mysthea.Components 1.0

Page {
    id: root
    title: qsTr("LORE")
    objectName: PageName.lorePage
    topPadding: 0
    bottomPadding: 0
    padding: 0

    property Action leftAction: null
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

    ListView {
        anchors.fill: parent
        clip: true
        spacing: 0
        model: LoreModel {
            width: root.availableWidth
        }


        ScrollIndicator.vertical: ScrollIndicator {}
    }
}
