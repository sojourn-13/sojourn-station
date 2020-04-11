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
	icon_state = "bat-color"
	colored_layers = 1

/datum/sprite_accessory/wings/bee
	name = "Bee Wings"
	desc = ""
	icon_state = "beewings"

/datum/sprite_accessory/wings/citheroniamoth
	name = "Citheronia Wings"
	desc = ""
	icon_state = "citheronia_wings"

/datum/sprite_accessory/wings/cyberdragon
	name = "Cyberdragon Wings"
	desc = ""
	icon_state = "cyberdragon_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/cyberdoe
	name = "Cyberdoe Wings"
	desc = ""
	icon_state = "cyberdoe_s"

/datum/sprite_accessory/wings/demon
	name = "Demon Wings"
	desc = ""
	icon_state = "sepulchre_wings"

/datum/sprite_accessory/wings/devil
	name = "Devil Wings"
	desc = ""
	icon_state = "bat-red"

/datum/sprite_accessory/wings/dragonfly
	name = "Dragonfly Wings"
	desc = ""
	icon_state = "dragonfly"
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

/datum/sprite_accessory/wings/fluffdragon
	name = "Fluffdragon Wings"
	desc = ""
	icon_state = "miria-fluffdragontail"

/datum/sprite_accessory/wings/gazer
	name = "Gazer Eyestalks"
	desc = ""
	icon_state = "liquidfirefly-eyestalks"

/datum/sprite_accessory/wings/greentaj
	name = "Green Wings"
	desc = ""
	icon_state = "scree-wings"

/datum/sprite_accessory/wings/harpywings
	name = "Harpy Wings"
	desc = ""
	icon_state = "harpywings"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/mothc
	name = "Moth Wings"
	desc = ""
	icon_state = "moth"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/Moth_royal_colorable
	name = "Moth Wings"
	desc = ""
	icon_state = "Moth_royal_colorable"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth_full
	name = "Moth Wings, With Antenna"
	desc = ""
	icon_state = "moth_full"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/nevrean
	name = "Nevrean Wings/Fantail"
	desc = ""
	icon_state = "nevrean_s"
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
