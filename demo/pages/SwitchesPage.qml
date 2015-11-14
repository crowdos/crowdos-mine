import QtQuick 2.0
import Crowd.Mine 1.0

Page {
    Column {
        width: parent.width
        Row {
            Switch {
                icon.source: "image://theme/foo"
            }

            TextSwitch {
                text: "A switch with a text"
            }
        }

        Row {
            Switch {
                icon.source: "image://theme/foo"
                busy: true
            }

            TextSwitch {
                busy: true
                text: "A busy text switch"
            }
        }
    }
}
