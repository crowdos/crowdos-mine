TARGET = mine-demo
SOURCES += main.cpp
QT += quick

target.path = /usr/bin/

qml.files = main.qml

qml.path = /usr/share/mine-demo/qml/

pages.files = pages/*.qml
pages.path = /usr/share/mine-demo/qml/pages/

INSTALLS += target qml pages
