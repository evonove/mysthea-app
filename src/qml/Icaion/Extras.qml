import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Pages 1.0 as MUPages
import MystheaUniverse.Components 1.0 as MUComponents
import MystheaUniverse.Theme 1.0

MUPages.Extras {
    id: root

    MUComponents.BackAction {
        id: _backAction
        onTriggered: {
            root.pop()
            if (root.depth() === 1) {
                root.leftAction = null
            }
        }
    }

    initialItem: Component {
        id: _extrasMenu
        ExtrasMenu {
            property bool isLoading: _extrasMenu.status != Component.Ready
            onLoreClicked: root.push(_lorePage)
            onArtworksClicked: root.push(_artworkPage)
            onMiniaturesClicked: root.push(_miniaturesPage)
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

    Component {
        id: _miniaturesPage
        Miniatures {
            id: _miniatures
            property bool isLoading: _miniaturesPage.status != Component.Ready
            mainLeftAction: _backAction

            onLeftActionChanged: {
                root.leftAction = _miniatures.leftAction
            }
        }
    }
}
