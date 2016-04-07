import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4


Item {
    // Needed for Layout to function
    // Note: this means the TextField must have a size, not anchors.fill: parent
    implicitHeight: 20 + theText.implicitHeight + checkS.implicitHeight + 2
    implicitWidth: Math.max(theText.implicitWidth, 2 * (checkS.implicitWidth + 10))

    property alias text: theText.text
    property alias checkedS: checkS.checked
    property alias checkedR: checkR.checked

    signal dataChanged

    GridLayout {
        id: mealGrid
        rows: 2
        columns: 2
//        anchors.centerIn: parent
        anchors.fill: parent
        signal dataChanged

        MealCB {
            id: checkS
            text: "S"
            onCheckedChanged: parent.dataChanged()
            Layout.row: 1
            Layout.column: 1
            Layout.alignment: Qt.AlignLeft + Qt.AlignTop
            Layout.leftMargin: 10
            Layout.topMargin: 2
        }

        MealCB {
            id: checkR
            text: "R"
            onCheckedChanged: parent.dataChanged()
            Layout.row: 1
            Layout.column: 2
            Layout.alignment: Qt.AlignRight + Qt.AlignTop
            Layout.rightMargin: 10
            Layout.topMargin: 2
        }

        TextField {
            id: theText
            anchors.fill: parent
            anchors.topMargin: 40
//            anchors.centerIn: parent
            onEditingFinished: parent.dataChanged()
            Layout.row: 2
            Layout.column: 1
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignBottom
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.topMargin: 20

            //For debugging Layout problems
            //Component.onCompleted: print("theText:", x, y, width, height)
        }
        onDataChanged: parent.dataChanged()
    }

    function to_object() {
        var data = {};

        data.checkedS = checkedS;
        data.checkedR = checkedR;
        data.text = text;

        return data;
    }
    function from_object(data) {
        if ("checkedS" in data) checkedS = data.checkedS;
        if ("checkedR" in data) checkedR = data.checkedR;
        if ("text" in data) text = data.text;
    }

    //For debugging Layout problems
    //Component.onCompleted: print("Meal:", x, y, width, height, implicitWidth, implicitHeight)
}
