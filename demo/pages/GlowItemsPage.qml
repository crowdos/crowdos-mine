import QtQuick 2.2
import Crowd.Mine 1.0

Page {
    MineGridView {
        anchors.fill: parent
        cellWidth: parent.width / 3
        cellHeight: cellWidth
        model: ListModel {
            ListElement { glowColor: "green" }
            ListElement { glowColor: "blue" }
            ListElement { glowColor: "red" }
            ListElement { glowColor: "yellow" }
            ListElement { glowColor: "violet" }
            ListElement { glowColor: "purple" }
            ListElement { glowColor: "white" }
        }

        delegate: Item {
            width: GridView.view.cellWidth
            height: GridView.view.cellHeight
            GlowItem {
                anchors.centerIn: parent
                color: glowColor
            }
        }
    }
}
