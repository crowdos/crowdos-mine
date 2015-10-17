import QtQuick 2.2
import Crowd.Mine 1.0

MouseArea {
    readonly property bool down: pressed && containsMouse
    property alias text: label.text
    property color color: Theme.textColor
    property color highlightColor: Theme.highlightTextColor
    property alias icon: image

    property bool __hasIcon: image.source != ""
    width: label.width + (__hasIcon ? 4 : 2) * Theme.paddingSize
    height: label.height * 1.5

    Label {
        id: label
        color: parent.pressed ? parent.color : parent.highlightColor
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: Theme.paddingSize
        }
    }

    Image {
        id: image
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: Theme.paddingSize
        }

        height: parent.height * 0.6
        width: height
    }

    Rectangle {
        color: parent.pressed ? parent.color : parent.highlightColor
        width: parent.width * 0.3
        height: label.height * 0.20
        radius: height / 4
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
    }
}
