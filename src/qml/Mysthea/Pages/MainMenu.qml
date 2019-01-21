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
    signal gameSetupClicked
    signal rulesbookClicked
    signal loreClicked
    signal languageClicked
    signal creditsClicked

    background: Image {
        source: "qrc:/assets/images/home-bg.jpg"
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

    ColumnLayout {
        id: logoContainer
        width: parent.width
        anchors.leftMargin: 32
        anchors.rightMargin: 32
        anchors.top: parent.top
        anchors.bottom: container.top

        Image {
            source: "qrc:/assets/images/logo.png"
            fillMode: Image.PreserveAspectFit
            smooth: false
            asynchronous: true
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: 311
            Layout.maximumHeight: 274
        }
    }

    ColumnLayout {
        id: container
        anchors.bottomMargin: 55
        anchors.leftMargin: 32
        anchors.rightMargin: 32

        spacing: 24
        anchors.bottom: parent.bottom
        width: parent.width

        Button {
            id: cardsReferenceButton

            containerY: container.y
            sourceItem: root.background

            text: qsTr("Cards Reference")
            font.capitalization: Font.AllUppercase

            Layout.alignment: Qt.AlignHCenter

            onClicked: root.cardsReferenceClicked()
        }

        Button {
            id: gameSetupButton

            containerY: container.y
            sourceItem: root.background
            // Game Setup is disabled until next release when it will be completed
            enabled: false

            text: qsTr("Game Setup")
            font.capitalization: Font.AllUppercase

            Layout.alignment: Qt.AlignHCenter

            onClicked: root.gameSetupClicked()
        }

        Button {
            id: rulesbookButton

            containerY: container.y
            sourceItem: root.background

            text: qsTr("Rulebook")
            font.capitalization: Font.AllUppercase

            Layout.alignment: Qt.AlignHCenter

            onClicked: root.rulesbookClicked()
        }

        Button {
            id: loreButton

            containerY: container.y
            sourceItem: root.background
            // Lore is disabled until next release when it will be completed
            enabled: false

            text: qsTr("Lore")
            font.capitalization: Font.AllUppercase

            Layout.alignment: Qt.AlignHCenter

            onClicked: root.loreClicked()
        }
    }
}
