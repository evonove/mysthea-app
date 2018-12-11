import QtQuick 2.0
import QtQuick.Controls 2.4

import Mysthea.Theme 1.0

Page {
    id: root

    signal backClicked

    header: ToolBar {

        // Back button shown only if there is more than a page in the StackView
        ToolButton {
            text: Icon.back
            font.pixelSize: 22
            font.family: "Material Icons"

            onClicked: {
                root.backClicked()
            }
        }
    }

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
