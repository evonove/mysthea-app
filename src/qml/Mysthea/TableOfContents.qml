import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.5
import QtQml.Models 2.3

import Mysthea 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0

Page {
    id: root
    title: qsTr("LORE - Table of contents")
    objectName: PageName.tableOfContentsPage
    padding: 0

    property Action leftAction: null
    property bool hasToolbarLine: true

    signal openSection(int element)

    background: Image {
        source: "qrc:/assets/images/cards-bg.jpg"
        fillMode: Image.PreserveAspectCrop
        smooth: false

        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignBottom

        Rectangle {
            anchors.fill: parent
            color: Palette.mineShaft
            opacity: 0.29
        }
    }

    ListView {
        anchors.fill: parent
        spacing: 12
        clip: true

        ScrollIndicator.vertical: ScrollIndicator {
        }

        header: Label {
            text: qsTr("Table of contents")
            font.pixelSize: 35
            font.letterSpacing: 1
            topPadding: 20
            bottomPadding: 12
            leftPadding: 20
            rightPadding: 0

            color: Palette.grayNurse
        }

        model: TableOfContentsModel {
        }

        delegate: ItemDelegate {
            width: parent.width
            padding: 0

            contentItem: ColumnLayout {
                spacing: 0

                Label {
                    text: chapter
                    font.pixelSize: 27
                    font.letterSpacing: 1
                    topPadding: 0
                    bottomPadding: 4
                    leftPadding: 20
                    rightPadding: 0
                    color: Palette.grayNurse
                }

                Repeater {
                    model: subchapters
                    delegate: ItemDelegate {
                        padding: 0
                        Layout.fillWidth: true
                        Layout.fillHeight: false
                        Layout.preferredHeight: 35

                        contentItem: Label {
                            text: title
                            font.pixelSize: 20
                            font.letterSpacing: 1
                            leftPadding: 32
                            color: Palette.grayNurse
                            verticalAlignment: Text.AlignVCenter
                        }
                        onClicked: {
                            root.openSection(element)
                        }
                    }
                }
            }

            onClicked: {
                root.openSection(element)
            }
        }
    }
}
