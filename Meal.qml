import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    // Needed for Layout to function
    // Note: this means the TextField must have a size, not anchors.fill: parent
    implicitHeight: theText.height
    implicitWidth: theText.width

    property alias text: theText.text

    TextField {
        id: "theText"
        anchors.centerIn: parent
        text: "a"
    }

    //For debugging Layout problems
    //Component.onCompleted: print(x, y, width, height, implicitWidth, implicitHeight)
}
