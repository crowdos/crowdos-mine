import QtQuick 2.5
import Crowd.Mine 1.0

Item {
    id: rootWindow
    width: Screen.width
    height: Screen.height

    property variant initialPage
    property PageStack pageStack: PageStack { window: rootWindow }

    // TODO: This is temporary
    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Component.onCompleted: {
        if (initialPage) {
            pageStack.push(initialPage, {}, true)
        }
    }
}
