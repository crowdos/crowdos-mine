import QtQuick 2.5
import Crowd.Mine 1.0

Page {
    MineFlickable {
        anchors.fill: parent
        contentHeight: column.height
        title: qsTr("Dialogs")

        Column {
            id: column
            spacing: Theme.paddingSize
            width: parent.width

            ValueButton {
                label: qsTr("Date")
            }

            ValueButton {
                label: qsTr("Time")
            }

            Button {
                text: qsTr("Color")
            }

            Button {
                text: qsTr("Custom dialog")
            }
        }
    }
}
