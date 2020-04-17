import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQml.Models 2.14
import QtGraphicalEffects 1.14

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

ObjectModel {
    id: root
    property int width: 100

    Flickable {
        contentWidth: root.width
        contentHeight: step1.height

        ColumnLayout {
            id: step1
            width: parent.width
            spacing: 20
        }
    }
}

