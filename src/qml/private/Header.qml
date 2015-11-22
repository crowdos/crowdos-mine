import QtQuick 2.5
import Crowd.Mine 1.0
import "Utils.js" as Utils

Rectangle {
    property alias title: label.text
    color: Theme.highlightBackgroundColor
    height: contentY >= -Theme.iconSizeSmall ? Theme.iconSizeSmall : -contentY
    width: parent.width
    visible: title != ""
    property real topMargin: title != "" ? Theme.itemSizeLarge : 0

    property Item __page

    MouseArea {
        id: mouse
        // TODO: icon is cropped when we scroll up.
        width: Theme.iconSizeSmall * 0.75
        height: Theme.iconSizeSmall * 0.75
        opacity: pageStack.depth > 1 && __page.backNavigation ? 1.0 : 0.0
        visible: opacity > 0.0
        Behavior on opacity {
            NumberAnimation { duration: Theme.animationDuration }
            enabled: pageStack.depth < 2
        }

        Component.onCompleted: __page = Utils.findPage(mouse)
        onClicked: pageStack.pop()

        anchors {
            left: parent.left
            bottom: parent.bottom
            bottomMargin: Theme.paddingSizeSmall
            leftMargin: Theme.paddingSizeSmall
        }

        Icon {
            anchors.fill: parent
            pressed: mouse.containsPress
        }
    }

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
