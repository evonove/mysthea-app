pragma Singleton
import QtQuick 2.3

QtObject {
    // Alpha must be between 0 and 1
    function transparentize(color, alpha) {
        return Qt.rgba(color.r, color.g, color.b, alpha)
    }
    //Color
    readonly property color black: "#000000"
    readonly property color white: "#FFFFFF"
    readonly property color background: "#170E12"
    readonly property color snuff: "#F3E5F5"
    readonly property color mineShaft: "#212121"
    readonly property color flamingo: "#F04937"
    readonly property color goldenFizz: "#FDEF30"
    readonly property color apple: "#62BB46"
    readonly property color cerulean: "#0099D8"
    readonly property color maroonFlush: "#B01B55"
    readonly property color grayNurse: "#DFE1DF"
    readonly property color dustyGray: "#999999"
    readonly property color gallery: "#EEEEEE"
    readonly property color silverChalice: "#AFAFAF"
    readonly property color cadillac: "#B7537A"
    readonly property color voodoo: "#4E3A53"
    readonly property color tequila: "#FEE4CD"
    readonly property color placeholderText: "#7F7F7F"

    // Mysthea default colors
    readonly property color mystheaMain: "#FF1371"
    readonly property color pink: "#FFC1DC"
    readonly property color darkPink: "#CF2568"
    readonly property color lightPink: "#FFDEEC"
    readonly property color pinkLavenderBlush: "#FFEDF5"

    // Icaion default colors
    readonly property color icaionMain: "#6DE4E9"
    readonly property color icaionDark: "#819FA5"
    readonly property color icaionLight: "#C3DDE2"
    readonly property color icaionBlack: "#0E1617"

    // TheFall default colors
    readonly property color theFallMain: "#2FFF20"
    readonly property color theFallDark: "#83A581"
    readonly property color theFallLight: "#C5E2C3"
    readonly property color theFallBlack: "#0E170F"
}
