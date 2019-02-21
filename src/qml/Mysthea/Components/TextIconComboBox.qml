import QtQuick 2.11
import QtQuick.Window 2.3
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Templates 2.4 as T
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Material.impl 2.4
import QtQuick.Layouts 1.12
import Mysthea.Models 1.0

T.ComboBox {
    id: control
    property string iconRole
    property string displayIcon

    implicitWidth: Math.max(
                       background ? background.implicitWidth : 0,
                       contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        background ? background.implicitHeight : 0, Math.max(
                            contentItem.implicitHeight,
                            indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    leftPadding: padding + (!control.mirrored || !indicator
                            || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator
                             || !indicator.visible ? 0 : indicator.width + spacing)

    Material.elevation: flat ? control.pressed
                               || control.hovered ? 2 : 0 : control.pressed ? 8 : 2
    Material.background: flat ? "transparent" : undefined
    Material.foreground: flat ? undefined : Material.primaryTextColor
    Material.accent: control.palette.plum

    delegate: MenuItem {
        width: parent.width
        Material.foreground: control.currentIndex
                             === index ? parent.Material.accent : parent.Material.foreground
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
        onTriggered: control.displayIcon = iconUrl

        RowLayout {
            spacing: 10
            height: parent.height
            Label {
                text: control.textRole ? (Array.isArray(
                                              control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
                Layout.leftMargin: 20
                Layout.alignment: Qt.AlignVCenter
            }
            Image {
                source: control.iconRole ? (Array.isArray(
                                                control.model) ? modelData[control.iconRole] : model[control.iconRole]) : modelData
                fillMode: Image.PreserveAspectFit

                Layout.preferredHeight: 16
                Layout.rightMargin: 20
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
    indicator: ColorImage {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.enabled ? control.Material.foreground : control.Material.hintTextColor
        source: "qrc:/qt-project.org/imports/QtQuick/Controls.2/Material/images/drop-indicator.png"
    }

    contentItem: Item {
        RowLayout {
            spacing: 8
            height: parent.height
            Label {
                height: parent.height
                text: control.editable ? control.editText : control.displayText
                font: control.font
                color: control.enabled ? control.Material.foreground : control.Material.hintTextColor

                leftPadding: control.editable ? 2 : control.mirrored ? 0 : 12
                Layout.alignment: Qt.AlignVCenter
            }

            Image {
                source: control.displayIcon
                visible: control.displayIcon.length > 0
                fillMode: Image.PreserveAspectFit

                Layout.preferredHeight: 16
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 48

        // external vertical padding is 6 (to increase touch area)
        y: 6
        height: parent.height - 12
        radius: control.flat ? 0 : 2
        color: !control.editable ? control.Material.dialogColor : "transparent"

        layer.enabled: control.enabled && !control.editable
                       && control.Material.background.a > 0
        layer.effect: ElevationEffect {
            elevation: control.Material.elevation
        }

        Rectangle {
            visible: control.editable
            y: parent.y + control.baselineOffset
            width: parent.width
            height: control.activeFocus ? 2 : 1
            color: control.editable
                   && control.activeFocus ? control.Material.accentColor : control.Material.hintTextColor
        }

        Ripple {
            clip: control.flat
            clipRadius: control.flat ? 0 : 2
            x: control.editable && control.indicator ? control.indicator.x : 0
            width: control.editable
                   && control.indicator ? control.indicator.width : parent.width
            height: parent.height
            pressed: control.pressed
            anchor: control.editable
                    && control.indicator ? control.indicator : control
            active: control.pressed || control.visualFocus || control.hovered
            color: control.Material.rippleColor
        }
    }

    popup: T.Popup {
        y: control.editable ? control.height - 5 : 0
        width: control.width
        height: Math.min(contentItem.implicitHeight,
                         control.Window.height - topMargin - bottomMargin)
        transformOrigin: Item.Top
        topMargin: 12
        bottomMargin: 12

        Material.theme: control.Material.theme
        Material.accent: control.Material.accent
        Material.primary: control.Material.primary

        enter: Transition {
            // grow_fade_in
            NumberAnimation {
                property: "scale"
                from: 0.9
                to: 1.0
                easing.type: Easing.OutQuint
                duration: 220
            }
            NumberAnimation {
                property: "opacity"
                from: 0.0
                to: 1.0
                easing.type: Easing.OutCubic
                duration: 150
            }
        }

        exit: Transition {
            // shrink_fade_out
            NumberAnimation {
                property: "scale"
                from: 1.0
                to: 0.9
                easing.type: Easing.OutQuint
                duration: 220
            }
            NumberAnimation {
                property: "opacity"
                from: 1.0
                to: 0.0
                easing.type: Easing.OutCubic
                duration: 150
            }
        }

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0
            T.ScrollIndicator.vertical: ScrollIndicator {
            }
        }

        background: Rectangle {
            radius: 2
            color: parent.Material.dialogColor

            layer.enabled: control.enabled
            layer.effect: ElevationEffect {
                elevation: 8
            }
        }
    }
}
