import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.5

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Pages 1.0 as Pages

Pages.Lore {
    id: root
    loreModel: LoreModel {
        width: root.availableWidth
    }
}
