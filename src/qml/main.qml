import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.4

import Mysthea.Pages 1.0
import Mysthea.Theme 1.0
import Mysthea.Models 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 375
    height: 667
    title: qsTr("Mysthea")

    font.family: "Yanone Kaffeesatz"
    font.pixelSize: 18
    Material.accent: Palette.maroonFlush

    Action {
        id: drawerAction
        text: Icon.menu
        onTriggered: console.log("drawer clicked.")
    }

    Action {
        id: backAction
        text: Icon.back
        onTriggered: _mainStackView.pop()
    }

    ToolBar {
        id: toolbar
        padding: 0
        z: 2
        width: parent.width
        height: 56
        position: ToolBar.Header

        background: Rectangle {
            visible: _mainStackView.currentItem.hasToolbarLine
            anchors.bottom: parent.bottom
            width: parent.width
            height: 0.5
            color: Palette.white
            opacity: 0.5
        }
        ToolButton {
            id: toolButton
            height: parent.height
            font.pixelSize: 24
            font.family: "Material Icons"
            action: _mainStackView.currentItem.leftAction
        }
        RowLayout {
            anchors.fill: parent
            Label {
                id: label
                Layout.fillWidth: true
                Layout.fillHeight: true
                anchors.topMargin: 16
                text: _mainStackView.currentItem.title
                font.pixelSize: 20
                font.letterSpacing: 0.5
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
            }

            Repeater {
                model: _mainStackView.currentItem.rightActions
                ToolButton {
                    height: parent.height
                    font.pixelSize: 24
                    font.family: "Material Icons"
                    action: modelData
                }
            }
        }
    }

    // Loads Material icons font
    FontLoader {
        source: "qrc:/assets/fonts/MaterialIcons-Regular.ttf"
    }
    FontLoader {
        source: "qrc:/assets/fonts/YanoneKaffeesatz-Regular.ttf"
    }
    FontLoader {
        source: "qrc:/assets/fonts/YanoneKaffeesatz-Bold.ttf"
    }

    StackView {
        id: _mainStackView
        anchors.fill: parent
        focus: true

        background: Rectangle {
            color: Palette.mineShaft
        }

        // Handles click of back button by popping current page from StackView
        Keys.onPressed: {
            if (event.key === Qt.Key_Escape || event.key === Qt.Key_Back) {
                if (_mainStackView.depth > 1) {
                    _mainStackView.pop()
                    event.accepted = true
                }
            }
        }

        initialItem: MainMenu {
            leftAction: drawerAction
            onCardsReferenceClicked: _mainStackView.push(_cardReference)
            onGameSetupClicked: _mainStackView.push(_gameSetup)
            onRulesbookClicked: _mainStackView.push(_rulebook)
            onLoreClicked: _mainStackView.push(_lore)
            onLanguageClicked: _mainStackView.push(_language)
            onCreditsClicked: _mainStackView.push(_credits)
        }

        Component {
            id: _cardReference
            CardsReferencePage {
                leftAction: drawerAction
                onCardClicked: _mainStackView.push(_detailPage, {
                                                       "model": cards,
                                                       "index": index
                                                   })
            }
        }
        Component {
            id: _detailPage
            DetailPage {
                leftAction: backAction
            }
        }

        Component {
            id: _gameSetup
            GameSetup {
                leftAction: drawerAction
            }
        }

        Component {
            id: _rulebook
            Rulebook {
                leftAction: backAction
            }
        }

        Component {
            id: _lore
            Lore {
                leftAction: backAction
            }
        }

        Component {
            id: _language
            Language {
                leftAction: backAction
            }
        }

        Component {
            id: _credits
            Credits {
                leftAction: backAction
            }
        }
    }
}
