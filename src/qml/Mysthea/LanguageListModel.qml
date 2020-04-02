import QtQuick 2.0
import Translations 1.0

ListModel {
    id: languageListModel

    ListElement {
        language: "EN"
        translation: TranslationsManager.English
    }
    ListElement {
        language: "FR"
        translation: TranslationsManager.French
    }
    ListElement {
        language: "ES"
        translation: TranslationsManager.Spanish
    }
    ListElement {
        language: "DE"
        translation:TranslationsManager.German
    }
    ListElement {
        language: "IT"
        translation: TranslationsManager.Italian
    }
    ListElement {
        language: "日本語"
        translation: TranslationsManager.Japanese
    }
}
