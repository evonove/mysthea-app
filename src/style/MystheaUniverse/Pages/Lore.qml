import QtQuick 2.14
import QtQml.Models 2.14
import QtQuick.Controls 2.14

Page {
    id: root

    property ObjectModel loreModel: null

    title: qsTr("LORE")
    objectName: PageName.lorePage
    padding: 0

    BusyIndicator {
        anchors.centerIn: parent
        running: _contentLoader.status !== Loader.Ready
    }

    Loader {
        id: _contentLoader
        anchors.fill: parent
        asynchronous: true
        clip: true
        sourceComponent: _listComponent
        visible: status === Loader.Ready
    }
    Component {
        id: _listComponent
        ListView {
            id: _listView
            anchors.fill: parent
            clip: true
            spacing: 0

            model: root.loreModel

            ScrollIndicator.vertical: ScrollIndicator {}
        }
    }
}
