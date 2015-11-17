import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    id: button

    readonly property bool down: pressed && containsMouse
    property alias icon: image

    implicitWidth: column.width + 2 * Theme.paddingSize
    implicitHeight: column.height + 2 * Theme.paddingSize

    Column {
        id: column
        width: image.width
        spacing: Theme.paddingSize
        anchors.centerIn: parent

        Icon {
            id: image
            pressed: button.down
            width: Theme.iconSizeSmall
            height: Theme.iconSizeSmall
        }

        GlowItem {
            width: parent.width
            glowRadius: height
            color: button.down ? Theme.highlightTextColor : Theme.textColor
        }
    }
}
