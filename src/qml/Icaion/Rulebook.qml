import QtQuick 2.14
import QtQuick.Controls 2.14

import MystheaUniverse.Pages 1.0

Rulebook {
    buttonImageSource: "qrc:/assets/images/main_menu/icaion_button_back.png"
    rulebooksModel: ListModel {
        ListElement {
            language: "DE"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/DE_ica-rulebook.pdf"
        }
        ListElement {
            language: "EN"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/%5BENG%5D_Icaion_rulebook_web_2020.pdf"
        }
        ListElement {
            language: "ES"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/ES_ica_rulebook.pdf"
        }
        ListElement {
            language: "FR"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/FR_ica_rulebook.pdf"
        }
        ListElement {
            language: "GR"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/GR_ica_rulebook.pdf"
        }
        ListElement {
            language: "IT"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/IT_ica-rulebook.pdf"
        }
        ListElement {
            language: "JP"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/JP_ica_rulebook.pdf"
        }
        ListElement {
            language: "PL"
            downloadUrl: "https://storage.googleapis.com/mystheauniverse/rulebooks/POL_ica_rulebook.pdf"
        }
    }
}
