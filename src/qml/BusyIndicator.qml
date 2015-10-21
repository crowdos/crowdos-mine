import QtQuick 2.0
import Crowd.Mine 1.0

Rectangle {
    id: indicator
    property real size: Theme.itemSize
    property bool running

    visible: running
    width: size
    height: size
    radius: width / 2
    smooth: true
    color: "transparent"
    border {
        color: Theme.highlightTextColor
        width: 1
    }

    GlowItem {
        id: glow
        anchors.centerIn: parent
        color: Theme.textColor
    }

    PropertyAnimation {
        target: glow
        property: "spread"
        from: 0.3
        to: 0.1 // TODO: same as GlowItem.qml
        duration: Theme.animationDurationSlow
        alwaysRunToEnd: true
        loops: Animation.Infinite
        running: indicator.running
    }
}
