import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    property bool showBackNavigationIndicator: true
    width: Theme.itemSizeSmall
    height: width

    z: 1

    visible: opacity > 0
    opacity: pageStack.depth > 1
        && pageStack.currentPage == parent
        && showBackNavigationIndicator ? 0.5 : 0.0

    Behavior on opacity {
        NumberAnimation { duration: Theme.animationDuration }
    }

    anchors {
        left: parent.left
        top: parent.top
    }

    onClicked: pageStack.pop()

    Icon {
        anchors.centerIn: parent
        source: "image://theme/foo" // TODO:
    }
}
