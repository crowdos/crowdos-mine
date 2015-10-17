import QtQuick 2.0
import Crowd.Mine 1.0

MouseArea {
    readonly property bool down: pressed && containsMouse
    property bool automaticCheck: true
    property bool checked
    property bool busy

    width: Theme.itemSize
    height: Theme.itemSize

    onClicked: {
        if (automaticCheck) {
            checked = !checked
        }
    }

    GlowItem {
        id: glow
        anchors.centerIn: parent
        color: parent.busy || parent.checked || parent.down ? Theme.textColor : Theme.highlightTextColor
    }

    PropertyAnimation {
        target: glow
        property: "spread"
        from: 0.3
        to: 0.1 // TODO: same as GlowItem.qml
        duration: 500
        alwaysRunToEnd: true
        loops: Animation.Infinite
        running: busy
    }
}
