import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    // Needed for Layout to function
    // Note: this means the TextField must have a size, not anchors.fill: parent
    implicitHeight: mealCB.height
    implicitWidth: mealCB.width

    property alias text: mealCB.text

    CheckBox {
        id: mealCB
        style: CheckBoxStyle {
            id: cbStyle
            //property alias text: indicatorText.text
            indicator: Text {
                id: indicatorText
                text: control.text
                color: control.checked ? "red" : "gray"
                font.bold: true
                font.pointSize: 18
            }
            label: Item { }
        }
    }
    //For debugging Layout problems
    //Component.onCompleted: print(x, y, width, height, implicitWidth, implicitHeight)
}


