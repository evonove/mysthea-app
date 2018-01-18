TEMPLATE = app
QT = testlib
CONFIG += testcase

include($$MYSTHEA_SOURCE_TREE/src/src.pri)

TARGET = tst_searchmodel

SOURCES += \
    $$PWD/tst_searchmodel.cpp
