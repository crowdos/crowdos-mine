import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    id: root

    property bool automaticCheck: true
    property bool checked
    property bool busy
    property alias text: label.text

    opacity: enabled ? 1.0 : Theme.dimmedItemOpacity
    width: label.width
    height: Theme.itemSize

    onClicked: {
        if (automaticCheck) {
            checked = !checked
        }
    }

    Row {
        anchors {
            fill: parent
            margins: Theme.paddingSize
        }

        spacing: Theme.paddingSize

        GlowItem {
            id: glow
            anchors.verticalCenter: parent.verticalCenter
            overlayVisible: root.checked || root.containsPress
        }

        Label {
            id: label
            anchors.verticalCenter: parent.verticalCenter
            color: root.containsPress ? Theme.highlightTextColor : Theme.textColor
        }
    }

    PropertyAnimation {
        target: glow
        property: "spread"
        from: 0.3
        to: 0.1 // TODO: same as GlowItem.qml
        duration: Theme.animationDuration
        alwaysRunToEnd: true
        loops: Animation.Infinite
        running: busy
    }
}
