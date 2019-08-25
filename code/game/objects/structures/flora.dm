//trees
/obj/structure/flora/tree
	name = "tree"
	anchored = 1
	density = 1
	pixel_x = -16
	layer = ABOVE_MOB_LAYER

/obj/structure/flora/tree/pine
	name = "pine tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"

/obj/structure/flora/tree/pine/New()
	..()
	icon_state = "pine_[rand(1, 3)]"

/obj/structure/flora/tree/pine/xmas
	name = "xmas tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_c"

/obj/structure/flora/tree/pine/xmas/New()
	..()
	icon_state = "pine_c"

/obj/structure/flora/tree/dead
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree_1"

/obj/structure/flora/tree/dead/New()
	..()
	icon_state = "tree_[rand(1, 6)]"

//grass
/obj/structure/flora/grass
	name = "grass"
	icon = 'icons/obj/flora/snowflora.dmi'
	anchored = 1

/obj/structure/flora/grass/brown
	icon_state = "snowgrass1bb"

/obj/structure/flora/grass/brown/New()
	..()
	icon_state = "snowgrass[rand(1, 3)]bb"


/obj/structure/flora/grass/green
	icon_state = "snowgrass1gb"

/obj/structure/flora/grass/green/New()
	..()
	icon_state = "snowgrass[rand(1, 3)]gb"

/obj/structure/flora/grass/both
	icon_state = "snowgrassall1"

/obj/structure/flora/grass/both/New()
	..()
	icon_state = "snowgrassall[rand(1, 3)]"


//bushes
/obj/structure/flora/bush
	name = "bush"
	icon = 'icons/obj/flora/snowflora.dmi'
	icon_state = "snowbush1"
	anchored = 1

/obj/structure/flora/bush/New()
	..()
	icon_state = "snowbush[rand(1, 6)]"

/obj/structure/flora/pottedplant
	name = "potted plant"
	icon = 'icons/obj/plants.dmi'
	icon_state = "plant-26"
	layer = ABOVE_MOB_LAYER

/obj/structure/flora/pottedplant
	name = "potted plant"
	desc = "Really brings the room together."
	icon = 'icons/obj/plants.dmi'
	icon_state = "plant-01"

/obj/structure/flora/pottedplant/large
	name = "large potted plant"
	desc = "This is a large plant. Three branches support pairs of waxy leaves."
	icon_state = "plant-26"

/obj/structure/flora/pottedplant/fern
	name = "potted fern"
	desc = "This is an ordinary looking fern. It looks like it could do with some water."
	icon_state = "plant-02"

/obj/structure/flora/pottedplant/overgrown
	name = "overgrown potted plants"
	desc = "This is an assortment of colourful plants. Some parts are overgrown."
	icon_state = "plant-03"

/obj/structure/flora/pottedplant/bamboo
	name = "potted bamboo"
	desc = "These are bamboo shoots. The tops looks like they've been cut short."
	icon_state = "plant-04"

/obj/structure/flora/pottedplant/largebush
	name = "large potted bush"
	desc = "This is a large bush. The leaves stick upwards in an odd fashion."
	icon_state = "plant-05"

/obj/structure/flora/pottedplant/thinbush
	name = "thin potted bush"
	desc = "This is a thin bush. It appears to be flowering."
	icon_state = "plant-06"

/obj/structure/flora/pottedplant/mysterious
	name = "mysterious potted bulbs"
	desc = "This is a mysterious looking plant. Touching the bulbs cause them to shrink."
	icon_state = "plant-07"

/obj/structure/flora/pottedplant/smalltree
	name = "small potted tree"
	desc = "This is a small tree. It is rather pleasant."
	icon_state = "plant-08"

/obj/structure/flora/pottedplant/unusual
	name = "unusual potted plant"
	desc = "This is an unusual plant. It's bulbous ends emit a soft blue light."
	icon_state = "plant-09"
	light_range = 2
	light_power = 0.6
	light_color = "#33CCFF"

/obj/structure/flora/pottedplant/orientaltree
	name = "potted oriental tree"
	desc = "This is a rather oriental style tree. Its flowers are bright pink."
	icon_state = "plant-10"

/obj/structure/flora/pottedplant/smallcactus
	name = "small potted cactus"
	desc = "This is a small cactus. Its needles are sharp."
	icon_state = "plant-11"

/obj/structure/flora/pottedplant/tall
	name = "tall potted plant"
	desc = "This is a tall plant. Tiny pores line its surface."
	icon_state = "plant-12"

/obj/structure/flora/pottedplant/sticky
	name = "sticky potted plant"
	desc = "This is an odd plant. Its sticky leaves trap insects."
	icon_state = "plant-13"

/obj/structure/flora/pottedplant/smelly
	name = "smelly potted plant"
	desc = "This is some kind of tropical plant. It reeks of rotten eggs."
	icon_state = "plant-14"

/obj/structure/flora/pottedplant/small
	name = "small potted plant"
	desc = "This is a pot of assorted small flora. Some look familiar."
	icon_state = "plant-15"

/obj/structure/flora/pottedplant/aquatic
	name = "aquatic potted plant"
	desc = "This is apparently an aquatic plant. It's probably fake."
	icon_state = "plant-16"

/obj/structure/flora/pottedplant/shoot
	name = "small potted shoot"
	desc = "This is a small shoot. It still needs time to grow."
	icon_state = "plant-17"

/obj/structure/flora/pottedplant/flower
	name = "potted flower"
	desc = "This is a slim plant. Sweet smelling flowers are supported by spindly stems."
	icon_state = "plant-18"

/obj/structure/flora/pottedplant/crystal
	name = "crystalline potted plant"
	desc = "These are rather cubic plants. Odd crystal formations grow on the end."
	icon_state = "plant-19"

/obj/structure/flora/pottedplant/subterranean
	name = "subterranean potted plant"
	desc = "This is a subterranean plant. It's bulbous ends glow faintly."
	icon_state = "plant-20"
	light_range = 2
	light_power = 0.6
	light_color = "#FF6633"

/obj/structure/flora/pottedplant/minitree
	name = "potted tree"
	desc = "This is a miniature tree. Apparently it was grown to 1/5 scale."
	icon_state = "plant-21"

/obj/structure/flora/pottedplant/stoutbush
	name = "stout potted bush"
	desc = "This is a stout bush. Its leaves point up and outwards."
	icon_state = "plant-22"

/obj/structure/flora/pottedplant/drooping
	name = "drooping potted plant"
	desc = "This is a small plant. The drooping leaves make it look like its wilted."
	icon_state = "plant-23"

/obj/structure/flora/pottedplant/tropical
	name = "tropical potted plant"
	desc = "This is some kind of tropical plant. It hasn't begun to flower yet."
	icon_state = "plant-24"

/obj/structure/flora/pottedplant/dead
	name = "dead potted plant"
	desc = "This is the dried up remains of a dead plant. Someone should replace it."
	icon_state = "plant-25"

/obj/structure/flora/pottedplant/decorative
	name = "decorative potted plant"
	desc = "This is a decorative shrub. It's been trimmed into the shape of an apple."
	icon_state = "applebush"

/obj/structure/flora/pottedplant/xmas
	name = "small christmas tree"
	desc = "This is a tiny well lit decorative christmas tree."
	icon_state = "plant-xmas"

//newbushes

/obj/structure/flora/ausbushes
	name = "bush"
	icon = 'icons/obj/flora/ausflora.dmi'
	icon_state = "firstbush_1"
	anchored = 1

/obj/structure/flora/ausbushes/New()
	..()
	icon_state = "firstbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/reedbush
	icon_state = "reedbush_1"

/obj/structure/flora/ausbushes/reedbush/New()
	..()
	icon_state = "reedbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/leafybush
	icon_state = "leafybush_1"

/obj/structure/flora/ausbushes/leafybush/New()
	..()
	icon_state = "leafybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/palebush
	icon_state = "palebush_1"

/obj/structure/flora/ausbushes/palebush/New()
	..()
	icon_state = "palebush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/stalkybush
	icon_state = "stalkybush_1"

/obj/structure/flora/ausbushes/stalkybush/New()
	..()
	icon_state = "stalkybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/grassybush
	icon_state = "grassybush_1"

/obj/structure/flora/ausbushes/grassybush/New()
	..()
	icon_state = "grassybush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/fernybush
	icon_state = "fernybush_1"

/obj/structure/flora/ausbushes/fernybush/New()
	..()
	icon_state = "fernybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/sunnybush
	icon_state = "sunnybush_1"

/obj/structure/flora/ausbushes/sunnybush/New()
	..()
	icon_state = "sunnybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/genericbush
	icon_state = "genericbush_1"

/obj/structure/flora/ausbushes/genericbush/New()
	..()
	icon_state = "genericbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/pointybush
	icon_state = "pointybush_1"

/obj/structure/flora/ausbushes/pointybush/New()
	..()
	icon_state = "pointybush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/lavendergrass
	icon_state = "lavendergrass_1"

/obj/structure/flora/ausbushes/lavendergrass/New()
	..()
	icon_state = "lavendergrass_[rand(1, 4)]"

/obj/structure/flora/ausbushes/ywflowers
	icon_state = "ywflowers_1"

/obj/structure/flora/ausbushes/ywflowers/New()
	..()
	icon_state = "ywflowers_[rand(1, 3)]"

/obj/structure/flora/ausbushes/brflowers
	icon_state = "brflowers_1"

/obj/structure/flora/ausbushes/brflowers/New()
	..()
	icon_state = "brflowers_[rand(1, 3)]"

/obj/structure/flora/ausbushes/ppflowers
	icon_state = "ppflowers_1"

/obj/structure/flora/ausbushes/ppflowers/New()
	..()
	icon_state = "ppflowers_[rand(1, 4)]"

/obj/structure/flora/ausbushes/sparsegrass
	icon_state = "sparsegrass_1"

/obj/structure/flora/ausbushes/sparsegrass/New()
	..()
	icon_state = "sparsegrass_[rand(1, 3)]"

/obj/structure/flora/ausbushes/fullgrass
	icon_state = "fullgrass_1"

/obj/structure/flora/ausbushes/fullgrass/New()
	..()
	icon_state = "fullgrass_[rand(1, 3)]"

/obj/structure/flora/tree/sif
	name = "glowing tree"
	desc = "It's a tree, except this one seems quite alien.  It glows a deep blue."
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree_sif"

/obj/structure/flora/tree/palm
	icon = 'icons/obj/flora/palmtrees.dmi'
	icon_state = "palm1"

/obj/structure/flora/tree/jungle
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree"

/obj/structure/flora/tree/jungle/variant1
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree2"

/obj/structure/flora/tree/jungle/variant2
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree3"

/obj/structure/flora/tree/jungle/variant3
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree4"

/obj/structure/flora/tree/jungle/variant4
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree5"

/obj/structure/flora/tree/jungle/variant5
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree6"

/obj/structure/flora/tree/jungle_small
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree"

/obj/structure/flora/tree/jungle_small/variant1
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree2"

/obj/structure/flora/tree/jungle_small/variant2
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree3"

/obj/structure/flora/tree/jungle_small/variant3
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree4"

/obj/structure/flora/tree/jungle_small/variant4
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree5"

/obj/structure/flora/tree/jungle_small/variant5
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree6"

/obj/structure/flora/small/rock1
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock1"

/obj/structure/flora/small/rock2
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock2"

/obj/structure/flora/small/rock3
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock3"

/obj/structure/flora/small/rock4
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock4"

/obj/structure/flora/small/rock5
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock5"

/obj/structure/flora/small/trailrocka1
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock1"

/obj/structure/flora/small/trailrocka2
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock2"

/obj/structure/flora/small/trailrocka3
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock3"

/obj/structure/flora/small/trailrocka4
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock4"

/obj/structure/flora/small/trailrocka5
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock5"

/obj/structure/flora/small/trailrockb1
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig1"

/obj/structure/flora/small/trailrockb2
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig2"

/obj/structure/flora/small/trailrockb3
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig3"

/obj/structure/flora/small/trailrockb4
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig4"

/obj/structure/flora/small/trailrockb5
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig5"

/obj/structure/flora/small/lavarock1
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "lavarocks1"

/obj/structure/flora/small/lavarock2
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "lavarocks2"

/obj/structure/flora/small/lavarock3
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "lavarocks3"

/obj/structure/flora/small/busha1
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha1"

/obj/structure/flora/small/busha2
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha2"

/obj/structure/flora/small/busha3
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha3"

/obj/structure/flora/small/bushb1
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb1"

/obj/structure/flora/small/bushb2
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb2"

/obj/structure/flora/small/bushb3
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb3"

/obj/structure/flora/small/bushc1
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc1"

/obj/structure/flora/small/bushc2
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc2"

/obj/structure/flora/small/bushc3
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc3"

/obj/structure/flora/small/grassa1
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa1"

/obj/structure/flora/small/grassa2
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa2"

/obj/structure/flora/small/grassa3
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa3"

/obj/structure/flora/small/grassa4
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa4"

/obj/structure/flora/small/grassa5
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa5"

/obj/structure/flora/small/grassb1
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb1"

/obj/structure/flora/small/grassb2
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb2"

/obj/structure/flora/small/grassb3
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb3"

/obj/structure/flora/small/grassb4
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb4"

/obj/structure/flora/small/grassb5
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb5"

/obj/structure/flora/big/bush1
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush1"

/obj/structure/flora/big/bush2
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush2"

/obj/structure/flora/big/bush3
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush3"

/obj/structure/flora/big/rocks1
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks1"

/obj/structure/flora/big/rocks2
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks2"

/obj/structure/flora/big/rocks3
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks3"




/obj/structure/flora/pumpkin
	name = "pumpkin"
	icon = 'icons/obj/flora/pumpkins.dmi'
	desc = "A healthy, fat pumpkin. It looks as if it was freshly plucked from its vines and shows no signs of decay."
	icon_state = "decor-pumpkin"

/obj/effect/landmark/carved_pumpkin_spawn
	name = "jack o'lantern spawn"
	icon = 'icons/obj/flora/pumpkins.dmi'
	icon_state = "spawner-jackolantern"

/obj/effect/landmark/carved_pumpkin_spawn/New()
    var/new_pumpkin = pick(
		prob(70);/obj/structure/flora/pumpkin,
        prob(60);/obj/structure/flora/pumpkin/carved,
        prob(30);/obj/structure/flora/pumpkin/carved/scream,
        prob(30);/obj/structure/flora/pumpkin/carved/girly,
        prob(10);/obj/structure/flora/pumpkin/carved/owo)
    new new_pumpkin(src.loc)
    ..()

/obj/structure/flora/pumpkin/carved
	name = "jack o'lantern"
	desc = "A fat, freshly picked pumpkin. This one has a face carved into it! This one has develishly evil-looking eyes and a grinning mouth more than big enough for a very small person to hide in."
	icon_state = "decor-jackolantern"

/obj/structure/flora/pumpkin/carved/scream
	desc = "A fat, freshly picked pumpkin. This one has a face carved into it! This one has rounded eyes looking in completely opposite directions and a wide mouth, forever frozen in a silent scream. It looks ridiculous, actually."
	icon_state = "decor-jackolantern-scream"

/obj/structure/flora/pumpkin/carved/girly
	desc = "A fat, freshly picked pumpkin. This one has a face carved into it! This one has neatly rounded eyes topped with what appear to be cartoony eyelashes, completed with what seems to have been the carver's attempt at friendly, toothy smile. The mouth is easily the scariest part of its face."
	icon_state = "decor-jackolantern-girly"

/obj/structure/flora/pumpkin/carved/owo
	desc = "A fat, freshly picked pumpkin. This one has a face carved into it! This one has large, round eyes and a squiggly, cat-like smiling mouth. Its pleasantly surprised expression seems to suggest that the pumpkin has noticed something about you."
	icon_state = "decor-jackolantern-owo"

/obj/structure/flora/rock
	name = "rock"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "basalt1"
	desc = "A dull and sturdy rock."
	anchored = 1

/obj/structure/flora/rock/variant1
	name = "rock"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "basalt2"
	desc = "A dull and sturdy rock."
	anchored = 1

/obj/structure/flora/rock/variant2
	name = "rock"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "basalt3"
	desc = "A dull and sturdy rock."
	anchored = 1