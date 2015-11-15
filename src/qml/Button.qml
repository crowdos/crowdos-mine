import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    id: button

    readonly property bool down: pressed && containsMouse
    property alias text: label.text
    property color color: Theme.textColor
    property color highlightColor: Theme.highlightTextColor

    implicitWidth: column.width + 2 * Theme.paddingSize
    implicitHeight: column.height + 2 * Theme.paddingSize

    Column {
        id: column
        width: label.width
        spacing: Theme.paddingSize
        anchors.centerIn: parent

        Label {
            id: label
            color: button.down ? button.highlightColor : button.color
        }

        GlowItem {
            color: label.color
            width: parent.width
            glowRadius: height
        }
    }
}
