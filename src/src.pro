TARGET = mysthea

QT += qml quick
CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    $$PWD/models/cardsmodel.h \
    $$PWD/models/data.h \
    $$PWD/models/searchmodel.h

SOURCES += \
    $$PWD/main.cpp \
    $$PWD/models/cardsmodel.cpp \
    $$PWD/models/searchmodel.cpp

RESOURCES += \
    $$PWD/qml.qrc \
    $$PWD/cards.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = \
    $$PWD/qml

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

android {
    QT += androidextras

    OTHER_FILES += \
        $$PWD/android/res/values/* \
        $$PWD/android/AndroidManifest.xml \
        $$PWD/android/build.gradle

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

ios {
    OTHER_FILES += $$PWD/ios/*

    # Custom plist
    QMAKE_INFO_PLIST = $$PWD/ios/Info.plist

    # App assets
     QMAKE_ASSET_CATALOGS = $$PWD/ios/Images.xcassets
     QMAKE_ASSET_CATALOGS_APP_ICON = "AppIcon"
}
