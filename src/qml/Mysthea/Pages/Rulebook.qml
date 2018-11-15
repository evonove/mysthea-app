import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Page {
    id: root

    header: ToolBar {

        // Back button shown only if there is more than a page in the StackView
        ToolButton {
            id: _backButton

            readonly property string backIcon: "\uE5C4"

            text: _backButton.backIcon
            font.pixelSize: 22
            font.family: "Material Icons"

            visible: _mainStackView.depth > 1
            opacity: visible ? 1 : 0

            onClicked: {
                if (_mainStackView.depth > 1) {
                    _mainStackView.pop()
                }
            }

            Behavior on opacity {
                PropertyAnimation {
                    duration: 200
                }
            }
        }
    }

    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    ScrollView {
        anchors.fill: parent
        padding: 8
        ColumnLayout {
            anchors.fill: parent
            spacing: 16

            Label {
                text: qsTr("Download rulebook");
                font.pixelSize: 16
            }

            Button {
                text: qsTr("english")
                onClicked: console.log("download english rulebook");
            }
            Button {
                text: qsTr("italian")
                onClicked: console.log("download italian rulebook");
            }
            Button {
                text: qsTr("deutsch")
                onClicked: console.log("download deutsch rulebook");
            }
            Button {
                text: qsTr("japanese")
                onClicked: console.log("download japanese rulebook");
            }
        }
    }
}
