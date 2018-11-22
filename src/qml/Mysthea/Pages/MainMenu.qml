import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import Mysthea.Components 1.0

Page {
    id: root

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
        verticalAlignment: Image.AlignTop

        Rectangle {
            anchors.fill: parent
            color: "#212121"
            opacity: 0.29
        }
    }

    RowLayout {
        id:logoContainer
        width: parent.width
        height: parent.height - container.height
        anchors.leftMargin: 32
        anchors.rightMargin: 32
        anchors.top: parent.top

        Image {
            source: "qrc:/assets/images/logo.png"
            fillMode: Image.PreserveAspectFit
            smooth: false
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.minimumWidth: 311
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

            text: qsTr("Lore")
            font.capitalization: Font.AllUppercase

            Layout.alignment: Qt.AlignHCenter

            onClicked: root.loreClicked()
        }
    }
}
