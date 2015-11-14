import QtQuick 2.0
import Crowd.Mine 1.0

Page {
    MineListView {
        anchors.fill: parent

        model: ListModel {
            ListElement {title: "Long press"; showMenu: true; fruit: "Apple" }
            ListElement {title: "Long press 2"; showMenu: true; fruit: "Orange" }
            ListElement {title: "Long press 3"; showMenu: true; fruit: "Grapes" }
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
                    text: "Fruit is " + fruit
                },
                Action {
                    text: "2nd item"
                },
                Action {
                    text: "Disabled"
                    enabled: false
                },
                Action {
                    text: "Hidden"
                    visible: false
                }
            ]
        }
    }

    PageMenu {
        actions: [
            Action {
                text: "Action 1"
            },
            Action {
                text: "Action 2"
            },
            Action {
                text: "Disabled action"
                enabled: false
            },
            Action {
                text: "Action 3"
            },
            Action {
                text: "Action 4"
            },
            Action {
                text: "Action 5"
            },
            Action {
                text: "Action 6"
            },
            Action {
                text: "Action 7"
            },
            Action {
                text: "Action 8"
            },
            Action {
                text: "Hidden action"
                visible: false
            },
            Action {
                text: "Last action"
            }
        ]
    }
}
