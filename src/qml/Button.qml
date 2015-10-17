import QtQuick 2.2
import Crowd.Mine 1.0

MouseArea {
    id: button

    readonly property bool down: pressed && containsMouse
    property alias text: label.text
    property color color: Theme.textColor
    property color highlightColor: Theme.highlightTextColor
    property alias icon: image
    property bool __hasIcon: image.source != ""

    width: row.width + 2 * Theme.paddingSize
    height: row.height + 2 * Theme.paddingSize

    Row {
        id: row
        spacing: Theme.paddingSize
        anchors.centerIn: parent
        Icon {
            id: image
            width: __hasIcon ? Theme.iconSize : 0
            height: __hasIcon ? Theme.iconSize : 0
            anchors.verticalCenter: parent.verticalCenter
            highlight: button.down
        }

        Label {
            id: label
            anchors.verticalCenter: parent.verticalCenter
            color: button.down ? button.color : button.highlightColor
        }
    }

    Rectangle {
        color: parent.pressed ? parent.color : parent.highlightColor
        width: parent.width * 0.3
        height: Theme.paddingSize / 2
        radius: height / 4
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
    }
}
