import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import Mysthea.Theme 1.0

Page {
    id: root

    signal backClicked

    padding: 16
    header: ToolBar {

        // Back button shown only if there is more than a page in the StackView
        ToolButton {
            text: Icon.back
            font.pixelSize: 22
            font.family: "Material Icons"

            onClicked: {
                root.backClicked()
            }
        }
    }

    background: Image {
        anchors.fill: root
        asynchronous: true
        cache: true
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    ColumnLayout {
        id: _layout
        anchors.fill: parent

        Column {
            spacing: 24

            Layout.fillWidth: true
            Layout.alignment: Qt.AlignBottom
            Layout.bottomMargin: 16

            Column {
                width: parent.width
                spacing: 16

                Label {
                    width: parent.width
                    text: qsTr("Game produced by")
                    horizontalAlignment: Text.AlignHCenter

                    wrapMode: Text.Wrap
                    font.pixelSize: 16
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/tabula-logo.png"
                    width: 200
                    height: 32
                    fillMode: Image.PreserveAspectFit
                    smooth: false

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Qt.openUrlExternally("https://tabula.games")
                    }
                }
            }

            Column {
                width: parent.width
                spacing: 16

                Label {
                    width: parent.width
                    text: qsTr("App Designed and Developed by")
                    horizontalAlignment: Text.AlignHCenter

                    wrapMode: Text.Wrap
                    font.pixelSize: 16
                }

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/images/evonove-logo.png"
                    width: 200
                    height: 24
                    fillMode: Image.PreserveAspectFit
                    smooth: false

                    MouseArea {
                        anchors.fill: parent
                        onClicked: Qt.openUrlExternally("https://evonove.it")
                    }
                }
            }
        }
    }
}
