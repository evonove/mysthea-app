import QtQuick 2.10
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.3

import Mysthea.Components 1.0
import Mysthea.Theme 1.0

Page {
    id: root
    title: qsTr("RULEBOOK")
    objectName: PageName.rulebookPage

    property Action leftAction: null
    property bool hasToolbarLine: true

    ListModel {
        id: _rulebooksModel
        ListElement {
            language: "Deutsch Rulebook"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_DE_web_v1.pdf"
        }
        ListElement {
            language: "English Rulebook"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_EN_web_v1.pdf"
        }
        ListElement {
            language: "Español Rulebook"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_ES_web_v1.pdf"
        }
        ListElement {
            language: "Français Rulebook"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_FR_web_v1.pdf"
        }
        ListElement {
            language: "Ελληνικά Rulebook"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_GR_web_v1.pdf"
        }
        ListElement {
            language: "Italiano Rulebook"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_IT_web_v1.pdf"
        }
        ListElement {
            language: "日本人 Rulebook"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_JPN_web_v1.pdf"
        }
        ListElement {
            language: "Português Rulebook"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_PT_web_v1.pdf"
        }
    }

    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
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
        anchors.fill: parent
        Label {
            text: qsTr("Download the rulebook in your preferred language")
            wrapMode: Text.WordWrap
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 0.5
            padding: 20
            Layout.fillWidth: true
        }

        ListView {
            id: _languageListView
            clip: true
            spacing: 36
            model: _rulebooksModel

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.rightMargin: 20

            delegate: RulebookButton {
                text: language
                iconText: Icon.download
                onClicked: Qt.openUrlExternally(downloadUrl)
            }
        }
    }
}
