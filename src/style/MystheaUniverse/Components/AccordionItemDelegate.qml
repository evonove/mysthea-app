import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import MystheaUniverse.Theme 1.0

ItemDelegate {
    id: root
    property string accordionText
    property Component accordionContent

    checkable: true
    height: 52

    contentItem: ColumnLayout {
        id: _content
        spacing: 0
        height: root.implicitHeight
        RowLayout {
            Layout.fillWidth: true
            spacing: 16
            Label {
                id: _labelsText
                text: root.accordionText
                font.family: "FuturaPTBold"
                color: Palette.white
                Layout.fillWidth: true
                Layout.leftMargin: 15
            }

            Image {
                id: arrowImage
                source: "qrc:/assets/icons/arrow.svg"
                sourceSize.height: 24
                Layout.rightMargin: 15
            }
        }
        Loader {
            id: _loader
            Layout.fillWidth: true
            sourceComponent: root.accordionContent
            active: false
            opacity: 0
        }
    }

    states: [
        State {
            name: 'expanded'
            when: root.checked
            PropertyChanges {
                target: arrowImage
                rotation: 90
            }
            PropertyChanges {
                target: root
                height: root.implicitHeight
            }
            PropertyChanges {
                target: _loader
                active: true
            }
            PropertyChanges {
                target: _loader
                opacity: 1
            }
        }
    ]

    transitions: Transition {
        reversible: true
        to: 'expanded'
        animations: [
            SequentialAnimation {
                PropertyAnimation {
                    target: root
                    property: "height"
                    duration: 100
                }
                NumberAnimation {
                    target: _loader
                    property: "opacity"
                    duration: 100
                }
            },
            PropertyAnimation {
                target: arrowImage
                property: "rotation"
                duration: 100
            }
        ]
    }
}
