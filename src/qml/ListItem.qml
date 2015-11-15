import QtQuick 2.5
import Crowd.Mine 1.0

BackgroundItem {
    id: item

    readonly property bool menuOpen: __menu && __menu.active
    readonly property real menuHeight: __menu ? __menu.height : 0

    property Component menu: null

    property Item __menu: null

    onPressAndHold: {
        if (!menu) {
            mouse.accepted = false
            return
        }

        if (!__menu) {
            __menu = menu.createObject(item)
        }

        if (!__menu.status == Component.Error) {
            console.log(__menu.errorString())
            mouse.accepted = false
            return
        }

        __menu.open()
    }
}
