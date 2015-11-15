import QtQuick 2.5
import Crowd.Mine 1.0
import "private"

Flickable {
    property alias title: header.title

    pixelAligned: true
    pressDelay: Theme.actionThreshold
    boundsBehavior: Flickable.OvershootBounds
    topMargin: header.topMargin

    Header {
        id: header
    }
}
