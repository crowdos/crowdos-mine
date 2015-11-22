TEMPLATE = lib
TARGET = $$qtLibraryTarget(crowdmineplugin)
INCLUDEPATH += .
CONFIG += qt plugin
QT += quick

INSTALL_PATH=$$[QT_INSTALL_QML]/Crowd/Mine/

SOURCES += declarativeplugin.cpp \
           declarativetheme.cpp \
           declarativeimageprovider.cpp \
           qrangemodel.cpp \
           minversemousearea.cpp \
           declarativestack.cpp \
           declarativescreen.cpp \
           declarativeicon.cpp \
           declarativecolorconverter.cpp \
           declarativemousegrabdetector.cpp \
           declarativedatemodel.cpp

HEADERS += declarativeplugin.h \
           declarativetheme.h \
           declarativeimageprovider.h \
           qrangemodel.h \
           minversemousearea.h \
           declarativestack.h \
           declarativescreen.h \
           declarativeicon.h \
           declarativecolorconverter.h \
           declarativemousegrabdetector.h \
           declarativedatemodel.h

target.path = $${INSTALL_PATH}

qml.files = qml/qmldir \
            qml/*.qml

qml.path = $${INSTALL_PATH}

private.files = qml/private/*.qml \
                qml/private/Utils.js

private.path = $${INSTALL_PATH}/private

INSTALLS += target qml private
