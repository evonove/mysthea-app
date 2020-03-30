import QtQuick 2.10
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import MystheaUniverse.Components 1.0
import MystheaUniverse.Theme 1.0
import MystheaUniverse.Pages 1.0

Rulebook {
    backgroundImageSource: "qrc:/assets/images/cards-bg.jpg"
    rulebooksModel: ListModel {
        ListElement {
            language: "Deutsch"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_DE_web_v1.pdf"
        }
        ListElement {
            language: "English"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_EN_web_v1.pdf"
        }
        ListElement {
            language: "Español"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_ES_web_v1.pdf"
        }
        ListElement {
            language: "Français"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_FR_web_v1.pdf"
        }
        ListElement {
            language: "Ελληνικά"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_GR_web_v1.pdf"
        }
        ListElement {
            language: "Italiano"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_IT_web_v1.pdf"
        }
        ListElement {
            language: "日本人"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_JPN_web_v1.pdf"
        }
        ListElement {
            language: "Português"
            downloadUrl: "https://s3-eu-west-1.amazonaws.com/mysthea/Rulebooks/rulebook_PT_web_v1.pdf"
        }
    }
}