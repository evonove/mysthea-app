import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Page {
    id: root
    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    ColumnLayout {
        spacing: 16
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 46
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: cardsReferenceButton
            text: qsTr("Cards Reference")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: console.log(cardsReferenceButton.text)
        }

        Button {
            id: gameSetupButton
            text: qsTr("Game Setup")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: console.log(gameSetupButton.text)
        }

        Button {
            id: rulesbookButton
            text: qsTr("Rulesbook")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: console.log(rulesbookButton.text)
        }

        Button {
            id: loreButton
            text: qsTr("Lore")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: console.log(loreButton.text)
        }

        Button {
            id: languageButton
            text: qsTr("Language")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: console.log(languageButton.text)
        }

        Button {
            id: creditsButton
            text: qsTr("Credits")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: console.log(creditsButton.text)
        }
    }
}
