import QtQuick 2.0
import Crowd.Mine 1.0

Page {
    MineFlickable {
        title: qsTr("Busy indicators")

        anchors {
            fill: parent
            margins: Theme.paddingSizeSmall
        }

        contentHeight: column.height

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingSizeLarge
            anchors.horizontalCenter: parent.horizontalCenter
            BusyIndicator {
                size: Theme.itemSizeSmall
                running: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            BusyIndicator {
                size: Theme.itemSize
                running: true
                anchors.horizontalCenter: parent.horizontalCenter
            }

            BusyIndicator {
                size: Theme.itemSizeLarge
                running: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
