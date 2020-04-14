import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import MystheaUniverse.Theme 1.0

Pane {
    background: null
    padding: 16
    topPadding: 32
    bottomPadding: 32

    ColumnLayout {
        width: parent.width
        spacing: 8

        Label {
            text: qsTr("Ooops! Card not found.")
            font.pixelSize: 24
            color: Palette.white
            wrapMode: Text.WordWrap

            Layout.fillWidth: true
        }

        Label {
            text: qsTr("Please try to type a different code or to change filter options.")
            color: Palette.white
            opacity: 0.5
            wrapMode: Text.WordWrap

            Layout.fillWidth: true
        }
    }
}
