import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

Page {
    id: root
    /*
      This page repersents the base of all CardsList or CardsNotFound pages.
      For default it contains the CardsFilterHeader and the models that it needs.
      These are the cards proxy model and another two models to populate the
      filters' combobox.
    */
    property color searchFieldBorderFocusColor: Palette.white
    property color comboBoxAccentColor: Palette.black
    property bool isLoading: _loader.status !== Loader.Ready
    property alias sourceComponent: _loader.sourceComponent
    property Action leftAction: null

    property alias typeProxyModel: _filtersHeader.typeProxyModel
    property alias typeComboBoxModel: _filtersHeader.typeComboBoxModel
    property alias commandComboBoxModel: _filtersHeader.commandComboBoxModel

    background: Rectangle {
        color: Palette.black
    }

    Column {
        anchors.fill: parent

        CardsFiltersHeader {
            id: _filtersHeader
            width: parent.width
            separatorFocusColor: root.searchFieldBorderFocusColor
            comboBoxAccentColor: root.comboBoxAccentColor
            backgroundColor: Palette.black

            onComboboxValueChanged: {
                // In loader we don't have only listView so we check if the item has this property
                if (_loader.item.hasOwnProperty('positionViewAtBeginning')) {
                    _loader.item.positionViewAtBeginning()
                }
            }
        }

        Loader {
            id: _loader
            height: parent.height - _filtersHeader.height
            width: parent.width
            asynchronous: true
        }
    }
}
