import QtQuick 2.14
import QtQuick.Controls 2.14

import Mysthea.Models 1.0
import MystheaUniverse.Theme 1.0

Page {
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


    function push(component, properties) {
        _stack.push(component, properties)
        _stack.forceActiveFocus()
    }

    function pop() {
        _stack.pop()
        _stack.forceActiveFocus()
    }

    function replace(component) {
        _stack.replace(component)
        _stack.forceActiveFocus()
    }

    background: Rectangle {
        color: Palette.black
    }

    BusyIndicator {
        anchors.centerIn: parent
        running: _stack.currentItem.isLoading
        z: 3
    }

    StackView {
        id: _stack
        anchors.fill: parent
        focus: true

        initialItem: CardsBasePage {
            typeProxyModel: root.typeProxyModel
            typeComboBoxModel: root.typeComboBoxModel
            commandComboBoxModel: root.commandComboBoxModel
            searchFieldBorderColor: root.searchFieldBorderColor
            sourceComponent: root.typeProxyModel.size
                             > 0 ? root.cardsListComponent : emptyCardListComponent
        }

        // Handles click of back button by popping current page from Swipe
        Keys.onPressed: {
            if (event.key === Qt.Key_Escape || event.key === Qt.Key_Back) {
                if (_stack.depth > 1) {
                    _stack.pop()
                    event.accepted = true
                }
            }
        }
    }

    Component {
        id: emptyCardListComponent
        CardNotFound {
            anchors.fill: parent
        }
    }
}
