import QtQuick 2.2
import Crowd.Mine 1.0

MouseArea {
    readonly property bool down: pressed && containsMouse
}
