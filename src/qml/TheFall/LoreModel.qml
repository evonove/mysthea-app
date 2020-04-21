import QtQuick 2.14
import QtQml.Models 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0
import MystheaUniverse.Components 1.0

ObjectModel {
    id: root

    property int width: 100
    property bool asynchronous: true

    LoreHeading {
        text: qsTr("Mysthea: the Fall")
        color: Palette.white
    }
    ColumnLayout {
        width: root.width
        spacing: 0

        LoreParagraph {
            text: qsTr("<strong>Henakor</strong>, the core crystal from beyond the stars, after piercing the planet Icaion became the <strong>new axis of a frantic magnetic field.</strong> The world was reshaped by the impact, nature itself morphed to adapt to these wild energies.")
            color: Palette.theFallLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("Once part of the surface, islands of floating earth and rock, vast as entire nations, strove to develop a new habitat while fully immersed in a sea of magnetic winds. The <strong>inhabitants</strong> of this sky world developed a <strong>deep connection with these storming energies,</strong> learning across centuries to manipulate them at will. This civilization call their home Mysthea.")
            color: Palette.theFallLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("Those who survived extinction on the planet surface did not develop any specific power, though. They had to learn anew, to rebuild from scratch, to discover and experiment. The Henakor is able to <strong>penetrate the thick layer of clouds</strong> enveloping the planet, collecting the energy of the sun and this energy can be harnessed and put to good use with the right tools.")
            color: Palette.theFallLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("Soon after, <strong>a society arose</strong>, whose whole reality revolves around the crystal arose while wealth revolves around the <strong>ability to harvest crystal pieces</strong>, called <strong>Qoam</strong>. For what we know, only one city, the City, exists on the world surface... built across millennia around, embracing the Henakor.")
            color: Palette.theFallLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/thefall/img_lore1.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("This <strong>excessive exploitation</strong> of the crystal caused its energy to be weakened to the point of <strong>destabilizing half planet</strong> and this fluctuation in the magnetic field made the <strong>five floating sacred islands of Mysthea to fall from the sky</strong>, crushing the lands surrounding the City.")
            color: Palette.theFallLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("The <strong>creatures</strong> that survived the impact changed their behavior as they were exposed to the Henakor proximity: they developed an <strong>aggressive nature</strong> that led them to attack everything that came between them and crystal, perhaps trying to restore that deep bond with the raw material that shaped them into what they are.")
            color: Palette.theFallLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("The devastation shocked the <strong>Mysthea Champions</strong> to the point that now they are willing to <strong>put aside their rivalry</strong> and the interests of the Guilds to stop their former minions from bringing destruction to this newly discovered civilization. On the other hand, <strong>Icaion Seekers are not going to refuse help</strong> when the only world they ever knew, the City, is at risk.")
            color: Palette.theFallLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("The key to end this madness seems to be the most imposing creature on the planet: <strong>the Colossus</strong> that roams the lands surrounding the City. Partly composed of the same substance as Henakor, the creature <strong>holds some Primal Shards:</strong> Henakor flakes detached during the first impact, still retaining <strong>the purest energy of Qoam.</strong>")
            color: Palette.theFallLight
            Layout.fillWidth: true
        }

        Image {
            source: "qrc:/assets/images/extras/lore/thefall/img_lore2.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }

        LoreParagraph {
            text: qsTr("The Colossus, who used to roam peacefully the surface, is now howling like a thunder, <strong>inciting the creatures</strong> that came from above to reach the crystal within the City walls. Is the Colossus trying to <strong>save the Henakor?</strong> Or is it just <strong>revenge</strong> for the exploited planet?")
            color: Palette.theFallLight
            Layout.fillWidth: true
        }
    }
}
