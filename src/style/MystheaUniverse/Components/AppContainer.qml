import QtQuick 2.11
import QtQuick.Controls 2.3

import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Pages 1.0

Page {
    id: root

    property real headerHeight: 54
    property alias logo: _header.logo
    property list<Component> appContents
    property Action leftAction: _stack.currentItem.leftAction
    property alias rightAction: _header.rightAction

    property color mainColor
    property color whiteColor
    property color accentColor
    property color headerSeparatorColor
    property color headerBackgroundColor

    signal cardsReferenceClicked
    signal gameSetupClicked
    signal rulebookClicked
    signal extrasClicked

    QtObject {
        // These functions take tracks of swipe history.
        id: history

        // It stores the index of pages that we visited.
        property list<Component> items

        function push(component) {
            let lastComponent = items[items.length - 1]
            if (lastComponent !== component) {
                items.push(component)
                _stack.push(component)
            }
            _stack.currentItem.forceActiveFocus()
        }

        function pop() {
            if(items.length > 1) {
                items.pop()
            }
        }
    }

    header: Header {
        id: _header
        width: parent.width
        height: root.headerHeight
        z: 2

        leftAction: root.leftAction
        separatorColor: root.headerSeparatorColor
        backgroundColor: root.headerBackgroundColor
    }

    onActiveFocusChanged: {
        if(root.activeFocus) {
            _stack.currentItem.forceActiveFocus()
        }
    }

    StackView {
        id: _stack
        anchors.fill: parent
        focus: true

        initialItem: root.appContents[0]

        // Handles click of back button by popping current page from Swipe
        Keys.onPressed: {
            if (event.key === Qt.Key_Escape || event.key === Qt.Key_Back) {
                if (_stack.depth > 1) {
                    _stack.pop()
                    _stack.currentItem.forceActiveFocus()
                    event.accepted = true
                }
            }
        }
    }

    footer: TabBar {
        id: _tabbar
        width: parent.width
        height: 49

        borderColor: root.accentColor

        TabButton {
            icon.source: "qrc:/assets/icons/card_reference_icon.svg"
            text: qsTr("Cards Reference")
            checked: _stack.currentItem.objectName === PageName.cardPage

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: {
                root.cardsReferenceClicked()
                history.push(root.appContents[0])
            }
        }

        TabButton {
            icon.source: "qrc:/assets/icons/game_setup_icon.svg"
            text: qsTr("Game Setup")
            checked: _stack.currentItem.objectName === PageName.gameSetupPage

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: {
                root.gameSetupClicked()
                history.push(root.appContents[1])
            }
        }

        TabButton {
            icon.source: "qrc:/assets/icons/rulebook_icon.svg"
            text: qsTr("Rulebook")
            checked: _stack.currentItem.objectName === PageName.rulebookPage

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: {
                root.rulebookClicked()
                history.push(root.appContents[2])
            }
        }

        TabButton {
            icon.source: "qrc:/assets/icons/extras_icon.svg"
            text: qsTr("Extras")
            checked: _stack.currentItem.objectName === PageName.extrasPage

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: {
                root.extrasClicked()
                history.push(root.appContents[3])
            }
        }
    }
}
