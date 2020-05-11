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
set(ANDROID_VERSION_NAME "4.0.1-dev")
set(ANDROID_VERSION_CODE "40000001")
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
qt5_add_big_resources(SOURCE_FILES mysthea-assets.qrc)
qt5_add_big_resources(SOURCE_FILES mysthea-cards.qrc)
qt5_add_big_resources(SOURCE_FILES icaion-assets.qrc)
qt5_add_big_resources(SOURCE_FILES icaion-cards.qrc)
qt5_add_big_resources(SOURCE_FILES thefall-assets.qrc)
qt5_add_big_resources(SOURCE_FILES thefall-cards.qrc)

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
    find_package(Qt5 COMPONENTS AndroidExtras REQUIRED)

    add_library(mystheaapp SHARED
        ${SOURCE_FILES}
        ${QML_JS_FILES}
        ${QM_FILES}
        )
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

