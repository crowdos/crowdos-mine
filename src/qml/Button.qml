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
            color: button.down ? button.highlightColor : button.color
        }
    }

    Rectangle {
        smooth: true
        color: label.color
        width: parent.width / 2
        height: 5
        radius: height / 2
        anchors {
            left: parent.left
            bottom: parent.bottom
        }
    }
}
