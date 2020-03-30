import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import MystheaUniverse.Pages 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0
import Mysthea 1.0 as Mysthea


Page {
    id: root
    objectName: PageName.extrasPage

    property Action leftAction: null
    property bool hasToolbarLine: false

    signal loreClicked
    signal artworksClicked
    signal miniaturesClicked

    padding: 16

    background: Rectangle {
        color: "black"
    }

    ColumnLayout {
        id: logoContainer
        anchors.fill: parent
        spacing: 18

        ExtrasButton {
            label: qsTr("LORE")
            backgroundImageSource: "qrc:/assets/images/main_menu/mysthea_button_back.png"
            indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
            onClicked: root.loreClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ExtrasButton {
            label: qsTr("ARTWORKS")
            backgroundImageSource: "qrc:/assets/images/main_menu/icaion_button_back.png"
            indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
            onClicked: root.artworksClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ExtrasButton {
            label: qsTr("MINIATURES")
            backgroundImageSource: "qrc:/assets/images/main_menu/the_fall_button_back.png"
            indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
            onClicked: root.miniaturesClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

}
