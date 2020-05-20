cmake_minimum_required(VERSION 3.10)

project(mystheaapp LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
set(ANDROID_VERSION_NAME "4.0.2-dev")
set(ANDROID_VERSION_CODE "40000002")
set(ANDROID_SDK_BUILD_TOOLS_REVISION "28.0.3")

set(QML_IMPORT_PATH
    ${CMAKE_CURRENT_SOURCE_DIR}/qml
    ${CMAKE_CURRENT_SOURCE_DIR}/style
    CACHE STRING "" FORCE
    )

find_package(Qt5 COMPONENTS Core Quick Svg LinguistTools REQUIRED)

# QML, javascript and qml dir
file(GLOB_RECURSE QML_JS_FILES *.qml *.js qmldir)

# Application sources
set(SOURCE_FILES
    main.cpp
    translationsmanager.cpp
    models/artworksmodel.cpp
    models/artworksfiltermodel.cpp
    models/cardsmodel.cpp
    models/cardsproxymodel.cpp
    models/commandcomboboxmodel.cpp
    models/miniaturesmodel.cpp
    models/miniaturesfiltermodel.cpp
    models/typecomboboxmodel.cpp
    models/typemodel.cpp
    models/typeproxymodel.cpp
    models/mystheatypeproxymodel.cpp
    models/icaiontypeproxymodel.cpp
    models/thefalltypeproxymodel.cpp
    configurations.qrc
    assets.qrc
    fonts.qrc
    qml.qrc
    ${CMAKE_CURRENT_BINARY_DIR}/translations.qrc
    )

# Translation files
set(TS_FILES
    translations/mysthea_de.ts
    translations/mysthea_en.ts
    translations/mysthea_es.ts
    translations/mysthea_fr.ts
    translations/mysthea_it.ts
    translations/mysthea_ja.ts
    )
configure_file(translations.qrc ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)
qt5_create_translation(QM_FILES ${CMAKE_CURRENT_SOURCE_DIR} ${TS_FILES})

if(ANDROID)
    qt5_add_big_resources(SOURCE_FILES mysthea-assets.qrc)
    qt5_add_big_resources(SOURCE_FILES mysthea-cards.qrc)
    qt5_add_big_resources(SOURCE_FILES icaion-assets.qrc)
    qt5_add_big_resources(SOURCE_FILES icaion-cards.qrc)
    qt5_add_big_resources(SOURCE_FILES thefall-assets.qrc)
    qt5_add_big_resources(SOURCE_FILES thefall-cards.qrc)
    find_package(Qt5 COMPONENTS AndroidExtras REQUIRED)

    add_library(mystheaapp SHARED
        ${SOURCE_FILES}
        ${QML_JS_FILES}
        ${QM_FILES}
        )

elseif(APPLE)
    message("Apple")
    qt5_add_resources(SOURCE_FILES mysthea-assets.qrc)
    qt5_add_resources(SOURCE_FILES mysthea-cards.qrc)
    qt5_add_resources(SOURCE_FILES icaion-assets.qrc)
    qt5_add_resources(SOURCE_FILES icaion-cards.qrc)
    qt5_add_resources(SOURCE_FILES thefall-assets.qrc)
    qt5_add_resources(SOURCE_FILES thefall-cards.qrc)

    set(CMAKE_SYSTEM_NAME iOS)
    set(CMAKE_OSX_ARCHITECTURES x86_64)
    set(MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_LIST_DIR}/ios/Info.plist")
    set(MACOSX_BUNDLE_GUI_IDENTIFIER "it.evonove.mysthea")
    set(MACOSX_BUNDLE_BUNDLE_NAME "Mysthea Universe")
    set(MACOSX_BUNDLE_BUNDLE_VERSION 3.5.0)

    set(IMAGES
        ios/Images.xcassets/LaunchImage.launchimage/Contents.json
        ios/Images.xcassets/LaunchImage.launchimage/1242×2688.jpg
        ios/Images.xcassets/LaunchImage.launchimage/828×1792.jpg
        ios/Images.xcassets/LaunchImage.launchimage/1125×2436.jpg
        ios/Images.xcassets/LaunchImage.launchimage/1242×2208.jpg
        ios/Images.xcassets/LaunchImage.launchimage/750x1334.jpg
        ios/Images.xcassets/LaunchImage.launchimage/640x960.jpg
        ios/Images.xcassets/LaunchImage.launchimage/640x1136.jpg
        ios/Images.xcassets/LaunchImage.launchimage/768x1024.jpg
        ios/Images.xcassets/LaunchImage.launchimage/1536x2048.jpg
        )

    set(ICONS
        ios/Images.xcassets/AppIcon.appiconset/Contents.json
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-20x20@2x-1.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-29x29@2x-1.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-40x40@2x-1.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png
        ios/Images.xcassets/AppIcon.appiconset/ItunesArtwork@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-24@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-27.5@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-29@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-29@3x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-40@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-86@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-98@2x.png
        ios/Images.xcassets/AppIcon.appiconset/Icon-44@2x.png
        )

    include(BundleUtilities)

    add_executable(mystheaapp MACOSX_BUNDLE
        ${IMAGES}
        ${ICONS}
        ${SOURCE_FILES}
        ${QML_JS_FILES}
        ${QM_FILES}
        ${FRAMEWORK}
        )

    message("mac osx bundle info plist path: " ${MACOSX_BUNDLE_INFO_PLIST})
    message("mac osx bundle info plist path: " ${MACOSX_BUNDLE_GUI_IDENTIFIER})

else()
    add_executable(mystheaapp
        ${SOURCE_FILES}
        ${QML_JS_FILES}
        ${QM_FILES}
        )
endif()

target_compile_definitions(mystheaapp
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(mystheaapp
    PRIVATE Qt5::Core Qt5::Quick Qt5::Svg $<$<BOOL:${ANDROID}>:Qt5::AndroidExtras>)
    #$<$<BOOL:${APPLE}>:"-framework CoreFoundation" "-framework Foundation" "-framework UIKit">)

