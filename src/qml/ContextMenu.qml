import QtQuick 2.0
import Crowd.Mine 1.0

MineFlickable {
    id: menu

    property list<Action> actions
    height: visible ? actions.length > 4 ? Theme.itemSize * 4.5 : Theme.itemSize * actions.length : 0
    visible: active && actions.length > 0
    property bool active

    property real __flickableY: menu.y

    function open() {
        active = true
    }

    function close() {
        active = false
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

    onActiveChanged: {
        if (active) {
            var page = __findPage()
            page.__menu = menu
        }
    }

    width: parent.width
    anchors.bottom: active ? parent.bottom : undefined
    contentHeight: column.height

    Column {
        id: column
        width: parent.width

        Repeater {
            id: repeater
            model: actions
            delegate: BackgroundItem {
                visible: modelData.visible
                color: Theme.highlightBackgroundColor
                onClicked: { modelData.clicked(); active = false }
                width: parent.width
                height: Theme.itemSize
                Label {
                    color: modelData.enabled && parent.down ? Theme.highlightTextColor : Theme.textColor
                    anchors.centerIn: parent
                    text: modelData.text
                    opacity: modelData.enabled ? 1.0 : 0.5
                }
            }
        }
    }
}
