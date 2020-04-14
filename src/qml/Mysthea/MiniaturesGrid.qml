import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtGraphicalEffects 1.14
import QtQml.Models 2.14

Pane {
    id: root

    signal cardClicked(var sourceIndex)

    property alias miniaturesModel: _grid.model
    property alias title: _header.text

    spacing: 0
    padding: 0

    DelegateModel {
        id: _delegate
        model: root.miniaturesModel
        delegate: Item {}
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Label {
            id: _header
            font.pixelSize: 32
            color: "white"
            padding: 7

            Layout.fillWidth: true
        }

        GridView {
            id: _grid
            interactive: false
            cellWidth: width / 2
            cellHeight: 250 + parent.spacing * 2

            Layout.fillWidth: true
            Layout.preferredHeight: Math.ceil(_delegate.count / 2) * cellHeight

            delegate: Pane {
                id: _pane
                width: _grid.cellWidth
                height: _grid.cellHeight
                padding: 7

                MouseArea {
                    id: _paneArea
                    anchors.fill: parent
                    onClicked: {
                        var sourceIndex = root.miniaturesModel.mapToSource(root.miniaturesModel.index(index, 0))
                        root.cardClicked(sourceIndex)
                    }
                }

                Image {
                    id: _image
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    source: model.image
                    visible: false
                }

                OpacityMask {
                    anchors.fill: parent
                    source: _image
                    maskSource: Rectangle {
                        width: _pane.width
                        height: _pane.height
                        radius: 10
                    }
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 18
                    height: 38
                    width: parent.width
                    color: "#99000000"

                    Label {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 7
                        text: model.name
                        color: "white"
                        font.pixelSize: 18
                        font.weight: Font.Bold
                    }
                }
            }
        }
    }
}

