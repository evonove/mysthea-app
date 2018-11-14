import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Page {
    id: root
    padding: 8

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

        Image {
            anchors.centerIn: parent
            sourceSize.height: 48
            source: "qrc:/images/logo.png"
        }
    }

    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    Flickable {
        anchors.fill: parent
        contentHeight:_layout.height
        contentWidth:_layout.width

        ColumnLayout {
            id: _layout
            width: parent.width
            spacing: 16
            Label {
                text: qsTr("Set Language of application");
                font.pixelSize: 16
            }
            Button {
                text: qsTr("english")
                onClicked: console.log("english");
            }
            Button {
                text: qsTr("italian")
                onClicked: console.log("italian");
            }
            Button {
                text: qsTr("deutsch")
                onClicked: console.log("deutsch");
            }
            Button {
                text: qsTr("japanese")
                onClicked: console.log("japanese");
            }
        }

        ScrollIndicator.vertical: ScrollIndicator { }

    }
}
