import QtQuick 2.0
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
                text: "Show handle"
                checked: true
            }

            TextSwitch {
                id: valueIndicatorVisibleSwitch
                text: "Show value indicator"
            }


            Label {
                text: "Slider with a custom indictor text"
            }

            Slider {
                minimumValue: 1
                maximumValue: 100
                value: 30
                handleVisible: true
                valueIndicatorVisible: true
                valueIndicatorText: "Selected value is " + value
            }

        }
    }
}
