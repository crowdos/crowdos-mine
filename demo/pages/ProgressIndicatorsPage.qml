import QtQuick 2.5
import Crowd.Mine 1.0

Page {
    MineFlickable {
        title: qsTr("Progress indicators")

        anchors {
            fill: parent
            margins: Theme.paddingSizeSmall
        }

        contentHeight: column.height

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingSizeSmall
            anchors.horizontalCenter: parent.horizontalCenter

            ProgressBar {
                id: progressBar
                anchors.horizontalCenter: parent.horizontalCenter
                minimumValue: 0
                maximumValue: 100
                label: qsTr("Progress bar")
                NumberAnimation {
                    target: progressBar
                    property: "value"
                    from: 1
                    to: 100
                    loops: Animation.Infinite
                    duration: Theme.animationDurationSlow * 10
                    running: true
                }
            }

            ProgressBar {
                anchors.horizontalCenter: parent.horizontalCenter
                minimumValue: 0
                maximumValue: 100
                value: 40
                indeterminate: true
                label: qsTr("Indeterminate")
            }
        }
    }
}
