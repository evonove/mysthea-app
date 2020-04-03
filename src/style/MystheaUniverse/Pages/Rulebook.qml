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

    GridView {
        id: _languageListView
        anchors.fill: parent
        cellWidth: width / 2
        cellHeight: 77 + 29

        header: Label {
            id: label
            text: qsTr("Download the rulebook in your preferred language")
            wrapMode: Text.WordWrap
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 0.5
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
            padding: 20
        }

        delegate: Item {
            width: _languageListView.cellWidth
            height: _languageListView.cellHeight
            RulebookButton {
                width: 134
                height: 77
                anchors.centerIn: parent
                label: language
                backgroundImageSource: "qrc:/assets/images/main_menu/mysthea_button_back.png"
                onClicked: Qt.openUrlExternally(downloadUrl)
            }
        }
    }
}
