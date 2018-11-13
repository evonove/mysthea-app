import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

import Mysthea.Pages 1.0

ApplicationWindow {
    visible: true
    width: 375
    height: 667
    title: qsTr("Mysthea")

    // Loads Material icons font
    FontLoader {
        source: "qrc:/fonts/MaterialIcons-Regular.ttf"
    }

    header: ToolBar {

        // Back button shown only if there is more than a page in the StackView
        ToolButton {
            id: _backButton

            readonly property string backIcon: "\uE5C4"

            text: _backButton.backIcon
            font.pixelSize: 22
            font.family: "Material Icons"

            visible: _mainStackView.depth > 1
            opacity: visible ? 1 : 0

            onClicked: {
                if (_mainStackView.depth > 1) {
                    _mainStackView.pop()
                }
            }

            Behavior on opacity {
                PropertyAnimation {
                    duration: 200
                }
            }
        }

        Image {
            anchors.centerIn: parent
            sourceSize.height: 48
            source: "qrc:/images/logo.png"
        }
    }

    StackView {
        id: _mainStackView
        anchors.fill: parent

        focus: true

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
            onCardsReferenceClicked: _mainStackView.push(_cardReference);
            onGameSetupClicked: console.log("Game Setup button clicked");
            onRulesbookClicked: console.log("Rulesbook button clicked");
            onLoreClicked: console.log("Lore button clicked");
            onLanguageClicked: console.log("Language button clicked");
            onCreditsClicked: _mainStackView.push(_credits);
        }

        Component {
            id: _cardReference
            SearchPage{}
        }

        Component {
            id: _credits
            Credits{}
        }
    }
}
