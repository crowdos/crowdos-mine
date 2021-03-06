import QtQuick 2.5
import Crowd.Mine 1.0
import "private"
import "private/Utils.js" as Utils

HeaderBase {
    id: header

    signal accepted
    signal rejected

    property alias acceptText: acceptButton.text
    property alias rejectText: rejectButton.text
    property alias title: label.text

    property bool canAccept: true

    height: Theme.itemSizeLarge // Similar to private/Header.qml

    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    function accept() {
        __forwardPop = true
        header.accepted()
        pageStack.pop()
    }

    function reject() {
        __forwardPop = false
        header.rejected()
        pageStack.pop()
    }

    property Item __page: null
    Component.onCompleted: __page = Utils.findPage(header)

    Binding {
        target: __page
        when: __page != null
        value: true
        property: "backNavigation"
    }

    Binding {
        target: __page
        when: __page != null
        value: header.canAccept
        property: "__forwardNavigation"
    }

    Label {
        id: label
        font.pixelSize: Theme.fontSizeSmall
        color: Theme.highlightTextColor

        anchors {
            right: parent.right
            rightMargin: Theme.paddingSizeSmall
            top: parent.top
            topMargin: Theme.paddingSizeSmall
        }
    }

    Button {
        id: acceptButton
        text: qsTr("Ok")
        enabled: header.canAccept
        anchors {
            right: parent.right
            rightMargin: Theme.paddingSize
            bottom: parent.bottom
            bottomMargin: Theme.paddingSizeSmall
        }

        onClicked: header.accept()
    }

    Button {
        id: rejectButton
        text: qsTr("Cancel")
        anchors {
            left: parent.left
            leftMargin: Theme.paddingSize
            bottom: parent.bottom
            bottomMargin: Theme.paddingSizeSmall
        }

        onClicked: header.reject()
    }
}
