import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Page {
    id: root
    padding: 8

    signal cardsReferenceClicked();
    signal gameSetupClicked();
    signal rulesbookClicked();
    signal loreClicked();
    signal languageClicked();
    signal creditsClicked();

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

            onClicked: root.cardsReferenceClicked()
        }

        Button {
            id: gameSetupButton
            text: qsTr("Game Setup")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: root.gameSetupClicked()
        }

        Button {
            id: rulesbookButton
            text: qsTr("Rulesbook")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: root.rulesbookClicked()
        }

        Button {
            id: loreButton
            text: qsTr("Lore")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: root.loreClicked()
        }

        Button {
            id: languageButton
            text: qsTr("Language")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: root.languageClicked()
        }

        Button {
            id: creditsButton
            text: qsTr("Credits")

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 150

            onClicked: root.creditsClicked()
        }
    }
}
