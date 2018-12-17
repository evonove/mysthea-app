import QtQuick 2.0
import QtQuick.Controls 2.4

import Mysthea.Theme 1.0

Page {
    id: root
    title: "LORE"
    property var leftAction: backAction

    signal backClicked

    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    Label {
        text: "Lore"
        anchors.centerIn: parent
    }
}
