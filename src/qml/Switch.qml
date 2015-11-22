import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    id: root

    property bool automaticCheck: true
    property bool checked
    property bool busy
    property alias icon: image

    width: Theme.itemSize
    height: Theme.itemSize

    onClicked: {
        if (automaticCheck) {
            checked = !checked
        }
    }

    Column {
        anchors {
            fill: parent
            margins: Theme.paddingSize
        }

        spacing: Theme.paddingSize

        GlowItem {
            id: glow
            anchors.horizontalCenter: parent.horizontalCenter
            overlayVisible: root.checked || root.containsPress
        }

        Icon {
            id: image
            anchors.horizontalCenter: parent.horizontalCenter
            pressed: root.checked || root.containsPress
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
