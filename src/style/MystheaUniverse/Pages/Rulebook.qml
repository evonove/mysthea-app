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
    property alias rulebooksModel: _languageListView.model

    background: Rectangle {
        anchors.fill: parent
        color: Palette.black
    }

    Flickable {
        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: contentColumn.height
        ScrollIndicator.vertical: ScrollIndicator {}
        clip: true

        Column {
            id: contentColumn
            anchors.centerIn: parent
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

            GridView {
                id: _languageListView
                clip: true

                width: root.width
                height: availableHeight
                cellWidth: 134 + 35
                cellHeight: 77 + 29

                Component.onCompleted: console.log(width)

                leftMargin: 20
                rightMargin: 20
                bottomMargin: 32
                interactive: false

                delegate: RulebookButton {
                    width: 134
                    height: 77
                    label: language
                    backgroundImageSource: "qrc:/assets/images/main_menu/mysthea_button_back.png"
                    onClicked: Qt.openUrlExternally(downloadUrl)
                }
            }

        }
    }
}
