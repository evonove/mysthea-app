import QtQuick 2.14
import QtQuick.Controls 2.14

Label {
    property string dropLetter;
    property string otherText

    text: qsTr("<table style=\"float: left\"><tr><td><span style=\"font-family: 'Futura PT Bold'; font-size: 57px\">" + dropLetter + "</span></td></tr></table><p>" + otherText + "</p>")
}
