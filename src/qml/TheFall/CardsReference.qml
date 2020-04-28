import QtQuick 2.14
import QtQuick.Controls 2.14

import TheFall.Models 1.0
import MystheaUniverse.Pages 1.0 as BasePages
import MystheaUniverse.Components 1.0 as Components
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Models 1.0

BasePages.CardsReference {
    id: root

    typeProxyModel: TheFallTypeProxyModel {
        configurationFilePath: "qrc:/configurations/the_fall_configuration.json"
    }
    typeComboBoxModel: TypeComboBoxModel {
        configurationFilePath: "qrc:/configurations/the_fall_configuration.json"
    }

    cardsListComponent: _cardsListComponent

    Component {
        id: _cardsListComponent
        Components.CardsList {
            anchors.fill: parent
            commandComboBoxModel: root.commandComboBoxModel
            typeComboBoxModel: root.typeComboBoxModel
            model: typeProxyModel
            onCardClicked: {
                var cardsModel = typeProxyModel.visibleCards
                root.push(_cardDetail, {
                              "model": cardsModel,
                              "index": cardsModel.indexOf(clickedCode)
                          })
            }
        }
    }

    Component {
        id: _cardDetail
        BasePages.CardDetail {
            property bool isLoading: false

            commandComboBoxModel: root.commandComboBoxModel
            typeComboBoxModel: root.typeComboBoxModel

            sourceComponent: CardDetailDelegate {
                commandComboBoxModel: root.commandComboBoxModel
                typeComboBoxModel: root.typeComboBoxModel
                cards: modelCards
            }

            Components.BackAction {
                id: _backAction
                onTriggered: root.pop()
            }

            Component.onCompleted: {
                root.leftAction = _backAction
            }
        }
    }

}
