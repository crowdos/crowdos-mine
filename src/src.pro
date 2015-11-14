TEMPLATE = lib
TARGET = $$qtLibraryTarget(crowdmine)
INCLUDEPATH += .
CONFIG += qt plugin
QT += quick

SOURCES += declarativeplugin.cpp \
           declarativetheme.cpp \
           declarativeimageprovider.cpp \
           qrangemodel.cpp

HEADERS += declarativeplugin.h \
           pagestatus.h \
           declarativetheme.h \
           declarativeimageprovider.h \
           qrangemodel.h

target.path = $$[QT_INSTALL_QML]/Crowd/Mine/

INSTALLS += target
