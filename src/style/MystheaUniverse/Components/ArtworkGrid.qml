import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtGraphicalEffects 1.14
import QtQml.Models 2.14

Pane {
    id: root
    spacing: 0
    padding: 7

    signal cardClicked(var sourceIndex)

    property alias artworkModel: _grid.model
    property alias title: _header.text

    DelegateModel {
        id: _delegate
        model: root.artworkModel
        delegate: Item {}
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 7
        spacing: 0

        Label {
            id: _header
            font.pixelSize: 32
            color: "white"
            leftPadding: 13
            topPadding: 10
            bottomPadding: 10

            Layout.fillWidth: true
        }

        GridView {
            id: _grid
            interactive: false
            cellWidth: root.width / 2 - root.padding
            cellHeight: 268

            Layout.fillWidth: true
            Layout.preferredHeight: Math.ceil(
                                        _delegate.count / 2) * cellHeight + root.padding

            delegate: Pane {
                id: _pane
                width: _grid.cellWidth
                height: _grid.cellHeight
                padding: 7

                MouseArea {
                    id: _paneArea
                    anchors.fill: parent
                    onClicked: {
                        var sourceIndex = root.artworkModel.mapToSource(
                                    root.artworkModel.index(index, 0))
                        root.cardClicked(sourceIndex)
                    }
                }

                Image {
                    id: _image
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    source: model.image
                    visible: false
                    asynchronous: true
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
                    id: _border
                    anchors.fill: parent
                    color: _image.status === Image.Ready ? "transparent" : "dimgray"
                    opacity: _image.status === Image.Ready ? 1 : 0.5
                    radius: 10
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 18
                    height: _column.implicitHeight + 14
                    width: parent.width
                    color: "#99000000"

                    ColumnLayout {
                        id: _column
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 7
                        anchors.rightMargin: 7
                        width: parent.width - anchors.leftMargin - anchors.rightMargin
                        spacing: 0

                        Label {
                            text: model.name
                            color: "white"
                            wrapMode: Text.Wrap

                            font.pixelSize: 18
                            font.family: "FuturaPTBold"

                            Layout.fillWidth: true
                        }

                        Label {
                            text: model.author
                            color: "white"
                            wrapMode: Text.Wrap

                            font.pixelSize: 12

                            Layout.fillWidth: true
                        }
                    }
                }
            }
        }
    }
}
