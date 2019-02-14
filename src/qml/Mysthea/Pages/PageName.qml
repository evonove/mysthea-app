pragma Singleton

import QtQuick 2.0

QtObject {
    id: pageName
    objectName: "pageName"
    property string homePage: "homePage"
    property string cardPage: "cardsReferencePage"
    property string gameSetupPage: "gameSetupPage"
    property string rulebookPage: "rulebookPage"
    property string lorePage: "lorePage"
    property string tableOfContentsPage: "tableOfContentsPage"
}
