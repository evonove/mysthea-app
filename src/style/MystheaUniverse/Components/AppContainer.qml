import QtQuick 2.11
import QtQuick.Controls 2.3

import MystheaUniverse.Theme 1.0
import Mysthea.Components 1.0

Page {
    id: root

    property real headerHeight: 54

    property alias logo: _header.logo

    property color mainColor
    property color whiteColor
    property color accentColor

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

        borderColor: root.accentColor

        TabButton {
            icon.source: "qrc:/assets/icons/card_reference_icon.svg"
            text: qsTr("Cards Reference")

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: root.cardsReferenceClicked()
        }

        TabButton {
            icon.source: "qrc:/assets/icons/game_setup_icon.svg"
            text: qsTr("Game Setup")

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: root.gameSetupClicked()
        }

        TabButton {
            icon.source: "qrc:/assets/icons/rulebook_icon.svg"
            text: qsTr("Rulebook")

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: root.rulebookClicked()
        }

        TabButton {
            icon.source: "qrc:/assets/icons/extras_icon.svg"
            text: qsTr("Extras")

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: root.extrasClicked()
        }
    }
}
