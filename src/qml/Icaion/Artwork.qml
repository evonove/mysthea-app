import QtQuick 2.14
import QtQuick.Controls 2.14

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
            type: 1
            title: qsTr("Colossus")
        }
        ListElement {
            type: 2
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
                    game: 2
                    sourceModel: _artworkModel
                    type: model.type
                }
                title: model.title
                onCardClicked: _stackView.push(_artworkSlides, { currentIndex: sourceIndex.row })
            }
        }
    }

    Component {
        id: _artworkSlides
        SwipeView {

            Action {
                id: _backAction
                text: Icon.back
                onTriggered: _stackView.pop()
            }

            property Action leftAction: _backAction
            clip: true

            Repeater {
                model: ArtworksFilterModel {
                    game: 2
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
