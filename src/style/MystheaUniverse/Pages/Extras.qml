import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import MystheaUniverse.Theme 1.0

Page {
    id: root

    property bool isPushing: false
    property alias menuPage: _extrasStackView.initialItem
    property alias pageStates: pageStatesList.states

    function pushToStack(component, stateToCheck) {
        // throttle clicks
        if (root.isPushing)
            return
        // avoid to push a page if it is the
        // current visible page
        if (pageStatesList.state !== stateToCheck) {
            root.isPushing = true
            _extrasStackView.push(component)
        }
        root.isPushing = false
    }

    signal moveToSection(int element)

    StackView {
        id: _extrasStackView
        anchors.fill: parent
        focus: true
        padding: 0
        background: Rectangle {
            color: Palette.mineShaft
        }

        // Handles click of back button by popping current page from StackView
        Keys.onPressed: {
            if (event.key === Qt.Key_Escape || event.key === Qt.Key_Back) {
                if (_extrasStackView.depth > 1) {
                    _extrasStackView.pop()
                    event.accepted = true
                }
            }
        }
    }

    StateGroup {
        id: pageStatesList
    }
}
