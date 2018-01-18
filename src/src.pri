QT += qml quick
CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += \
    $$PWD

HEADERS += \
    $$PWD/models/cardsmodel.h \
    $$PWD/models/data.h \
    $$PWD/models/searchmodel.h

SOURCES += \
    $$PWD/models/cardsmodel.cpp \
    $$PWD/models/searchmodel.cpp
