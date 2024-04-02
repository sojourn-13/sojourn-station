/*
////////////////////////////
/  =--------------------=  /
/  == Ear Definitions  ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/ears
	name = "Hide Ears"
	icon = 'icons/mob/sprite_accessory/ears.dmi'
	colored_layers = 0 // If set to 1, will apply color to the base sprite using the blend variable's mode.
	var/desc = "You should not see this..."

/datum/sprite_accessory/ears/antlers
	name = "Antlers"
	desc = ""
	icon_state = "antlers"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlers_e
	name = "Antlers, With Ears"
	desc = ""
	icon_state = "cow-nohorns"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlers_a
	name = "Antlers, With Ears alt"
	desc = ""
	icon_state = "elk-ears"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlers_small
	name = "Antlers, Small"
	desc = ""
	icon_state = "smallantlers"
	colored_layers = 1
	blend = ICON_MULTIPLY

//Icons form Occult sprited By Zenitheevee (I think)
/datum/sprite_accessory/ears/antlers_marked_small_occultported
	name = "Antlers Mark, Small"
	desc = ""
	icon_state = "antlermarksmall"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlermarksmall_head_occultported
	name = "Antlers Mark, Small Head"
	desc = ""
	icon_state = "antlermarksmall-head"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlers_mark_occultported
	name = "Antlers Mark"
	desc = ""
	icon_state = "antlermark"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/antlermark_head_occultported
	name = "Antlers Mark, Head"
	desc = ""
	icon_state = "antlermark-head"
	colored_layers = 1
	blend = ICON_MULTIPLY


//End of Occult sprited things (That im aware of)

/datum/sprite_accessory/ears/antlers_smallwithears
	name = "Antlers, Small With Ears"
	desc = ""
	icon_state = "smallantlers"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/bearhc
	name = "Bear Ears"
	desc = ""
	icon_state = "bear"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/bear_small
	name = "Bear Ears, Small"
	desc = ""
	icon_state = "smallbear"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/antennae_hc
	name = "Bee Antennae"
	desc = ""
	icon_state = "antennae"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/bunnyhc
	name = "Bunny Ears"
	desc = ""
	icon_state = "bunny"
	colored_layers = 1
	blend = ICON_MULTIPLY

//Skyrats ported
/*
/datum/sprite_accessory/ears/bunnyhc_alt
	name = "Bunny Ears, Alt"
	desc = ""
	icon_state = "bunny_alt"
	colored_layers = 3 //Looks like 2 is intented
	blend = ICON_MULTIPLY
*/
/datum/sprite_accessory/ears/bunny_floppy
	name = "Bunny Ears, Floppy"
	desc = ""
	icon_state = "bunny_floppy"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/bunny_swooped
	name = "Bunny Ears, Swooped"
	desc = ""
	icon_state = "bunny_swooped"
	colored_layers = 1
	blend = ICON_MULTIPLY
/*
//Skyrats ported
/datum/sprite_accessory/ears/bunny_rabbet
	name = "Bunny Ears, Rabbet"
	desc = ""
	icon_state = "rabbit_lop"
	colored_layers = 2
	blend = ICON_MULTIPLY

//Skyrats ported
/datum/sprite_accessory/ears/bunny_rabbet_alt
	name = "Bunny Ears, Rabbet Alt"
	desc = ""
	icon_state = "rabbit"
	colored_layers = 6
	blend = ICON_MULTIPLY
*/
/datum/sprite_accessory/ears/bnnuy
	name = "Bunny Ears, Short"
	desc = ""
	icon_state = "bnnuy"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/bnnuy_long
	name = "Bunny Ears, Long"
	desc = ""
	icon_state = "bnnuy_long"
	colored_layers = 1
	blend = ICON_MULTIPLY
/*
//Skyrats ported
/datum/sprite_accessory/ears/bnnuy_long_est
	name = "Bunny Ears, Tall"
	desc = ""
	icon_state = "bunny_tall"
	colored_layers = 4 //Looks like 3 is intented
	blend = ICON_MULTIPLY
*/
/datum/sprite_accessory/ears/jackalope
	name = "Jackalope ears and horns"
	desc = ""
	icon_state = "jackalope"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/jackalopeh
	name = "Jackalope horns"
	desc = ""
	icon_state = "jackalopehorns" //wouldn't these just be deer antlers?
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/caprahorns
	name = "Caprine Horns"
	desc = ""
	icon_state = "caprahorns"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/antennae_citheronia
	name = "Citheronia Antennae"
	desc = ""
	icon_state = "lilimoth_antennae"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/cowc
	name = "Cow Horns"
	desc = ""
	icon_state = "cowearshc"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/cowcalt
	name = "Cow Horns Alt"
	icon_state = "cowearshcalt"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/cow_nohorns
	name = "Cow Horns, Cut"
	desc = ""
	icon_state = "ncowearshc"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/antennae_curly
	name = "Curly Antennae"
	desc = ""
	icon_state = "curly_bug"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/deer
	name = "Deer Ears"
	desc = ""
	icon_state = "deer"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/demon_horns1_c
	name = "Demon Horns"
	desc = ""
	icon_state = "demon-horns1_c"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/demon_horns2
	name = "Demon Horns, Outward"
	desc = ""
	icon_state = "demon-horns2"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/fluffdragon
	name = "Dragon Ears"
	desc = ""
	icon_state = "miria-fluffdragonears"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/dragon_horns
	name = "Dragon Horns"
	desc = ""
	icon_state = "dragon-horns"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/elfs
	name = "Elven Ears"
	desc = ""
	icon_state = "elfs"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/fenearshc
	name = "Fennec Ears"
	desc = ""
	icon_state = "fenearshc"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/higherlanderhc
	name = "Fox Ears"
	desc = ""
	icon_state = "foxearshc"
	colored_layers = 1
	blend = ICON_MULTIPLY
/*
//Skyrats ported
/datum/sprite_accessory/ears/higherlanderhc_alt
	name = "Fox Ears Alt"
	desc = ""
	icon_state = "fox"
	colored_layers = 4
	blend = ICON_MULTIPLY
*/
/datum/sprite_accessory/ears/frills_aquatic
	name = "Frills, Aquatic"
	desc = ""
	icon_state = "frills_aqua"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/drake
	name = "Frills, Drake"
	desc = ""
	icon_state = "drake"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/frills_short
	name = "Frills, Short"
	desc = ""
	icon_state = "frills_short"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/frills_simple
	name = "Frills, Simple"
	desc = ""
	icon_state = "frills_simple"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/frills_big
	name = "Frills, Big"
	desc = ""
	icon_state = "frills_big"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/pharoah
	name = "Hound Ears"
	desc = ""
	icon_state = "shock"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/jagged
	name = "Jagged Ears"
	desc = ""
	icon_state = "zears"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/kitsunetritail
	name = "Kitsune Ears"
	desc = ""
	icon_state = "rosey"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/kitsune
	name = "Kitsune Ears, Speckled"
	desc = ""
	icon_state = "molenar-kitsune"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/kittyhc
	name = "Feline Ears"
	desc = ""
	icon_state = "kitty"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/kittyalt
	name = "Alternate Feline Ears"
	desc = ""
	icon_state = "cat_alt"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/lizard
	name = "Lizard Horns"
	desc = ""
	icon_state = "molenar-deathclaw"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/ram
	name = "Ram Horns"
	desc = ""
	icon_state = "ram-horns"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/sheep
	name = "Sheep ears"
	desc = ""
	icon_state = "sheep"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/mousehc
	name = "Mouse Ears"
	desc = ""
	icon_state = "mouse"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/oni_h1_c
	name = "Oni Horns"
	desc = ""
	icon_state = "oni-h1_c"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/otie
	name = "Doberman Ears"
	desc = ""
	icon_state = "otie"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/panda
	name = "Panda Ears"
	desc = ""
	icon_state = "panda"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/naramad
	name = "Naramad Ears"
	icon_state = "serg_plain_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/sleek
	name = "Sleek Ears"
	desc = ""
	icon_state = "sleek"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/squirrelhc
	name = "Squirrel Ears"
	desc = ""
	icon_state = "squirrel"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/robot
	name = "Synth Antennae"
	desc = ""
	icon_state = "robot_dual"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/left_robot
	name = "Synth Antennae, Left"
	desc = ""
	icon_state = "robot_left"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/right_robot
	name = "Synth Antennae, Right"
	desc = ""
	icon_state = "robot_right"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shforward
	name = "Sablekyne Large Horns"
	desc = ""
	icon_state = "sh_forward"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shcurled
	name = "Sablekyne Curled Horns"
	desc = ""
	icon_state = "sh_curled"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shcurledS
	name = "Sablekyne Curled Horns (small)"
	desc = ""
	icon_state = "sh_curledS"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shsmall
	name = "Sablekyne Small Horns 1"
	desc = ""
	icon_state = "sh_small"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shsmall2
	name = "Sablekyne Small Horns 2"
	desc = ""
	icon_state = "sh_small2"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shsmall3
	name = "Sablekyne Small Horns 3"
	desc = ""
	icon_state = "sh_small3"
	colored_layers = 1
	blend = ICON_MULTIPLY

/*
/datum/sprite_accessory/ears/teshari
	name = "Teshari Fluff"
	desc = ""
	icon_state = "teshari"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/tesharilow
	name = "Teshari Fluff, Lower Ear"
	desc = ""
	icon_state = "tesharilow"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/tesharihigh
	name = "Teshari Fluff, Upper Ear"
	desc = ""
	icon_state = "tesharihigh"
	colored_layers = 2
	blend = ICON_MULTIPLY
*/

/datum/sprite_accessory/ears/tigress
	name = "Tigress Ears"
	desc = ""
	icon_state = "tigressears"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/vulp
	name = "Vulpkanin Ears"
	desc = ""
	icon_state = "vulp"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/wolfhc
	name = "Wolf Ears"
	desc = ""
	icon_state = "wolf"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/wolfhc_tall
	name = "Wolf Ears Taller"
	desc = ""
	icon_state = "bigwolf"
	colored_layers = 3
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/axolotl
	name = "Axolotl Gills"
	desc = ""
	icon_state = "axolotl"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/liftedhorns
	name = "Lifted Horns"
	desc = ""
	icon_state = "liftedhorns"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/newcurlyhorn
	name = "Bulky Curly Horn"
	desc = ""
	icon_state = "newcurlyhorn"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/newdragonhorns
	name = "Bulky Dragon Horn"
	desc = ""
	icon_state = "newdragonhorns"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shstabbers
    name = "Sablekyne Stabber Horns"
    desc = ""
    icon_state = "sh_stabbers"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shdogma
    name = "Sablekyne Dogma Horns"
    desc = ""
    icon_state = "sh_dogma"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shoutstretched
    name = "Sablekyne Outstretched Horns"
    desc = ""
    icon_state = "sh_outstretched"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shhalo
    name = "Sablekyne Halo Horns"
    desc = ""
    icon_state = "sh_halo"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shupwards
    name = "Sablekyne Upward Horns"
    desc = ""
    icon_state = "sh_upwards"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shgreathorns
    name = "Sablekyne Great Horns"
    desc = ""
    icon_state = "sh_greathorns"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shbuns
    name = "Sablekyne Bun Horns"
    desc = ""
    icon_state = "sh_bunhorns"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shmurauder
    name = "Sabelkyne Murauder Horns"
    desc = ""
    icon_state = "sh_murauder"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/shfaceguard
    name = "Sabelkyne Faceguard Horns"
    desc = ""
    icon_state = "sh_faceguard"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/uni
    name = "Uni-Horn"
    desc = ""
    icon_state = "uni-horn"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/stabbers
    name = "Stabber Horns (Colorable)"
    desc = ""
    icon_state = "stabbers"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/billbery
    name = "Billberry Horns"
    desc = ""
    icon_state = "billberry"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/billberyears
    name = "Billberry Horns (Ears)"
    desc = ""
    icon_state = "billberry_ears"
    colored_layers = 2
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/elfslonger
    name = "Long Elf Ears"
    desc = ""
    icon_state = "elfs_longer"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/elfswider
    name = "Wide Elf Ears"
    desc = ""
    icon_state = "elfs_wide"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/elfsbroad
    name = "Broad Elf Ears"
    desc = ""
    icon_state = "elfs_broad"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/elfsribbons
    name = "Ribbon Elf Ears"
    desc = ""
    icon_state = "elfs_ribbons"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/goblinmassive
    name = "Massive Goblin Ears"
    desc = ""
    icon_state = "goblin-massive"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/goblindroopy
    name = "Droopy Goblin Ears"
    desc = ""
    icon_state = "goblin-droopy"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/goblinperky
    name = "Perky Goblin Ears"
    desc = ""
    icon_state = "goblin-perky"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/goblinfluted
    name = "Fluted Goblin Ears"
    desc = ""
    icon_state = "goblin-fluted"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/goblintorn
    name = "Torn Goblin Ears"
    desc = ""
    icon_state = "goblin-torn"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/oxhorns
    name = "Ox Horns"
    desc = ""
    icon_state = "upwardshorns"
    colored_layers = 1
    blend = ICON_MULTIPLY

/datum/sprite_accessory/ears/sheep_horn
    name = "Sheep Horn"
    desc = ""
    icon_state = "sheep_horn"
    colored_layers = 2
    blend = ICON_MULTIPLY
