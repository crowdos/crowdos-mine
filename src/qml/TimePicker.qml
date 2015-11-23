import QtQuick 2.5
import Crowd.Mine 1.0

// TODO: date formatting
// TODO: 12/24 hours/am pm
// TODO: indicators

Item {
    id: picker

    width: Math.min(Screen.width, Screen.height)
    height: width
    property int hour: time.getHours()
    property int minute: time.getMinutes()
    property date time: new Date()

    property bool __showHours: true

    PathView {
        id: hoursAmView
        property real radius: (Math.min(picker.width, picker.height) / 2) - Theme.itemSizeSmall
        interactive: false
        anchors.fill: parent
        model: 12
        rotation: 30
        opacity: __showHours ? 1.0 : 0.0
        visible: opacity > 0
        Behavior on opacity {
            NumberAnimation { duration: Theme.animationDurationFast }
        }

        delegate: Label {
            property int hour: modelData + 1
            text: hour
            width: Theme.itemSizeSmall
            height: Theme.itemSizeSmall
            font.pixelSize: Theme.fontSizeSmall
            rotation: -30
            color: hour == picker.hour ? Theme.highlightTextColor : Theme.textColor
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    picker.hour = parent.hour
                    picker.__showHours = false
                }
            }
        }

        path: Path {
            startX: hoursAmView.width / 2// + hoursAmView.radius / 3
            startY: Theme.itemSizeSmall// + hoursAmView.radius / 3

            PathArc {
                x: hoursAmView.width / 2// - hoursAmView.radius / 3
                y: hoursAmView.height - Theme.itemSizeSmall// - hoursAmView.radius / 3
                radiusX: hoursAmView.radius
                radiusY: hoursAmView.radius
                useLargeArc: false
            }

            PathArc {
                x: hoursAmView.width / 2
                y: Theme.itemSizeSmall
                radiusX: hoursAmView.radius
                radiusY: hoursAmView.radius
                useLargeArc: false
            }
        }
    }

    PathView {
        id: hoursPmView
        width: parent.width - 2 * Theme.itemSizeSmall * 1.5
        height: parent.height - 2 * Theme.itemSizeSmall * 1.5
        property real radius: (Math.min(width, height) / 2) - Theme.itemSizeSmall
        interactive: false
        anchors.centerIn: parent
        model: 12
        rotation: 30
        opacity: __showHours ? 1.0 : 0.0
        visible: opacity > 0
        Behavior on opacity {
            NumberAnimation { duration: Theme.animationDurationFast }
        }

        delegate: Label {
            property int hour: modelData == 11 ? 0 : modelData + 13
            text: hour
            width: Theme.itemSizeSmall
            height: Theme.itemSizeSmall
            font.pixelSize: Theme.fontSizeSmall
            rotation: -30
            color: hour == picker.hour ? Theme.highlightTextColor : Theme.textColor
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    picker.hour = parent.hour
                    picker.__showHours = false
                }
            }
        }

        path: Path {
            startX: hoursPmView.width / 2
            startY: Theme.itemSizeSmall

            PathArc {
                x: hoursPmView.width / 2
                y: hoursPmView.height - Theme.itemSizeSmall
                radiusX: hoursPmView.radius
                radiusY: hoursPmView.radius
                useLargeArc: false
            }

            PathArc {
                x: hoursPmView.width / 2
                y: Theme.itemSizeSmall
                radiusX: hoursPmView.radius
                radiusY: hoursPmView.radius
                useLargeArc: false
            }
        }
    }

    PathView {
        id: minutesView
        property real radius: (Math.min(picker.width, picker.height) / 2) - Theme.itemSizeSmall
        interactive: false
        anchors.fill: parent
        model: 12
        opacity: !__showHours ? 1.0 : 0.0
        visible: opacity > 0
        Behavior on opacity {
            NumberAnimation { duration: Theme.animationDurationFast }
        }

        delegate: Label {
            property int minute: modelData * 5
            text: minute
            width: Theme.itemSizeSmall
            height: Theme.itemSizeSmall
            font.pixelSize: Theme.fontSizeSmall
            color: minute == picker.minute ? Theme.highlightTextColor : Theme.textColor
        }

        path: Path {
            startX: minutesView.width / 2
            startY: Theme.itemSizeSmall

            PathArc {
                x: minutesView.width / 2
                y: minutesView.height - Theme.itemSizeSmall
                radiusX: minutesView.radius
                radiusY: minutesView.radius
                useLargeArc: false
            }

            PathArc {
                x: minutesView.width / 2
                y: Theme.itemSizeSmall
                radiusX: minutesView.radius
                radiusY: minutesView.radius
                useLargeArc: false
            }
        }

        MouseArea {
            id: mouse
            preventStealing: true
            anchors.fill: parent
            enabled: !__showHours
            onPressed: calculateMinute(mouse.x, mouse.y)
            onPositionChanged: calculateMinute(mouse.x, mouse.y)

            function calculateMinute(x, y) {
                y -= mouse.height / 2
                y *= -1
                x -= mouse.width / 2

                var tan = y / x
                var angle = Math.atan(tan) * 180 / Math.PI
                if (x < 0)  {
                    angle += 180
                } else if (y < 0) {
                    angle += 360
                }

                angle = Math.round(60 - (((angle - 90) / 360) * 60)) % 60
                picker.minute = angle
            }
        }
    }

    Label {
        anchors.centerIn: parent
        text: qsTr("%1:%2").arg(picker.hour).arg(picker.minute)

        MouseArea {
            anchors.fill: parent
            onClicked: __showHours = !__showHours
        }
    }

}
