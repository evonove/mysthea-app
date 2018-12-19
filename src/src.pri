QT += qml quick
CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += \
    $$PWD

HEADERS += \
    $$PWD/models/cardsmodel.h \
    $$PWD/translationsmanager.h \
    $$PWD/models/card_data.h \
    $$PWD/models/typemodel.h \
    $$PWD/models/cardsproxymodel.h \
    $$PWD/models/typeproxymodel.h \
    $$PWD/models/commandcomboboxmodel.h \
    $$PWD/models/typecomboboxmodel.h

SOURCES += \
    $$PWD/models/cardsmodel.cpp \
    $$PWD/translationsmanager.cpp \
    $$PWD/models/typemodel.cpp \
    $$PWD/models/cardsproxymodel.cpp \
    $$PWD/models/typeproxymodel.cpp \
    $$PWD/models/commandcomboboxmodel.cpp \
    $$PWD/models/typecomboboxmodel.cpp

lupdate_only{
    SOURCES += \
        $$PWD/qml/Mysthea/*.qml \
        $$PWD/qml/Mysthea/Components/*.qml \
        $$PWD/qml/Mysthea/Pages/*.qml \
        $$PWD/qml/Mysthea/Theme/*.qml \
        $$PWD/qml/*.qml
}

TRANSLATIONS += \
    $$PWD/translations/mysthea_en.ts \
    $$PWD/translations/mysthea_fr.ts \
    $$PWD/translations/mysthea_es.ts \
    $$PWD/translations/mysthea_de.ts \
    $$PWD/translations/mysthea_it.ts \
    $$PWD/translations/mysthea_ja.ts
