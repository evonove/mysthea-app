import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.impl 2.14
import QtQuick.Layouts 1.14

import MystheaUniverse.Theme 1.0

TextField {
    id: control

    property color borderColorFocus: Palette.white
    signal resetSearchFieldClicked

    implicitHeight: 48
    topPadding: 13
    bottomPadding: 13
    leftPadding: 64
    rightPadding: 19

    Label {
        id: iconSearch
        height: parent.height
        leftPadding: 19

        text: Icon.search
        color: control.activeFocus ? Palette.black : Palette.placeholderText
        font.pixelSize: 24
        font.family: "Material Icons"
        verticalAlignment: control.verticalAlignment
    }

    PlaceholderText {
        id: placeholder
        anchors.left: iconSearch.right
        padding: 0

        color: Palette.placeholderText
        verticalAlignment: control.verticalAlignment
    }

    Image {
        id: _resetTextButton
        anchors.right: control.right
        width: 48
        height: 48
        source: "qrc:/assets/icons/clear_filter_icon.svg"
        sourceSize.width: 48
        sourceSize.height: 48
        fillMode: Image.PreserveAspectFit
        visible: false

        MouseArea {
            anchors.fill: parent
            onClicked: control.resetSearchFieldClicked()
        }
    }

    background: Rectangle {
        color: Palette.white
        border.color: control.activeFocus ? control.borderColorFocus : Palette.white
        border.width: 2
        radius: 5
    }

    onPreeditTextChanged: {
        if (control.displayText.length > 0) {
            _resetTextButton.visible = true
        } else {
            _resetTextButton.visible = false
        }
    }

    onTextEdited: {
        if (control.text.length > 0) {
            _resetTextButton.visible = true
        } else {
            _resetTextButton.visible = false
        }
    }

    onResetSearchFieldClicked: {
        _resetTextButton.visible = false
        control.forceActiveFocus()
    }
}
