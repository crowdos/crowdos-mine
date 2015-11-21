import QtQuick 2.5
import Crowd.Mine 1.0

Item {
    id: picker

    width: Math.min(Screen.width, Screen.height)/2
    height: width

    property int firstYear: 1800
    property int lastYear: 2200

    property int day: date.getDate()
    property int month: date.getMonth() + 1
    property int year: date.getFullYear()
    property date date: new Date()

    property variant _locale: Qt.locale("C") // TODO: use current locale

    function setDate(day, month, year) {
        picker.day = day
        picker.month = month
        picker.year = year

        view.currentIndex = mainModel.indexForDate(picker.month, picker.year)
    }

    property Component delegate: Component {
        Label {
            property bool isCurrentDay: picker.day == day &&
                picker.month == month &&
                picker.year == year
            width: parent ? parent.width / 7 : 0
            height: width
            color: isCurrentDay ? Theme.highlightTextColor : Theme.textColor
            // TODO: formatting
            text: day
            opacity: currentMonth ? 1.0 : Theme.dimmedItemOpacity
            font.pixelSize: Theme.fontSizeSmall
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            MouseArea {
                anchors.fill: parent
                onClicked: picker.setDate(day, month, year)
            }
        }
    }

    readonly property int _months: 12 *(picker.lastYear - picker.firstYear + 1)

    DateModel {
        id: mainModel
        firstYear: picker.firstYear
        lastYear: picker.lastYear
    }

    // TODO: We need this and to bind the currentIndex too. No idea why.
    Component.onCompleted: view.currentIndex = mainModel.indexForDate(picker.month, picker.year)

    Column {
        width: parent.width

        Label {
            width: parent.width
            property string _monthName: _locale.standaloneMonthName(view.currentItem.month - 1)
            property string _yearName: view.currentItem.year
            // TODO: formatting
            text: qsTr("%1 %2").arg(_monthName).arg(_yearName)
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.fontSizeSmall
        }

        Row {
            width: parent.width

            Flow {
                width: parent.width
                Repeater {
                    model: 7
                    delegate: Label {
                        width: parent.width / 7
                        text: _locale.dayName(modelData, Locale.ShortFormat)
                        font.pixelSize: Theme.fontSizeSmall
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }

        MineListView {
            id: view
            clip: true
            width: parent.width
            height: width
            orientation: ListView.Horizontal
            highlightFollowsCurrentItem: true
            model: _months
            snapMode: ListView.SnapOneItem
            highlightRangeMode: ListView.StrictlyEnforceRange
            currentIndex: mainModel.indexForDate(picker.month, picker.year)
            delegate: Item {
                id: item
                property alias year: dateModel.year
                property alias month: dateModel.month
                width: ListView.view.width
                height: ListView.view.height
                DateModel {
                    id: dateModel
                    firstYear: picker.firstYear
                    lastYear: picker.lastYear
                    currentIndex: modelData
                }

                Flow {
                    width: parent.width
                    Repeater {
                        model: dateModel
                        delegate: picker.delegate
                    }
                }
            }
        }
    }
}
