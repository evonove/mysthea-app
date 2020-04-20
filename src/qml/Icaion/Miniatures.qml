import QtQuick 2.14
import QtQuick.Controls 2.14

import Mysthea.Models 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0


Page {
    id: root
    padding: 0

    property Action leftAction: _stackView.currentItem.leftAction
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

    StackView {
        id: _stackView
        anchors.fill: parent
        initialItem: _miniaturesGrid
        padding: 0
    }

    Action {
        id: _backAction
        text: Icon.back
        onTriggered: _stackView.pop()
    }

    Component {
        id: _miniaturesGrid
        ListView {
            property Action leftAction: mainLeftAction

            model: _miniaturesGridModel
            delegate: MiniaturesGrid {
                width: _stackView.width
                miniaturesModel: MiniaturesFilterModel {
                    game: 2
                    sourceModel: _miniaturesModel
                    type: model.type
                }
                title: model.title
                onCardClicked: _stackView.push(_miniaturesSlides, { sourceIndex: sourceIndex })
            }
        }
    }

    Component {
        id: _miniaturesSlides
        SwipeView {
            property Action leftAction: _backAction
            property var sourceIndex

            currentIndex: _miniaturesSlidesProxyModel.mapFromSource(sourceIndex).row
            clip: true


            Repeater {
                model: MiniaturesFilterModel {
                    id: _miniaturesSlidesProxyModel
                    game: 2
                    sourceModel: _miniaturesModel
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
