import QtQuick 2.14
import QtQuick.Controls 2.14

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
        configurationFilePath: "qrc:/configurations/icaion_configuration.json"
    }

    ListModel {
        id: _artworkGridModel
        ListElement {
            type: 7
            title: qsTr("Colossus")
        }
        ListElement {
            type: 8
            title: qsTr("Seekers")
        }
        ListElement {
            type: 9
            title: qsTr("Machines")
        }
        ListElement {
            type: 10
            title: qsTr("Specialized Gear")
        }
        ListElement {
            type: 11
            title: qsTr("Wonders")
        }
        ListElement {
            type: 12
            title: qsTr("Events")
        }
        ListElement {
            type: 13
            title: qsTr("Parasites")
        }
        ListElement {
            type: 14
            title: qsTr("Playerboards")
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
                id: _repeater
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
                        anchors.fill: parent
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
