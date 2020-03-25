import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4

import MystheaUniverse.Theme 1.0

ScrollIndicator {
    id: control

    contentItem: Rectangle {
        implicitWidth: 2
        implicitHeight: 2

        color: Palette.white
        visible: control.size < 1.0
        opacity: 0.0

        states: State {
            name: "active"
            when: control.active
            PropertyChanges { target: control.contentItem; opacity: 0.5 }
        }

        transitions: [
            Transition {
                from: "active"
                SequentialAnimation {
                    PauseAnimation { duration: 450 }
                    NumberAnimation { target: control.contentItem; duration: 200; property: "opacity"; to: 0.0 }
                }
            }
        ]
    }
}
