import QtQuick 2.0
import Translations 1.0

ListModel {
    id: languageListModel

    ListElement {
        language: "English"
        translation: TranslationsManager.English
    }
    ListElement {
        language: "Français"
        translation: TranslationsManager.French
    }
    ListElement {
        language: "Español"
        translation: TranslationsManager.Spanish
    }
    ListElement {
        language: "Duitse"
        translation:TranslationsManager.German
    }
    ListElement {
        language: "Italiano"
        translation: TranslationsManager.Italian
    }
    ListElement {
        language: "日本人"
        translation: TranslationsManager.Japanese
    }
}
