import QtQuick 2.5
import Crowd.Mine 1.0

Page {
    MineFlickable {
        anchors.fill: parent
        contentHeight: column.height
        title: qsTr("Text input")

        Column {
            id: column
            spacing: Theme.paddingSize
            width: parent.width

            TextField {
            }

            TextArea {
            }
        }
    }
}