import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

Page {
    id: root
    spacing: 8

    signal stepClicked(int step)

    background: Image {
        source: "qrc:/images/background.png"
        fillMode: Image.PreserveAspectCrop
        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignTop
    }

    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        Button {
            id: _firstButton
            text: qsTr("1")
            onClicked: {
                root.stepClicked(1)
            }
        }
        Button {
            id: _secondButton
            text: qsTr("2")
            onClicked: {
                root.stepClicked(2)
            }
        }
        Button {
            id: _thirdButton
            text: qsTr("3")
            onClicked: {
                root.stepClicked(3)
            }
        }
    }
}
