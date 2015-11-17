import QtQuick 2.5
import Crowd.Mine 1.0
import "private"

MouseArea {
    id: page
 // TODO:
    readonly property int status: PageStatus.Inactive
    property bool backNavigation: true

    property Item __menu: null

    visible: opacity > 0
    opacity: pageStack.currentPage == page ? 1.0 : 0.0

    Behavior on opacity {
        enabled: pageStack.depth > 1
        NumberAnimation { duration: Theme.animationDurationFast }
    }

    drag {
        minimumX: 0
        maximumX: width
        target: pageStack.depth > 1 && __menu == null && backNavigation ? page : null
        axis: "XAxis"
        filterChildren: true
        threshold: Theme.actionThreshold / 2
    }

    onReleased: {
        if (drag.active && page.x > Theme.actionThreshold) {
            pageStack.pop()
        } else {
            page.x = 0
        }
    }
}
