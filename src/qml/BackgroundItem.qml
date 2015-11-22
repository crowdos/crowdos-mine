import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    default property alias children: rectangle.children
    property alias color: rectangle.color
    property alias contentItem: rectangle

    width: parent.width

    implicitHeight: Theme.itemSize

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: parent.containsPress ? Theme.highlightBackgroundColor : Theme.backgroundColor
    }
}
