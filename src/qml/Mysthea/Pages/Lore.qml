import QtQuick 2.0
import QtQuick.Controls 2.4

import Mysthea.Theme 1.0

//Beacause of Page is handle by a StackView we can access to it by his attached property.
//So we use root.StackView.view.[property] to use StackView properties.
Page {
    id: root

    header: ToolBar {

        // Back button shown only if there is more than a page in the StackView
        ToolButton {
            text: Icon.back
            font.pixelSize: 22
            font.family: "Material Icons"

            onClicked: {
                if (root.StackView.view.depth > 1) {
                    root.StackView.view.pop()
                }
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
