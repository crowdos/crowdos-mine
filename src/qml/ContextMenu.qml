import QtQuick 2.5
import Crowd.Mine 1.0
import "private/Utils.js" as Utils

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

    onActiveChanged: {
        if (active) {
            var page = Utils.findPage(menu)
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
                    opacity: modelData.enabled ? 1.0 : Theme.dimmedItemOpacity
                }
            }
        }
    }
}
