cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)


find_package(Qt5 COMPONENTS Core Test Quick REQUIRED)

include_directories(
    ${PROJECT_SOURCE_DIR}/src/models
    )

qt5_add_resources(RESOURCES ${PROJECT_SOURCE_DIR}/src/configurations.qrc)

enable_testing(true)

# Mysthea
# types
file(GLOB mysthea_types_sources
    "${PROJECT_SOURCE_DIR}/src/models/mystheatypeproxymodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/mystheatypeproxymodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/typeproxymodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/typeproxymodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/cardsproxymodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/cardsproxymodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/typemodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/typemodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/cardsmodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/cardsmodel.cpp"
    )

add_executable(mysthea_types_proxy_model_test
    ${mysthea_types_sources}
    ${RESOURCES}
    tst_mystheatypeproxymodel.cpp
    )

add_test(NAME mysthea_types_proxy_model_test COMMAND mysthea_types_proxy_model_test)
target_link_libraries(mysthea_types_proxy_model_test PRIVATE Qt5::Core Qt5::Quick Qt5::Test)

# artworks
file(GLOB artowors_sources
    "${PROJECT_SOURCE_DIR}/src/models/artworksfiltermodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/artworksfiltermodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/artworksmodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/artworksmodel.cpp"
    )

add_executable(mysthea_artworks_proxy_model_test
    ${artowors_sources}
    ${RESOURCES}
    tst_mystheaartworksproxymodel.cpp
    )

add_test(NAME mysthea_artworks_proxy_model_test COMMAND mysthea_artworks_proxy_model_test)
target_link_libraries(mysthea_artworks_proxy_model_test PRIVATE Qt5::Core Qt5::Quick Qt5::Test)

# miniatures
file(GLOB miniatures_sources
    "${PROJECT_SOURCE_DIR}/src/models/miniaturesfiltermodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/miniaturesfiltermodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/miniaturesmodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/miniaturesmodel.cpp"
    )

add_executable(mysthea_miniatures_proxy_model_test
    ${miniatures_sources}
    ${RESOURCES}
    tst_mystheaminiaturesproxymodel.cpp
    )

add_test(NAME mysthea_miniatures_proxy_model_test COMMAND mysthea_miniatures_proxy_model_test)
target_link_libraries(mysthea_miniatures_proxy_model_test PRIVATE Qt5::Core Qt5::Quick Qt5::Test)

# Icaion
# types
file(GLOB icaion_types_sources
    "${PROJECT_SOURCE_DIR}/src/models/icaiontypeproxymodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/icaiontypeproxymodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/typeproxymodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/typeproxymodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/cardsproxymodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/cardsproxymodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/typemodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/typemodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/cardsmodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/cardsmodel.cpp"
    )

add_executable(icaion_types_proxy_model_test
    ${icaion_types_sources}
    ${RESOURCES}
    tst_icaiontypeproxymodel.cpp
    )

add_test(NAME icaion_types_proxy_model_test COMMAND icaion_types_proxy_model_test)
target_link_libraries(icaion_types_proxy_model_test PRIVATE Qt5::Core Qt5::Quick Qt5::Test)

# artworks
add_executable(icaion_artworks_proxy_model_test
    ${artowors_sources}
    ${RESOURCES}
    tst_icaionartworksproxymodel.cpp
    )

add_test(NAME icaion_artworks_proxy_model_test COMMAND icaion_artworks_proxy_model_test)
target_link_libraries(icaion_artworks_proxy_model_test PRIVATE Qt5::Core Qt5::Quick Qt5::Test)

# miniatures
add_executable(icaion_miniatures_proxy_model_test
    ${miniatures_sources}
    ${RESOURCES}
    tst_icaionminiaturesproxymodel.cpp
    )

add_test(NAME icaion_miniatures_proxy_model_test COMMAND icaion_miniatures_proxy_model_test)
target_link_libraries(icaion_miniatures_proxy_model_test PRIVATE Qt5::Core Qt5::Quick Qt5::Test)

# TheFall
# types
file(GLOB thefall_types_sources
    "${PROJECT_SOURCE_DIR}/src/models/thefalltypeproxymodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/thefalltypeproxymodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/typeproxymodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/typeproxymodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/cardsproxymodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/cardsproxymodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/typemodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/typemodel.cpp"
    "${PROJECT_SOURCE_DIR}/src/models/cardsmodel.h"
    "${PROJECT_SOURCE_DIR}/src/models/cardsmodel.cpp"
    )

add_executable(thefall_types_proxy_model_test
    ${thefall_types_sources}
    ${RESOURCES}
    tst_thefalltypeproxymodel.cpp
    )

add_test(NAME thefall_types_proxy_model_test COMMAND thefall_types_proxy_model_test)
target_link_libraries(thefall_types_proxy_model_test PRIVATE Qt5::Core Qt5::Quick Qt5::Test)

# artworks
add_executable(thefall_artworks_proxy_model_test
    ${artowors_sources}
    ${RESOURCES}
    tst_thefallartworksproxymodel.cpp
    )

add_test(NAME thefall_artworks_proxy_model_test COMMAND thefall_artworks_proxy_model_test)
target_link_libraries(thefall_artworks_proxy_model_test PRIVATE Qt5::Core Qt5::Quick Qt5::Test)
