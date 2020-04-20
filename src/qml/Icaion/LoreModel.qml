import QtQuick 2.14
import QtQml.Models 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import MystheaUniverse.Theme 1.0

ObjectModel {
    id: root

    property int width: 100
    property bool asynchronous: true
    LoreHeading {
        text: qsTr("Icaion Lore")
        color: Palette.icaionLight
    }

    ColumnLayout {
        width: root.width
        spacing: 0


        LoreTitle {
            text: qsTr("A cold dark planet")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("Being completely engulfed by the eternal storm of clouds above, Icaion is an extremely cold and dark planet. <strong>Sunlight is one of the most scarce resources</strong> and this forced civilizations to develop only on the rare places where the sun reaches the ground, allowing them to cultivate lands obtaining steady food supplies impossible to have anywhere else. These spots are so scarce and so far away one from another, that these civilizations never met and are unaware of each other's existence. The regions that surround the City are mainly barren and there are no other known cities or settlements in them, just Seeker's outposts to help the process of harvest different kinds of crystals.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore1.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("The lands not touched by light are <strong>barren and dangerous places</strong>, twisted by the devastating cataclysm which happened millennia ago. The effects of the crystal can vary wildly from one region to another, causing some places to have perennial snowstorms, others are submerged in mist, others are places with eternal rain and so on, with <strong>frightening weather phenomena going on in different regions.</strong> Those unstable regions offer <strong>different types of Qoam crystals.</strong> It isn’t known if the instability depends from these crystals or it is the instability itself that altered the crystal.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("In these unforgiving lands other forms of life developed, creating the most unimaginable and dangerous creatures. For all these reasons the barren lands are highly inhospitable and not inhabited by any civilized species. These grim places are extremely rich in treasures, Qoam and rare artifacts, making exploration always worthwhile, even if risky.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0

        LoreTitle {
            text: qsTr("The city")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("Directly below the floating regions of Mysthea is present one of the biggest cities of Icaion, <strong>built around the enormous crystal that comes out of the land.</strong> The crystal emanates such powerful energies that the clouds above are constantly moved by it and the City around the crystal lies inside the eye of a permanent cyclone. <strong>The movement of the clouds created a permanent circle, a ring of sunlight between the crystal and clouds</strong>, where society developed over the years. The absence of storms with the constant sunny daylight makes this <strong>ring of cultivable land excellent for farming</strong>. Around the fields lies a huge City. Since cultivable land is a finite and extremely rare asset, the City developed in every spot that wouldn’t waste precious soil.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore2.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("The City is divided into <strong>two circles</strong>, the first one, closer to the crystal, is where the sunlight is present. This circle is considered the <strong>core of the whole society, where the most powerful and influential individuals reside</strong>. Outside there is the <strong>'region of eternal dusk'</strong>, an outer circle where the rest of society lives crammed as tightly as possible. All of this is surrounded by a huge wall that encloses the whole City from the dangers present outside. The walls are a mix of natural boundaries which were thrust up by earthquakes when the crystal arose millennia ago, and artificial ones made to fill the gaps.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("Society inside the walls")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("The inhabitants of the City have extremely limited to almost no manipulation abilities with Qoam, but they are able to use the crystal as a fuel to power machines. The Qoam is extracted from the Henakor itself, from mines that go for miles below the surface, and other new varieties are brought from the outside by Seekers themselves.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("Since the sun only reaches a small circle of land around the crystal, this zone of the City is the only place where cultivation of land is possible. This made land owners in this region the most powerful and wealthy individuals of the society. Farming is considered an activity reserved exclusively for the elite, the few people that can live their lives in constant sunlight while eating genuine produce from the earth and not just processed by-products.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore3.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("The rest of society lives in a state of wild and ruthless capitalism, instead, with everyone crossing each other trying to find some ways to earn a better life. Citizens of the City are divided into a strict class system, where their place in society and privileges are strictly tied to the occupation an individual can do. Occupations are generally inherited and it is very difficult for somebody who was born into a certain class to change occupation by rising to another one.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("Classes of the city")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("Citizens of the City are <strong>divided into a strict class system</strong>, where their place in society and privileges are tied to the occupation an individual can do. Occupations are generally inherited and it is very difficult for somebody who was born into a certain class to change occupation by rising to another one.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore4.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("Inside each class, individuals often form <strong>organizations</strong> to work on what is their class expertise and knowledge. Most of these organizations are centered and managed by a single family and employ only people from that lineage to manage their process. Some organizations are of course richer and more powerful than others.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("<strong>Farmers are the wealthiest and most powerful individuals,</strong> referred to as those <strong>'blessed with the gift of light'</strong>. They own all of the lands where cultivation is undertaken, they make good use of heavy machines and other automated equipment to work the land, since the Workers are not deemed worthy of being under the sun. The Farmer class live an enviable life, as being able to live their whole lives bathed in sunlight and working with something so rare and precious as plants is considered the most luxurious thing a human could dream of. <strong>They spend their days in orchards and gardens cultivating rare and precious species</strong>, while the mostly automated mass cultivation of their other lands makes them rich.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("<strong>Extractors are the people that own and operate the Qoam mines</strong> on the Henakor. Their organizations always have a booming business and they employ all kinds of machinery and people to extract the precious crystal.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("The <strong>Industrialists hold the well guarded knowledge, technology and resources to build Qoam powered tools.</strong> Their organizations are driving forward society and are in high competition between each other.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("<strong>Workers are the backbone of society,</strong> these people are employed in the most various activities around the City and are in a constant struggle to sustain themselves and their families. They commonly do <strong>manual labor and menial tasks</strong> for the organizations of the elites, that usually consider them as replaceable and dispensable. Some of them show more initiative and manage small activities in the region of eternal dusk to service other Workers, such as shops and taverns.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("Lastly, the <strong>Seekers are elite soldiers that go outside the City walls to explore wild lands</strong> trying to extract resources and find treasures. Due to the fact that the temperatures are cold and the constant darkness has strange effects on the mind, <strong>only a few people have what it takes to take this path.</strong> Considering that dangerous monsters are sometimes spotted in the dark around the City, every journey outside could be the last. Almost anyone could become a Seeker, and joining the Organization is often seen as the only way for common folks to become a more respected member of society.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("Seekers are the only citizens that live outside the walls, in the Organization Headquarters.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore5.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("The organization")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("On the outer rim of the City perched just outside the City walls there are the headquarters, living chambers and hangars of the Organization. This rich and powerful organization <strong>manages expeditions to explore, excavate and scavenge in the harsh and dangerous environment outside the wall.</strong>")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("The Organization has five Divisions specialized in different kinds of expeditions and environments. It employs skilled Seekers, heavy vehicles and machinery useful to harvest Qoam and other resources, as well as to help them to explore more deeply into the Regions. Most of the Seekers <strong>live outside the walls to prepare for the expeditions by adapting to the harsh conditions.</strong>")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("Seekers venture regularly outside the City in <strong>small teams and convoys</strong>, to gather precious resources, hunt for treasures, scavenge ancient relics and to ensure that no monster threats are nearby. Outside the walls some outposts are present, managed by the Seeker’s Organization and used as places to rest and recuperate before going even further in their missions.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("Recently their work has become even harder. They discovered that a <strong>huge Colossus</strong> roaming the most remote regions is connected with Qoam. The being doesn’t seem directly aggressive, but its presence seems to <strong>twist the planet, spreading an illness</strong> everywhere it crosses.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreHeading {
            text: qsTr("Seekers’ Backstories & Design")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("The Lone Survivor")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("Tall, muscular and mostly abrupt in his manner of speech, the Lone Survivor was born as a Worker and his imagination had been captivated by the life of the Seekers as a child when he regularly saw them in his father’s tavern and stood for hours listening to their stories and tales. During his career he distinguished himself as light on his feet and quick-thinking under stress, able to improvise solutions to the difficult situations that arose during expeditions.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore6.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("Several years ago <strong>he returned alone from an expedition that departed with fifty Seekers.</strong> Although he was de-briefed by the top echelons of the Organization, <strong>nobody outside the senior ranks knows what happened to the other members.</strong> Since that time the Lone Survivor has remained curt and mostly unresponsive in conversation, always keeping to himself except for essential communication. He carries with him a giant staff in the form of a two-pronged fork. This is also a relic from his solo return. Nobody knows where it is from, how the Lone Survivor came to have it in his possession, nor to what ends it can be put to. Rumour has it that if someone stands close to it they can hear it humming and if you touch it there is shock that burns, but leaves no mark. The Lone Survivor habitually wears a broad-brimmed hat that obscures his face and a long heavy waterproof coat that he wears everywhere. The mysterious staff is never out of his grasp and that also accompanies him in his slumber.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("The Heir")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("A fat, spoiled and rich man from the Farmer Class, someone 'blessed with the gift of light' so to speak. He's <strong>the heir of a huge estate of lands near the crystal</strong> and he has always lived a comfortable and easy life under the sun. Some years ago he decided to find some thrill in his life and <strong>used his family influence to join the Organization,</strong> climbing the ranks without any merit. He joined and started to guide expeditions only for his leisure, most often than not endangering the whole convoy with his lack of expertise combined with his unwillingness to listen to the Seekers’ advice about the harsh wilderness.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore7.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("The Organization has learned that he’s a liability more than anything else, but his ruthless methods and complete disregard for others allows him to do things that at the end of the day are very valuable for them. Considering also that the family influence is strong, the Organization still allows him to have his little game outside the City walls even if it’s not always in the Organization’s best interests. He’s <strong>always carried around by his two personal servants</strong> so he doesn’t need to ever touch foot on the cold ground of the wild regions.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("The Machine")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        LoreParagraph {
            text: qsTr("An <strong>autonomous machine built by the Industrialists</strong> in an effort to make expeditions by themselves without relying on the Organization and to avoid paying their cut. The Industrialists invested a lot of resources in building the Machine, hoping that they could just send machines outside without having to pay the costly labor expenses and bonuses of the human Seekers.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore8.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("The Machine showed useful skills and a great ability for adaptation, but it was unable to work completely by itself without bringing a team on its convoy. The Industrialists’ goal to not rely on expert Seekers was far from being achieved and the research and development needed to reach it by adjusting the design flaws of the Machine was too expensive. Therefore the Industrialists decided that it wasn’t possible to recover on their investment and they <strong>sold the design to the Organization</strong> to recoup the research costs incurred so far. The Organization now employs the Machine as an overseer of the most technical expeditions, in which its built in tools give it an edge.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("The Creature")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("The Creature appeared one day around the City walls and quickly demonstrated that it wasn’t a threat. It <strong>learned how to communicate perfectly in the people’s language in a matter of days,</strong> showing that it is in its nature to learn almost everything in an extremely short time. This seems to be the peculiarity of this species, they are <strong>able to learn and master even the most complex skill really quickly,</strong> but unfortunately they can do this only for a few skills at a time. This is not a major problem since they can <strong>forget and relearn things</strong> so fast that they just end up switching between skills frequently. This huge flexibility made The Creature very interesting to the Organization that started to employ her in as many of the most various tasks as possible. Regardless of the task, the Creature is capable of spending very few days with proficient instructors and it will rapidly learn the assigned skill. The Creature always <strong>carries an object in two of its four hands</strong> and many people believe that it is this object which conveys it its learning power.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore9.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("The Outsider")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("A mysterious man that was encountered far from the City, deep in the regions during an expedition years ago. A stranger of unknown origins clearly not from anywhere near the City. Although The Outsider is humanoid, <strong>it is speculated among the Seekers that he is not entirely human.</strong> When he originally made contact with a convoy the Seekers were very wary. Nonetheless, after the initial caution, he was asked to join them after helping with his knowledge of survival skills necessary for the Regions. Eventually he went with them to the headquarters of the Organization outside the City walls. He lived in the wilderness around the walls for a while, until he was approached by the Organization, interested in employing him due to his <strong>great adaptability and expert knowledge of the areas outside</strong>.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lor10.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("His in-depth understanding of the Regions allowed him to quickly make a name for himself inside the Organization, becoming one of the most efficient expedition leaders. He doesn't answer any questions about his past and he is generally silent. He wears a mask which also covers his eyes and a hood which he never takes off while in the presence of others.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("The Criminal")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("She’s a convicted criminal that escaped from the City years ago, having a hefty bounty on her head she would be arrested on the spot if she ever set foot in the City again. To survive the wilderness and harshness of the outside regions, she built a set of <strong>armor with thermal capabilities</strong>, to keep her warm and protected. Being unrecognizable in the armor, she was able to join a Seeker’s convoy and managed to enter the Organization undercover. She did not reveal her identity until she proved her value to the Organization leaders, who then <strong>decided to protect her</strong> due to her incredible survival and adaptation abilities on the outside. She now lives in the Organization headquarters outside the walls and outside the City jurisdiction.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore11.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }


    }
    ColumnLayout {
        width: root.width
        spacing: 0
        LoreTitle {
            text: qsTr("The Cursed")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        LoreParagraph {
            text: qsTr("This woman from the Industrialxist Class has always been a talented individual able to <strong>build the most innovative machines and contraptions.</strong> Her technical and tinkering skill was unmatched among her peers, but unfortunately for her, she always had the reputation of being somewhat of a jinxed individual. This was because she always <strong>pushed to the most obscure fringes of science</strong>, so her results may either be spectacular or fail in spectacular (and sometimes very loud) ways. For her all these failures where just part of <strong>her innovative and rigorous creative method</strong>, which allowed her to have an edge over her competitors. She didn’t really care about the gossip since she knew that they were only due to ignorance and she always thought that in the end her works would speak for themselves. Unfortunately that wasn’t the case and one day she lost an arm while working on some new innovative contraption that she believed could change Qoam extraction forever. This event really damaged her reputation and people became so entrenched in the conviction that she was cursed. It reached the point where almost nobody would work with her anymore. Forced to find new ways to make a living, she joined the Organization and they were more than happy to disregard all the hearsay and take such a talented individual on board.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }

        Image {
            source: "qrc:/assets/images/extras/lore/icaion/img_lore12.jpg"
            fillMode: Image.PreserveAspectFit
            sourceSize.width: width
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            Layout.fillWidth: true
            asynchronous: root.asynchronous
        }
        LoreParagraph {
            text: qsTr("Being a tinkerer, <strong>she tried to build the perfect mechanic substitution for her arm</strong> and over the years she experimented with and improved on different designs. Her current production is a wing-like device that she originally built hoping she could start to fly. Unfortunately it did not work, but she found out that refitting the design to hold tools and blades would make an extremely effective and dangerous weapon. Thus she kept her wing, at least until her unstoppable mind will bring a new creation.")
            color: Palette.icaionLight
            Layout.fillWidth: true
        }
    }
}
