import QtQuick 2.5
import Crowd.Mine 1.0

Item {
    id: menu

    property list<Action> actions

    visible: actions.length > 0
    anchors.fill: parent
    property bool active

    onActiveChanged: {
        if (!active) {
            var page = __findPage()
            page.__menu = null
        }
    }

    Button {
        id: handle
        width: Theme.itemSizeLarge
        height: Theme.itemSize
        opacity: active ? 0 : 0.5

        Behavior on y {
            enabled: !pressed
            NumberAnimation { duration: Theme.animationDuration }
        }

        anchors {
            right: parent.right
            rightMargin: Theme.paddingSizeSmall
            bottom: parent.bottom
        }

        property real __initialY
        property real __initialPos
        onPressed: {
            anchors.bottom = undefined
            __initialY = mapToItem(menu, mouse.x, mouse.y).y
            __initialPos = y
        }

        onPositionChanged: {
            active = true
            var pos = __initialPos + (mapToItem(menu, mouse.x, mouse.y).y - __initialY)
            if (pos <= parent.height - flickable.height - height) {
                pos = parent.height - flickable.height - height
            }
            y = pos
        }

        onReleased: {
            y = Qt.binding(function() { return active ? parent.height - flickable.height - height : parent.height - height})
            flickable.contentY = 0
            active = __initialPos - y >= Theme.actionThreshold
            var page = __findPage()
            page.__menu = menu
        }
    }

    function __findPage() {
        var page = parent
        while (page != null) {
            if (page.__menu !== undefined) {
                return page
            }

            page = page.parent
        }

        return null
    }

    InverseMouseArea {
        x: flickable.x
        y: flickable.y
        width: flickable.width
        height: flickable.height
        enabled: menu.active
        onPressedOutside: menu.active = false
    }

    MineFlickable {
        id: flickable
        boundsBehavior: Flickable.StopAtBounds
        clip: true
        y: handle.y + handle.height
        width: parent.width
        height: actions.length > 4 ? Theme.itemSize * 4.5 : Theme.itemSize * actions.length
        contentHeight: column.height

        Column {
            id: column
            width: parent.width
            visible: opacity > 0
            opacity: active ? 1.0 : 0.0
            Behavior on opacity {
                NumberAnimation { duration: Theme.animationDuration }
            }

            Repeater {
                id: repeater
                model: actions
                delegate: BackgroundItem {
                    id: item
                    visible: modelData.visible
                    color: Theme.highlightBackgroundColor
                    onClicked: { modelData.clicked(); active = false }

                    Label {
                        color: modelData.enabled && item.down ? Theme.highlightTextColor : Theme.textColor
                        anchors.centerIn: parent
                        text: modelData.text
                        opacity: modelData.enabled ? 1.0 : 0.5
                    }
                }
            }
        }
    }
}
