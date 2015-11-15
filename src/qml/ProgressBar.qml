import QtQuick 2.5
import Crowd.Mine 1.0

Column {
    id: progressBar

    property real minimumValue: 0
    property real maximumValue: 100
    property real value: 0
    readonly property real progressValue: Math.max(Math.min(value, maximumValue), minimumValue)
    property bool indeterminate: false
    property string valueText: qsTr("%1%").arg(progressValue.toFixed())
    property alias label: labelLabel.text

    width: parent.width
    spacing: Theme.paddingSizeSmall

    property real __indicatorWidth: (groove.width * progressValue) / (maximumValue - minimumValue + 1)
    onIndeterminateChanged: indicator.x = 0

    Label {
        id: valueLabel
        text: valueText
        font.pixelSize: Theme.fontSizeSmall
        visible: text != "" && !progressBar.indeterminate
        x: Math.min(Math.max(0, __indicatorWidth - (width / 2)), groove.width - width)
    }

    Rectangle {
        id: groove
        height: Theme.itemSizeNonClickable

        anchors {
            left: parent.left
            leftMargin: Theme.paddingSizeLarge
            right: parent.right
            rightMargin: Theme.paddingSizeLarge
        }

        gradient: Gradient {
            GradientStop {position: 0.0; color: "transparent"}
            GradientStop {position: 0.5; color: Theme.textColor}
            GradientStop {position: 1.0; color: "transparent"}
        }

        Rectangle {
            id: indicator
            height: Theme.itemSizeNonClickable
            width: progressBar.indeterminate ? Theme.itemSizeSmall : __indicatorWidth
            x: 0

            PropertyAnimation {
                id: animation

                property: "x"
                to: groove.width - indicator.width
                from: 0
                target: indicator
                loops: Animation.Infinite
                duration: Theme.animationDurationSlow
            }

            // This is a hack. If we bind animation.running to progressBar.indeterminate
            // then animation miscalculates the "to" value for whatever reason :/
            Timer {
                interval: 100
                repeat: false
                running: progressBar.indeterminate
                onTriggered: animation.running = Qt.binding(function() { return progressBar.indeterminate })
            }

            gradient: Gradient {
                GradientStop {position: 0.0; color: "transparent"}
                GradientStop {position: 0.5; color: Theme.highlightTextColor}
                GradientStop {position: 1.0; color: "transparent"}
            }
        }
    }

    Label {
        id: labelLabel
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Theme.fontSizeSmall
        visible: text != ""
        text: label
    }
}
