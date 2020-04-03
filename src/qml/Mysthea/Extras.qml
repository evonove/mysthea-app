import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Pages 1.0
import MystheaUniverse.Theme 1.0

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
        Lore {
            loreModel: LoreModel {
                width: root.availableWidth
            }

            Action {
                id: _backAction
                text: Icon.back
                onTriggered: root.pop()
            }

            Component.onCompleted: {
                root.leftAction = _backAction
            }
        }
    }
}
