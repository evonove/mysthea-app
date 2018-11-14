import QtQuick 2.0
import QtQuick.Controls 2.4

Page {
    id: root
    padding: 8
    property alias content: _content.text
    property alias mainImageSource: _mainImage.source

    background: null

    ScrollView {
        anchors.fill: parent

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
}
