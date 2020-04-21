import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Pages 1.0 as MystheaUniverse
import MystheaUniverse.Theme 1.0

MystheaUniverse.Extras {
    id: root
    property bool isLoading: false

    Action {
        id: _backAction
        text: Icon.back
        onTriggered: root.pop()
    }

    initialItem: Component {
        id: _extrasMenu
        ExtrasMenu {
            property bool isLoading: _extrasMenu.status != Component.Ready
            onLoreClicked: root.push(_lorePage)
            onArtworksClicked: root.push(_artworkPage)
        }
    }

    Component {
        id: _lorePage
        Lore {
            property bool isLoading: _lorePage.status != Component.Ready

            Component.onCompleted: {
                root.leftAction = _backAction
            }
        }
    }

    Component {
        id: _artworkPage
        Artwork {
            id: _artworks
            property bool isLoading: _artworkPage.status != Component.Ready
            mainLeftAction: _backAction

            onLeftActionChanged: {
                root.leftAction = _artworks.leftAction
            }
        }
    }
}

