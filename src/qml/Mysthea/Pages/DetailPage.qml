import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Page {
    id: root

    padding: 8

    property string code: ""
    property string type: ""
    property string category: ""
    property string image: ""
    property string description: ""

    Flickable {
        anchors.fill: parent
        contentHeight: _layout.height
        contentWidth: parent.width

        ColumnLayout {
            id: _layout
            width: parent.width

            spacing: 8

            Label {
                font.pixelSize: 24
                text: root.code

                Layout.alignment: Qt.AlignHCenter
            }

            RowLayout {

                spacing: 8

                Image {
                    width: sourceSize.width
                    height: sourceSize.height
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/" + image
                }

                ColumnLayout {

                    spacing: 8

                    Label {
                        font.pixelSize: 24
                        text: root.type
                    }

                    Label {
                        font.pixelSize: 24
                        text: root.category
                    }
                }
            }

            Label {
                font.pixelSize: 24
                text: root.description

                wrapMode: Text.Wrap

                Layout.maximumWidth: parent.width
            }
        }
    }
}
