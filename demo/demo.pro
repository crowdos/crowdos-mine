TARGET = mine-demo
SOURCES += main.cpp
QT += quick

target.path = /usr/bin/

qml.files = main.qml

qml.path = /usr/share/mine-demo/qml/

pages.files = pages/BusyIndicatorsPage.qml \
              pages/ButtonsPage.qml \
              pages/GlowItemsPage.qml \
              pages/LabelsPage.qml \
              pages/MainPage.qml \
              pages/MenusPage.qml \
              pages/SlidersPage.qml \
              pages/SwitchesPage.qml
pages.path = /usr/share/mine-demo/qml/pages/

INSTALLS += target qml pages
