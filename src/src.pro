TARGET = mysthea

SOURCES += \
    $$PWD/main.cpp

RESOURCES += \
    $$PWD/assets.qrc \
    $$PWD/attunement.qrc \
    $$PWD/encounter.qrc \
    $$PWD/encounter-back.qrc \
    $$PWD/era-i.qrc \
    $$PWD/era-ii.qrc \
    $$PWD/era-iii.qrc \
    $$PWD/era-x.qrc \
    $$PWD/event.qrc \
    $$PWD/hero.qrc \
    $$PWD/qml.qrc \
    $$PWD/translations.qrc

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
    QT += androidextras svg

    OTHER_FILES += \
        $$PWD/android/res/drawable/* \
        $$PWD/android/res/values/* \
        $$PWD/android/AndroidManifest.xml \
        $$PWD/android/build.gradle

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

ios {
    LIBS += -framework Foundation -framework CoreFoundation -framework UIKit

    HEADERS += \
        $$PWD/ios/helpers/nativeidentifier.h

    OBJECTIVE_SOURCES += \
        $$PWD/ios/helpers/nativeidentifier.mm

    QT += svg
    OTHER_FILES += $$PWD/ios/*

    # Custom plist
    QMAKE_INFO_PLIST = $$PWD/ios/Info.plist

    # launch images
    launchimages.files = $$files($$PWD/ios/LaunchImage*.png)
    QMAKE_BUNDLE_DATA += launchimages

    # App assets
     QMAKE_ASSET_CATALOGS = $$PWD/ios/Images.xcassets
     QMAKE_ASSET_CATALOGS_APP_ICON = "AppIcon"
    QMAKE_ASSET_CATALOGS_LAUNCH_IMAGE = "LaunchImage"
}

DISTFILES += \
    qml/Mysthea/Components/RadioIndicator.qml \
    qml/Mysthea/Pages/LanguageListModel.qml \
    qml/Mysthea/Pages/PageName.qml \
    qml/Mysthea/Components/LinkButton.qml
