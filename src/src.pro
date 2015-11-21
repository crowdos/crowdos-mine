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
            qml/Action.qml \
            qml/ApplicationWindow.qml \
            qml/BackgroundItem.qml \
            qml/BusyIndicator.qml \
            qml/Button.qml \
            qml/ContextMenu.qml \
            qml/GlowItem.qml \
            qml/IconButton.qml \
            qml/Icon.qml \
            qml/Label.qml \
            qml/ListItem.qml \
            qml/MineFlickable.qml \
            qml/MineGridView.qml \
            qml/MineListView.qml \
            qml/PageMenu.qml \
            qml/Page.qml \
            qml/PageStack.qml \
            qml/ProgressBar.qml \
            qml/Slider.qml \
            qml/Switch.qml \
            qml/TextSwitch.qml \
            qml/ValueButton.qml

qml.path = $${INSTALL_PATH}

private.files = qml/private/Header.qml \
                qml/private/Utils.js

private.path = $${INSTALL_PATH}/private

INSTALLS += target qml private
