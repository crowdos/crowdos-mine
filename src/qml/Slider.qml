import QtQuick 2.5
import Crowd.Mine 1.0

MouseArea {
    id: slider

    property alias minimumValue: range.minimumValue
    property alias maximumValue: range.maximumValue
    property alias value: range.value
    property alias stepSize: range.stepSize

    preventStealing: true
    property alias valueIndicatorVisible: label.visible
    property string valueIndicatorText: range.value
    property alias handleVisible: knob.visible

    width: Math.max(Screen.width, Screen.height) / 2
    height: label.visible ? Theme.itemSize + label.height : Theme.itemSize

    drag {
        target: knob
        axis: Drag.XAxis
        minimumX: range.positionAtMinimum
        maximumX: range.positionAtMaximum
    }

    function __updateValue(mouse) {
        if (mouse.x < Theme.paddingSizeLarge) {
            range.value = range.minimumValue
        } else if (mouse.x > groove.width + Theme.paddingSizeLarge) {
            range.value = range.maximumValue
        } else {
            range.position = mouse.x
        }
    }

    onPressed: __updateValue(mouse)
    onPositionChanged: __updateValue(mouse)

    Label {
        id: label
        anchors {
            top: parent.top
        }

        text: valueIndicatorText
        property real __pos: knob.x - (label.width - knob.width) / 2
        x: Math.min(Math.max(__pos, Theme.paddingSizeLarge), groove.width - label.width + Theme.paddingSizeLarge)
    }

    Item {
        anchors {
            top: label.visible ? label.bottom : parent.top
            right: parent.right
            left: parent.left
            bottom: parent.bottom
        }

        Rectangle {
            id: groove
            height: Theme.itemSizeNonClickable
            anchors {
                left: parent.left
                leftMargin: Theme.paddingSizeLarge
                right: parent.right
                rightMargin: Theme.paddingSizeLarge
                verticalCenter: parent.verticalCenter
            }

            gradient: Gradient {
                GradientStop {position: 0.0; color: "transparent"}
                GradientStop {position: 0.5; color: Theme.textColor}
                GradientStop {position: 1.0; color: "transparent"}
            }
        }

        Rectangle {
            id: selected
            height: Theme.itemSizeNonClickable
            width: knob.x - Theme.paddingSizeLarge

            anchors {
                left: parent.left
                leftMargin: Theme.paddingSizeLarge
                verticalCenter: parent.verticalCenter
            }

            gradient: Gradient {
                GradientStop {position: 0.0; color: "transparent"}
                GradientStop {position: 0.5; color: Theme.highlightTextColor}
                GradientStop {position: 1.0; color: "transparent"}
            }
        }

        GlowItem {
            id: knob
            anchors.verticalCenter: parent.verticalCenter
            color: slider.containsPress ? Theme.highlightTextColor : Theme.textColor
            x: range.position
        }

        RangeModel {
            id: range
            minimumValue: 0.0
            maximumValue: 1.0
            value: 0.0
            stepSize: 1.0
            positionAtMinimum: Theme.paddingSizeLarge - knob.width / 2
            positionAtMaximum: groove.width + Theme.paddingSizeLarge - knob.width / 2
            inverted: false
        }
    }
}
