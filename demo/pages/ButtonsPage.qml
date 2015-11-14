import QtQuick 2.2
import Crowd.Mine 1.0

Page {
    Column {
        spacing: Theme.paddingSize
        width: parent.width
        Button {
            text: "Button!"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: "Button with a very long label!"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            icon.source: "image://theme/icon-l-copy"
            text: "Button with icon!"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        ValueButton {
            label: "Label"
            value: "Value"
        }
    }
}
