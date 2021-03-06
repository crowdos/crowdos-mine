import QtQuick 2.5
import Crowd.Mine 1.0
import QtGraphicalEffects 1.0

Item {
    property alias color: rect.color
    property alias spread: glow.spread
    property alias glowRadius: glow.glowRadius
    property alias cornerRadius: glow.cornerRadius
    property alias overlayColor: overlay.color
    property alias overlayVisible: overlay.visible

    width: Theme.itemSizeNonClickable
    height: Theme.itemSizeNonClickable

    Rectangle {
        id: rect
        anchors.fill: parent
        color: Theme.textColor
        radius: height / 2
        opacity: parent.enabled ? 1.0 : 0.1
    }

    RectangularGlow {
        id: glow
        glowRadius: Theme.itemSizeNonClickable * 2
        spread: 0.1
        cornerRadius: rect.radius + glowRadius
        anchors.fill: rect
        color: rect.color
    }

    Rectangle {
        id: overlay
        anchors.fill: rect
        radius: rect.radius
        color: Theme.highlightTextColor
        visible: false
    }
}
