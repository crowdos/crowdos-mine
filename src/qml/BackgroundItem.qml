import QtQuick 2.2
import Crowd.Mine 1.0

MouseArea {
    readonly property bool down: pressed && containsMouse

    Rectangle {
        anchors.fill: parent
        color: parent.down ? Theme.highlightBackgroundColor : Theme.backgroundColor
    }
}
