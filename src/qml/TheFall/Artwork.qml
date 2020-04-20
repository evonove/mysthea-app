import QtQuick 2.14
import QtQuick.Controls 2.14

import TheFall 1.0
import Mysthea.Models 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

Page {
    id: root
    padding: 0

    property Action leftAction: _stackView.currentItem.leftAction

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

    StackView {
        id: _stackView
        anchors.fill: parent
        initialItem: _artworkGrid
        padding: 0
    }

    Component {
        id: _artworkGrid
        ListView {
            property Action leftAction: null

            model: _artworkGridModel

            delegate: ArtworkGrid {
                width: _stackView.width
                artworkModel: ArtworksFilterModel {
                    game: 3
                    sourceModel: _artworkModel
                    type: model.type
                }
                title: model.title
                onCardClicked: _stackView.push(_artworkSlides, { sourceIndex: sourceIndex })
            }
        }
    }

    Component {
        id: _artworkSlides
        SwipeView {
            property Action leftAction: _backAction
            property var sourceIndex

            currentIndex: _artworkSlidesProxyModel.mapFromSource(sourceIndex).row
            clip: true

            Action {
                id: _backAction
                text: Icon.back
                onTriggered: _stackView.pop()
            }

            Repeater {
                model: ArtworksFilterModel {
                    id: _artworkSlidesProxyModel
                    game: 3
                    sourceModel: _artworkModel
                }
                Pane {
                    width: _stackView.width
                    height: _stackView.height
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

