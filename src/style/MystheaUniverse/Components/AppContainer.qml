import QtQuick 2.11
import QtQuick.Controls 2.3

import MystheaUniverse.Theme 1.0
import Mysthea.Components 1.0

Page {
    id: root

    property real headerHeight: 54
    property alias logo: _header.logo

    signal cardsReferenceClicked
    signal gameSetupClicked
    signal rulebookClicked
    signal extrasClicked

    header: Header {
        id: _header
        width: parent.width
        height: root.headerHeight
        z: 2

        rightAction: Action {
            id: _backAction
            icon.source: "qrc:/assets/icons/menu.svg"
        }
    }

    footer: TabBar {
        width: parent.width
        height: 49

        borderColor: Palette.darkPink

        TabButton {
            icon.source: "qrc:/assets/icons/accessory.svg"
            text: qsTr("Cards Reference")
            onClicked: root.cardsReferenceClicked()
        }

        TabButton {
            icon.source: "qrc:/assets/icons/accessory.svg"
            text: qsTr("Game Setup")
            onClicked: root.gameSetupClicked()
        }

        TabButton {
            icon.source: "qrc:/assets/icons/accessory.svg"
            text: qsTr("Rulebook")
            onClicked: root.rulebookClicked()
        }

        TabButton {
            icon.source: "qrc:/assets/icons/accessory.svg"
            text: qsTr("Extras")
            onClicked: root.extrasClicked()
        }
    }
}
