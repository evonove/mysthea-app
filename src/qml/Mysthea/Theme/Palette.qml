pragma Singleton
import QtQuick 2.3

QtObject {
    // Alpha must be between 0 and 1
    function transparentize(color, alpha) {
        return Qt.rgba(color.r, color.g, color.b, alpha);
    }
    //Color
    readonly property color black: "#000000"
    readonly property color white: "#FFFFFF"
    readonly property color snuff: "#F3E5F5"
    readonly property color mineShaft: "#212121"

    //Icon
    readonly property string menu: "\ue5d2"
}

