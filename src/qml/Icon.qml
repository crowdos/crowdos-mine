import QtQuick 2.2
import Crowd.Mine 1.0

Item {
    property bool highlight
    property url source
    property color highlightColor: Theme.highlightTextColor
    property url __highlightSource: source == "" ? "" : source + "?" + Theme.highlightTextColor
    Image {
        anchors.fill: parent
        source: parent.highlight ? __highlightSource : parent.source
    }
}
