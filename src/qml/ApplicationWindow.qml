import QtQuick 2.2

Item {
    id: rootWindow
    width: 400
    height: 600

    property variant initialPage
    property PageStack pageStack: PageStack { window: rootWindow }

    Component.onCompleted: {
        if (initialPage) {
            pageStack.push(initialPage, {}, true)
        }
    }
}
