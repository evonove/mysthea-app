import QtQuick 2.14
import QtQuick.Controls 2.14

import Mysthea.Models 1.0
import MystheaUniverse.Theme 1.0

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import MystheaUniverse.Theme 1.0

StackPage {
    id: root
    title: qsTr("CARDS REFERENCE")
    objectName: PageName.cardPage

    property color searchFieldBorderColor
    property Action leftAction: null
    property Component cardsListComponent: null
    // NOTE: Those models works only if all the apps have the same structure.
    // Eventually, if the apps have not the same structure, it will be necessary
    // to change it and moved into CardsBasePage component.
    property TypeProxyModel typeProxyModel: null
    property TypeComboBoxModel typeComboBoxModel: null
    property CommandComboBoxModel commandComboBoxModel: null

    initialItem: Component {
        id: _cardPage
        CardsBasePage {
            id: _cardBasePage
            typeProxyModel: root.typeProxyModel
            typeComboBoxModel: root.typeComboBoxModel
            commandComboBoxModel: root.commandComboBoxModel
            searchFieldBorderColor: root.searchFieldBorderColor
            sourceComponent: root.typeProxyModel.size
                             > 0 ? root.cardsListComponent : emptyCardListComponent
        }
    }

    Component {
        id: emptyCardListComponent
        CardNotFound {
            anchors.fill: parent
        }
    }
}
