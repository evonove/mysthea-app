TARGET = mysthea

SOURCES += \
    $$PWD/main.cpp

RESOURCES += \
    $$PWD/qml.qrc \
    $$PWD/translations.qrc \
    $$PWD/red-cards.qrc \
    $$PWD/yellow-cards.qrc \
    $$PWD/green-cards.qrc \
    $$PWD/blue-cards.qrc \
    $$PWD/gray-cards.qrc \
    $$PWD/assets.qrc

include($$PWD/src.pri)

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

DISTFILES += \
    qml/Mysthea/Pages/MockList.qml
