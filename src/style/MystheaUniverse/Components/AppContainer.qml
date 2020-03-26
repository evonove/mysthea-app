import QtQuick 2.11
import QtQuick.Controls 2.3

import MystheaUniverse.Theme 1.0
import Mysthea.Components 1.0

Page {
    id: root

    property real headerHeight: 54
    property alias logo: _header.logo

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
}
