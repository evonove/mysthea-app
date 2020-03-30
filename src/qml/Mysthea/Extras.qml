import QtQuick 2.11
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.4
import QtQml.Models 2.1
import QtGraphicalEffects 1.0

import Mysthea 1.0 as Mysthea
import Icaion 1.0 as Icaion
import TheFall 1.0 as TheFall
import Mysthea.Models 1.0
import Translations 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Pages 1.0

Extras {
    id: root
    menuPage: _extrasMenu
    pageStates: [
        State {
            name: PageName.lorePage
            when: _mainStackView.currentItem.objectName === PageName.lorePage
        }
    ]

    Component {
        id: _extrasMenu
        ExtrasMenu {
            onLoreClicked: root.pushToStack(_lorePage, PageName.lorePage)
            onArtworksClicked: console.log("Artwork clicked")
            onMiniaturesClicked: console.log("Miniatures clicked")
        }
    }

    Component {
        id: _lorePage
        Lore {}
    }
}
