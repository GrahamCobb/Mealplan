import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4


Item {
    // Needed for Layout to function
    // Note: this means the TextField must have a size, not anchors.fill: parent
    implicitHeight: theText.height + checkS.height
    implicitWidth: theText.width

    property alias text: theText.text

    GridLayout {
        id: mealGrid
        rows: 2
        columns: 2
        anchors.centerIn: parent

        MealCB {
            id: checkS
            text: "S"
            Layout.row: 1
            Layout.column: 1
            Layout.alignment: Qt.AlignLeft + Qt.AlignTop
            Layout.leftMargin: 10
            Layout.topMargin: 2
        }

        MealCB {
            id: checkR
            text: "R"
            Layout.row: 1
            Layout.column: 2
            Layout.alignment: Qt.AlignRight + Qt.AlignTop
            Layout.rightMargin: 10
            Layout.topMargin: 2
        }

        TextField {
            id: theText
            anchors.centerIn: parent
            text: "a"
            Layout.row: 2
            Layout.column: 1
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignBottom
            Layout.topMargin: 20
        }
    }

    //For debugging Layout problems
    //Component.onCompleted: print(x, y, width, height, implicitWidth, implicitHeight)
}
