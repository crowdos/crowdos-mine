import QtQuick 2.0
import Crowd.Mine 1.0

MouseArea {
    id: page
 // TODO:
    readonly property int status: PageStatus.Inactive
    property bool backNavigation: true

    property Item __menu
    property bool __menuOpen: __menu != null ? __menu.active : false
    visible: opacity > 0
    opacity: pageStack.currentPage == page ? 1.0 : 0.0

    Behavior on opacity {
        enabled: pageStack.depth > 1
        NumberAnimation { duration: Theme.animationDuration }
    }

    // Only close if we do not tap inside the flickable itself
    onClicked: if (__menu && mouse.y < __menu.__flickableY) { __menu.active = false }
    drag {
        minimumX: 0
        maximumX: width
        target: pageStack.depth > 1 && !__menuOpen && backNavigation ? page : null
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
