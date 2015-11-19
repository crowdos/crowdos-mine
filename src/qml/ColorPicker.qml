import QtQuick 2.5
import Crowd.Mine 1.0

// Ideas from http://blog.ruslans.com/2010/12/cute-quick-colorpicker.html
// TODO: alpha blending
// TODO: indicators
Item {
    id: picker

    width: Math.min(Screen.width, Screen.height)/2
    height: width
    property color color: "blue"

    property bool __complete
    function __updateColor() {
        if (!__complete) {
            return
        }

        picker.color = Qt.hsva(huePicker.hValue, slPicker.sValue, slPicker.vValue, 1.0)
    }

    ColorConverter {
        id: converter
    }

    Component.onCompleted: {
        initialColor.color = picker.color
        converter.color = picker.color
        __complete = true

        huePicker.mouseY = 1.0 - (huePicker.height * converter.hue)
        slPicker.mouseX = slPicker.width * converter.value
        slPicker.mouseY = 1.0 - (converter.saturation * slPicker.height)
    }

    MouseArea {
        id: slPicker
        width: parent.width - Theme.itemSizeSmall - Theme.paddingSize
        height: width
        preventStealing: true

        property real mouseX
        property real mouseY
        property real sValue: Math.max(0.0, Math.min(mouseX / width, 1.0));
        property real vValue: Math.max(0.0, Math.min(1.0 - mouseY / height, 1.0));

        onSValueChanged: __updateColor()
        onVValueChanged: __updateColor()

        onPressed: {mouseX = mouse.x; mouseY = mouse.y }
        onPositionChanged: { mouseX = mouse.x; mouseY = mouse.y }

        anchors {
            left: parent.left
            top: parent.top
        }

        Rectangle {
            anchors.fill: parent
            smooth: true
            rotation: 90
            gradient: Gradient {
                GradientStop { position: 0.0; color: Qt.hsva(huePicker.hValue, 1.0, 1.0, 1.0) }
                GradientStop { position: 1.0; color: "#FFFFFFFF" }
            }
        }

        Rectangle {
            anchors.fill: parent
            smooth: true
            rotation: 180
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#FF000000" }
                GradientStop { position: 1.0; color: "#00000000" }
            }
        }
    }

    MouseArea {
        id: huePicker
        width: Theme.itemSizeSmall
        height: parent.height
        anchors {
            right: parent.right
            top: parent.top
        }

        onHValueChanged:  __updateColor()

        property real hValue: Math.max(0.0, Math.min(1.0 - mouseY / height, 1.0));
        property real mouseY

        onPressed: mouseY = mouse.y
        onPositionChanged: mouseY = mouse.y

        Rectangle {
            smooth: true
            anchors.fill: parent

            gradient: Gradient {
                GradientStop { position: 1.0;  color: "#FF0000" }
                GradientStop { position: 0.85; color: "#FFFF00" }
                GradientStop { position: 0.76; color: "#00FF00" }
                GradientStop { position: 0.5;  color: "#00FFFF" }
                GradientStop { position: 0.33; color: "#0000FF" }
                GradientStop { position: 0.16; color: "#FF00FF" }
                GradientStop { position: 0.0;  color: "#FF0000" }
            }
        }
    }

    Rectangle {
        id: initialColor
        width: Theme.itemSize
        height: Theme.itemSizeSmall

        anchors {
            left: parent.left
            top: slPicker.bottom
            topMargin: Theme.paddingSize
        }
    }

    Rectangle {
        id: finalColor
        color: picker.color
        width: Theme.itemSize
        height: Theme.itemSizeSmall
        anchors {
            right: huePicker.left
            rightMargin: Theme.paddingSize
            top: slPicker.bottom
            topMargin: Theme.paddingSize
        }
    }
}
