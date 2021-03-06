import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import MystheaUniverse.Components 1.0
import MystheaUniverse.Models 1.0
import Translations 1.0

ToolBar {
    id: root

    property TypeProxyModel typeProxyModel: null
    property TypeComboBoxModel typeComboBoxModel: null
    property CommandComboBoxModel commandComboBoxModel: null
    property color accentColor

    signal comboboxValueChanged

    implicitHeight: 136
    padding: 16

    ColumnLayout {
        anchors.fill: parent
        spacing: 16

        SearchField {
            id: _searchField
            borderColorFocus: root.accentColor
            placeholderText: qsTr("Search cards by code")
            font.family: "FuturaPTBook"
            font.pixelSize: 18

            Layout.fillWidth: true

            onTextEdited: root.typeProxyModel.setCodeFilter(_searchField.text)

            onResetSearchFieldClicked: {
                _searchField.clear()
                _searchField.update()
                root.typeProxyModel.setCodeFilter(_searchField.displayText)
            }

            onPreeditTextChanged: {
                root.typeProxyModel.setCodeFilter(_searchField.displayText)
            }
        }

        RowLayout {
            spacing: 16

            Layout.fillWidth: true

            TextIconComboBox {
                id: _typesCombo

                model: root.typeComboBoxModel
                textRole: "type"
                roleName: TypeComboBoxModel.IconUrl
                accentColor: root.accentColor


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
                enabled: root.commandComboBoxModel
                         != null ? root.typeProxyModel.enableCommand : false

                visible: root.commandComboBoxModel != null

                textRole: "command"
                iconRole: root.commandComboBoxModel != null ? "iconUrl" : ""
                roleName: CommandComboBoxModel.IconUrl
                iconAlignLeft: true
                accentColor: root.accentColor

                Layout.fillWidth: root.commandComboBoxModel != null

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
                    if (_commandsCombo.visible) {
                        _commandsCombo.displayText = Qt.binding(function () {
                            return root.commandComboBoxModel.data(
                                        root.commandComboBoxModel.index(
                                            _commandsCombo.currentIndex, 0),
                                        CommandComboBoxModel.Command)
                        })
                    }
                }
            }
        }
    }
}
