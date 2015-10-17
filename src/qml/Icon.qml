import QtQuick 2.2
import Crowd.Mine 1.0

Item {
    property bool highlight
    property url source
    property color highlightColor: Theme.highlightTextColor
    property url __highlightSource: source == "" ? "" : source + "?" + Theme.highlightTextColor

    width: Theme.iconSize
    height: Theme.iconSize

    Image {
        width: parent.width * 0.9
        height: parent.height * 0.9
        anchors.fill: parent
        source: parent.highlight ? __highlightSource : parent.source
        sourceSize.width: width
        sourceSize.height: height
    }
}
