import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2


Page {
    id: root

    ColumnLayout {
        anchors.fill: parent

        Pane {
            Layout.fillWidth: true

            Material.elevation: 1

            RowLayout {
                anchors.fill: parent

                TextField {
                    id: _searchField
                    placeholderText: qsTr("Search code…")
                    inputMethodHints: Qt.ImhPreferNumbers

                    Layout.fillWidth: true

                    onTextEdited: cardsModel.setFilterFixedString(_searchField.text)
                }
            }
        }

        ListView {
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
                            {
                                "code": code,
                                "type": type,
                                "category": category,
                                "image": image,
                                "description": description
                            });
                    }
                }
            }
        }
    }
}
