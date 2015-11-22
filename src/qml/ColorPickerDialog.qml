import QtQuick 2.5
import Crowd.Mine 1.0

Page {
    property alias acceptText: dialogView.acceptText
    property alias rejectText: dialogView.rejectText
    property alias title: dialogView.title
    property alias canAccept: dialogView.canAccept

    property alias color: picker.color

    signal accepted
    signal rejected

    DialogView {
        id: dialogView
        onAccepted: parent.accepted()
        onRejected: parent.rejected()
        title: qsTr("Choose color")
    }

    MineFlickable {
        anchors {
            top: dialogView.bottom
            topMargin: Theme.paddingSize
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        ColorPicker {
            id: picker
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
