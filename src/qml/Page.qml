import QtQuick 2.5
import Crowd.Mine 1.0
import "private"

MouseArea {
    id: page

    property bool backNavigation: true
    property bool __forwardNavigation: false
    property bool __forwardPop: false

    property Item __menu: null

    y: 0
    width: pageStack.window.width
    height: pageStack.window.height
    visible: opacity > 0
    opacity: pageStack.previousPage == page && pageStack.currentPage.x != 0 ?
        pageStack.currentPage.x / pageStack.currentPage.width : pageStack.currentPage == page ? 1.0 : 0.0

    Behavior on opacity {
        NumberAnimation { duration: Theme.animationDurationFast }
    }

    property QtObject popAnimation: PropertyAnimation {
        target: page
        properties: "x"
        to: __forwardPop ? -pageStack.window.width : pageStack.window.width
        duration: Theme.animationDurationFast
    }

   property QtObject pushAnimation: PropertyAnimation {
        target: page
        properties: "x"
        to: 0
        duration: Theme.animationDurationFast
    }

    drag {
        minimumX: __forwardNavigation ? -width : 0
        maximumX: width
        target: !pageStack._mouseGrabbed && pageStack.depth > 1 && __menu == null && backNavigation ? page : null
        axis: "XAxis"
        filterChildren: true
        threshold: Theme.actionThreshold / 2
    }

    onReleased: {
        if (drag.active) {
            if (page.x > 0 && page.x > Theme.actionThreshold) {
                __forwardPop = false
                pageStack.pop()
                return;
            } else if (page.x < 0 && Math.abs(page.x) > Theme.actionThreshold) {
                __forwardPop = true
                pageStack.pop()
                return;
            }
        }

        page.x = 0
    }
}
