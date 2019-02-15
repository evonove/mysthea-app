import QtQuick 2.11
import QtQuick.Window 2.3
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
    visible: true
    width: 375
    height: 667
    title: qsTr("Mysthea")
    flags: hasNotch ? Qt.MaximizeUsingFullscreenGeometryHint : Qt.Window

    // A top margin added to various components so that they're not covered
    // by the iPhone top notch
    readonly property int safeTopMargin: hasNotch ? 34 : 0

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
        if (pageStatesList.state !== stateToCheck) {
            root.isPushing = true
            _mainStackView.push(component)
        }
        drawer.close()
        root.isPushing = false
    }

    signal moveToSection(int element)

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
        onTriggered: {
            _mainStackView.pop()
            _mainStackView.currentItem.forceActiveFocus()
        }
    }

    ToolBar {
        id: toolbar
        padding: 0
        topPadding: root.safeTopMargin
        z: 2
        width: parent.width
        height: 56 + root.safeTopMargin
        position: ToolBar.Header

        background: Rectangle {
            visible: _mainStackView.currentItem.hasToolbarLine
            anchors.bottom: parent.bottom
            width: parent.width
            height: 0.5
            color: Palette.white
            opacity: 0.5
        }

        RowLayout {
            anchors.fill: parent
            ToolButton {
                id: toolButton
                height: parent.height
                font.pixelSize: 24
                font.family: "Material Icons"
                action: _mainStackView.currentItem.leftAction

                Material.foreground: Palette.white
                Layout.fillHeight: true
            }
            Label {
                id: label
                anchors.topMargin: 16
                text: _mainStackView.currentItem.title
                font.pixelSize: 20
                font.letterSpacing: 0.5
                verticalAlignment: Qt.AlignVCenter

                Material.foreground: Palette.white
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Repeater {
                model: _mainStackView.currentItem.rightActions
                ToolButton {
                    height: parent.height
                    font.pixelSize: 24
                    font.family: "Material Icons"
                    action: modelData

                    Material.foreground: Palette.white
                    Layout.fillHeight: true

                }
            }
        }
    }

    MainDrawer {
        id: drawer
        topPadding: root.safeTopMargin
        width: 0.8 * root.width
        height: root.height
        interactive: _mainStackView.currentItem.leftAction === drawerAction

        state: pageStatesList.state

        // This property is used to throttle clicks
        // and avoid pushing a page while one is being
        // loaded
        onHomeClicked: {
            root.pushToStack(_homePage, PageName.homePage)
        }

        onCardsReferenceClicked: {
            root.pushToStack(_cardReference, PageName.cardPage)
        }
        onGameSetupClicked: {
            root.pushToStack(_gameSetup, PageName.gameSetupPage)
        }
        onRulesbookClicked: {
            root.pushToStack(_rulebook, PageName.rulebookPage)
        }
        onLoreClicked: {
            root.pushToStack(_lore, PageName.lorePage)
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

                onCardsReferenceClicked: root.pushToStack(_cardReference,
                                                          PageName.cardPage)

                onGameSetupClicked: root.pushToStack(_gameSetup,
                                                     PageName.gameSetupPage)
                onRulesbookClicked: root.pushToStack(_rulebook,
                                                     PageName.rulebookPage)
                onLoreClicked: root.pushToStack(_lore, PageName.lorePage)
            }
        }

        Component {
            id: _cardReference
            CardsReferencePage {
                topPadding: toolbar.height
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
                topPadding: toolbar.height
                leftAction: backAction
            }
        }
        Component {
            id: _gameSetup
            GameSetup {
                topPadding: toolbar.height
                leftAction: drawerAction
            }
        }
        Component {
            id: _rulebook
            Rulebook {
                topPadding: toolbar.height
                leftAction: drawerAction
            }
        }
        Component {
            id: _lore
            Lore {
                topPadding: toolbar.height
                leftAction: drawerAction
                onOpenTableOfContents: root.pushToStack(
                                           _loreTableOfContents,
                                           PageName.tableOfContentsPage)
                Connections {
                    target: root
                    onMoveToSection: {
                        scrollTo(element)
                    }
                }
            }
        }

        Component {
            id: _loreTableOfContents
            TableOfContents {
                topPadding: toolbar.height
                leftAction: backAction

                onOpenSection: {
                    root.moveToSection(element)
                    _mainStackView.pop()
                }
            }
        }
    }

    StateGroup {
        id: pageStatesList
        states: [
            State {
                name: PageName.homePage
                when: _mainStackView.currentItem.objectName === PageName.homePage
            },
            State {
                name: PageName.cardPage
                when: _mainStackView.currentItem.objectName === PageName.cardPage
            },
            State {
                name: PageName.gameSetupPage
                when: _mainStackView.currentItem.objectName === PageName.gameSetupPage
            },
            State {
                name: PageName.rulebookPage
                when: _mainStackView.currentItem.objectName === PageName.rulebookPage
            },
            State {
                name: PageName.lorePage
                when: _mainStackView.currentItem.objectName === PageName.lorePage
            }
        ]
    }
}
