import QtQuick 2.14
import QtQuick.Controls 2.14

import Mysthea 1.0
import Mysthea.Models 1.0

Page {
    id: root
    padding: 0

    MiniaturesModel {
        id: _miniaturesModel
    }

    ListModel {
        id: _miniaturesGridModel
        ListElement {
            game: 1
            title: qsTr("Heroes")
        }
    }

    StackView {
        id: _stackView
        anchors.fill: parent
        initialItem: _miniaturesGrid
        padding: 0
    }

    Component {
        id: _miniaturesGrid
        ListView {
            model: _miniaturesGridModel
            delegate: MiniaturesGrid {
                width: _stackView.width
                miniaturesModel: MiniaturesFilterModel {
                    game: 1
                    sourceModel: _miniaturesModel
                }
                title: model.title
                onCardClicked: _stackView.push(_miniaturesSlides, { currentIndex: sourceIndex.row })
            }
        }
    }

    Component {
        id: _miniaturesSlides
        SwipeView {
            clip: true

            Repeater {
                model: MiniaturesFilterModel {
                    game: 1
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

