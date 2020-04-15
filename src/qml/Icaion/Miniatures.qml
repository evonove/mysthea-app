import QtQuick 2.14
import QtQuick.Controls 2.14

import Mysthea.Models 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Pages 1.0


StackPage {
    id: root
    padding: 0
    initialItem: _miniaturesGrid

    property Action mainLeftAction;

    MiniaturesModel {
        id: _miniaturesModel
    }

    ListModel {
        id: _miniaturesGridModel
        ListElement {
            type: 2
            title: qsTr("Colossus")
        }
        ListElement {
            type: 3
            title: qsTr("Seekers")
        }
        ListElement {
            type: 4
            title: qsTr("Machines")
        }
        ListElement {
            type: 5
            title: qsTr("Wonders")
        }
        ListElement {
            type: 6
            title: qsTr("Parasites")
        }
    }

    BackAction {
        id: _backAction
        onTriggered: root.pop()
    }

    Component {
        id: _miniaturesGrid
        ListView {
            property bool isLoading: _miniaturesGrid.status != Component.Ready
            property Action leftAction: mainLeftAction

            model: _miniaturesGridModel
            delegate: MiniaturesGrid {
                width: root.width
                miniaturesModel: MiniaturesFilterModel {
                    sourceModel: _miniaturesModel
                    type: model.type
                }
                title: model.title
                onCardClicked: root.push(_miniaturesSlides, { sourceIndex: sourceIndex })
            }
        }
    }

    Component {
        id: _miniaturesSlides
        SwipeView {
            property bool isLoading: _miniaturesSlides.status != Component.Ready
            property Action leftAction: _backAction
            property var sourceIndex

            currentIndex: _miniaturesSlidesProxyModel.mapFromSource(sourceIndex).row
            clip: true


            Repeater {
                model: MiniaturesFilterModel {
                    id: _miniaturesSlidesProxyModel
                    sourceModel: _miniaturesModel
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
