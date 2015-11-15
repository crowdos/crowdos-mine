import QtQuick 2.5
import Crowd.Mine 1.0
import "private"

Flickable {
    id: flickable

    property alias title: header.title

    pixelAligned: true
    pressDelay: Theme.actionThreshold
    boundsBehavior: Flickable.OvershootBounds
    topMargin: __header.topMargin

    property Item __header: Header {
        id: header
        parent: flickable
    }
}
