import QtQuick 2.11
import QtQuick.Controls 2.3

import MystheaUniverse.Theme 1.0
import Mysthea.Components 1.0

Page {
    id: root

    property alias logo: _header.logo

    header: Header {
        id: _header
    }
}
