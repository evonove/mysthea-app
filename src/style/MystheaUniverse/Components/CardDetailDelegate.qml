import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.14

import MystheaUniverse.Theme 1.0
import Mysthea.Models 1.0

Pane {
    id: root
    topPadding: 24
    bottomPadding: 24
    leftPadding: 20
    rightPadding: 20
    background: null

    property CommandComboBoxModel commandComboBoxModel: null
    property TypeComboBoxModel typeComboBoxModel: null

    property var cards: null

}
