import QtQuick 2.11
import QtQuick.Controls 2.3

import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0

Page {
    id: root

    property real headerHeight: 54

    property alias logo: _header.logo
    property alias appContents: _swipe.contentData

    property color mainColor
    property color whiteColor
    property color accentColor

    signal cardsReferenceClicked
    signal gameSetupClicked
    signal rulebookClicked
    signal extrasClicked

    QtObject {
        // These functions take tracks of swipe history.
        id: history

        // It stores the index of pages that we visited.
        property var items: [0]

        function push(index) {
            let lastIndex = items[items.length - 1]
            if (lastIndex !== index) {
                items.push(index)
                // Update the item in swipe view.
                _swipe.currentIndex = index
            }
            _swipe.currentItem.forceActiveFocus()
        }

        function pop() {
            if (items.length > 1) {
                items.pop()
                let index = items[items.length - 1]
                // Update the item in swipe view.
                _swipe.currentIndex = index
                // Update the current item of tabbar to highlight the correct button.
                _tabbar.currentIndex = index
            }
            _swipe.currentItem.forceActiveFocus()
        }
    }

    header: Header {
        id: _header
        width: parent.width
        height: root.headerHeight
        z: 2

        rightAction: Action {
            id: _backAction
            icon.source: "qrc:/assets/icons/menu.svg"
        }
    }

    contentItem: SwipeView {
        id: _swipe
        width: parent.width
        height: parent.height - header.height - footer.height
        focus: true
        interactive: false

        // Handles click of back button by popping current page from Swipe
        Keys.onPressed: {
            if (event.key === Qt.Key_Escape || event.key === Qt.Key_Back) {
                if (history.items.length > 1) {
                    history.pop()
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

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: history.push(TabBar.index)
        }

        TabButton {
            icon.source: "qrc:/assets/icons/game_setup_icon.svg"
            text: qsTr("Game Setup")

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: history.push(TabBar.index)
        }

        TabButton {
            icon.source: "qrc:/assets/icons/rulebook_icon.svg"
            text: qsTr("Rulebook")

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: history.push(TabBar.index)
        }

        TabButton {
            icon.source: "qrc:/assets/icons/extras_icon.svg"
            text: qsTr("Extras")

            checkedColor: root.mainColor
            uncheckedColor: root.whiteColor

            onClicked: history.push(TabBar.index)
        }
    }
}
