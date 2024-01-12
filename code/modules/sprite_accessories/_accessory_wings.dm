/*
////////////////////////////
/  =--------------------=  /
/  == Wing Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/wings
	name = "Hide Wings"
	icon = 'icons/mob/sprite_accessory/wings.dmi'
	colored_layers = 0 //Set to 1 to enable coloration using the tail color.
	extra_overlay // Use remaining layers from another sprite name rather than the original.
	var/clothing_can_hide = 1 // If true, clothing with HIDETAIL hides it. If the clothing is bulky enough to hide a tail, it should also hide wings.
	// var/show_species_tail = 1 // Just so // TODO - Seems not needed ~Leshana
	var/desc = "You should not see this..."
	var/ani_state // State when flapping/animated
	var/extra_overlay_w // Flapping state for extra overlay
	var/layers = 0

/datum/sprite_accessory/wings/bat_color
	name = "Bat Wings"
	desc = ""
	icon_state = "bat"
	colored_layers = 2

/datum/sprite_accessory/wings/bee
	name = "Bee Wings"
	desc = ""
	icon_state = "bee"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/butterfly
	name = "Butterfly Wings"
	desc = ""
	icon_state = "butterfly"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/cyberdragon
	name = "Cybernetic Wings"
	desc = ""
	icon_state = "cyber"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/demon
	name = "Demon Wings"
	desc = ""
	icon_state = "demon"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/dragon
	name = "Dragon Wings"
	desc = ""
	icon_state = "dragon"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/dragonfold
	name = "Dragon Wings Folded"
	desc = ""
	icon_state = "dragonfold"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/dragonfly
	name = "Dragonfly Wings"
	desc = ""
	icon_state = "dragonfly"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/fantail
	name = "Fantail Wings"
	desc = ""
	icon_state = "fantail"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/feathered
	name = "Feathered Wings, Small"
	desc = ""
	icon_state = "feathered"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/feathered_medium
	name = "Feathered Wings, Medium"
	desc = ""
	icon_state = "feathered3"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/featheredlarge
	name = "Feathered Wings, Large"
	desc = ""
	icon_state = "feathered2"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/gazer
	name = "Gazer Eyestalks"
	desc = ""
	icon_state = "eyestalk"
	colored_layers = 2
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/harpywings
	name = "Harpy Wings"
	desc = ""
	icon_state = "harpy"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_burned
	name = "Moth Wings, Burned"
	desc = ""
	icon_state = "moth_burned"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_citheronia
	name = "Moth Wings, Citheronia"
	desc = ""
	icon_state = "citheronia_wings"

/datum/sprite_accessory/wings/moth_deathhead
	name = "Moth Wings, Deathhead"
	desc = ""
	icon_state = "moth_deathhead"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_firewatch
	name = "Moth Wings, Firewatch"
	desc = ""
	icon_state = "moth_firewatch"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_gothic
	name = "Moth Wings, Gothic"
	desc = ""
	icon_state = "moth_gothic"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_lover
	name = "Moth Wings, Lover"
	desc = ""
	icon_state = "moth_lover"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_monarch
	name = "Moth Wings, Monarch"
	desc = ""
	icon_state = "moth_monarch"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_moonfly
	name = "Moth Wings, Moonfly"
	desc = ""
	icon_state = "moth_moonfly"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_poison
	name = "Moth Wings, Poison"
	desc = ""
	icon_state = "moth_poison"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_ragged
	name = "Moth Wings, Ragged"
	desc = ""
	icon_state = "moth_ragged"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_red
	name = "Moth Wings, Red"
	desc = ""
	icon_state = "moth_red"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/Moth_royal_colorable
	name = "Moth Wings, Royal"
	desc = ""
	icon_state = "Moth_royal_colorable"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_royal_unfluff
	name = "Moth Wings, Royal Unfluffed"
	desc = ""
	icon_state = "moth_royal_unfluff"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_snowy
	name = "Moth Wings, Snowy"
	desc = ""
	icon_state = "moth_snowy"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_white
	name = "Moth Wings, White"
	desc = ""
	icon_state = "moth_white"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_full
	name = "Moth Wings, Worker"
	desc = ""
	icon_state = "moth_worker"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_plain
	name = "Moth Wings, Plain"
	desc = ""
	icon_state = "moth_plain"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spider_legs
	name = "Spider Legs"
	desc = ""
	icon_state = "spider-legs"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_aquatic
	name = "Spines, Aquatic"
	desc = ""
	icon_state = "spines_aqua"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_long
	name = "Spines, Long"
	desc = ""
	icon_state = "spines_long"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_long_membrane
	name = "Spines, Long Membrane"
	desc = ""
	icon_state = "spines_long_membrane"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_short
	name = "Spines, Short"
	desc = ""
	icon_state = "spines_short"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_short_membrane
	name = "Spines, Short Membrane"
	desc = ""
	icon_state = "spines_short_membrane"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/succubus
	name = "Succubus Wings"
	desc = ""
	icon_state = "succubus"
	colored_layers = 3
