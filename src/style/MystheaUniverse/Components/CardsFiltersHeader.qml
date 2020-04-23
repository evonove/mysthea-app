import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import MystheaUniverse.Components 1.0
import Mysthea.Models 1.0
import Translations 1.0

ToolBar {
    id: root

    property TypeProxyModel typeProxyModel: null
    property TypeComboBoxModel typeComboBoxModel: null
    property CommandComboBoxModel commandComboBoxModel: null

    signal comboboxValueChanged()

    implicitHeight: 136
    padding: 16

    ColumnLayout {
        anchors.fill: parent
        spacing: 16

        SearchField {
            id: _searchField

            borderColor: root.separatorColor
            placeholderText: qsTr("Search cards by code")
            font.family: "FuturaPTBook"
            font.pixelSize: 18

            Layout.fillWidth: true

            onTextEdited: root.typeProxyModel.setCodeFilter(_searchField.text)
        }

        RowLayout {
            spacing: 16

            Layout.fillWidth: true

            TextIconComboBox {
                id: _typesCombo

                model: root.typeComboBoxModel

                textRole: "type"
                iconRole: "iconUrl"
                roleName: TypeComboBoxModel.IconUrl
                iconAlignLeft: false

                Layout.fillWidth: true

                onActivated: {
                    root.typeProxyModel.setTypeFilter(
                                root.typeComboBoxModel.data(
                                    root.typeComboBoxModel.index(index, 0),
                                    TypeComboBoxModel.Key))
                    root.comboboxValueChanged()
                }
            }

            TextIconComboBox {
                id: _commandsCombo
                padding: 0
                model: root.commandComboBoxModel
                enabled: root.typeProxyModel.enableCommand

                textRole: "command"
                iconRole: "iconUrl"
                roleName: CommandComboBoxModel.IconUrl
                iconAlignLeft: true

                Layout.fillWidth: true

                onActivated: {
                    root.typeProxyModel.setCommandFilter(
                                root.commandComboBoxModel.data(
                                    root.commandComboBoxModel.index(index, 0),
                                    CommandComboBoxModel.Key))
                    root.comboboxValueChanged()
                }

                onEnabledChanged: {
                    if (!enabled) {
                        currentIndex = 0
                    }
                }
            }

            // We created this connection because the currentText of combobox doesn't change when changing
            // language and its displayText will not update.
            Connections {
                target: TranslationsManager
                onCurrentLanguageChanged: {
                    _typesCombo.displayText = Qt.binding(function () {
                        return root.typeComboBoxModel.data(
                                    root.typeComboBoxModel.index(
                                        _typesCombo.currentIndex, 0),
                                    TypeComboBoxModel.Type)
                    })
                    _commandsCombo.displayText = Qt.binding(function () {
                        return root.commandComboBoxModel.data(
                                    root.commandsComboBoxModel.index(
                                        _commandsCombo.currentIndex, 0),
                                    CommandComboBoxModel.Command)
                    })
                }
            }
        }
    }
}
