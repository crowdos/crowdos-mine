import QtQuick 2.5
import Crowd.Mine 1.0

Item {
    id: picker

    width: Math.min(Screen.width, Screen.height)/2
    height: width

    property int firstYear: 1800
    property int lastYear: 2200

// TODO: make inner delegate configurable
// TODO: API
// TODO: today's date
    property int day: date.getDate()
    property int month: date.getMonth() + 1
    property int year: date.getFullYear()
    property date date: new Date()

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
            // TODO: formatting
            text: qsTr("%1, %2").arg("").arg(view.currentItem ? view.currentItem.year : "")
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
                property int year: dateModel.year
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
                        delegate: Label {
                            width: item.width / 7
                            height: width
                            // TODO: formatting
                            text: day
                            // TODO: color
                            color: currentMonth ? Theme.textColor: Theme.highlightTextColor
                            font.pixelSize: Theme.fontSizeSmall
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    picker.day = day
                                    picker.month = dateModel.month
                                    picker.year = dateModel.year
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
