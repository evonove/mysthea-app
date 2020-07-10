import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

ColumnLayout {
    id: root
    property alias title: _title.text
    property alias paragraph: _paragraph.text
    property ListModel contentModel
    spacing: 0
    Label {
        id: _title
        color: Palette.icaionLight
        font.pixelSize: 32
        font.letterSpacing: 1
        textFormat: Text.RichText
        wrapMode: Text.Wrap
        lineHeight: 1.0

        Layout.fillWidth: true
        Layout.leftMargin: 15
        Layout.rightMargin: 15
        Layout.topMargin: 15
    }
    Label {
        id: _paragraph
        color: Palette.icaionLight
        font.pixelSize: 18
        font.letterSpacing: 1
        textFormat: Text.RichText
        wrapMode: Text.Wrap
        lineHeight: 1.0

        Layout.fillWidth: true
        Layout.leftMargin: 15
        Layout.rightMargin: 15
        Layout.topMargin: 18
    }

    Repeater {
        model: root.contentModel
        ColumnLayout {
            width: parent.width
            spacing: 0
            Label {
                text: model.subTitle
                color: Palette.icaionLight
                font.pixelSize: 18
                font.letterSpacing: 1
                font.capitalization: Font.AllUppercase
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 15
                Layout.rightMargin: 15
                Layout.topMargin: 24
            }
            Label {
                text: model.subParagraph
                color: Palette.icaionLight
                font.pixelSize: 18
                font.letterSpacing: 1
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                lineHeight: 1.0

                Layout.fillWidth: true
                Layout.leftMargin: 15
                Layout.rightMargin: 15
                Layout.topMargin: 18
            }
            RoundedImage {
                source: model.imageSource
                fillMode: Image.PreserveAspectCrop
                borderWidth: 1
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.leftMargin: 15
                Layout.rightMargin: 15
                Layout.topMargin: 18
            }
        }
    }
}
