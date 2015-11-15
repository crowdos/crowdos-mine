import QtQuick 2.0
import Crowd.Mine 1.0

Page {
    MineFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingSize
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "A label with text and normal font size"
                width: parent.width
            }

            Label {
                font.pixelSize: Theme.fontSizeSmall
                anchors.horizontalCenter: parent.horizontalCenter
                text: "A label with text and small font size"
                width: parent.width
            }

            Label {
                font.pixelSize: Theme.fontSizeLarge
                anchors.horizontalCenter: parent.horizontalCenter
                text: "A label with text and large font size"
                width: parent.width
            }
        }
    }
}
