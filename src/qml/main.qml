import QtQuick 2.10
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Mysthea")

    header: ToolBar { }

    Button {
        anchors.centerIn: parent
        text: "FOO"
    }
}
