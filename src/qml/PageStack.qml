import QtQuick 2.5
import Crowd.Mine 1.0

Item {
    id: root
    property Item window
    readonly property Item currentPage: stack.currentItem ? stack.currentItem.page : null
    readonly property Item previousPage: stack.previousItem ? stack.previousItem.page : null

    property alias depth: stack.size

    property variant __cache: []

    property alias _mouseGrabbed: grabDetector.mouseGrabbed

    MouseGrabDetector {
        id: grabDetector
        currentPage: root.currentPage
    }

    Stack {
        id: stack
    }

    function clear() {
        while (depth > 0) {
            __pop(true)
        }
    }

    function find(func) {
// TODO:
    }

    function pop(page, immediate) {
        if (immediate == undefined) {
            immediate = false
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

        for (var x = 0; x < stack.size; x++) {
            if (stack.at(x).page == page) {
                break
            }
        }

        if (x == stack.size) {
            x = 0
        }

        // x is a position but we are comparing it to length so we add 1
        // We need to pop until the page immediately after x so we add another 1
        x += 2

        while (stack.size > x) {
            __pop(true)
        }

        __pop(false)
    }

    function __pop(immediate) {
        if (immediate == true) {
            var comp = stack.pop()
            __destroyComponent(comp)
        } else {
            // We are starting the animation first before popping the component.
            // This is because we have a Behavior enabled when the pop animation
            // is running. If we pop off the stack first then the Behavior enabled
            // condition will not be true.
            var comp = stack.at(stack.size - 1)
            comp.page.popAnimation.start()
            if (stack.size >= 2) {
                stack.at(stack.size - 2).page.__opacity = Qt.binding(function() {
                    return comp && comp.page ? Math.abs(comp.page.x) / comp.page.width : 1.0
                })
            }

            stack.pop()
        }
    }

    function __destroyComponent(comp) {
        if (comp.ownedByUs) {
            comp.page.destroy()
        } else {
            comp.page.parent = comp.originalParent
        }
        comp.destroy()
        comp = null
    }

    function push(page, properties, immediate) {
        if (!page) {
            console.log("Cannot push a non-existent page")
            return
        }
 // TODO: handle arrays
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
                comp.destroy()
                return
            }
        } else if (typeof page == "string") {
            // String
            if (page.slice(0, 11) == "Crowd.Mine.") {
                var str = page.slice(11) + ".qml"
                return push(Qt.resolvedUrl(str), properties, immediate)
            }

            var cached = __lookup(page)
            comp.destroy()
            return push(cached, properties, immediate)
        } else {
            // An Item
            comp.page = page
            comp.originalParent = page.parent
            page.parent = window
            comp.ownedByUs = false
        }

        comp.page.popAnimation.stopped.connect(function() {
            __destroyComponent(comp)
        })

        comp.page.parent = window
        comp.page.x = immediate == true ? 0 : window.width
        comp.page.pushAnimation.start()

        stack.push(comp)

        return comp.page
    }

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

    property Component wrapper: Component {
        QtObject {
            property Item originalParent
            property Page page
            property bool ownedByUs
        }
    }
}
