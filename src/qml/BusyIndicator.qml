import QtQuick 2.5
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

    Grid {
        id: rotater
        anchors.centerIn: parent
        width: 6 * Theme.itemSizeNonClickable
        height: 6 * Theme.itemSizeNonClickable
        columns: 2
        spacing: 4 * Theme.itemSizeNonClickable

        Repeater {
            model: 4
            delegate: GlowItem {
                id: glow
                color: Theme.textColor
            }
        }
    }

    PropertyAnimation {
        target: rotater
        property: "rotation"
        from: 0
        to: 360
        duration: Theme.animationDurationSlow
        alwaysRunToEnd: true
        loops: Animation.Infinite
        running: indicator.running
    }
}
