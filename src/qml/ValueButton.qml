import QtQuick 2.5
import Crowd.Mine 1.0

BackgroundItem {
    property alias label: labelLabel.text
    property alias value: valueLabel.text
    property alias labelColor: labelLabel.color
    property alias valueColor: valueLabel.color

    height: column.height + Theme.paddingSize * 2

    Column {
        id: column
        width: parent.width - x
        anchors.verticalCenter: parent.verticalCenter
        spacing: Theme.paddingSizeSmall
        x: Theme.paddingSize

        Label {
            id: labelLabel
        }

        Label {
            id: valueLabel
            color: Theme.highlightTextColor
            font.pixelSize: Theme.fontSizeSmall
        }
    }
}
