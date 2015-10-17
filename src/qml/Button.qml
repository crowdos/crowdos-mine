import QtQuick 2.2
import Crowd.Mine 1.0

MouseArea {
    readonly property bool down: pressed && containsMouse
    property alias text: label.text
    property color color: Theme.textColor
    property color highlightColor: Theme.highlightTextColor
    width: label.width * 1.25
    height: label.height * 1.5

    Label {
        id: label
        color: parent.pressed ? parent.color : parent.highlightColor
        anchors.centerIn: parent
    }

    Rectangle {
        color: parent.pressed ? parent.color : parent.highlightColor
        width: parent.width * 0.3
        height: label.height * 0.25
        radius: height / 4
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
    }
}
