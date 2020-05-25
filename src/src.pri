QT += qml quick svg core gui-private
CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += \
    $$PWD

HEADERS += \
    $$PWD/models/artworksmodel.h \
    $$PWD/system.h \
    $$PWD/translationsmanager.h \
    $$PWD/models/artworksfiltermodel.h \
    $$PWD/models/cardsmodel.h \
    $$PWD/models/cardsproxymodel.h \
    $$PWD/models/commandcomboboxmodel.h \
    $$PWD/models/miniaturesmodel.h \
    $$PWD/models/miniaturesfiltermodel.h \
    $$PWD/models/typecomboboxmodel.h \
    $$PWD/models/typemodel.h \
    $$PWD/models/typeproxymodel.h \
    $$PWD/models/mystheatypeproxymodel.h \
    $$PWD/models/icaiontypeproxymodel.h \
    $$PWD/models/thefalltypeproxymodel.h

SOURCES += \
    $$PWD/models/artworksmodel.cpp \
    $$PWD/system.cpp \
    $$PWD/translationsmanager.cpp \
    $$PWD/models/artworksfiltermodel.cpp \
    $$PWD/models/cardsmodel.cpp \
    $$PWD/models/cardsproxymodel.cpp \
    $$PWD/models/commandcomboboxmodel.cpp \
    $$PWD/models/miniaturesmodel.cpp \
    $$PWD/models/miniaturesfiltermodel.cpp \
    $$PWD/models/typecomboboxmodel.cpp \
    $$PWD/models/typemodel.cpp \
    $$PWD/models/typeproxymodel.cpp \
    $$PWD/models/mystheatypeproxymodel.cpp \
    $$PWD/models/icaiontypeproxymodel.cpp \
    $$PWD/models/thefalltypeproxymodel.cpp

lupdate_only{
    SOURCES += \
        $$PWD/qml/Mysthea/*.qml \
        $$PWD/qml/Icaion/*.qml \
        $$PWD/qml/TheFall/*.qml \
        $$PWD/style/MystheaUniverse/Compoents/*.qml \
        $$PWD/style/MystheaUniverse/Pages/*.qml \
        $$PWD/style/MystheaUniverse/Theme/*.qml \
        $$PWD/qml/*.qml
}

TRANSLATIONS += \
    $$PWD/translations/mysthea_en.ts \
    $$PWD/translations/mysthea_fr.ts \
    $$PWD/translations/mysthea_es.ts \
    $$PWD/translations/mysthea_de.ts \
    $$PWD/translations/mysthea_it.ts \
    $$PWD/translations/mysthea_ja.ts

