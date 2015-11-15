import QtQuick 2.5
import Crowd.Mine 1.0

Page {
    MineListView {
        title: qsTr("Menus")
        anchors.fill: parent

        model: ListModel {
            ListElement {title: qsTr("Long press"); showMenu: true; fruit: "Apple" }
            ListElement {title: qsTr("Long press 2"); showMenu: true; fruit: "Orange" }
            ListElement {title: qsTr("Long press 3"); showMenu: true; fruit: "Grapes" }
            ListElement {title: "No menu"; showMenu: false; }
        }

        delegate: ListItem {
            width: ListView.view.width
            height: Theme.itemSize + menuHeight
            menu: showMenu ? menuComponent : null
            Label {
                anchors.centerIn: menuOpen ? undefined : parent
                anchors.top: menuOpen ? parent.top : undefined
                text: title
            }
        }
    }

    Component {
        id: menuComponent

        ContextMenu {
            actions: [
                Action {
                    text: qsTr("Fruit is %1").arg(fruit)
                },
                Action {
                    text: qsTr("2nd item")
                },
                Action {
                    text: qsTr("Disabled")
                    enabled: false
                },
                Action {
                    text: qsTr("Hidden")
                    visible: false
                }
            ]
        }
    }

    PageMenu {
        actions: [
            Action {
                text: qsTr("Action 1")
            },
            Action {
                text: qsTr("Action 2")
            },
            Action {
                text: qsTr("Disabled action")
                enabled: false
            },
            Action {
                text: qsTr("Action 3")
            },
            Action {
                text: qsTr("Action 4")
            },
            Action {
                text: qsTr("Action 5")
            },
            Action {
                text: qsTr("Action 6")
            },
            Action {
                text: qsTr("Action 7")
            },
            Action {
                text: qsTr("Action 8")
            },
            Action {
                text: qsTr("Hidden action")
                visible: false
            },
            Action {
                text: qsTr("Last action")
            }
        ]
    }
}
