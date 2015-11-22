import QtQuick 2.5
import Crowd.Mine 1.0

Page {
    MineFlickable {
        anchors.fill: parent
        contentHeight: column.height
        title: qsTr("Dialogs")

        Column {
            id: column
            spacing: Theme.paddingSize
            width: parent.width

            ValueButton {
                id: dateButton
                label: qsTr("Date")
                property date date: new Date()
                property int day: date.getDate()
                property int month: date.getMonth() + 1
                property int year: date.getFullYear()
                value: qsTr("%1.%2.%3").arg(day).arg(month).arg(year)

                onClicked: {
                    var dlg = pageStack.push("Crowd.Mine.DatePickerDialog",
                        {year: dateButton.year, month: dateButton.month, day: dateButton.day})
                    dlg.accepted.connect(function() {
                        dateButton.day = dlg.day
                        dateButton.month = dlg.month
                        dateButton.year = dlg.year
                    })
                }
            }

            ValueButton {
                id: timeButton
                label: qsTr("Time")
                property date time: new Date()
                property int hour: time.getHours()
                property int minute: time.getMinutes()
                value: qsTr("%1:%2").arg(hour).arg(minute)

                onClicked: {
                    var dlg = pageStack.push("Crowd.Mine.TimePickerDialog",
                        {hour: timeButton.hour, minute: timeButton.minute})
                    dlg.accepted.connect(function() {
                        timeButton.hour = dlg.hour
                        timeButton.minute = dlg.minute
                    })
                }
            }

            Button {
                id: colorButton
                text: qsTr("Color")
                onClicked: {
                    var dlg = pageStack.push("Crowd.Mine.ColorPickerDialog",
                        {color: colorButton.color})
                    dlg.accepted.connect(function() {
                        colorButton.color = dlg.color
                    })
                }
            }

            Button {
                text: qsTr("Custom dialog")
// TODO:
            }
        }
    }
}
