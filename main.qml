import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Window {
    visible: true
    minimumWidth: mealTable.implicitWidth
    minimumHeight: mealTable.implicitHeight

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(JSON.stringify(mealTable.to_object()));
            Qt.quit();
        }
    }

    GridLayout {
        id: mealTable
        rows: 6
        columns: 8
        anchors.fill: parent
        signal dataChanged
        onDataChanged: console.log("onDataChanged: " + JSON.stringify(mealTable.to_object()))

        // Row and Column numbers (in case I add or remove something)
        property int rowTitle: 1
        property int rowDate: 2
        property int rowSarah: 3
        property int rowBreakfast: 4
        property int rowLunch: 5
        property int rowDinner: 6
        property int colLabels: 1
        property int colMon: 2
        property int colTue: 3
        property int colWed: 4
        property int colThu: 5
        property int colFri: 6
        property int colSat: 7
        property int colSun: 8

        // Column Titles
        Label {
            text: "Monday"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowTitle
            Layout.column: mealTable.colMon
        }
        Label {
            text: "Tuesday"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowTitle
            Layout.column: mealTable.colTue
        }
        Label {
            text: "Wednesday"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowTitle
            Layout.column: mealTable.colWed
        }
        Label {
            text: "Thursday"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowTitle
            Layout.column: mealTable.colThu
        }
        Label {
            text: "Friday"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowTitle
            Layout.column: mealTable.colFri
        }
        Label {
            text: "Saturday"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowTitle
            Layout.column: mealTable.colSat
        }
        Label {
            text: "Sunday"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowTitle
            Layout.column: mealTable.colSun
        }

        // Row Labels
        Label {
            text: "Sarah"
            Layout.row: mealTable.rowSarah
            Layout.column: mealTable.colLabels
        }
        Label {
            text: "Breakfast"
            Layout.row: mealTable.rowBreakfast
            Layout.column: mealTable.colLabels
        }
        Label {
            text: "Lunch"
            Layout.row: mealTable.rowLunch
            Layout.column: mealTable.colLabels
        }
        Label {
            text: "Dinner"
            Layout.row: mealTable.rowDinner
            Layout.column: mealTable.colLabels
        }

        // Dates
        Text {
            id: "dateMon"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowDate
            Layout.column: mealTable.colMon
            onTextChanged: parent.dataChanged()
        }
        Text {
            id: "dateTue"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowDate
            Layout.column: mealTable.colTue
        }
        Text {
            id: "dateWed"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowDate
            Layout.column: mealTable.colWed
        }
        Text {
            id: "dateThu"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowDate
            Layout.column: mealTable.colThu
        }
        Text {
            id: "dateFri"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowDate
            Layout.column: mealTable.colFri
        }
        Text {
            id: "dateSat"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowDate
            Layout.column: mealTable.colSat
        }
        Text {
            id: "dateSun"
            Layout.alignment: Qt.AlignHCenter
            Layout.row: mealTable.rowDate
            Layout.column: mealTable.colSun
        }
        function setDates() {
            // Note: this function relies on the fact that Date.setDate accepts out of range date-of-month
            var d = new Date();
            var dow;

            // Find last Monday
            dow = d.getDay();
            if (dow == 0) dow = 7;
            d.setDate(d.getDate() - (dow-1));

            dateMon.text = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            d.setDate(d.getDate()+1);
            dateTue.text = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            d.setDate(d.getDate()+1);
            dateWed.text = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            d.setDate(d.getDate()+1);
            dateThu.text = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            d.setDate(d.getDate()+1);
            dateFri.text = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            d.setDate(d.getDate()+1);
            dateSat.text = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
            d.setDate(d.getDate()+1);
            dateSun.text = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
        }

        // Sarah
        TextField {
            id: "sarahMon"
            Layout.row: mealTable.rowSarah
            Layout.column: mealTable.colMon
            onEditingFinished: parent.dataChanged()
        }
        TextField {
            id: "sarahTue"
            Layout.row: mealTable.rowSarah
            Layout.column: mealTable.colTue
            onEditingFinished: parent.dataChanged()
        }
        TextField {
            id: "sarahWed"
            Layout.row: mealTable.rowSarah
            Layout.column: mealTable.colWed
            onEditingFinished: parent.dataChanged()
        }
        TextField {
            id: "sarahThu"
            Layout.row: mealTable.rowSarah
            Layout.column: mealTable.colThu
            onEditingFinished: parent.dataChanged()
        }
        TextField {
            id: "sarahFri"
            Layout.row: mealTable.rowSarah
            Layout.column: mealTable.colFri
            onEditingFinished: parent.dataChanged()
        }
        TextField {
            id: "sarahSat"
            Layout.row: mealTable.rowSarah
            Layout.column: mealTable.colSat
            onEditingFinished: parent.dataChanged()
        }
        TextField {
            id: "sarahSun"
            Layout.row: mealTable.rowSarah
            Layout.column: mealTable.colSun
            onEditingFinished: parent.dataChanged()
        }

        // Meals
        Meal {
            id: "breakfastMon"
            Layout.row: mealTable.rowBreakfast
            Layout.column: mealTable.colMon
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "breakfastTue"
            Layout.row: mealTable.rowBreakfast
            Layout.column: mealTable.colTue
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "breakfastWed"
            Layout.row: mealTable.rowBreakfast
            Layout.column: mealTable.colWed
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "breakfastThu"
            Layout.row: mealTable.rowBreakfast
            Layout.column: mealTable.colThu
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "breakfastFri"
            Layout.row: mealTable.rowBreakfast
            Layout.column: mealTable.colFri
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "breakfastSat"
            Layout.row: mealTable.rowBreakfast
            Layout.column: mealTable.colSat
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "breakfastSun"
            Layout.row: mealTable.rowBreakfast
            Layout.column: mealTable.colSun
            onDataChanged: parent.dataChanged()
        }

        Meal {
            id: "lunchMon"
            Layout.row: mealTable.rowLunch
            Layout.column: mealTable.colMon
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "lunchTue"
            Layout.row: mealTable.rowLunch
            Layout.column: mealTable.colTue
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "lunchWed"
            Layout.row: mealTable.rowLunch
            Layout.column: mealTable.colWed
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "lunchThu"
            Layout.row: mealTable.rowLunch
            Layout.column: mealTable.colThu
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "lunchFri"
            Layout.row: mealTable.rowLunch
            Layout.column: mealTable.colFri
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "lunchSat"
            Layout.row: mealTable.rowLunch
            Layout.column: mealTable.colSat
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "lunchSun"
            Layout.row: mealTable.rowLunch
            Layout.column: mealTable.colSun
            onDataChanged: parent.dataChanged()
        }

        Meal {
            id: "dinnerMon"
            Layout.row: mealTable.rowDinner
            Layout.column: mealTable.colMon
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "dinnerTue"
            Layout.row: mealTable.rowDinner
            Layout.column: mealTable.colTue
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "dinnerWed"
            Layout.row: mealTable.rowDinner
            Layout.column: mealTable.colWed
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "dinnerThu"
            Layout.row: mealTable.rowDinner
            Layout.column: mealTable.colThu
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "dinnerFri"
            Layout.row: mealTable.rowDinner
            Layout.column: mealTable.colFri
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "dinnerSat"
            Layout.row: mealTable.rowDinner
            Layout.column: mealTable.colSat
            onDataChanged: parent.dataChanged()
        }
        Meal {
            id: "dinnerSun"
            Layout.row: mealTable.rowDinner
            Layout.column: mealTable.colSun
            onDataChanged: parent.dataChanged()
        }

        function to_object() {
            var data = {};

            // Start Date
            data.startDate = dateMon.text;

            // Sarah
            data.sarahMon = sarahMon.text;
            data.sarahTue = sarahTue.text;
            data.sarahWed = sarahWed.text;
            data.sarahThu = sarahThu.text;
            data.sarahFri = sarahFri.text;
            data.sarahSat = sarahSat.text;
            data.sarahSun = sarahSun.text;

            //Meals
            data.breakfastMon = breakfastMon.to_object();
            data.breakfastTue = breakfastTue.to_object();
            data.breakfastWed = breakfastWed.to_object();
            data.breakfastThu = breakfastThu.to_object();
            data.breakfastFri = breakfastFri.to_object();
            data.breakfastSat = breakfastSat.to_object();
            data.breakfastSun = breakfastSun.to_object();

            data.lunchMon = lunchMon.to_object();
            data.lunchTue = lunchTue.to_object();
            data.lunchWed = lunchWed.to_object();
            data.lunchThu = lunchThu.to_object();
            data.lunchFri = lunchFri.to_object();
            data.lunchSat = lunchSat.to_object();
            data.lunchSun = lunchSun.to_object();

            data.dinnerMon = dinnerMon.to_object();
            data.dinnerTue = dinnerTue.to_object();
            data.dinnerWed = dinnerWed.to_object();
            data.dinnerThu = dinnerThu.to_object();
            data.dinnerFri = dinnerFri.to_object();
            data.dinnerSat = dinnerSat.to_object();
            data.dinnerSun = dinnerSun.to_object();

            return data;
        }

        Component.onCompleted: {
            setDates();
        }
    }
}
