import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import Mysthea 1.0
import Mysthea.Models 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Pages 1.0 as BasePages
import MystheaUniverse.Theme 1.0

BasePages.CardsReference {
    id: root

    signal cardClicked(CardsProxyModel cards, int index)

    TypeProxyModel {
        id: typeProxy
    }
    TypeComboBoxModel {
        id: typeModel
    }

    CommandComboBoxModel {
        id: commandModel
    }

    sourceComponent: Component {
        id: _content

        Column {
            id: content
            anchors.fill: parent

            CardsFiltersHeader {
                id: _filtersHeader
                width: parent.width

                typeProxyModel: typeProxy
                typeComboBoxModel: typeModel
                commandComboBoxModel: commandModel

                separatorColor: root.searchFieldBorderColor
            }

            Flickable {
                width: parent.width
                height: parent.height - _filtersHeader.height
                contentWidth: width
                contentHeight: _listLoader.height
                clip: true

                ScrollIndicator.vertical: ScrollIndicator {}

                Loader {
                    id: _listLoader
                    width: parent.width

                    asynchronous: true
                    sourceComponent: typeProxy.size > 0 ? cardListComponent : emptyCardListComponent
                }
            }
        }
    }

    Component {
        id: cardListComponent
        CardsList {
            height: contentHeight
            width: parent.width
            model: typeProxy
            interactive: false
            onCardClicked: {
                var cardsModel = typeProxy.visibleCards
                root.cardClicked(cardsModel, cardsModel.indexOf(clickedCode))
            }
        }
    }

    Component {
        id: emptyCardListComponent
        Pane {
            background: null
            padding: 16
            topPadding: 32
            bottomPadding: 32

            ColumnLayout {
                width: parent.width
                spacing: 8

                Label {
                    text: qsTr("Ooops! Card not found.")
                    font.pixelSize: 24
                    color: Palette.white
                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }

                Label {
                    text: qsTr("Please try to type a different code or to change filter options.")
                    color: Palette.white
                    opacity: 0.5
                    wrapMode: Text.WordWrap

                    Layout.fillWidth: true
                }
            }
        }
    }
}
