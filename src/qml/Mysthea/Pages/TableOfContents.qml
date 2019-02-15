import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.5
import QtQml.Models 2.3

import Mysthea.Theme 1.0

Page {
    id: root
    title: qsTr("LORE - Table of contents")
    objectName: PageName.tableOfContentsPage
    topPadding: 0
    padding: 20

    property Action leftAction: null

    property bool hasToolbarLine: true

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
    ColumnLayout {
        anchors.fill: parent
        spacing: 27

        Label {
            text: qsTr("Table of contents")
            font.pixelSize: 35
            font.letterSpacing: 1
            topPadding: 20
            padding: 0

            color: Palette.grayNurse
        }

        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 27
            clip: true

            model: ListModel {
                ListElement {
                    chapter: qsTr("General Setting")
                    subchapters: [
                        ListElement {
                            title: qsTr("The Planet Icaion")
                        },
                        ListElement {
                            title: qsTr("Mysthea")
                        },
                        ListElement {
                            title: qsTr("The Five")
                        }
                    ]
                }
                ListElement {
                    chapter: qsTr("The World of Mysthea")
                    subchapters: [
                        ListElement {
                            title: qsTr("Society")
                        },
                        ListElement {
                            title: qsTr("Ilvash and the Kingdom of Ahatils")
                        },
                        ListElement {
                            title: qsTr("A Breakhthrough")
                        }
                    ]
                }
                ListElement {
                    chapter: qsTr("The Ancient Guilds of Ilvash")
                    subchapters: [
                        ListElement {
                            title: qsTr("Varorin – Guild of Merchants")
                        },
                        ListElement {
                            title: qsTr("Volarees – Guild of Nobility")
                        },
                        ListElement {
                            title: qsTr("Lusma – Guild of Faith")
                        },
                        ListElement {
                            title: qsTr("Kaetur – Guild of Soldiers")
                        },
                        ListElement {
                            title: qsTr("Magista – Guild of Scholars")
                        },
                        ListElement {
                            title: qsTr("Shinglori - Order of Champions")
                        }
                    ]
                }
                ListElement {
                    chapter: qsTr("Champions of Ilvash")
                    subchapters: [
                        ListElement {
                            title: qsTr("Telron")
                        },
                        ListElement {
                            title: qsTr("Anuth")
                        },
                        ListElement {
                            title: qsTr("Celethe")
                        },
                        ListElement {
                            title: qsTr("Leheir")
                        },
                        ListElement {
                            title: qsTr("Sanya")
                        },
                        ListElement {
                            title: qsTr("Kolbor & Malabor")
                        },
                        ListElement {
                            title: qsTr("CR 2T1")
                        }
                    ]
                }
                ListElement {
                    chapter: qsTr("Monsters")
                    subchapters: [
                        ListElement {
                            title: qsTr("Onygauros the Collector")
                        },
                        ListElement {
                            title: qsTr("Boulron the Reaper")
                        },
                        ListElement {
                            title: qsTr("Caerulas the Inhabitant from Below")
                        },
                        ListElement {
                            title: qsTr("Obsidusa the Devourer")
                        },
                        ListElement {
                            title: qsTr("Cannibarok the Qoam Eater")
                        },
                        ListElement {
                            title: qsTr("Kodror the Infestation")
                        },
                        ListElement {
                            title: qsTr("Utcoro the Swarmer")
                        }
                    ]
                }
                ListElement {
                    chapter: qsTr("Misc")
                    subchapters: [
                        ListElement {
                            title: qsTr("Qoam Manipulation")
                        }

                    ]
                }
            }

            delegate: ItemDelegate {
                width: parent.width
                padding: 0

                contentItem: ColumnLayout {
                    Label {
                        text: chapter
                        font.pixelSize: 27
                        font.letterSpacing: 1
                        padding: 0
                        color: Palette.grayNurse
                    }
                    Repeater {
                        model: subchapters
                        delegate: ItemDelegate {
                            Label {
                                text: title
                                font.pixelSize: 20
                                font.letterSpacing: 1
                                leftPadding: 12
                                padding: 0
                                color: Palette.grayNurse
                            }
                        }
                    }
                }

                onClicked: console.log(model.chapter)
            }
        }
    }
}