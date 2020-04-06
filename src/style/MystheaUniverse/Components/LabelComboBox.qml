import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

Item {
    id: control

    implicitHeight: 36
    implicitWidth: 164

    property alias text: _label.text
    property alias iconUrl: _icon.source
    property alias textColor: _label.color
    property bool iconAlignLeft: false

    Label {
        id: _label
        height: parent.height
        verticalAlignment: Text.AlignVCenter

        anchors.left: control.left
        anchors.leftMargin: control.iconAlignLeft
                            && control.iconUrl != "" ? 36 : 16

        elide: Text.ElideRight
        font.pixelSize: 18
        font.letterSpacing: 0
    }

    Image {
        id: _icon
        anchors.left: control.iconAlignLeft ? control.left : _label.right
        anchors.leftMargin: control.iconAlignLeft ? 8 : 0
        anchors.verticalCenter: parent.verticalCenter

        width: 24
        height: 16
        fillMode: Image.PreserveAspectFit
        sourceSize.width: 16
        sourceSize.height: 16
    }
}
