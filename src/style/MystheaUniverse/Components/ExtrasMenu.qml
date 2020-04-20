import QtQuick 2.14
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0
import MystheaUniverse.Pages 1.0
import MystheaUniverse.Components 1.0

Page {
    id: root
    objectName: PageName.extrasPage

    property Action leftAction: null
    property bool hasToolbarLine: false
    property alias loreImage: _loreImage.backgroundImageSource
    property alias artworksImage: _artworksImage.backgroundImageSource
    property alias miniaturesImage: _miniaturesImage.backgroundImageSource

    signal loreClicked
    signal artworksClicked
    signal miniaturesClicked

    padding: 16
    ColumnLayout {
        id: logoContainer
        anchors.fill: parent
        spacing: 18

        ImageButton {
            id: _loreImage
            label: qsTr("LORE")
            indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
            onClicked: root.loreClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ImageButton {
            id: _artworksImage
            label: qsTr("ARTWORKS")
            indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
            onClicked: root.artworksClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        ImageButton {
            id: _miniaturesImage
            label: qsTr("MINIATURES")
            indicatorImageSource: "qrc:/assets/icons/arrow_right.svg"
            onClicked: root.miniaturesClicked()
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}

