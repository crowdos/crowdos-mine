import QtQuick 2.0
import Crowd.Mine 1.0

Page {
    MineListView {
        id: view
        anchors.fill: parent
        model: ListModel {
            ListElement { title: "Buttons"; page: "ButtonsPage.qml" }
            ListElement { title: "Sliders"; page: "SlidersPage.qml" }
            ListElement { title: "Switches"; page: "SwitchesPage.qml" }
            ListElement { title: "Menus"; page: "MenusPage.qml" }
            ListElement { title: "Labels"; page: "LabelsPage.qml" }
            ListElement { title: "Glow Items"; page: "GlowItemsPage.qml" }
            ListElement { title: "Text input"; page: "TextInputPage.qml" }
            ListElement { title: "Progress indicators"; page: "ProgressIndicatorsPage.qml" }
            ListElement { title: "Busy indicators"; page: "BusyIndicatorsPage.qml" }
            ListElement { title: "Orientation"; page: "OrientationPage.qml" }
            ListElement { title: "Combo box"; page: "ComboBoxPage.qml" }
            ListElement { title: "Dialogs"; page: "DialogsPage.qml" }
            ListElement { title: "Banners"; page: "BannersPage.qml" }
        }

        delegate: ListItem {
            width: ListView.view.width
            height: Theme.itemSize
            Label {
                anchors.centerIn: parent
                text: title
            }
            onClicked: pageStack.push(Qt.resolvedUrl(page), {title: title})
        }
    }
/*
    Column {
        width: parent.width
        MouseArea {
            onClicked: pageStack.push(Qt.resolvedUrl("MainPage.qml"))
            width: parent.width
            height: 100
            Rectangle { anchors.fill: parent; color: "green" }
            Text {
                anchors.fill: parent
                text: "push"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        MouseArea {
            onClicked: pageStack.push(Qt.resolvedUrl("MainPage.qml"), {}, true)
            width: parent.width
            height: 75
            Rectangle { anchors.fill: parent; color: "blue" }
            Text {
                anchors.fill: parent
                text: "push immediate"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        MouseArea {
            onClicked: pageStack.pop()
            width: parent.width
            height: 75
            Rectangle { anchors.fill: parent; color: "red" }
            Text {
                anchors.fill: parent
                text: "pop"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        MouseArea {
            onClicked: pageStack.pop(undefined, true)
            width: parent.width
            height: 75
            Rectangle { anchors.fill: parent; color: "purple" }
            Text {
                anchors.fill: parent
                text: "pop immediate"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        MouseArea {
            onClicked: pageStack.clear()
            width: parent.width
            height: 75
            Rectangle { anchors.fill: parent; color: "yellow" }
            Text {
                anchors.fill: parent
                text: "clear"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        MouseArea {
            onClicked: pageStack.pop(pageStack.__stack[1].page)
            width: parent.width
            height: 75
            Rectangle { anchors.fill: parent; color: "yellow" }
            Text {
                anchors.fill: parent
                text: "clear until second"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        MouseArea {
            width: parent.width
            height: 75
            Text {
                anchors.fill: parent
                text: pageStack.depth
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

    }
*/
}