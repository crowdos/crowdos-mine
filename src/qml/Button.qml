import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    id: button

    readonly property bool down: pressed && containsMouse
    property alias text: label.text
    property color color: Theme.textColor
    property color highlightColor: Theme.highlightTextColor

    width: Math.min(Screen.width, Screen.height) / 3
    implicitHeight: column.height + 2 * Theme.paddingSize

    Column {
        id: column
        anchors {
            left: parent.left
            right: parent.right
            margins: Theme.paddingSizeSmall
        }

        spacing: Theme.paddingSizeSmall

        Label {
            id: label
            color: button.down ? button.highlightColor : button.color
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            elide: Text.ElideRight
            height: Theme.itemSizeSmall
        }

        GlowItem {
            color: label.color
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            glowRadius: height
        }
    }
}
