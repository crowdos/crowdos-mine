TARGET = mine-demo
SOURCES += main.cpp
QT += quick

target.path = /usr/bin/

qml.files = main.qml \
            pages/BusyIndicatorsPage.qml \
            pages/ButtonsPage.qml \
            pages/GlowItemsPage.qml \
            pages/LabelsPage.qml \
            pages/MainPage.qml \
            pages/MenusPage.qml \
            pages/SlidersPage.qml \
            pages/SwitchesPage.qml

qml.path = /usr/share/mine-demo/qml/

INSTALLS += target qml
