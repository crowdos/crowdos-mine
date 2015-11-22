import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    id: button

    property alias icon: image

    opacity: enabled ? 1.0 : Theme.dimmedItemOpacity
    implicitWidth: column.width + 2 * Theme.paddingSize
    implicitHeight: column.height + 2 * Theme.paddingSize

    Column {
        id: column
        width: image.width
        spacing: Theme.paddingSize
        anchors.centerIn: parent

        Icon {
            id: image
            pressed: button.containsPress
            width: Theme.iconSizeSmall
            height: Theme.iconSizeSmall
        }

        GlowItem {
            width: parent.width
            glowRadius: height
            color: button.containsPress ? Theme.highlightTextColor : Theme.textColor
        }
    }
}
