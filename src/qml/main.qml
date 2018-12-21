import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.4
import QtQml.Models 2.1
import QtGraphicalEffects 1.0

import Mysthea.Pages 1.0
import Mysthea.Theme 1.0
import Mysthea.Models 1.0
import Translations 1.0
import Mysthea.Components 1.0

ApplicationWindow {
    id: root

    signal changed

    visible: true
    width: 375
    height: 667
    title: qsTr("Mysthea")

    font.family: "Yanone Kaffeesatz"
    font.pixelSize: 18
    Material.accent: Palette.maroonFlush

    property bool isPushing: false

    function pushToStack(component, stateToCheck) {
        // throttle clicks
        if (root.isPushing)
            return

        // avoid to push a page if it is the
        // current visible page
        console.log(stateToCheck)
        console.log(component)

        if (pages.state !== stateToCheck) {
            root.isPushing = true
            _mainStackView.push(component)
        }
        drawer.close()
        root.isPushing = false
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

    Action {
        id: drawerAction
        text: Icon.menu
        onTriggered: drawer.open()
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

    MainDrawer {
        id: drawer
        width: 0.8 * root.width
        height: root.height

        state: pages.state

        // This property is used to throttle clicks
        // and avoid pushing a page while one is being
        // loaded
        onHomeClicked: {
            root.pushToStack(_homePage, "homePage")
        }

        onCardsReferenceClicked: {
            root.pushToStack(_cardReference, "cardsReferencePage")
        }
        onGameSetupClicked: {
            root.pushToStack(_gameSetup, "gameSetupPage")
        }
        onRulesbookClicked: {
            root.pushToStack(_rulebook, "rulebookPage")
        }
        onLoreClicked: {
            root.pushToStack(_lore, "lorePage")
        }
    }

    StackView {
        id: _mainStackView
        anchors.fill: parent
        focus: !drawer.activeFocus
        padding: 0
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

        initialItem: _homePage
        Component {
            id: _homePage
            MainMenu {
                leftAction: drawerAction
                onCardsReferenceClicked: _mainStackView.push(_cardReference)
                onGameSetupClicked: _mainStackView.push(_gameSetup)
                onRulesbookClicked: _mainStackView.push(_rulebook)
                onLoreClicked: _mainStackView.push(_lore)
            }
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
                leftAction: drawerAction
            }
        }
        Component {
            id: _lore
            Lore {
                leftAction: drawerAction
            }
        }
    }

    StateGroup {
        id: pages
        states: [
            State {
                name: "homePage"
                when: _mainStackView.currentItem.objectName === "homePage"
            },
            State {
                name: "cardsReferencePage"
                when: _mainStackView.currentItem.objectName === "cardsReferencePage"
            },
            State {
                name: "gameSetupPage"
                when: _mainStackView.currentItem.objectName === "gameSetupPage"
            },
            State {
                name: "rulebookPage"
                when: _mainStackView.currentItem.objectName === "rulebookPage"
            },
            State {
                name: "lorePage"
                when: _mainStackView.currentItem.objectName === "lorePage"
            }
        ]
    }
}
