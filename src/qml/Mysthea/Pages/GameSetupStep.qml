import QtQuick 2.0
import QtQuick.Controls 2.4

Page {
    id: root
    padding: 8
    property alias content: _content.text
    property alias mainImageSource: _mainImage.source

    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    Column {
        anchors.fill: parent
        spacing: 16
        Label {
            id: _title
            text: root.title
        }

        Image {
            id: _mainImage
            width: root.availableWidth
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: _content
            width: root.availableWidth
            wrapMode: Text.Wrap
        }

    }

}
