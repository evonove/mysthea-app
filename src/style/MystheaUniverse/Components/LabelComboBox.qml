import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

RowLayout {
    id: control
    spacing: 8

    property alias text: _label.text
    property alias iconUrl: _icon.source
    property alias textColor: _label.color
    property bool iconAlignLeft: false

    Label {
        id: _label
        elide: Text.ElideRight

        Layout.fillHeight: false
        Layout.fillWidth: false
        Layout.leftMargin: 16
    }

    Image {
        id: _icon

        fillMode: Image.PreserveAspectFit
        sourceSize.width: 16
        sourceSize.height: 16

        Layout.fillHeight: false
        Layout.fillWidth: false
        Layout.preferredHeight: 16
        Layout.rightMargin: 16
        Layout.alignment: control.iconAlignLeft ? Qt.AlignLeft : Qt.AlignRight
    }
}
