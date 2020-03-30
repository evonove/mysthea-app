import QtQuick 2.11
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.4
import QtQml.Models 2.1
import QtGraphicalEffects 1.0

import Mysthea 1.0 as Mysthea
import Icaion 1.0 as Icaion
import TheFall 1.0 as TheFall
import Mysthea.Models 1.0
import Translations 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0
import MystheaUniverse.Pages 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 375
    height: 667
    title: qsTr("Mysthea-Icaion-Thefall")
    flags: hasNotch ? Qt.MaximizeUsingFullscreenGeometryHint : Qt.Window

    // A top margin added to various components so that they're not covered
    // by the iPhone top notch
    readonly property int safeTopMargin: hasNotch ? 34 : 0

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
    FontLoader {
        source: "qrc:/assets/fonts/EraIcons.ttf"
    }

    StackView {
        id: _mainStackView
        anchors.fill: parent
        focus: true
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
                onMystheaClicked: root.pushToStack(_mystheaApp,
                                                   PageName.mystheaPage)
                onIcaionClicked: root.pushToStack(_icaionApp,
                                                  PageName.icaionPage)
                onTheFallClicked: root.pushToStack(_theFallApp,
                                                   PageName.theFallPage)
            }
        }

        Component {
            id: _mystheaApp
            AppContainer {
                id: _mysthea
                logo: "qrc:/assets/images/mysthea_logo.png"
                mainColor: Palette.mystheaMain
                whiteColor: Palette.lightPink
                accentColor: Palette.darkPink
                appContents: [
                    Mysthea.CardsReference {},
                    Mysthea.GameSetup {},
                    Mysthea.Rulebook {},
                    Mysthea.Extras {}
                ]
            }
        }

        Component {
            id: _icaionApp
            AppContainer {
                id: _icaion
                logo: "qrc:/assets/images/icaion_logo.png"
                mainColor: Palette.icaionMain
                whiteColor: Palette.lightPink
                accentColor: Palette.darkPink
                appContents: [
                    Icaion.CardsReference {},
                    Icaion.GameSetup {},
                    Icaion.Rulebook {},
                    Icaion.Extras {}
                ]
            }
        }

        Component {
            id: _theFallApp
            AppContainer {
                id: _theFall
                logo: "qrc:/assets/images/the_fall_logo.png"
                mainColor: Palette.thefallMain
                whiteColor: Palette.lightPink
                accentColor: Palette.darkPink
                appContents: [
                    TheFall.CardsReference {},
                    TheFall.GameSetup {},
                    TheFall.Rulebook {},
                    TheFall.Extras {}
                ]
            }
        }
    }

    StateGroup {
        id: pageStatesList
        states: [
            State {
                name: PageName.mystheaPage
                when: _mainStackView.currentItem.objectName === PageName.mystheaPage
            },
            State {
                name: PageName.icaionPage
                when: _mainStackView.currentItem.objectName === PageName.icaionPage
            },
            State {
                name: PageName.theFallPage
                when: _mainStackView.currentItem.objectName === PageName.theFallPage
            }
        ]
    }
}
