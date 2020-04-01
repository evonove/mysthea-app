import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.4

import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0

Page {
    id: root
    objectName: PageName.homePage

    property Action leftAction: null
    property bool hasToolbarLine: false

    signal mystheaClicked
    signal icaionClicked
    signal theFallClicked

    padding: 16

    background: Rectangle {
        color: Palette.mineShaft
        opacity: 0.29
    }

    ColumnLayout {
        id: logoContainer
        anchors.fill: parent
        spacing: 18

        ImageButton {
            mainColor: Palette.mystheaMain
            backgroundImageSource: "qrc:/assets/images/main_menu/mysthea_button_back.png"
            logoImageSource: "qrc:/assets/images/mysthea_logo.png"
            indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
            onClicked: root.mystheaClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
            rounded: true
        }
        ImageButton {
            mainColor: Palette.icaionMain
            backgroundImageSource: "qrc:/assets/images/main_menu/icaion_button_back.png"
            logoImageSource: "qrc:/assets/images/icaion_logo.png"
            indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
            onClicked: root.icaionClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
            rounded: true
        }
        ImageButton {
            mainColor: Palette.thefallMain
            backgroundImageSource: "qrc:/assets/images/main_menu/the_fall_button_back.png"
            logoImageSource: "qrc:/assets/images/the_fall_logo.png"
            indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
            onClicked: root.theFallClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
            rounded: true
        }
    }
}
