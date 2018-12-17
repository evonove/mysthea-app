import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import Mysthea.Theme 1.0

Page {
    id: root
    title: "RULEBOOK"
    property Action leftAction: null
    property bool hasToolbarLine: false

    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    ScrollView {
        anchors.fill: parent
        padding: 8
        ColumnLayout {
            anchors.fill: parent
            spacing: 16

            Label {
                text: qsTr("Download rulebook")
                font.pixelSize: 16
            }

            Button {
                text: qsTr("english")
                onClicked: console.log("download english rulebook")
            }
            Button {
                text: qsTr("italian")
                onClicked: console.log("download italian rulebook")
            }
            Button {
                text: qsTr("deutsch")
                onClicked: console.log("download deutsch rulebook")
            }
            Button {
                text: qsTr("japanese")
                onClicked: console.log("download japanese rulebook")
            }
        }
    }
}
