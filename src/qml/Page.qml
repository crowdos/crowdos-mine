import QtQuick 2.0
import Crowd.Mine 1.0

Item {
    id: page
 // TODO:
    property int status: PageStatus.Inactive
    visible: opacity > 0
    opacity: pageStack.currentPage == page ? 1.0 : 0.0
    // TODO: pushing the initial page causes this animation to run
    Behavior on opacity {
        enabled: pageStack.busy
        // TODO: same as the page stack animation duration
        NumberAnimation { duration: 100 }
    }
}