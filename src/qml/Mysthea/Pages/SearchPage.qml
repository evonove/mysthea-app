import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2

import Mysthea.Components 1.0

Page {
    id: root

    ColumnLayout {
        anchors.fill: parent

        Pane {
            Layout.fillWidth: true

            Material.elevation: 1

            ColumnLayout {
                anchors.fill: parent

                TextField {
                    id: _searchField
                    placeholderText: qsTr("Search code…")
                    inputMethodHints: Qt.ImhPreferNumbers

                    Layout.fillWidth: true

                    onTextEdited: cardsModel.setCodeFilter(_searchField.text)
                }

                RowLayout {
                    ComboBox {
                        model: ["All Categories", "Era X", "Era I", "Era II", "Era III", "Hero", "Attunement"]

                        Layout.minimumWidth: 150

                        onActivated: cardsModel.setCategoryFilter(model[index]);
                    }

                    ColorComboBox {
                        Layout.minimumWidth: 150

                        onActivated: cardsModel.setColorFilter(model.get(index).colorName);
                    }
                }
            }
        }

        ListView {
            id: _cardsList
            model: cardsModel

            clip: true

            Layout.fillWidth: true
            Layout.fillHeight: true

            ScrollIndicator.vertical: ScrollIndicator {}

            delegate: Pane {
                height: 60
                width: parent.width

                Label {
                    font.pixelSize: 18
                    text: code
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        // Unfocuses search field so that keyboard is hidden
                        _searchField.focus = false;

                        root.StackView.view.push(
                            "qrc:/qml/Mysthea/Pages/DetailPage.qml",
                            { "model": _cardsList.model, "index": index }
                        );
                    }
                }
            }
        }
    }
}
