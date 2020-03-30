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
    property alias backgroundImageSource: _backgroundImage.source

    background: Image {
        id: _backgroundImage
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
