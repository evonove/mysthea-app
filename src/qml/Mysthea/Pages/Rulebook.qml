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
            language: "Deutsch"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_DE_web_v1.pdf"
        }
        ListElement {
            language: "English"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_EN_web_v1.pdf"
        }
        ListElement {
            language: "Español"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_ES_web_v1.pdf"
        }
        ListElement {
            language: "Français"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_FR_web_v1.pdf"
        }
        ListElement {
            language: "Ελληνικά"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_GR_web_v1.pdf"
        }
        ListElement {
            language: "Italiano"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_IT_web_v1.pdf"
        }
        ListElement {
            language: "日本人"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_JPN_web_v1.pdf"
        }
        ListElement {
            language: "Português"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_PT_web_v1.pdf"
        }
    }

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

    ListView {
        id: _languageListView
        anchors.fill: parent
        anchors.topMargin: 16
        spacing: 16
        clip: true

        model: _rulebooksModel

        delegate: Item {
            width: parent.width
            height: 55

            Button {
                anchors.centerIn: parent
                containerY: parent.y - _languageListView.contentY + root.topPadding
                sourceItem: root.background
                text: language
                font.capitalization: Font.AllUppercase

                onClicked: Qt.openUrlExternally(downloadUrl)
            }
        }
    }
}
