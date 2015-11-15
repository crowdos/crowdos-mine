import QtQuick 2.5
import Crowd.Mine 1.0

Page {
    MineFlickable {
        title: qsTr("Sliders")

        anchors {
            fill: parent
            margins: Theme.paddingSize
        }

        contentHeight: column.height

        Column {
            id: column
            width: parent.width

            Slider {
                minimumValue: 1
                maximumValue: 100
                value: 30
                handleVisible: handleVisibleSwitch.checked
                valueIndicatorVisible: valueIndicatorVisibleSwitch.checked
            }

            TextSwitch {
                id: handleVisibleSwitch
                text: qsTr("Show handle")
                checked: true
            }

            TextSwitch {
                id: valueIndicatorVisibleSwitch
                text: qsTr("Show value indicator")
            }


            Label {
                text: qsTr("Slider with a custom indictor text")
            }

            Slider {
                minimumValue: 1
                maximumValue: 100
                value: 30
                handleVisible: true
                valueIndicatorVisible: true
                valueIndicatorText: qsTr("Selected value is %1").arg(value)
            }

        }
    }
}
