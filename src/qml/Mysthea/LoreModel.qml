import QtQuick 2.0
import QtQml.Models 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import MystheaUniverse.Theme 1.0

ObjectModel {
    id: root

    property int width: 100
    property bool asynchronous: true

    // General Setting
    Label {
        width: root.width
        text: qsTr("General Setting")
        color: Palette.grayNurse
        font.pixelSize: 35
        font.letterSpacing: 1
        topPadding: 20
        rightPadding: 20
        leftPadding: 20
        bottomPadding: 0
    }
    // The Planet Icaion
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("The Planet Icaion")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 0

            Layout.fillWidth: true
        }
        Label {
            text: qsTr("Millenia ago, a planet called Icaion"
                       + " was hit by a giant crystal of unknown "
                       + "origins which came at high speed from the "
                       + "depths of space. With staggering force, "
                       + "the crystal pierced through the planet, ending a "
                       + "long journey from a mysterious place. The impact"
                       + " was so strong that the planet, and the forces "
                       + "governing it, were changed forever.")

            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            padding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Image {
            source: "qrc:/images/lore/image21.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }

        Label {
            text: qsTr("On impact, the crystal scattered into shards" + " all over the planet, from the surface to its " + "greatest depths. These crystal shards, called " + "Qoam, have their own magnetic field that reacts " + "oddly with the planet’s gravitational forces." + " Some Qoam shards float, while others remain " + "firmly solidified on the ground. Some shards are " + "embedded so deeply in stone and other materials " + "that the material itself shares their same properties. \n\n" + "This cataclysm and displacement had huge consequences " + "on the balance of the forces of the planet, creating " + "anomalies everywhere, bending the laws of physics and " + "spawning unimaginable anomalies. \n\n" + "One of the two most notable effects of this cataclysm was" + " the blanket of mist and clouds covering the whole surface " + "of the planet, a seemingly endless storm that appeared " + "after the impact and continued for millenia. The second " + "most notable effect was the detachment of large and small " + "chunks of crust from the planet’s surface. Areas as large as " + "continents detached from the planet and began floating around " + "it, pulled by a mysterious gravitational force generated " + "by the Henakor, the largest chunk of crystal still embedded " + "within the center of the planet. The floating islands orbit " + "around Icaion above the cloud layer. \n\n" + "It took thousands of years for the planet to rebalance itself," + " if we can truly call it balance even now. In reality, " + "while it’s stable at the moment, this stability is just a " + "temporary truce in an endless fight between the planet’s " + "attempts to restore itself and the constant instability brought " + "on by the unnatural forces of the Henakor.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            padding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Image {
            source: "qrc:/images/lore/image5.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin

            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
    }
    // Mysthea
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Mysthea")
            color: Palette.grayNurse
            font.pixelSize: 27
            rightPadding: 20
            leftPadding: 20
            topPadding: 35
            bottomPadding: 0
            font.letterSpacing: 1

            Layout.fillWidth: true
        }

        Label {
            text: qsTr(
                      "Mysthea is the region of lands floating above the clouds." + " It consists of a great landmass and plenty of smaller " + "islands, including the five main ones that rotate around " + "the Henakor. \n\n" + "During these long years new life spawned in Mysthea, " + "influenced and corrupted by the power of the crystal and " + "the presence of Qoam. Some of these beings are peaceful " + "creatures, while others react violently to the energy of the " + "crystal. It remains unclear if humans survived the cataclysm " + "or were generated by the anomalies on the planet after the" + " impact, but unquestionably their physical and societal " + "development has been largely influenced by the presence of the " + "crystal. These people developed the ability to attune themselves " + "with Qoam shards and interact with their powers in strange ways. " + "Their society is progressing steadily using Qoam as its main " + "resource. \n\n" + "In present day, the population above the clouds lives and prospers " + "completely unaware of what lies beneath them. The floating regions " + "of Mysthea, for all its inhabitants know, contain the only " + "human presence in the whole universe. They are just able to see the " + "Henakor sticking out from the perennial storm. From their perspective, " + "it is impossible to tell if it is floating there or if it stretches " + "all the way down to something else below. Scholars have their theories, " + "the faith have others and the common folksmen rely on legends and tales. "
                      + "What is certain is that nobody has ever ventured there.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            padding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Image {
            source: "qrc:/images/lore/image15.jpg"
            asynchronous: root.asynchronous
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
    }
    // The Five
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("The Five")
            color: Palette.grayNurse
            font.pixelSize: 27
            rightPadding: 20
            leftPadding: 20
            topPadding: 35
            bottomPadding: 0
            font.letterSpacing: 1

            Layout.fillWidth: true
        }

        Label {
            text: qsTr("The Henakor releases regularly pulsing waves of energy, " + " twisting everything they happen to hit. Luckily for the" + " inhabitants of Mysthea, they are far enough from the " + "crystal to be out of reach of this energy. From a distance " + "they observe the effects it has on everything within its reach. \n\n" + "Particularly, there are five floating islands that are stuck " + "in a gravitational force generated by the Henakor. " + "These islands are periodically hit by beams of energy from" + "the crystal and are heavily affected. As beholders of this " + "phenomenon they are hypnotized, waiting to be immersed in the next " + "pulse wave. These islands are hazardous places since the crystal causes " + "all kinds of effects on the environment and inhabitants. For the people " + "living on Mysthea the crystal and its odd satellites have always been " + "there, becoming the stuff of tales and legends, both admired and feared, " + "an astonishing and terrifying place that the faith venerates and that " + "scholars can only dream of comprehending.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            padding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image4.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
    }



    // The World of Mysthea
    Label {
        text: qsTr("The World of Mysthea")
        color: Palette.grayNurse
        font.pixelSize: 35
        font.letterSpacing: 1
        rightPadding: 20
        leftPadding: 20
        topPadding: 48
        bottomPadding: 0

        Layout.fillWidth: true
    }
    // Society
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Society")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 18
            bottomPadding: 0

            Layout.fillWidth: true
        }

        Label {
            text: qsTr("People living on Mysthea are naturally able to " + "interact telekinetically with Qoam shards. Some " + "have a more natural predisposition and are able to " + "perform amazing feats, but generally almost anyone " + "is able to sense the presence of Qoam and to move it " + "in small quantities. This telekinetic ability has " + "been used during the development of society in the most " + "creative ways and has shaped the evolution of the whole " + "species. Qoam itself, but more particularly rocks with " + "the crystal embedded in it, have been used for the most " + "diverse applications, from something as simple as a tool " + "to a base material used to build whole cities. The most " + "virtuous and talented Qoam manipulators are able to use " + "it as a weapon, weightless to them and deadly to others. " + "Some are able to walk around covered in otherworldly " + "crystal armor without compromising any mobility. Some " + "even manage to bring these materials to life: using Qoam " + "shards and stones with the crystal embedded in it to " + "generate golems with a will of their own. Everyone manages" + " to find some clever and unique way to use Qoam and this "
                       + "makes it an integral part of the fabric of society. ")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            padding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image22.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }

        Label {
            text: qsTr(
                      "Society prospered, living and building on the "
                      + "lands, admiring from afar the Henakor with its five "
                      + "floating islands. \n\n" + "For centuries the inhabitants battled "
                      + "among themselves for power and land, cities were built,"
                      + " and kingdoms went to war, while society relentlessly developed "
                      + "and evolved. Now the Kingdom of Ahatils has proven its "
                      + "supremacy and domain over Mysthea, undisputed for decades. "
                      + "This is a stability previously unknown in the land’s history. ")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Ilvash and the Kingdom of Ahatils
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Ilvash and the Kingdom of Ahatils")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 18
            bottomPadding: 0

            Layout.fillWidth: true
        }

        Label {
            text: qsTr("The city of Ilvash, capital of the Kingdom of " + "the ruling dynasty Ahatils, is a sprawling city built " + "upon the biggest floating chunk of land in Mysthea. It’s " + "the oldest citiy ever built, and the biggest one. It " + "rules over all other cities and towns, even ones that were " + "once rivaling kingdoms. \n\n" + "After decades of peace ascribable " + "to the King’s conquest of all opposing states, the ruler " + "decided to delegate the management of the state to the five " + "major Guilds of the city. For each citizen in the kingdom it " + "is mandatory to enroll in the guild that represents the " + "interests of his social class. This system was created to ensure " + "that every citizen’s interests are somehow represented. In reality, " + "it ended up with the guilds fighting between each other for " + "political and economical power in a constant struggle that rarely " + "considers the needs of the population.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // A Breakthrough
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("A Breakthrough")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 18
            bottomPadding: 0

            Layout.fillWidth: true
        }

        Label {
            text: qsTr(
                      "Recently, for the first time ever, Magista, "
                      + "the Guild of Scholars, decided to collaborate with the Faith,"
                      + " represented by the Lusma Guild, to research a new artefact. "
                      + "They hoped this artefact would be able to amplify the people’s "
                      + "power, allowing them to move quantities of Qoam previously "
                      + "unimaginable. The manufacturing of this artefact was extremely "
                      + "difficult and expensive, but they succeeded. This was a huge "
                      + "breakthrough. They created an object that in the right hands would "
                      + "allow people to complete incredible feats. With enough concentration "
                      + "the right mind could now move immense quantities of Qoam, maybe even "
                      + "cities if they chose to. \n\n" +
                      "Only five artefacts were created, and they were gifted to the five "
                      + "guilds of the capital. They were considered tools of immense power, " + "necessary for the development of the society, to be used with extreme " + "care and responsibility and only for further progress of the species. " + "For a while they were rarely utilized, mostly in ceremonious instances: " + "the power they could bring was so strong that even the elders of the " + "guilds were afraid of possible outcomes. That was, until the moment in " + "which the Merchant Guild realized that with the aid of the artefact they " + "could send an explorer to the islands around the Henakor. For the first time " + "in history, they would be able to explore those new, terrifying and sacred " + "places. The idea started to spread quickly among the whole population: they " + "would finally be able to reach that place of tales and legend. They could touch " + "the lands considered holy by some but damned by others. What would be waiting " + "there? What would happen when they were so close to the Henakor? What answers" + " would they find? What treasure would they be able to bring back?")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }



    //The Ancient Guilds of Ilvash
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("The Ancient Guilds of Ilvash")
            color: Palette.grayNurse
            font.pixelSize: 35
            font.letterSpacing: 1
            topPadding: 48
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 0

            Layout.fillWidth: true
        }
        Label {
            text: qsTr("Each guild, with its own unique history and interests, "+
                       "has its reasons to be the first to explore these islands.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Varorin – Guild of Merchants
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Varorin – Guild of Merchants")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image25.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "The Merchant Guild represents the interests of merchants, "+
                      "bankers, and those involved in commerce. They ensure that taxation "+
                      "remains bearable and goods can travel freely within the Kingdom. "+
                      "Some have speculated those of this guild are richer than the crown "+
                      "and it’s not implausible since wealthy people gladly make voluntary "+
                      "donations in exchange for special considerations.\n\n"+

                      "They were the first guild to understand that with the aid of the "+
                      "artefact and enough concentration, a talented Qoam manipulator could "+
                      "move a Qoam-powered airship from their homeland to the nearest of the "+
                      "five islands, successfully taking an explorer  there, and from this "+
                      "everything started.\n\n"+

                      "Their sole goal is to create wealth. They see the new islands as possible "+
                      "sources of abundant resources and riches. They fund the expedition in hopes"+
                      " of great returns.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Volarees – Guild of Nobility
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Volarees – Guild of Nobility")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image24.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "This guild represents the interests of the pure blooded noblemen "+
                      "close to the crown who live off their family inheritances. They "+
                      "formed this guild when they noticed the King began to delegate power. "+
                      "They understood that if they did not begin to protect their interests, "+
                      "they would lose much in the long term. \n\n"+

                      "Their power is entirely tied to land ownership but if the people were "+
                      "to stop believing the guild was powerful, they would probably stop being"+
                      " so. They understand the value of land and even more so the value of "+
                      "being the first to obtain it. They finance the exploration of the Henakor "+
                      "because they believe conquest is essential to maintaining their social"+
                      " status and thus their power.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Lusma – Guild of Faith
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Lusma – Guild of Faith")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image26.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "This guild claims to represent the interests of those left behind by "+
                      "the other, wealthier guilds. Despite what they say, they hold immense "+
                      "power inside the city walls since the majority of the population is "+
                      "always ready to answer their call. They are the spiritual and religious "+
                      "leaders of this world. They are in the rare position of deciding what is "+
                      "right and what is wrong. More than once they used this power to their own "+
                      "advantage, to the point that a simple threat was enough to get what they "+
                      "wanted. \n\n"+

                      "They venerate the Henakor, sure that it holds together not only their "+
                      "world, but the entire universe. They are the elected species, since they "+
                      "are the ones living so close to the crystal. They also believe that the "+
                      "Qoam, being parts of a god, are sacred objects that should only be used "+
                      "under certain circumstances and with great care. They chant prayers "+
                      "before using them. In reality, nobody follows their instructions regarding "+
                      "this matter, but this doesn't stop them from using it as an excuse to "+
                      "persecute troublesome individuals. \n\n"+

                      " They are sure that once they reach the Henakor and conquer those lands, "+
                      "their god will finally reward their faith.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Kaetur – Guild of Soldiers
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Kaetur – Guild of Soldiers")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image29.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "The most feared guild on the entire island is composed of soldiers, "+
                      "military officials, and security militias. Although they swear loyalty "+
                      "to the crown, but the guild has been known to utilize power to promote "+
                      "their own interests in the past. From intimidation and violence to other "+
                      "more subtle approaches, they obtain what they want in one way or another. "+
                      "They tend to keep a low profile and do not usually involve themselves in"+
                      " politics, until they very much need something. When they do get involved "+
                      "everybody knows they are going to get what they want.\n\n"+

                      "They fund the expeditions because they need to maintain control over all "+
                      "the territories known to man, to avoid even the slightest chance of losing "+
                      "their grip among the other guilds.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Magista – Guild of Scholars
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Magista – Guild of Scholars")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image12.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "This small guild represents the city’s scholars, scientists, engineers, "+
                      "and tinkerers. They have an obsession with increasing knowledge. They "+
                      "are those in the city that truly understand how manipulation of Qoam "+
                      "actually works. Even if they are just a small group made up of oftentimes "+
                      "peculiar individuals, they are respected. They are the ones that more than "+
                      "once have made discoveries that helped society progress and use crystals "+
                      "more effectively.\n\n"+

                      "The Faith considers them borderline blasphemous, but have always tolerated "+
                      "their presence because they’ve gained much thanks to their discoveries.\n\n"+

                      "When Magista understood that they may be able to create what would later "+
                      "become the artefact, they pitched the idea to the other guilds to gain "+
                      "funding for the research. Only the Faith understood its importance and "+
                      "contributed. In exchange for their funding, they wanted the Scholars to "+
                      "declare publicly that the Faith’s knowledge helped immensely in the creation "+
                      "of the artefact.\n\n" +

                      "They fund expeditions because they believe that proximity to the Henakor " +
                      "could bring breakthroughs in their experiments and because, truly, they are " +
                      "also just curious to discover the wonders of new lands.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Shinglori - Order of Champions
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Shinglori - Order of Champions")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image11.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "While not technically a guild, this Order represents the Champions the "+
                      "same way the guilds represents the rest of the population. Being a "+
                      "Champion means being on a different level from the rest of the citizens. "+
                      "It’s a title that comes with honors and duties, one of which is the commitment "+
                      "to total political and theological neutrality. It’s said that the Champions"+
                      " first serve the citizens, then serve the guilds, and only after do they serve"+
                      " the kingdom. The Champions are servants of everyone and for this reason it"+
                      " is required for them to be neutral and not join a Guild. For a Champion, being "+
                      "involved in politics could cost him the title. Shinglori is the Order that "+
                      "represents the Champions. With their vow of neutrality, champions must not "+
                      "enter into a guild because this organization is what ensures that the rights "+
                      "and duties of the Kingdom and of the Guilds toward the Champions are always "+
                      "honored. The leader of this guild is decided by election and cannot remain in "+
                      "power for more than a year.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }



    // Champions of Ilvash
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Champions of Ilvash")
            color: Palette.grayNurse
            font.pixelSize: 35
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 48
            bottomPadding: 0

            Layout.fillWidth: true
        }
        Label {
            text: qsTr("The whole kingdom buzzed with excitement when the guilds announced "+
                       "that they were going to fund expeditions. Each one would choose a "+
                       "Champion to entrust the artefact to, hiring them to guide an expedition "+
                       "on these new harsh lands. The Champion would represent the interests of"+
                       " the guild in hopes of bringing back great rewards.\n\n"+

                       "“Champion of Ilvash” is a title bestowed to heroes from different "+
                       "backgrounds, with different traits and abilities. Nevertheless, every one "+
                       "of them has shown an extremely high capability in interacting with Qoam "+
                       "and is able to do things that common people would never be able to do. "+
                       "Usually Champions are such masters in manipulating Qoam that over time "+
                       "they build a unique style, specializing in using it in ways that nobody "+
                       "else is capable of replicating.\n\n"+

                       "Champions are revered around the city and live off their talent, selling "+
                       "their services to guilds and private citizens. Even if some of them would "+
                       "join the exploration just for the great monetary compensation, this isn’t "+
                       "the main motivation driving most of them.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Telron
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Telron")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image9.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Telron is a feared and respected personality of Ilvash, considered "+
                      "by many the most able Qoam manipulator who ever lived. He’s able to "+
                      "do things with the crystal that leave people speechless. Some swear "+
                      "he’s able to move Qoam so far that in the end, they reach beyond his "+
                      "line of sight. Others claim they have seen him moving an enormous quantity "+
                      "of crystals, enough to build huge structures, by himself. Before the "+
                      "invention of the artefact he was the one that was called upon when something "+
                      "big needed to be moved and no one could manage it.\n\n"+

                      "He’s so able because other than his natural talent, he’s spent years and "+
                      "years studying and researching the source of these powers trying to understand "+
                      "how to improve his abilities. Telron is iron-willed and believes his path "+
                      "must be one of constant improvement. Simply being the best in what he does "+
                      "is not enough; he also must  constantly better himself and his abilities.\n\n"+

                      "He decides to go for the expedition because he believes that in the islands he"+
                      " could find ways to become even stronger.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Anuth
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Anuth")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image28.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Anuth is an ex-soldier, a retired commander that led the Ilvash army to"+
                      " victory in the Great War of Dulkodel. Hardened by innumerable battles, "+
                      "he’s one of the strongest warriors who ever lived, but also a great "+
                      "strategist on the field. He decided to retire after the Great War and now "+
                      "operates his private militia that escorts merchants and precious goods. \n\n"+

                      "He owns a shield made of Qoam that was gifted to him by his mentor when he "+
                      " was recruited into the army. He’s refused to use any other shield and since "+
                      " its Qoam frequency resonates perfectly with him, he’s developed a peculiar "+
                      " fighting style utilizing it to bash and charge his foes. To him, the weapon "+
                      " feels almost weightless, granting a completely unexpected agility.\n\n"+

                      "He strongly believes in Ilvash as a Nation, and he wants to take part in "+
                      "the exploration to help the City progress towards development once again.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Celethe
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Celethe")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image1.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Celethe of the family Ahatils was the heiress to the throne of Ilvash. She is the "+
                      "daughter of the King and would have been the rightful owner of the crown when the "+
                      "time came. This was her fate until she renounced her name and refused her rights. "+
                      "Celethe was uninterested in the sort of lifestyle nobles indulge in. She always had "+
                      "a great fascination for Qoam manipulation and great talent for it. But as the life "+
                      "she was born into was predestined for other things, she renounced her birthright to "+
                      "become the apprentice of Telron, the most respected Qoam manipulator. Telron had never "+
                      "had an apprentice, but for Celethe made one exception. When Celethe’s training ended "+
                      "and they parted ways, she managed to use her family name and master’s fame to become "+
                      "a respected manipulator. As revered as Celethe has become, she may one day be the great "+
                      "Telron’s successor. \n\n"+

                      "Celethe wants to take part in the exploration for her desire of making a name "+
                      "for herself, in order to become stronger that one day she might even surpass"+
                      " her mentor.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Leheir
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Leheir")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image19.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Leheir was once the leader of a rebel group that attempted to overthrow "+
                      "the Crown of a rival state. They wanted to establish a new absurd form "+
                      "of government that would have been rooted to the will of the population."+
                      " Her organization lingered in the shadows for a long time, plotting and "+
                      "attempting a revolt, but Leheir’s plans and dreams failed when almost all of "+
                      "her group was arrested during a sting and executed on the spot. Alone, "+
                      "she fled to Ilvash to ask for political asylum. The king would concede only "+
                      "if she agreed to use her knowledge of the rival state and its underworld "+
                      "to conquer it in his name. Her original plan for change became the strategy "+
                      "for a military conquest, that succeeded and strengthened another Kingdom. "+
                      "Leheir is cheered as a conqueror in Ilvash, but deep inside she remains "+
                      "full of sorrow and regret for what she not only allowed to happen, but also "+
                      "played a key role in.\n\n"+

                      "Now, she wants to take part in the exploration as an act of redemption, hoping "+
                      "that in this new land there will be something that can bring her happiness "+
                      "once again.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Sanya
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Sanya")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image18.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Sanya grew up near the city walls of Ilvash, an area populated by lower class"+
                      " farmers that traveled daily to farmlands outside the city. Her life was "+
                      "humble, but Sanya has fond memories of those times. Times that abruptly ended "+
                      "the day a Cannibarook attacked the city. On this day a lot of people remained "+
                      "trapped and died below the ruins of the city Walls, including Sanya’s entire"+
                      " family. During this accident, she lost both her legs becoming one of the "+
                      "tragedy’s many victims. Sanya recovered, but losing her family and her mobility "+
                      "took a toll on her that required years to overcome. \n\n"+

                      "After the accident, a physician from the Magista Guild crafted two prosthesis"+
                      " out of Qoam enable her to walk again. The physician made it out of Qoam so "+
                      "that Sanya would use her mental powers to help her movements. What no one "+
                      "anticipated is how quickly she would learn this skill and how much control"+
                      " she would have over the crystal. It soon became clear that she had an innate "+
                      "talent for Qoam manipulation, since Sanya used her mental powers to boost her "+
                      "movements at an incredibly high speed. After just a few years, Sanya’s control"+
                      " over her Qoam legs become complete and she was able to do things with an "+
                      "unnatural agility. It was just a matter of time before she became a Champion "+
                      "of Ilvash.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Kolbor & Malabor
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Kolbor & Malabor")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image20.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Kolbor and Malabor, known around Ilvash as “the Twins”, refuse to work unless"+
                      " hired together. Very little is known about the Twins, including where they "+
                      "came from. Some stories claim that they arrived from an ancient structure "+
                      "buried beneath the ground, while others say they are from the Five and others "+
                      "even dare to state that they come, somehow, from underneath the clouds. The "+
                      "only thing that is clear is that Kolbor and Malabor made a name for themselves "+
                      "in the shadiest corners of Ilvash.  \n\n"+

                      "Kolbor and Malabor do everything in their daily life in complete synchronicity,"+
                      " harmonizing every movement like two mirror images. They always know what the"+
                      " other does, as if each could read the other’s thought. In reality, this "+
                      "mysterious skill  most likely is due to  the Qoam they have embed in their"+
                      " hands, two symmetrical and identical crystals that resonate at opposite "+
                      "frequencies.\n\n"+

                      "Their behaviour, odd in everyday activities, becomes frightening when they "+
                      "face an enemy. The Twins fight in coordination to the point that they seem "+
                      "to be a single entity, an agile and terrifying being. Their effectiveness "+
                      "during combat, mixed with their unusual appearance and odd behaviour made them "+
                      "famous quickly. They are marked by a stigma of being associated with the Ilvash"+
                      " underworld. Therefore, guilds always make a point to distance themselves from"+
                      " these two brothers.\n\n"+

                      "One day, Kolbor & Malabor were caught breaking into the Varorin’s headquarters,"+
                      " trying to snatch something valuable, most likely for the collection of a "+
                      "wealthy criminal. Varorin officials, known for their savviness, understood that "+
                      "trying to capture these brothers would not end well and decided to let them go"+
                      " without charge for an exchange of work for the guild. The brothers accepted "+
                      "and the problem dissolved quickly and without further issues. What the Varorin "+
                      "official probably had not foreseen when they made this decision was that by law,"+
                      " any citizen that is tasked by a guild to perform extraordinary feats gains the"+
                      " right to bear the Champion name. And so, to the other guilds’ disdain, Kolbor "+
                      "and Malabor entered the same ranks as the other revered Champions of Ilvash.\n\n"+

                      "This did not change the brothers much, and they continued to be odd and "+
                      "secretive individuals closer to the underworld than the rest of the society."+
                      " But now Kolbor & Malabor can answer the call of the Guilds and carry out "+
                      "remunerative champion tasks.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // CR 2T1
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("CR 2T1")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/images/lore/image8.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "CR 2T1, is an ancient machine built by a civilization long gone. This strange "+
                      "invention has mysteriously reactivated itself leaving the whole Kingdom in awe."+
                      " The Magista are trying to understand what could have caused this strange "+
                      "phenomenon but even more so what the machine was designed to do. But they are "+
                      "far from finding answers.\n\n"+

                      "CR 2T1 was found by Magista fellows during an expedition to some ancient ruins"+
                      " not far from Ilvash. For years the machine was considered nothing more than"+
                      " a strange relic from a past so distant that men could never understand it. "+
                      "CR 2T1 was conserved only as an antiquity in the museum of Ilvash until the "+
                      "day it mysteriously reactivated itself demonstrating  that it is a somewhat "+
                      "sentient, albeit extremely strange, being. The machine operates only to help"+
                      " others fulfill their goals, but only if those goals follow a specific moral"+
                      " code of conduct that CR 2T1 is hardwired with. The code is still impossible "+
                      "to fully comprehend for all the inhabitants of Ilvash. During the time that"+
                      " passed since its activation it has helped all kinds of people and "+
                      "organizations, performing charitable actions, but also violent acts of war."+
                      " It is unclear what CR 2T1 is trying to accomplish or what for the machine "+
                      "constitutes a worthy task, but exploring the new islands is a call it is ready"+
                      " to answer!")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }



    // Monsters
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Monsters")
            color: Palette.grayNurse
            font.pixelSize: 35
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 48
            bottomPadding: 0

            Layout.fillWidth: true
        }
        Label {
            text: qsTr("The world of Icaion is populated by so many creatures and monsters "+
                       "that the discovery of new species is almost expected when venturing "+
                       "far from the city walls. Most creatures are peaceful and even show a "+
                       "great amount of intelligence, to the point that they are accepted inside"+
                       " the city walls and are also given roles in society.\n\n"+

                       "This coexistence between monsters and people is taken for granted by "+
                       "the citizens of Ilvash, but those used to traveling around Icaion know "+
                       "that this is not always the case. Monsters can be unpredictable and even "+
                       "dangerous when exposed to the wild energy of Qoam, to the point that "+
                       "creatures that  normally cooperate in the city, are known to become "+
                       "aggressive in certain areas of the world. Monsters become uncontrollable "+
                       "when hit by energy that vibrates at a certain frequency, but the source of "+
                       "this energy is undetectable. Due to this uncertainty, the army employs "+
                       "these troops only for the defence of the city or in areas where they are "+
                       "sure they are safe from dangerous energies.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Image {
            source: "qrc:/images/lore/image7.jpg"
            fillMode: Image.PreserveAspectFit
            asynchronous: root.asynchronous
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
    }
    // Onygauros the Collector
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Onygauros the Collector")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image16.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "The Onygauros are a species of huge scarab-like monsters with four arms"+
                      " and they are probably the smartest creatures after humans. Onygauros are "+
                      "called “the collectors”, since they live in small caves where they store "+
                      "huge collections of weird items that usually have no value at all for humans,"+
                      " but seem extremely precious to them. Each Onygauros is fascinated by a "+
                      "different kind of item and tend to collect as many variations as possible of "+
                      "that specific item. For example, you might see a Onygauros cave filled with "+
                      "all sorts of bottles and another filled with drawers, cogs, and other bizarre"+
                      " things. Be aware when venturing into their caves because they may become "+
                      "violent to defend their collections. \n\n"+

                      "Their bizarre behaviour has long been the basis for collaboration with "+
                      "humans, who quickly understood how to please these powerful beasts, making"+
                      " them allies and valuable assets to their armies. While they are excellent"+
                      " warriors due to their size and ability to wield four weapons at once, some"+
                      " are uninterested in engaging in war and can instead be seen trading their "+
                      "strange objects with human merchants. They naturally understand what is "+
                      "valuable to other beings and use this to obtain what they want from each "+
                      "trade.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Boulron the Reaper
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Boulron the Reaper")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image13.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Boulron are eerie, elegant creatures that appeared on Mysthea some years"+
                      " ago. Their presence is unsettling to many, especially because they were"+
                      " unknown to man until their surprising appearance one day. It was an odd"+
                      " day. The citizens woke up to see these strange creatures roaming through"+
                      " the city like they’d always lived there. At first this created a panic, "+
                      "but soon the people understood that Boulron did not pose too great a"+
                      " threat.\n\n"+

                      "The creatures move slowly with sinuous, elegant gestures. Boulron roam "+
                      "and observe other beings, but try not to interact. They are considered "+
                      "a sign of bad luck by many because they seem attracted by death. It is "+
                      "not unusual to see Boulron congregate where someone has died, just to stand"+
                      "for hours in what seems a form of sorrow.\n\n"+

                      "Another sign of their dark nature is their habit, while roaming, to become"+
                      " suddenly attracted by and follow soldiers, mercenaries, or anyone who has"+
                      " had an encounter with death recently.\n\n"+

                      "In the wild not only is their behaviour unsettling and unpredictable, but "+
                      "the idea that crystal energy can enrage them at any moment is a cause for"+
                      " great fear. Boulron are known to forget their calm and slow movement and "+
                      "to become machines of war when triggered by the crystals, capable of "+
                      "destroying entire armies at once.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Caerulas the Inhabitant from Below
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Caerulas the Inhabitant from Below")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image23.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Caerulas, nicknamed “the inhabitant from below”, is a strange three-headed"+
                      " creature that appears from the storm. Usually it tends to appear from the"+
                      " clouds, fly over the floating island while screeching strange harmonic"+
                      " sounds, then disappearing back below. Its appearance is similar to the"+
                      " rest of the mist that surrounds the planet, and it is not clear if Caerulas"+
                      " is made of the same or if the cloud sticks to its body as it travels through "+
                      "it. Caerulas  seems to ignore humanity and all living beings. It’s most important"+
                      " goal is to fly freely around Icaion. \n\n"+

                      "Some scholars studying Caerulas more closely reported there had actually"+
                      " been some interactions between Caerulas and humans. But these reports are"+
                      " strange, like tales of madmen, and all uncannily similar to each other. "+
                      "Once they had Caerulas’ attention, the raconteurs felt that Caerulas was"+
                      " staring directly into their souls, comprehending every detail of their "+
                      "existence before quickly disappearing into the skies. This is what is reported"+
                      " by those who survived the encounter, since there are also many reports of "+
                      "people being brutally slaughtered by Caerulas, perhaps people whose souls"+
                      " may not have impressed the creature.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Obsidusa the Devourer
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Obsidusa the Devourer")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image6.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Obsidusa is a walking abomination fused with Qoam. The story goes that he"+
                      " captures unfortunate adventurers and proceeds to absorb the victims, "+
                      "engulfing them in his own body made by flesh and remnants of other people"+
                      " that were unable to fight him. It is said he was once human. Obsidusa is not"+
                      " the only abomination infused with Qoam that roams the lands of Mysthea. "+
                      "Horrors of all kinds with Qoam embed in their flesh turn up often and their "+
                      "origin is a chapter of Ilvash history that most people prefer to not"+
                      " remember.\n\n"+

                      "That sad history starts with a Champion that disappeared in mysterious"+
                      " circumstances during the Great War of Dulkodel. The Champion was known "+
                      "for making strange experiments with Qoam, involving other living creatures."+
                      " The experiments were unethical and at some point almost all the guilds"+
                      " decided to cut ties with him. Kaetur was the only guild interested in his"+
                      " services, using his “inventions” and discoveries in battle. His experiments"+
                      " may have been unethical, but they created things of great power, irreplicable"+
                      " by other means. During the Great War, he was given unlimited freedom and"+
                      " resources to pursue his research, as the philosophy of “victory at any"+
                      " cost” was normal during those times and justified practices that today "+
                      "would only be considered mad. Until one day toward the end of the war he"+
                      " suddenly went missing along with much of the equipment from his laboratory."+
                      " Some speculate that he escaped to avoid risk of being persecuted for the"+
                      " unspeakable things he did during the war; others think that he needed to"+
                      " throw off any pressure from society to pursue his mad research. No one"+
                      " has seen him since that day, but shortly after creatures never seen before"+
                      " appeared in Mysthea disseminating horror everywhere they turn up."+
                      " Abominations with the likes of Obsidusa are just the waste of his"+
                      " experiments, thrown away when they no longer serve a use to him.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Cannibarok the Qoam Eater
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Cannibarok the Qoam Eater")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image14.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Cannibarok is a huge and dangerously stupid creature that lives only to "+
                      "satisfy his most basic needs. He feeds himself off Qoam and little else"+
                      " matters to this great beast. Cannibarok seems to be able to sense Qoam,"+
                      " even at a great distance, and when he reaches it he uses his multiple mouths"+
                      " to feed himself with the precious Crystal. \n\n"+

                      "It is possible to tell the age of a Qoam Eater by his size, since the diet"+
                      " seems to have an effect on the growth of the beast. Usually Qoam Eaters"+
                      " do not live more than a decade, but during this time they can grow to "+
                      "incredible proportions, which poses a great risk for everyone around them. "+
                      "Sometimes these Qoam Eaters enter unnoticed into caves filled with Crystal"+
                      " and come out many years later, having grown to gigantic proportions from"+
                      " feasting on the crystals within and henceforth wreaking havoc on their path"+
                      " toward some new Qoam field. For this reason the Kaetur Guild monitors "+
                      "closely the presence of Cannibaroks around cities and settlements,trying"+
                      " to exterminate the creatures before they grow too large. This movement "+
                      "started after an enormous Cannibarook entered the walls of Ilvash, attracted"+
                      " by the Qoam embedded in almost every building of the city. He destroyed a"+
                      " large portion of the city and a day of fighting ensued before Champions and"+
                      " soldiers were able to bring down the beast.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Kodror the Infestation
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Kodror the Infestation")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image17.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr(
                      "Kodror is a unique kind of mold-like lifeform that seems to develop "+
                      "and grow only when in contact with Qoam. Highly toxic and caustic for "+
                      "all kinds of living creatures, Kodror takes its nutrients by attaching"+
                      " itself to living beings and killing them. It rarely creates issues on "+
                      "the ground since it usually gets eradicated before it can grow to any "+
                      "considerable amount. But a situation can become deadly when Kodror grows "+
                      "on large chunks of floating Qoam, since Kodror does not become noticeable"+
                      " until it is already dangerously large. At that point Kodror becomes a "+
                      "frightening, floating abomination with huge  tentacles that reach to kill"+
                      " anything passing below them.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }
    // Utcoro the Swarmer
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Utcoro the Swarmer")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            topPadding: 18
            rightPadding: 20
            leftPadding: 20
            bottomPadding: 20

            Layout.fillWidth: true
        }
        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image27.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: Layout.leftMargin
            Layout.fillWidth: true
        }
        Label {
            text: qsTr("Utcoros are predatory beasts with a short lifespan of just a couple "+
                       "of months. They hatch from eggs and immediately begin to hunt for "+
                       "sustenance. Utcoros try to kill and eat almost anything they encounter,"+
                       " if their size allows it. If their size does not allow it, they tend to"+
                       " aggregate themselves in packs to swarm and overwhelm their prey. Utcoros "+
                       "continuously hunt until they are ready to lay eggs. When this happens, "+
                       "it means that their life span is near its end. Utcoros die on top of their"+
                       " offspring, so that their toxic dead bodies can protect their eggs from "+
                       "the elements and from any other predators until the eggs hatch and the "+
                       "cycle repeats. \n\n"+

                       "They are sometimes used by soldiers and militias of Mysthea as a sort"+
                       " of rite of passage: after their training young recruits are required"+
                       " to kill them as a test of courage and strength. For this reason military"+
                       " veterans see fleeing in front of them as an act of cowardice, an admission"+
                       " of weakness and unpreparedness.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 20
            bottomPadding: 0
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }
    }



    // Misc
    Label {
        text: qsTr("Misc")
        color: Palette.grayNurse
        font.pixelSize: 35
        font.letterSpacing: 1
        rightPadding: 20
        leftPadding: 20
        topPadding: 48
        bottomPadding: 0

        Layout.fillWidth: true
    }
    // Qoam Manipulation
    ColumnLayout {
        width: root.width
        spacing: 0
        Label {
            text: qsTr("Qoam Manipulation")
            color: Palette.grayNurse
            font.pixelSize: 27
            font.letterSpacing: 1
            rightPadding: 20
            leftPadding: 20
            topPadding: 18
            bottomPadding: 0

            Layout.fillWidth: true
        }

        Label {
            text: qsTr("The process of manipulating Qoam to move it telekinetically"+
                       " is common practice for all of the city. The practice is "+
                       "considered as natural as breathing. In reality the process is very"+
                       " complex, but only some are aware of this or are able to use this "+
                       "knowledge to their advantage. Highly talented individuals put a lot "+
                       "of concentration into what they do. For them, the goal is to sense "+
                       "crystals whose electromagnetic fields vibrate at a frequency that works"+
                       " well for them. Finding such a crystal makes a great difference, as "+
                       "choosing the right crystal can make the process immensely easier, enabling"+
                       " the user to perform greater feats. Usually, when one is interacting with"+
                       " a Qoam, others cannot take control of it unless the first user allows "+
                       "them to do so.")
            color: Palette.grayNurse
            font.pixelSize: 20
            font.letterSpacing: 1
            padding: 20
            wrapMode: Text.Wrap
            lineHeight: 1.1

            Layout.fillWidth: true
        }

        Image {
            asynchronous: root.asynchronous
            source: "qrc:/images/lore/image3.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.bottomMargin: 20
            Layout.rightMargin: 20
            Layout.leftMargin: 20
            Layout.topMargin: 0
            Layout.fillWidth: true
        }
    }

}