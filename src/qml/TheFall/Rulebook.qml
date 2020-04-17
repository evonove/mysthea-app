import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Pages 1.0

Rulebook {
    buttonImageSource: "qrc:/assets/images/main_menu/the_fall_button_back.png"
    // TODO: Add rulebook urls
    rulebooksModel: ListModel {
        ListElement {
            language: "DE"
            downloadUrl: ""
        }
        ListElement {
            language: "EN"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/%5BENG%5D_Mysthea_the_Fall_rulebook_web_2020.pdf"
        }
        ListElement {
            language: "ES"
            downloadUrl: ""
        }
        ListElement {
            language: "FR"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/FR_tfa_rulebook.pdf"
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
