import QtQuick 2.5
import Crowd.Mine 1.0

Rectangle {
    property alias title: label.text
    color: Theme.highlightBackgroundColor
    height: contentY >= -Theme.iconSizeSmall ? Theme.iconSizeSmall : -contentY
    width: parent.width
    visible: title != ""
    property real topMargin: title != "" ? Theme.itemSizeLarge : 0

    Label {
        id: label
        font.pixelSize: Theme.fontSizeSmall
        color: Theme.highlightTextColor
        anchors {
            right: parent.right
            bottom: parent.bottom
            bottomMargin: Theme.paddingSizeSmall
            rightMargin: Theme.paddingSizeSmall
        }
    }
}
