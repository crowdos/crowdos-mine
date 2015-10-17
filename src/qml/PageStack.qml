import QtQuick 2.2
import Crowd.Mine 1.0
import "PageStack.js" as Cache

QtObject {
    property Item window
    property Item currentPage
    property int depth
    readonly property bool busy: animation.running
//    property variant __cache: []
    property variant __stack: []

    function completeAnimation() {
        if (busy) {
            animation.complete()
         }
    }

    function clear() {
        while (depth > 0) {
            __pop(true)
            completeAnimation()
        }
    }

    function find(func) {
// TODO:
    }

    function pop(page, immediate) {
        if (busy) {
            console.log("An animation is already running")
            return null
        }
        if (depth < 1) {
            console.log("Cannot pop the first page or an empty stack")
            return null
        }

        if (page == undefined) {
            return __pop(immediate)
        }

        if (page == currentPage) {
            // Nothing to do here.
            return
        }

        for (var x = 0; x < __stack.length; x++) {
            if (__stack[x].page == page) {
                break
            }
        }

        if (x == __stack.length) {
            x = 0
        }

        // x is a position but we are comparing it to length so we add 1
        // We need to pop until the page immediately after x so we add another 1
        x += 2

        while (__stack.length > x) {
            __pop(true)
            completeAnimation()
        }

        __pop(false)
    }

    function __pop(immediate) {
        var comp = __stack.pop()
        animation.from = comp.page.x
        animation.to = immediate == true ? 0 : window.width
        animation.comp = comp
        animation.target = currentPage
        depth = __stack.length
        currentPage = __stack.length == 0 ? null : __stack[__stack.length - 1].page
        animation.start()
    }

    function push(page, properties, immediate) {
        if (!page) {
            console.log("Cannot push a non-existent page")
            return
        }
 // TODO: handle arrays
        if (busy) {
            console.log("An animation is already running")
            return null
        }

        var comp = wrapper.createObject(window)
        if (properties == null) {
            properties = {}
        }

        if (page.createObject) {
            // Component
            comp.page = page.createObject(window, properties)
            comp.ownedByUs = true
            if (page.status == Component.Error) {
                console.log(page.errorString())
                return
            }
        } else if (typeof page == "string") {
            // String
            var cached = Cache.__lookup(page)
            return push(cached, properties, immediate)
        } else {
            // An Item
            comp.page = page
            comp.originalParent = page.parent
            page.parent = window
            comp.ownedByUs = false
        }

        comp.page.parent = window
        comp.page.x = immediate == true ? 0 : window.width
        comp.page.y = 0
        comp.page.width = Qt.binding(function() { return window.width })
        comp.page.height = Qt.binding(function() { return window.height })
        animation.target = comp.page
        animation.from = comp.page.x
        animation.to = 0
        animation.comp = null
        animation.start()
        if (__stack == undefined) {
            __stack = new Array
        }
        __stack.push(comp)
        depth = __stack.length
        currentPage = comp.page
        return currentPage
    }
/*
    function __lookup(page) {
            if (__cache == undefined) {
                __cache = new Array
            }

            if (__cache[page] == undefined) {
                var comp = Qt.createComponent(page)
                if (!comp) {
                    return null
                }

                if (comp.status == Component.Error) {
                    console.log(comp.errorString())
                    comp.destroy()
                    return null
                }

                __cache[page] = comp
            }

            return __cache[page];
    }
*/
    property Component wrapper: Component {
        QtObject {
            property Item originalParent
            property Page page
            property bool ownedByUs
        }
    }

    property variant animation: PropertyAnimation {
        property QtObject comp
        property: "x"
        duration: 100
        alwaysRunToEnd: true
        onRunningChanged: {
            if (!running && comp) {
                target = null
                if (comp.ownedByUs) {
                    comp.page.destroy()
                } else {
                    comp.page.parent = comp.originalParent
                }
                comp.destroy()
                comp = null
            }
        }
    }
}
