import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0

ComboBox {
    id: root

    property string urlIcon
    property int roleName

    onCurrentIndexChanged: {
        // This operation is necessary because we need to update the icon in contentItem.
        root.urlIcon = root.iconRole ? root.model.data(root.model.index(
                                                           root.currentIndex,
                                                           0),
                                                       root.roleName) : ""
    }

    contentItem: Item {
        width: parent.width
        implicitHeight: 36

        LabelComboBox {
            id: _contentItem
            height: parent.height
            width: root.width

            text: root.displayText
            iconUrl: root.urlIcon

            textColor: root.enabled ? Palette.black : Palette.placeholderText
            iconAlignLeft: root.iconAlignLeft
        }
    }
}
