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

    property Action mainLeftAction

    ArtworksModel {
        id: _artworkModel
        configurationFilePath: "qrc:/configurations/the_fall_configuration.json"
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
            id: _swipeView
            width: root.width

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
                    width: root.width
                    height: root.height - _swipeView.topPadding
                    active: SwipeView.isCurrentItem || SwipeView.isNextItem
                            || SwipeView.isPreviousItem
                    asynchronous: true

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

                    BusyIndicator {
                        anchors.centerIn: parent
                        running: _loader.status !== Loader.Ready
                    }
                }
            }
        }
    }
}
