import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import Mysthea.Theme 1.0

Pane {
    id: root
    padding: 8
    background: null

    property string code: ""
    property string type: ""
    property string command: ""
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
            RowLayout {
                width: parent.width
                Label {
                    font.pixelSize: 24
                    text: root.code
                    color: Palette.white
                }
                Label {
                    font.pixelSize: 24
                    text: if (root.type == "Hero") {
                              return "Hero"
                          } else if (root.type == "Attunement") {
                              return "Attunement"
                          } else {
                              return "Command"
                          }

                    color: Palette.white
                }
            }
            RowLayout {

                spacing: 8

                Image {
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/cards/" + image

                    Layout.fillWidth: true
                }

                ColumnLayout {

                    spacing: 8

                    Label {
                        font.pixelSize: 24
                        text: root.type
                    }

                    Label {
                        font.pixelSize: 24
                        text: root.command
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
