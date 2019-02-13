import QtQuick 2.0
import QtQml.Models 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

import Mysthea.Theme 1.0

ObjectModel {
    id: root

    property int width: 100

    ColumnLayout {
        width: root.width
        spacing: 0

        Label {
            text: qsTr("General Setting")
            color: Palette.grayNurse
            font.pixelSize: 35
            font.letterSpacing: 0.5
            topPadding: 20

            Layout.fillWidth: true
        }
        Label {
            text: qsTr("The Planet Icaion")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18

            Layout.fillWidth: true
        }
        Label {
            text: qsTr("Millenia ago, a planet called " + "Icaion was hit by a giant crystal "
                       + "of unknown origins which came at "
                       + "high speed from the depths of space. "
                       + "With staggering force, the crystal pierced "
                       + "through the planet, ending a long journey "
                       + "from a mysterious place. The impact was so "
                       + "strong that the planet, and the forces "
                       + "governing it, were changed forever.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            topPadding: 20
            bottomPadding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Image {
            source: "qrc:/assets/icons/tabula-logo.svg"
            fillMode: Image.PreserveAspectFit
        }

        Label {
            text: qsTr(
                      "On impact, the crystal scattered " + "into shards all over the planet, "
                      + "from the surface to its greatest "
                      + "depths. These crystal shards, called "
                      + "Qoam, have their own magnetic field "
                      + "that reacts oddly with the planet’s "
                      + "gravitational forces. Some Qoam shards "
                      + "float, while others remain firmly "
                      + "solidified on the ground. Some shards "
                      + "are embedded so deeply in stone and other "
                      + "materials that the material itself shares " + "their same properties.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            topPadding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Label {
            text: qsTr("Mysthea")
            color: Palette.grayNurse
            font.pixelSize: 27
            topPadding: 35
            font.letterSpacing: 1

            Layout.fillWidth: true
        }

        Label {
            text: qsTr(
                      "Mysthea is the region of lands " + "floating above the clouds. "
                      + "It consists of a great landmass " + "and plenty of smaller islands, "
                      + "including the five main ones that " + "rotate around the Henakor.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            topPadding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Label {
            text: qsTr(
                      "During these long years new life " + "spawned in Mysthea, influenced and"
                      + "corrupted by the power of the " + "crystal and the presence of "
                      + "Qoam. Some of these beings are " + "peaceful creatures, while others "
                      + "react violently to the energy of " + "the crystal. It remains unclear "
                      + "if humans survived the cataclysm " + "or were generated by the anomalies "
                      + "on the planet after the impact, " + "but unquestionably their physical "
                      + "and societal development has been " + "largely influenced by the presence "
                      + "of the crystal. These people " + "developed the ability to attune "
                      + "themselves with Qoam shards and " + "interact with their powers in strange " + "ways. Their society is progressing " + "steadily using Qoam as its main resource.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            topPadding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }

    ColumnLayout {
        width: root.width
        spacing: 0

        Label {
            text: qsTr("The World of Mysthea")
            color: Palette.grayNurse
            font.pixelSize: 35
            font.letterSpacing: 1

            Layout.fillWidth: true
        }
        Label {
            text: qsTr("Society")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18

            Layout.fillWidth: true
        }

        Label {
            text: qsTr("Millenia ago, a planet called Icaion"
                       + " was hit by a giant crystal of unknown "
                       + "origins which came at high speed from "
                       + "the depths of space. With staggering force,"
                       + " the crystal pierced through the planet, "
                       + "ending a long journey from a mysterious place."
                       + " The impact was so strong that the planet,"
                       + " and the forces governing it, were changed forever.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            topPadding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
}
