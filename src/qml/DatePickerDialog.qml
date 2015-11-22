import QtQuick 2.5
import Crowd.Mine 1.0

Page {
    property alias acceptText: dialogView.acceptText
    property alias rejectText: dialogView.rejectText
    property alias title: dialogView.title
    property alias canAccept: dialogView.canAccept

    property alias day: picker.day
    property alias month: picker.month
    property alias year: picker.year

    signal accepted
    signal rejected

    DialogView {
        id: dialogView
        onAccepted: parent.accepted()
        onRejected: parent.rejected()
        title: qsTr("Choose date")
    }

    MineFlickable {
        anchors {
            top: dialogView.bottom
            topMargin: Theme.paddingSize
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        DatePicker {
            id: picker
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
