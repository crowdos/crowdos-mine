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
           declarativeicon.cpp

HEADERS += declarativeplugin.h \
           declarativetheme.h \
           declarativeimageprovider.h \
           qrangemodel.h \
           minversemousearea.h \
           declarativestack.h \
           declarativescreen.h \
           declarativeicon.h

target.path = $${INSTALL_PATH}

qml.files = qml/qmldir \
            qml/ApplicationWindow.qml \
            qml/BackgroundItem.qml \
            qml/BusyIndicator.qml \
            qml/Button.qml \
            qml/ContextMenu.qml \
            qml/GlowItem.qml \
            qml/Icon.qml \
            qml/Label.qml \
            qml/ListItem.qml \
            qml/MineFlickable.qml \
            qml/MineGridView.qml \
            qml/MineListView.qml \
            qml/PageMenu.qml \
            qml/Page.qml \
            qml/PageStack.qml \
            qml/Slider.qml \
            qml/Switch.qml \
            qml/TextSwitch.qml \
            qml/ValueButton.qml

qml.path = $${INSTALL_PATH}

INSTALLS += target qml
