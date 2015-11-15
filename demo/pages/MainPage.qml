import QtQuick 2.0
import Crowd.Mine 1.0

Page {
    MineListView {
        id: view
        anchors.fill: parent

        title: qsTr("Components")

        model: ListModel {
            ListElement { title: "Buttons"; page: "ButtonsPage.qml" }
            ListElement { title: "Sliders"; page: "SlidersPage.qml" }
            ListElement { title: "Switches"; page: "SwitchesPage.qml" }
            ListElement { title: "Menus"; page: "MenusPage.qml" }
            ListElement { title: "Labels"; page: "LabelsPage.qml" }
            ListElement { title: "Glow items"; page: "GlowItemsPage.qml" }
            ListElement { title: "Text input"; page: "TextInputPage.qml" }
            ListElement { title: "Progress indicators"; page: "ProgressIndicatorsPage.qml" }
            ListElement { title: "Busy indicators"; page: "BusyIndicatorsPage.qml" }
            ListElement { title: "Orientation"; page: "OrientationPage.qml" }
            ListElement { title: "Combo box"; page: "ComboBoxPage.qml" }
            ListElement { title: "Dialogs"; page: "DialogsPage.qml" }
            ListElement { title: "Banners"; page: "BannersPage.qml" }
        }

        delegate: ListItem {
            width: ListView.view.width
            height: Theme.itemSize
            Label {
                anchors.centerIn: parent
                text: title
            }
            onClicked: pageStack.push(Qt.resolvedUrl(page), {title: title})
        }
    }
}