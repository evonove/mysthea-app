import QtQuick 2.10
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Pages 1.0

Rulebook {
    buttonImageSource: "qrc:/assets/images/main_menu/mysthea_button_back.png"
    rulebooksModel: ListModel {
        ListElement {
            language: "DE"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_DE_web_v1.pdf"
        }
        ListElement {
            language: "EN"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_EN_web_v1.pdf"
        }
        ListElement {
            language: "ES"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_ES_web_v1.pdf"
        }
        ListElement {
            language: "FR"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_FR_web_v1.pdf"
        }
        ListElement {
            language: "GR"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_GR_web_v1.pdf"
        }
        ListElement {
            language: "IT"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_IT_web_v1.pdf"
        }
        ListElement {
            language: "JP"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_JPN_web_v1.pdf"
        }
        ListElement {
            language: "PT"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_PT_web_v1.pdf"
        }
    }
}
