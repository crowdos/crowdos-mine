import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    id: button

    readonly property bool down: pressed && containsMouse
    readonly property color __color: image.highlight ? Theme.highlightTextColor : Theme.textColor
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
            highlight: button.down
        }

        GlowItem {
            width: parent.width
            glowRadius: height
            color: button.__color
        }
    }
}
