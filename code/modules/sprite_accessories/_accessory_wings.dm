/*
////////////////////////////
/  =--------------------=  /
/  == Wing Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/wings
	name = "You should not see this..."
	icon = 'icons/mob/sprite_accessory/wings.dmi'
	colored_layers = 0 //Set to 1 to enable coloration using the tail color.
	extra_overlay // Use remaining layers from another sprite name rather than the original.
	var/clothing_can_hide = 1 // If true, clothing with HIDETAIL hides it. If the clothing is bulky enough to hide a tail, it should also hide wings.
	// var/show_species_tail = 1 // Just so // TODO - Seems not needed ~Leshana
	var/desc = "You should not see this..."
	var/ani_state // State when flapping/animated
	var/extra_overlay_w // Flapping state for extra overlay
	var/layers = 0

/datum/sprite_accessory/wings/shock //Unable to split the tail from the wings in the sprite, so let's just classify it as wings.
	name = "pharoah hound tail (Shock Diamond)"
	desc = ""
	icon_state = "shock"
	ckeys_allowed = list("icowom")

/datum/sprite_accessory/wings/featheredlarge //Made by Natje!
	name = "large feathered wings (colorable)"
	desc = ""
	icon_state = "feathered2"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spider_legs //Not really /WINGS/ but they protrude from the back, kinda. Might as well have them here.
	name = "spider legs"
	desc = ""
	icon_state = "spider-legs"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/moth
	name = "moth wings"
	desc = ""
	icon_state = "moth"

/datum/sprite_accessory/wings/mothc
	name = "moth wings, colorable"
	desc = ""
	icon_state = "moth"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/citheroniamoth
	name = "citheronia wings"
	desc = ""
	icon_state = "citheronia_wings"
	ckeys_allowed = list("kira72")

/datum/sprite_accessory/wings/feathered
	name = "feathered wings, colorable"
	desc = ""
	icon_state = "feathered"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/feathered_medium
	name = "medium feathered wings, colorable" // Keekenox made these feathery things with a little bit more shape to them than the other wings. They are medium sized wing boys.
	desc = ""
	icon_state = "feathered3"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/bat_black
	name = "bat wings, black"
	desc = ""
	icon_state = "bat-black"

/datum/sprite_accessory/wings/bat_color
	name = "bat wings, colorable"
	desc = ""
	icon_state = "bat-color"
	colored_layers = 1

/datum/sprite_accessory/wings/bat_red
	name = "bat wings, red"
	desc = ""
	icon_state = "bat-red"

/datum/sprite_accessory/wings/harpywings
	name = "harpy wings, colorable"
	desc = ""
	icon_state = "harpywings"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/feathered
	name = "feathered wings, colorable"
	desc = ""
	icon_state = "feathered"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/beewings
	name = "bee wings"
	desc = ""
	icon_state = "beewings"

/datum/sprite_accessory/wings/sepulchre
	name = "demon wings (Sepulchre)"
	desc = ""
	icon_state = "sepulchre_wings"
	ckeys_allowed = list("sepulchre")

/datum/sprite_accessory/wings/miria_fluffdragon
	name = "fluffdragon wings (Miria Masters)"
	desc = ""
	icon_state = "miria-fluffdragontail"
	ckeys_allowed = list("miriamasters")

/datum/sprite_accessory/wings/scree
	name = "green taj wings (Scree)"
	desc = ""
	icon_state = "scree-wings"
	ckeys_allowed = list("scree")

/datum/sprite_accessory/wings/liquidfirefly_gazer //I g-guess this could be considered wings?
	name = "gazer eyestalks"
	desc = ""
	icon_state = "liquidfirefly-eyestalks"
	//ckeys_allowed = list("liquidfirefly","seiga") //At request.

/datum/sprite_accessory/wings/moth_full
	name = "moth antenna and wings"
	desc = ""
	icon_state = "moth_full"

/datum/sprite_accessory/wings/kerena
	name = "wingwolf wings (Kerena)"
	desc = ""
	icon_state = "kerena-wings"
	ckeys_allowed = list("somekindofpony")

/datum/sprite_accessory/wings/snag
	name = "xenomorph backplate"
	desc = ""
	icon_state = "snag-backplate"

/datum/sprite_accessory/wings/nevrean
	name = "nevrean wings/fantail"
	desc = ""
	icon_state = "nevrean_s"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_short
	name = "spines, short, colorable"
	desc = ""
	icon_state = "spines_short"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_short_membrane
	name = "spines, short membrane, colorable"
	desc = ""
	icon_state = "spines_short_membrane"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_long
	name = "spines, long, colorable"
	desc = ""
	icon_state = "spines_long"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_long_membrane
	name = "spines, long membrane, colorable"
	desc = ""
	icon_state = "spines_long_membrane"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/spines_aquatic
	name = "spines, aquatic, colorable"
	desc = ""
	icon_state = "spines_aqua"
	colored_layers = 1
	blend = ICON_MULTIPLY

/datum/sprite_accessory/wings/Moth_royal
	name = "moth royal"
	desc = ""
	icon_state = "Moth_royal"

/datum/sprite_accessory/wings/Moth_royal_colorable
	name = "moth royal, colorable"
	desc = ""
	icon_state = "Moth_royal_colorable"
	colored_layers = 1
	blend = ICON_MULTIPLY
