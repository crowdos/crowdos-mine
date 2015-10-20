import QtQuick 2.2
import Crowd.Mine 1.0

MouseArea {
    readonly property bool down: pressed && containsMouse
    property alias color: rectangle.color

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: parent.down ? Theme.highlightBackgroundColor : Theme.backgroundColor
    }
}
