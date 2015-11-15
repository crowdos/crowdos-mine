import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    id: root
    readonly property bool down: pressed && containsMouse
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
            overlayVisible: root.checked || root.down
        }

        Icon {
            id: image
            anchors.horizontalCenter: parent.horizontalCenter
            highlight: root.checked || root.down
        }
    }

    PropertyAnimation {
        target: glow
        property: "spread"
        from: 0.3
        to: 0.1 // TODO: same as GlowItem.qml
        duration: Theme.animationDurationSlow
        alwaysRunToEnd: true
        loops: Animation.Infinite
        running: busy
    }
}
