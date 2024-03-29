TARGET = mysthea

SOURCES += \
    $$PWD/main.cpp

RESOURCES += \
    $$PWD/assets.qrc \
    $$PWD/configurations.qrc \
    $$PWD/fonts.qrc \
    $$PWD/qml.qrc \
    $$PWD/mysthea-assets.qrc \
    $$PWD/mysthea-cards.qrc \
    $$PWD/icaion-assets.qrc \
    $$PWD/icaion-cards.qrc \
    $$PWD/thefall-assets.qrc \
    $$PWD/thefall-cards.qrc \
    $$PWD/ios-translations.qrc


include($$PWD/src.pri)

OTHER_FILES += \
    $$files($$PWD/*.qml, true) \
    $$files($$PWD/qmldir, true) \

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = \
    $$PWD/qml \
    $${PWD}/style \

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

android {
    QT += androidextras

    # To upgrade the version change the following variable
    VERSION = 4.1.3

    OTHER_FILES += \
        $$PWD/android/res/drawable/* \
        $$PWD/android/res/values/* \
        $$PWD/android/AndroidManifest.xml \
        $$PWD/android/build.gradle \
        $$PWD/android/gradle/wrapper/gradle-wrapper.jar \
        $$PWD/android/gradle/wrapper/gradle-wrapper.properties \
        $$PWD/android/gradlew \
        $$PWD/android/gradlew.bat \
        $$PWD/android/res/mipmap-hdpi/* \
        $$PWD/android/res/mipmap-mdpi/* \
        $$PWD/android/res/mipmap-xhdpi/* \
        $$PWD/android/res/mipmap-xxhdpi/* \
        $$PWD/android/res/mipmap-xxxhdpi/* \

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

    # This is needed to automate version code increment for 54bit builds
    # Reference: https://blog.qt.io/blog/2019/06/28/comply-upcoming-requirements-google-play/
    defineReplace(droidVersionCode) {
        segments = $$split(1, ".")
        for (segment, segments): vCode = "$$first(vCode)$$format_number($$segment, width=3 zeropad)"

        contains(ANDROID_TARGET_ARCH, arm64-v8a): \
            suffix = 1
        else:contains(ANDROID_TARGET_ARCH, armeabi-v7a): \
            suffix = 0
        # add more cases as needed

        return($$first(vCode)$$first(suffix))
    }

    ANDROID_VERSION_NAME = $$VERSION
    ANDROID_VERSION_CODE = $$droidVersionCode($$ANDROID_VERSION_NAME)
}

ios {
    # To upgrade the version change the following variable
    # For iOS the value of ShortVersionString must contain a higher version
    # than that of the previosly approved version.
    VERSION = 4.1.0

    QMAKE_TARGET_BUNDLE_PREFIX = it.evonove
    QMAKE_BUNDLE = mysthea

    LIBS += -framework Foundation -framework CoreFoundation -framework UIKit

    OTHER_FILES += \
        $$PWD/ios/Images.xcassets/*

    # Custom plist
    QMAKE_INFO_PLIST = $$PWD/ios/Info.plist

    # App assets
    QMAKE_ASSET_CATALOGS = $$PWD/ios/Images.xcassets
    QMAKE_ASSET_CATALOGS_APP_ICON = "AppIcon"
    QMAKE_ASSET_CATALOGS_LAUNCH_IMAGE = "LaunchImage"
}


