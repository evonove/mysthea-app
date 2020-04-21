import QtQuick 2.14
import QtQuick.Controls 2.14

import TheFall 1.0
import Mysthea.Models 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Pages 1.0
import MystheaUniverse.Theme 1.0

StackPage {
    id: root
    padding: 0
    initialItem: _artworkGrid

    property Action mainLeftAction;

    ArtworksModel {
        id: _artworkModel
    }

    ListModel {
        id: _artworkGridModel
        ListElement {
            type: 15
            title: qsTr("Mysthea: The Fall")
        }
        ListElement {
            type: 16
            title: qsTr("Seekers")
        }
    }

    Action {
        id: _backAction
        text: Icon.back
        onTriggered: root.pop()
    }

    Component {
        id: _artworkGrid
        ListView {
            property bool isLoading: _artworkGrid.status != Component.Ready
            property Action leftAction: mainLeftAction
            model: _artworkGridModel

            delegate: ArtworkGrid {
                width: root.width
                artworkModel: ArtworksFilterModel {
                    game: 3
                    sourceModel: _artworkModel
                    type: model.type
                }
                title: model.title
                onCardClicked: root.push(_artworkSlides, { sourceIndex: sourceIndex })
            }

        }
    }

    Component {
        id: _artworkSlides
        SwipeView {
            property bool isLoading: _artworkSlides.status != Component.Ready
            property Action leftAction: _backAction
            property var sourceIndex

            currentIndex: _artworkSlidesProxyModel.mapFromSource(sourceIndex).row
            clip: true

            Repeater {
                model: ArtworksFilterModel {
                    id: _artworkSlidesProxyModel
                    game: 3
                    sourceModel: _artworkModel
                }
                Pane {
                    width: root.width
                    height: root.height
                    padding: 0

                    Image {
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectCrop
                        source: model.image
                        sourceSize.width: parent.width
                    }
                }
            }
        }
    }
}

