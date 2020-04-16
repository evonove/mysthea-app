import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Pages 1.0

Rulebook {
    buttonImageSource: "qrc:/assets/images/main_menu/icaion_button_back.png"
    // TODO: Add rulebook urls
    rulebooksModel: ListModel {
        ListElement {
            language: "DE"
            downloadUrl: ""
        }
        ListElement {
            language: "EN"
            downloadUrl: ""
        }
        ListElement {
            language: "ES"
            downloadUrl: ""
        }
        ListElement {
            language: "FR"
            downloadUrl: ""
        }
        ListElement {
            language: "GR"
            downloadUrl: ""
        }
        ListElement {
            language: "IT"
            downloadUrl: ""
        }
        ListElement {
            language: "JP"
            downloadUrl: ""
        }
        ListElement {
            language: "PT"
            downloadUrl: ""
        }
    }
}
