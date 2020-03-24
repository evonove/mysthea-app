import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.4

import Mysthea.Components 1.0
import Mysthea.Theme 1.0

Page {
    id: root
    objectName: PageName.homePage
    property Action leftAction: null
    property bool hasToolbarLine: false

    signal cardsReferenceClicked

    background: Rectangle {
        color: Palette.mineShaft
        opacity: 0.29
    }

    ColumnLayout {
        id: logoContainer
        anchors.fill: parent
        anchors.margins: 32


        ProjectButton {
            mainColor: "black"
            imageSource: "qrc:/assets/images/logo.png"
            indicatorSource: "qrc:/assets/images/logo.png"
            onClicked: root.cardsReferenceClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ProjectButton {
            mainColor: "white"
            imageSource: "qrc:/assets/images/logo.png"
            indicatorSource: "qrc:/assets/images/logo.png"
            onClicked: root.cardsReferenceClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ProjectButton {
            mainColor: "yellow"
            imageSource: "qrc:/assets/images/logo.png"
            indicatorSource: "qrc:/assets/images/logo.png"
            onClicked: root.cardsReferenceClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
