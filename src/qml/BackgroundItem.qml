import QtQuick 2.2
import Crowd.Mine 1.0

MouseArea {
    readonly property bool down: pressed && containsMouse
    default property alias children: rectangle.children
    property alias color: rectangle.color
    property alias contentItem: rectangle

    width: parent.width

    implicitHeight: Theme.itemSize

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: parent.down ? Theme.highlightBackgroundColor : Theme.backgroundColor
    }
}
