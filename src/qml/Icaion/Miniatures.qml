import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.5

import Mysthea.Models 1.0
import MystheaUniverse.Pages 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0


Page {
    id: root
    property Action leftAction: _stackView.currentItem.leftAction

    MiniaturesModel {
        id: _miniaturesModel
    }

    ListModel {
        id: _miniaturesGridModel
        ListElement {
            game: 2
            title: qsTr("Colossus?")
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
            property Action leftAction: null

            model: _miniaturesGridModel
            delegate: MiniaturesGrid {
                width: _stackView.width
                miniaturesModel: MiniaturesFilterModel {
                    game: 2
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

            Action {
                id: _backAction
                text: Icon.back
                onTriggered: _stackView.pop()
            }

            property Action leftAction: _backAction
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
