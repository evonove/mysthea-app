TEMPLATE = app
QT = testlib
CONFIG += testcase

include($$MYSTHEA_SOURCE_TREE/src/src.pri)

TARGET = tst_icaionartworksproxymodel

RESOURCES += \
    $$MYSTHEA_SOURCE_TREE/src/configurations.qrc

SOURCES += \
    tst_icaionartworksproxymodel.cpp
