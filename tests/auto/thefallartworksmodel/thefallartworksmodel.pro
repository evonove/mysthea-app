TEMPLATE = app
QT = testlib
CONFIG += testcase

include($$MYSTHEA_SOURCE_TREE/src/src.pri)

TARGET = tst_thefallartworksproxymodel

RESOURCES += \
    $$MYSTHEA_SOURCE_TREE/src/configurations.qrc

SOURCES += \
    tst_thefallartworksproxymodel.cpp
