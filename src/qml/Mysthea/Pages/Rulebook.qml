import QtQuick 2.10
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.3

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

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

    Flickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: contentColumn.height
        clip: true
        ScrollIndicator.vertical: ScrollIndicator {}

        Column {
            id: contentColumn
            width: parent.width
            height: label.height + _languageListView.contentHeight + _languageListView.bottomMargin + spacing

            Label {
                id: label
                text: qsTr("Download the rulebook in your preferred language")
                wrapMode: Text.WordWrap
                color: Palette.grayNurse
                font.pixelSize: 27
                font.letterSpacing: 0.5
                width: parent.width
                padding: 20
            }


           ListView {
                id: _languageListView
                clip: true
                spacing: 36
                model: _rulebooksModel

                width: parent.width
                height: availableHeight
                leftMargin: 20
                rightMargin: 20
                bottomMargin: 32
                interactive: false

                delegate: RulebookButton {
                    text: language
                    iconText: Icon.download
                    onClicked: Qt.openUrlExternally(downloadUrl)
                }
            }

        }
    }
}
