import QtQuick 2.2
import Crowd.Mine 1.0

Page {
    MineFlickable {
        anchors.fill: parent
        contentHeight: column.height
        title: qsTr("Buttons")

        Column {
            id: column
            spacing: Theme.paddingSize
            width: parent.width
            Button {
                text: "Button!"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                text: "Button with a very long label!"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                Button {
                    text: qsTr("Button 1")
                }

                Button {
                    text: qsTr("Button 2")
                }

                Button {
                    text: qsTr("Button 3")
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                IconButton {
                    icon.source: "image://theme/icon-l-copy"
                }

                IconButton {
                    icon.source: "image://theme/icon-l-copy"
                }

                IconButton {
                    icon.source: "image://theme/icon-l-copy"
                }

                IconButton {
                    icon.source: "image://theme/icon-l-copy"
                }
            }

            ValueButton {
                label: "Label"
                value: "Value"
            }
        }
    }
}
