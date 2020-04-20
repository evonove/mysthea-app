import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0
import MystheaUniverse.Pages 1.0 as Pages

Pages.Lore {
    id: root
    loreModel: LoreModel {
        width: root.availableWidth
    }
}
