import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

import Translations 1.0
import Mysthea.Theme 1.0

Page {
    id: root
    title: "LANGUAGE"
    property var leftAction: backAction

    signal backClicked

    padding: 8

    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    Flickable {
        anchors.fill: parent
        contentHeight: _layout.height
        contentWidth: _layout.width

        ColumnLayout {
            id: _layout
            width: parent.width
            spacing: 16
            Label {
                text: qsTr("Set Language of application")
                font.pixelSize: 16
            }
            Button {
                text: qsTr("english")
                onClicked: TranslationsManager.currentLanguage = TranslationsManager.English
            }
            Button {
                text: qsTr("italian")
                onClicked: TranslationsManager.currentLanguage = TranslationsManager.Italian
            }
            Button {
                text: qsTr("german")
                onClicked: TranslationsManager.currentLanguage = TranslationsManager.German
            }
            Button {
                text: qsTr("french")
                onClicked: TranslationsManager.currentLanguage = TranslationsManager.French
            }
        }

        ScrollIndicator.vertical: ScrollIndicator {
        }
    }
}
