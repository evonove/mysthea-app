import QtQuick 2.14
import QtQuick.Controls 2.14

import Mysthea 1.0
import Mysthea.Models 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Pages 1.0

StackPage {
    id: root
    padding: 0
    initialItem: _artworkGrid

    property Action mainLeftAction

    ArtworksModel {
        id: _artworkModel
        configurationFilePath: "qrc:/configurations/mysthea_configuration.json"
    }

    ListModel {
        id: _artworkGridModel
        ListElement {
            type: 1
            title: qsTr("Champions")
        }
        ListElement {
            type: 2
            title: qsTr("Attunements")
        }
        ListElement {
            type: 3
            title: qsTr("Encounters")
        }
        ListElement {
            type: 4
            title: qsTr("Monsters")
        }
        ListElement {
            type: 5
            title: qsTr("Regions")
        }
        ListElement {
            type: 6
            title: qsTr("Guilds")
        }
    }

    BackAction {
        id: _backAction
        onTriggered: root.pop()
    }

    Component {
        id: _artworkGrid
        ListView {
            property bool isLoading: _artworkGrid.status !== Component.Ready
            property Action leftAction: mainLeftAction

            model: _artworkGridModel

            delegate: ArtworkGrid {
                width: root.width
                artworkModel: ArtworksFilterModel {
                    sourceModel: _artworkModel
                    type: model.type
                }
                title: model.title
                onCardClicked: root.push(_artworkSlides, {
                                             "sourceIndex": sourceIndex
                                         })
            }
        }
    }

    Component {
        id: _artworkSlides
        SwipeView {
            property bool isLoading: _artworkSlides.status !== Component.Ready
            property Action leftAction: _backAction
            property var sourceIndex

            currentIndex: _artworkSlidesProxyModel.mapFromSource(
                              sourceIndex).row
            clip: true

            Repeater {
                model: ArtworksFilterModel {
                    id: _artworkSlidesProxyModel
                    sourceModel: _artworkModel
                }

                Loader {
                    id: _loader
                    sourceComponent: Pane {
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
}
