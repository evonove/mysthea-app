import QtQuick 2.0
import QtQuick.Controls 2.4

import MystheaUniverse.Pages 1.0 as MystheaUniverse
import MystheaUniverse.Theme 1.0

MystheaUniverse.Extras {
    id: root
    property bool isLoading: false

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

    Component {
        id: _artworkPage
        Artwork {
            id: _artworks
            property bool isLoading: _artworkPage.status != Component.Ready

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

            onLeftActionChanged: {
                root.leftAction = _miniatures.leftAction
            }
        }
    }
}
