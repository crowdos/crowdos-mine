import QtQuick 2.5
import Crowd.Mine 1.0

Item {
    property alias source: icon.source
    property bool pressed

    width: Theme.iconSize
    height: Theme.iconSize

    IconImage {
        id: icon
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        scale: parent.pressed ? 1.1 : 0.9
        Behavior on scale {
            NumberAnimation { duration: Theme.animationDurationFast }
        }
    }
}
