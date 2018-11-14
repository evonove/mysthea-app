import QtQuick 2.0
import QtQuick.Controls 2.4

Page {
    id: root

    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    Label {
        text: "Rulebook"
        anchors.centerIn: parent
    }
}
