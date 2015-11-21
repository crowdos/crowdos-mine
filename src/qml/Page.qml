import QtQuick 2.5
import Crowd.Mine 1.0
import "private"

MouseArea {
    id: page

    property bool backNavigation: true

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
        to: pageStack.window.width
        duration: Theme.animationDurationFast
    }

   property QtObject pushAnimation: PropertyAnimation {
        target: page
        properties: "x"
        to: 0
        duration: Theme.animationDurationFast
    }

    drag {
        minimumX: 0
        maximumX: width
        target: !pageStack._mouseGrabbed && pageStack.depth > 1 && __menu == null && backNavigation ? page : null
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
