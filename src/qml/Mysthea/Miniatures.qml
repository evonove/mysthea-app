import QtQuick 2.14
import QtQuick.Controls 2.14

import Mysthea 1.0
import Mysthea.Models 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Pages 1.0
import MystheaUniverse.Components 1.0 as MUComponents

StackPage {
    id: root
    padding: 0
    initialItem: _miniaturesGrid

    property Action mainLeftAction

    MiniaturesModel {
        id: _miniaturesModel
        configurationFilePath: "qrc:/configurations/mysthea_configuration.json"
    }

    ListModel {
        id: _miniaturesGridModel
        ListElement {
            game: 1
            type: 1
            title: qsTr("Heroes")
        }
    }

    MUComponents.BackAction {
        id: _backAction
        onTriggered: root.pop()
    }

    Component {
        id: _miniaturesGrid
        ListView {
            property bool isLoading: _miniaturesGrid.status !== Component.Ready
            property Action leftAction: mainLeftAction

            model: _miniaturesGridModel
            delegate: MUComponents.MiniaturesGrid {
                width: root.width
                miniaturesModel: MiniaturesFilterModel {
                    sourceModel: _miniaturesModel
                }
                title: model.title
                onCardClicked: root.push(_miniaturesSlides, {
                                             "sourceIndex": sourceIndex
                                         })
            }
        }
    }

    Component {
        id: _miniaturesSlides
        SwipeView {
            id: _swipeView

            property bool isLoading: _miniaturesSlides.status !== Component.Ready
            property Action leftAction: _backAction
            property var sourceIndex

            width: root.width

            currentIndex: _miniaturesSlidesProxyModel.mapFromSource(
                              sourceIndex).row
            clip: true

            Repeater {
                model: MiniaturesFilterModel {
                    id: _miniaturesSlidesProxyModel
                    sourceModel: _miniaturesModel
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
                            asynchronous: true
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
