import QtQuick 2.14
import QtQuick.Controls 2.14

import Mysthea.Models 1.0
import MystheaUniverse.Pages 1.0 as MUPages
import MystheaUniverse.Components 1.0 as MUComponents
import MystheaUniverse.Theme 1.0

MUPages.CardsReference {
    id: root

    typeProxyModel: TypeProxyModel {}
    typeComboBoxModel: TypeComboBoxModel {}
    commandComboBoxModel: CommandComboBoxModel {}

    cardsListComponent: _cardsListComponent

    Component {
        id: _cardsListComponent
        CardsList {
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
        CardDetail {
            property bool isLoading: false

            commandComboBoxModel: root.commandComboBoxModel
            typeComboBoxModel: root.typeComboBoxModel

            sourceComponent: CardDetailDelegate {
                commandComboBoxModel: root.commandComboBoxModel
                typeComboBoxModel: root.typeComboBoxModel
                cards: modelCards
            }

            MUComponents.BackAction {
                id: _backAction
                onTriggered: root.pop()
            }

            Component.onCompleted: {
                root.leftAction = _backAction
            }
        }
    }
}
