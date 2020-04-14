import QtQuick 2.14
import QtQuick.Controls 2.14

import Mysthea.Models 1.0
import MystheaUniverse.Theme 1.0

Page {
    id: root

    property alias initialItem: _stack.initialItem

    function push(component, properties) {
        _stack.push(component, properties)
        _stack.forceActiveFocus()
    }

    function pop() {
        _stack.pop()
        _stack.forceActiveFocus()
    }

    function clear() {
        if(_stack.depth > 1) {
            _stack.pop(StackView.Immediate)
            _stack.push(root.initialItem, StackView.Immediate)
            _stack.forceActiveFocus()
        }
    }

    function replace(component) {
        _stack.replace(component, {}, StackView.Immediate)
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
        clip: true

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
}
