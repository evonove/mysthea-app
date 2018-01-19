import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2


/*! \qmltype ColorComboBox
 *
 *  Custom ComboBox used to pick cards colors, shows a small dot colored and its
 *  related color
 */
ComboBox {
    id: control

    font.pixelSize: 16

    model: ListModel {
        ListElement { colorName: "All Colors";  colorHex: "#FFFFFF" }
        ListElement { colorName: "Red";         colorHex: "#F44336" }
        ListElement { colorName: "Green";       colorHex: "#4CAF50" }
        ListElement { colorName: "Blue";        colorHex: "#2196F3" }
        ListElement { colorName: "Yellow";      colorHex: "#FFEB3B" }
        ListElement { colorName: "Gray";        colorHex: "#9E9E9E" }
    }

    delegate: ItemDelegate {
        width: control.width
        contentItem: RowLayout {
            spacing: 8

            // Color dot
            Rectangle {
                width: 10
                height: width
                radius: width
                color: colorHex
            }

            // Color name
            Label {
                text: colorName
                color: control.currentIndex === index ? parent.Material.accent : parent.Material.foreground
                font: control.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter

                Layout.fillWidth: true
            }
        }
        highlighted: control.highlightedIndex === index
    }

    contentItem: RowLayout {
        // Color dot
        Rectangle {
            width: 10
            height: width
            radius: width
            color: model.get(control.currentIndex).colorHex

            Layout.leftMargin: 8
            Layout.rightMargin: 8
        }

        // Color name
        Label {
            text: model.get(control.currentIndex).colorName
            font: control.font
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight

            Layout.fillWidth: true
        }
    }
}
