/datum/species_form //The default species form is going to be uncolored human.
	var/name = "Unknown"
//	var/name_plural = "Unknowns"
	// Icon/appearance vars.
	var/base = 'icons/mob/human_races/r_human.dmi'    // Normal icon set.
	var/deform = 'icons/mob/human_races/r_def_human.dmi' // Mutated icon set.
	var/face = 'icons/mob/human_face.dmi'

	// Damage overlay and masks.
	var/damage_overlays = 'icons/mob/human_races/masks/dam_human.dmi'
	var/damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	var/blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'

	// Death vars.
	var/meat_type = /obj/item/reagent_containers/food/snacks/meat/human
	var/gibber_type = /obj/effect/gibspawner/human
	var/single_gib_type = /obj/effect/decal/cleanable/blood/gibs
	var/remains_type = /obj/item/remains/xeno
	var/gibbed_anim = "gibbed-h"
	var/dusted_anim = "dust-h"

	//Death Vars
	var/death_sound
	var/death_message = "seizes up and falls limp, their eyes dead and lifeless..."
	var/knockout_message = "has been knocked unconscious!"

	//Up/Downgrades
	var/primitive_form = "Monkey"     // Lesser form, if any (ie. monkey for humans)
	var/greater_form              // Greater form, if any, ie. human for monkeys.

	var/prone_icon                                      // If set, draws this from icobase when mob is prone.
	var/eyes = "eyes_s"                                 // Icon for eyes.
	var/has_floating_eyes = FALSE                       // Eyes will overlay over darkness (glow)
	var/blood_color = "#A10808"                         // Red.
	var/flesh_color = "#FFC896"                         // Pink.
	var/base_color = "#FFE0D0"                          // Used by changelings. Should also be used for icon previes..
	var/tail                                            // Name of tail state in species effects icon file.
	var/tail_animation                                  // If set, the icon to obtain tail animation states from.
	var/form_key = 0       	                            // Used for mob icon cache string.
	var/icon/icon_template                              // Used for mob icon generation for non-32x32 species.
	var/appearance_flags = 0      						// Appearance/display related features.
	var/show_ssd = "fast asleep"

	var/colorable = FALSE
	var/color_mode = ICON_MULTIPLY

	var/playable = FALSE //Whether or not it can be selected in char creation.
	var/variantof = null
	var/list/variants = list()
/*
	How variants work. The base form's variants var will either be set to its own name or null in code.
	At runtime, each variant will seek the base variant. If the base variant it is given has its own variant
*/

	var/icon_fallback = FORM_HUMAN //Set this to fall back on another spritesheet if this one doesn't have the icon_state needed. Use form defines, it'll pull from the global list.
	var/backpack_icon = 		'icons/inventory/back/mob.dmi'
	var/uniform_icon = 			'icons/inventory/uniform/mob.dmi'
	var/gloves_icon = 			'icons/inventory/hands/mob.dmi'
	var/glasses_icon = 			'icons/inventory/eyes/mob.dmi'
	var/ears_icon = 			'icons/inventory/ears/mob.dmi'
	var/shoes_icon = 			'icons/inventory/feet/mob.dmi'
	var/s_store_icon = 			'icons/inventory/on_suit/mob.dmi'
	var/head_icon = 			'icons/inventory/head/mob.dmi'
	var/belt_icon = 			'icons/inventory/belt/mob.dmi'
	var/suit_icon = 			'icons/inventory/suit/mob.dmi'
	var/mask_icon = 			'icons/inventory/face/mob.dmi'
	var/underwear_icon = 		'icons/inventory/underwear/mob.dmi'
	var/misc_icon = 			'icons/mob/mob.dmi'

	//Use these for form_variants of sprites. //TODO make functional.
	//var/form_suffix =			""

	var/list/subforms = null

	//Helper proc that verifies if the current form has a given form as ancestor.
/datum/species_form/proc/has_ancestor(var/ancestor_form, var/start_form = null)
	if(!istext(ancestor_form))
		return FALSE //We don't know what you gave us and we don't care. Alternatively you just did a full loop.
	if(ancestor_form == name)
		return TRUE
	if(!variantof || variantof == name || name == start_form)
		return FALSE
	return GLOB.all_species_form_list[variantof]?:has_ancestor(ancestor_form, start_form ? start_form : name)

/datum/species_form/proc/get_mob_icon(var/slot, var/icon_state)
	var/icon/I
	switch(slot)
		if("misc")    	I = misc_icon
		if("uniform") 	I = uniform_icon
		if("suit")    	I = suit_icon
		if("gloves")  	I = gloves_icon
		if("glasses") 	I = glasses_icon
		if("ears")    	I = ears_icon
		if("mask")    	I = mask_icon
		if("head")    	I = head_icon
		if("shoes")   	I = shoes_icon
		if("belt")    	I = belt_icon
		if("s_store") 	I = s_store_icon
		if("back")    	I = backpack_icon
		/*if("tie")   	I = ties_icon
		if("hidden")  	I = hidden_icon
		if("rig")     	I = rig_back*/
		else
			log_world("##ERROR. Wrong sprite group for mob icon \"[slot]\"")
	if(icon_fallback && (icon_fallback != name) && icon_state && !(icon_state in icon_states(I)))
		var/datum/species_form/F = GLOB.all_species_form_list[icon_fallback]
		if(F)
			I = F.get_mob_icon(slot, icon_state)

	return I

/datum/species_form/proc/get_bodytype()
	return name

//Used to gain the reduced form of something that shouldn't be playable, I guess?
/datum/species_form/proc/get_station_variant()
	return name

/datum/species_form/proc/get_facial_hair_styles(var/gender)
	return GLOB.facial_hair_styles_list

/datum/species_form/proc/get_hair_styles(var/gender)
	return GLOB.hair_styles_list
