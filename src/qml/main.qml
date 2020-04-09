import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtQml.Models 2.14
import QtGraphicalEffects 1.14

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

    signal moveToSection(int element)

    // A top margin added to various components so that they're not covered
    // by the iPhone top notch
    readonly property int safeTopMargin: hasNotch ? 34 : 0

    property bool isPushing: false

    function pushToStack(component, stateToCheck) {
        // Throttle clicks
        if (root.isPushing)
            return
        // Avoid to push a page if it is the current visible page
        if (pageStatesList.state !== stateToCheck) {
            root.isPushing = true
            _mainStackView.push(component)
        }
        root.isPushing = false
    }

    title: qsTr("Mysthea Universe")
    width: 375
    height: 667
    visible: true
    flags: hasNotch ? Qt.MaximizeUsingFullscreenGeometryHint : Qt.Window

    font.pixelSize: 18

    palette {
        window: Palette.black
    }

    // Loads Material icons font
    FontLoader {
        source: "qrc:/assets/fonts/MaterialIcons-Regular.ttf"
    }
    FontLoader {
        source: "qrc:/assets/fonts/FuturaPTMedium.otf"
    }
    FontLoader {
        source: "qrc:/assets/fonts/FuturaPTBold.otf"
    }
    FontLoader {
        source: "qrc:/assets/fonts/FuturaPTBook.otf"
    }
    FontLoader {
        source: "qrc:/assets/fonts/FuturaPTLightOblique.otf"
    }
    FontLoader {
        source: "qrc:/assets/fonts/EraIcons.ttf"
    }

    Action {
        id: _drawerOpenAction
        icon.source: "qrc:/assets/icons/menu.svg"
        onTriggered: _drawer.open()
    }

    AppDrawer {
        id: _drawer
        width: 319
        height: root.height
        onMystheaClicked: root.pushToStack(_mystheaApp, PageName.mystheaPage)
        onIcaionClicked: root.pushToStack(_icaionApp, PageName.icaionPage)
        onTheFallClicked: root.pushToStack(_theFallApp, PageName.theFallPage)
    }

    StackView {
        id: _mainStackView
        anchors.fill: parent
        focus: true
        padding: 0

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
                objectName: PageName.mystheaPage
                logo: "qrc:/assets/images/mysthea_logo.png"
                mainColor: Palette.mystheaMain
                whiteColor: Palette.lightPink
                accentColor: Palette.darkPink
                headerSeparatorColor: Palette.pink
                leftAction: _mystheaExtras.leftAction
                rightAction: _drawerOpenAction
                appContents: [
                    Mysthea.CardsReference {
                        searchFieldBorderColor: Palette.pinkLavenderBlush
                        onCardClicked: {
                            console.log("Open detail of card with index:",
                                        index)
                        }
                    },
                    Mysthea.GameSetup {},
                    Mysthea.Rulebook {},
                    Mysthea.Extras {
                        id: _mystheaExtras
                    }
                ]
            }
        }

        Component {
            id: _icaionApp
            AppContainer {
                id: _icaion
                objectName: PageName.icaionPage
                logo: "qrc:/assets/images/icaion_logo.png"
                mainColor: Palette.icaionMain
                whiteColor: Palette.lightPink
                accentColor: Palette.darkPink
                headerSeparatorColor: Palette.pink
                rightAction: _drawerOpenAction
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
                objectName: PageName.theFallPage
                logo: "qrc:/assets/images/the_fall_logo.png"
                mainColor: Palette.theFallMain
                whiteColor: Palette.lightPink
                accentColor: Palette.darkPink
                headerSeparatorColor: Palette.pink
                rightAction: _drawerOpenAction
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
                PropertyChanges {
                    target: _drawer
                    activeColor: Palette.mystheaMain
                    activeBackgroundImageSource: "qrc:/assets/images/main_menu/mysthea_button_back.png"
                    activeLogoImageSource: "qrc:/assets/images/mysthea_logo.png"
                    mystheaButtonVisible: false
                    icaionButtonVisible: true
                    theFallButtonVisible: true
                }
            },
            State {
                name: PageName.icaionPage
                when: _mainStackView.currentItem.objectName === PageName.icaionPage
                PropertyChanges {
                    target: _drawer
                    activeColor: Palette.icaionMain
                    activeBackgroundImageSource: "qrc:/assets/images/main_menu/icaion_button_back.png"
                    activeLogoImageSource: "qrc:/assets/images/icaion_logo.png"
                    mystheaButtonVisible: true
                    icaionButtonVisible: false
                    theFallButtonVisible: true
                }
            },
            State {
                name: PageName.theFallPage
                when: _mainStackView.currentItem.objectName === PageName.theFallPage
                PropertyChanges {
                    target: _drawer
                    activeColor: Palette.theFallMain
                    activeBackgroundImageSource: "qrc:/assets/images/main_menu/the_fall_button_back.png"
                    activeLogoImageSource: "qrc:/assets/images/the_fall_logo.png"
                    mystheaButtonVisible: true
                    icaionButtonVisible: true
                    theFallButtonVisible: false
                }
            }
        ]
    }
}
