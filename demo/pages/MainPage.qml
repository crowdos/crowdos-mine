import QtQuick 2.5
import Crowd.Mine 1.0

Page {
    MineListView {
        id: view
        anchors.fill: parent

        title: qsTr("Components")

        model: ListModel {
            ListElement { title: qsTr("Buttons"); page: "ButtonsPage.qml" }
            ListElement { title: qsTr("Sliders"); page: "SlidersPage.qml" }
            ListElement { title: qsTr("Switches"); page: "SwitchesPage.qml" }
            ListElement { title: qsTr("Menus"); page: "MenusPage.qml" }
            ListElement { title: qsTr("Labels"); page: "LabelsPage.qml" }
            ListElement { title: qsTr("Glow items"); page: "GlowItemsPage.qml" }
            ListElement { title: qsTr("Text input"); page: "TextInputPage.qml" }
            ListElement { title: qsTr("Progress indicators"); page: "ProgressIndicatorsPage.qml" }
            ListElement { title: qsTr("Busy indicators"); page: "BusyIndicatorsPage.qml" }
            ListElement { title: qsTr("Orientation"); page: "OrientationPage.qml" }
            ListElement { title: qsTr("Combo box"); page: "ComboBoxPage.qml" }
            ListElement { title: qsTr("Dialogs"); page: "DialogsPage.qml" }
            ListElement { title: qsTr("Banners"); page: "BannersPage.qml" }
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