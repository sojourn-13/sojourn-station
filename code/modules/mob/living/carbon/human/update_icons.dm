/*
	Global associative list for caching humanoid icons.
	Index format m or f, followed by a string of 0 and 1 to represent bodyparts followed by husk fat hulk skeleton 1 or 0.
	TODO: Proper documentation
	icon_key is [species.race_key][husk][fat][hulk][skeleton]
*/
var/global/list/human_icon_cache = list()
var/global/list/light_overlay_cache = list()

	///////////////////////
	//UPDATE_ICONS SYSTEM//
	///////////////////////
/*
Calling this  a system is perhaps a bit trumped up. It is essentially update_clothing dismantled into its
core parts. The key difference is that when we generate over-lays we do not generate either lying or standing
versions. Instead, we generate both and store them in two fixed-length lists, both using the same list-index
(The indexes are in update_icons.dm): Each list for humans is (at the time of writing) of length 19.
This will hopefully be reduced as the system is refined.

	var/overlays_lying[19]			//For the lying down stance
	var/overlays_standing[19]		//For the standing stance

When we call update_icons, the 'lying' variable is checked and then the appropriate list is assigned to our over-lays!
That in itself uses a tiny bit more memory (no more than all the ridiculous lists the game has already mind you).

On the other-hand, it should be very CPU cheap in comparison to the old system.
In the old system, we updated all our over-lays every life() call, even if we were standing still inside a crate!
or dead!. 25ish over-lays, all generated from scratch every second for every xeno/human/monkey and then applied.
More often than not update_clothing was being called a few times in addition to that! CPU was not the only issue,
all those icons had to be sent to every client. So really the cost was extremely cumulative. To the point where
update_clothing would frequently appear in the top 10 most CPU intensive procs during profiling.

Another feature of this new system is that our lists are indexed. This means we can update specific over-lays!
So we only regenerate icons when we need them to be updated! This is the main saving for this system.

In practice this means that:
	everytime you fall over, we just switch between precompiled lists. Which is fast and cheap.
	Everytime you do something minor like take a pen out of your pocket, we only update the in-hand overlay
	etc...


There are several things that need to be remembered:

>	Whenever we do something that should cause an overlay to update (which doesn't use standard procs
	( i.e. you do something like l_hand = /obj/item/something new(src) )
	You will need to call the relevant update_inv_* proc:
		update_inv_head()
		update_inv_wear_suit()
		update_inv_gloves()
		update_inv_shoes()
		update_inv_w_uniform()
		update_inv_glasses()
		update_inv_l_hand()
		update_inv_r_hand()
		update_inv_belt()
		update_inv_wear_id()
		update_inv_ears()
		update_inv_s_store()
		update_inv_pockets()
		update_inv_back()
		update_inv_handcuffed()
		update_inv_wear_mask()

	All of these are named after the variable they update from. They are defined at the mob/ level like
	update_clothing was, so you won't cause undefined proc runtimes with usr.update_inv_wear_id() if the usr is a
	slime etc. Instead, it'll just return without doing any work. So no harm in calling it for slimes and such.


>	There are also these special cases:
		update_mutations()	//handles updating your appearance for certain mutations.  e.g TK head-glows
		UpdateDamageIcon()	//handles damage over-lays for brute/burn damage //(will rename this when I geta round to it)
		update_body()	//Handles updating your mob's icon to reflect their gender/race/complexion etc
		update_hair()	//Handles updating your hair overlay (used to be update_face, but mouth and
																			...eyes were merged into update_body)
		update_targeted() // Updates the target overlay when someone points a gun at you

>	All of these procs update our overlays_lying and overlays_standing, and then call update_icons() by default.
	If you wish to update several over-lays at once, you can set the argument to 0 to disable the update and call
	it manually:
		e.g.
		update_inv_head(0)
		update_inv_l_hand(0)
		update_inv_r_hand()		//<---calls update_icons()

	or equivillantly:
		update_inv_head(0)
		update_inv_l_hand(0)
		update_inv_r_hand(0)
		update_icons()

>	If you need to update all over-lays you can use regenerate_icons(). it works exactly like update_clothing used to.

>	I reimplimented an old unused variable which was in the code called (coincidentally) var/update_icon
	It can be used as another method of triggering regenerate_icons(). It's basically a flag that when set to non-zero
	will call regenerate_icons() at the next life() call and then reset itself to 0.
	The idea behind it is icons are regenerated only once, even if multiple events requested it.

This system is confusing and is still a WIP. It's primary goal is speeding up the controls of the game whilst
reducing processing costs. So please bear with me while I iron out the kinks. It will be worth it, I promise.
If I can eventually free var/lying stuff from the life() process altogether, stuns/death/status stuff
will become less affected by lag-spikes and will be instantaneous! :3

If you have any questions/constructive-comments/bugs-to-report/or have a massivly devestated butt...
Please contact me on #coderbus IRC. ~Carn x
*/

//Human over-lays Indexes/////////
#define MARKINGS_LAYER			1
#define MUTATIONS_LAYER			2
#define DAMAGE_LAYER			3
#define SURGERY_LAYER			4
#define IMPLANTS_LAYER			5

#define UNDERWEAR_LAYER 		6
#define UNIFORM_LAYER			7
#define ID_LAYER				8
#define SHOES_LAYER				9
#define GLOVES_LAYER			10
#define BELT_LAYER				11
#define SUIT_LAYER				12
#define CUSTOM_TAIL_LAYER		13		//bs12 specific. this hack is probably gonna come back to haunt me
#define GLASSES_LAYER			14
#define BELT_LAYER_ALT			15
#define BACK_LAYER				16
#define SUIT_STORE_LAYER		17
#define HAIR_LAYER				18		//TODO: make part of head layer?
#define L_EAR_LAYER				19
#define R_EAR_LAYER				20
#define FACEMASK_LAYER			21
#define HEAD_LAYER				22
#define CUSTOM_EARS_LAYER		23
#define CUSTOM_WINGS_LAYER		24
#define CUSTOM_TAIL_LAYER_ALT	25	//For Tails that go above Adornments
#define COLLAR_LAYER			26
#define HANDCUFF_LAYER			27
#define LEGCUFF_LAYER			28
#define L_HAND_LAYER			29
#define R_HAND_LAYER			30
#define FIRE_LAYER				31		//If you're on fire
#define BLOCKING_LAYER		    32
#define TOTAL_LAYERS			32
//////////////////////////////////

/mob/living/carbon/human
	var/tmp/list/overlays_standing[TOTAL_LAYERS]
	var/tmp/previous_damage_appearance // store what the body last looked like, so we only have to update it if something changed

//UPDATES OVER-LAYS FROM OVERLAYS_LYING/over-lays_STANDING
//this proc is messy as I was forced to include some old laggy cloaking code to it so that I don't break cloakers
//I'll work on removing that stuff by rewriting some of the cloaking stuff at a later date.
/mob/living/carbon/human/update_icons()
	lying_prev = lying	//so we don't update over-lays for lying/standing unless our stance changes again
//	update_hud()		//TODO: remove the need for this
	cut_overlays()

	if (icon_update)
		icon = stand_icon
		for(var/image/I in overlays_standing)
			add_overlay(I)
		if(form.has_floating_eyes)
			add_overlay(species.get_eyes(src))

	if(lying && !form.prone_icon) //Only rotate them if we're not drawing a specific icon for being prone.
		add_new_transformations(list(
								/datum/transform_type/prone,
								list(/datum/transform_type/modular, list(shift_x = 1, shift_y = -6, flag = HUMAN_PRONE_TRANSFORM, priority = HUMAN_PRONE_TRANSFORM_PRIORITY)))
)
	else
		remove_transformations(list(HUMAN_PRONE_TRANSFORM, PRONE_TRANSFORM))

	. = ..()

	var/list/scale = get_scale()
	animate(
		src,
		transform = matrix().Update(
			scale_x = scale[1],
			scale_y = scale[2],
			rotation = lying ? 90 : 0,
			offset_y = lying ? -6 - default_pixel_z : 16 * (scale[2] - 1)
		),
		time = ANIM_LYING_TIME
	)

/mob/living/carbon/human/proc/get_scale()
	//bastardised bay's code
	var/mob/living/carbon/human/H = src
	var/build_modifier = H.scale_effect
	var/height_modifier = H.scale_effect
	return list(
		(1 + build_modifier * 0.01) * (tf_scale_x || 1),
		(1 + height_modifier * 0.01) * (tf_scale_y || 1)
	)

var/global/list/damage_icon_parts = list()

var/global/list/marking_cache = list()
var/global/list/ears_icon_cache = list()
var/global/list/tail_icon_cache = list()
var/global/list/wings_icon_cache = list()

//DAMAGE over-lays
//constructs damage icon for each organ from mask * damage field and saves it in our over-lays_ lists
/mob/living/carbon/human/UpdateDamageIcon(var/update_icons=1)
	// first check whether something actually changed about damage appearance
	var/damage_appearance = ""

	for(var/obj/item/organ/external/O in organs)
		if(O.is_stump())
			continue
		damage_appearance += O.damage_state

	if(damage_appearance == previous_damage_appearance)
		// nothing to do here
		return

	previous_damage_appearance = damage_appearance

	var/image/standing_image = image(form.damage_overlays, icon_state = "00")

	// blend the individual damage states with our icons
	if(species.blood_color)
		for(var/obj/item/organ/external/O in organs)
			if(O.is_stump())
				continue

			O.update_damstate()
			if(O.damage_state == "00") continue
			var/icon/DI
			var/cache_index = "[O.damage_state]/[O.organ_tag]/[species.blood_color]/[species.get_bodytype()]"
			if(damage_icon_parts[cache_index] == null)
				DI = new /icon(form.damage_overlays, O.damage_state)			// the damage icon for whole human
				DI.Blend(new /icon(form.damage_mask, O.organ_tag), ICON_MULTIPLY)	// mask with this organ's pixels
				DI.Blend(species.blood_color, ICON_MULTIPLY)
				damage_icon_parts[cache_index] = DI
			else
				DI = damage_icon_parts[cache_index]

			standing_image.overlays += DI

	overlays_standing[DAMAGE_LAYER] = standing_image

	if(update_icons)   update_icons()

//BASE MOB SPRITE
/mob/living/carbon/human/proc/update_body(var/update_icons=1)

	appearance_test.Log("ENTED update_body for \"[real_name]\"")

	var/husk_color_mod = rgb(96,88,80)
	var/hulk_color_mod = rgb(48,224,40)

	var/husk = (HUSK in src.mutations)
	var/hulk = (HULK in src.mutations)
	var/skeleton = (SKELETON in src.mutations)

	//Create a new, blank icon for our mob to use.
	if(stand_icon)
		qdel(stand_icon)

	if(!appearance_test.build_body)
		stand_icon = new('icons/mob/human.dmi', "human_[(gender == MALE) ? "m" : "f"]")
		appearance_test.Log("Sprite generation is disabled.")
	else
		stand_icon = new('icons/mob/human.dmi',"blank")
		var/icon_key = ""
		if(appearance_test.cache_sprites)
			icon_key = "[form.get_bodytype()]"
			icon_key += "[husk ? 1 : 0][hulk ? 1 : 0][skeleton ? 1 : 0]"
			if(lip_style)
				icon_key += "[lip_style]"
			else
				icon_key += "nolips"

			for(var/organ_tag in species.has_limbs)
				var/obj/item/organ/external/part = organs_by_name[organ_tag]
				if(isnull(part))
					icon_key += "[organ_tag]Missed"
					continue
				icon_key += "[organ_tag][part.get_cache_key()]"

			appearance_test.Log("Generated key: [icon_key]")

		var/icon/base_icon
		if(appearance_test.cache_sprites && human_icon_cache[icon_key])
			appearance_test.Log("Cached icon found.")
			base_icon = human_icon_cache[icon_key]
		else
			appearance_test.Log("New icon will be generated.")

			//BEGIN CACHED ICON GENERATION.
			base_icon = new('icons/mob/human.dmi',"blank")

			for(var/obj/item/organ/external/part in organs)
				var/icon/temp = part.get_icon(skeleton)
				if(!temp)
					continue
				//That part makes left and right legs drawn topmost and lowermost when human looks WEST or EAST
				//And no change in rendering for other parts (they icon_position is 0, so goes to 'else' part)
				if(part.icon_position&(LEFT|RIGHT))
					var/icon/temp2 = new('icons/mob/human.dmi',"blank")
					temp2.Insert(new/icon(temp,dir=NORTH),dir=NORTH)
					temp2.Insert(new/icon(temp,dir=SOUTH),dir=SOUTH)
					if(!(part.icon_position & LEFT))
						temp2.Insert(new/icon(temp,dir=EAST),dir=EAST)
					if(!(part.icon_position & RIGHT))
						temp2.Insert(new/icon(temp,dir=WEST),dir=WEST)
					base_icon.Blend(temp2, ICON_OVERLAY)
					if(part.icon_position & LEFT)
						temp2.Insert(new/icon(temp,dir=EAST),dir=EAST)
					if(part.icon_position & RIGHT)
						temp2.Insert(new/icon(temp,dir=WEST),dir=WEST)
					base_icon.Blend(temp2, ICON_UNDERLAY)
				else
					base_icon.Blend(temp, ICON_OVERLAY)

			if(!skeleton)
				if(husk)
					base_icon.ColorTone(husk_color_mod)
				else if(hulk)
					var/list/tone = ReadRGB(hulk_color_mod)
					base_icon.MapColors(rgb(tone[1],0,0),rgb(0,tone[2],0),rgb(0,0,tone[3]))

			//Handle husk overlay.
			if(husk && ("overlay_husk" in icon_states(form.base)))
				var/icon/mask = new(base_icon)
				var/icon/husk_over = new(form.base,"overlay_husk")
				mask.MapColors(0,0,0,1, 0,0,0,1, 0,0,0,1, 0,0,0,1, 0,0,0,0)
				husk_over.Blend(mask, ICON_ADD)
				base_icon.Blend(husk_over, ICON_OVERLAY)

		if(appearance_test.cache_sprites)
			human_icon_cache[icon_key] = base_icon

		//END CACHED ICON GENERATION.
		stand_icon.Blend(base_icon,ICON_OVERLAY)

	//ears, wings and tail
	update_marking(0)
	update_ears(0)
	update_tail(0)
	update_wings(0)

	appearance_test.Log("EXIT update_body()")
	if(update_icons)
		update_icons()

//UNDERWEAR OVERLAY

/mob/living/carbon/human/proc/update_underwear(var/update_icons=1)
	overlays_standing[UNDERWEAR_LAYER] = null

	if(form.appearance_flags & HAS_UNDERWEAR)
		var/icon/underwear = new/icon(get_gender_icon(gender, "underwear"), "blank")
		for(var/entry in worn_underwear)
			var/obj/item/underwear/UW = entry
			var/icon/I = new /icon(get_gender_icon(gender, "underwear"), UW.icon_state)
			if(UW.color)
				I.Blend(UW.color, ICON_MULTIPLY)
			underwear.Blend(I, ICON_OVERLAY)
		overlays_standing[UNDERWEAR_LAYER] = image(underwear)
	if(update_icons)
		update_icons()

//HAIR OVERLAY
/mob/living/carbon/human/proc/update_hair(var/update_icons=1)
	//Reset our hair
	overlays_standing[HAIR_LAYER]	= null

	var/obj/item/organ/external/head/head_organ = get_organ(BP_HEAD)
	if(!head_organ || head_organ.is_stump() )
		if(update_icons)
			update_icons()
		return

	//masks and helmets can obscure our hair.
	if( (head && (head.flags_inv & BLOCKHAIR)) || (wear_mask && (wear_mask.flags_inv & BLOCKHAIR)))
		if(update_icons)   update_icons()
		return

	//base icons
	var/icon/face_standing = new /icon('icons/mob/hair.dmi',"bald")

	if(f_style && !(wear_mask && (wear_mask.flags_inv & BLOCKFACEHAIR)))
		var/datum/sprite_accessory/facial_hair_style = GLOB.facial_hair_styles_list[f_style]
		if(facial_hair_style && facial_hair_style.species_allowed && (src.species.get_bodytype() in facial_hair_style.species_allowed))
			var/icon/facial_s = new/icon(facial_hair_style.icon, facial_hair_style.icon_state)
			if(facial_hair_style.colored_layers)
				facial_s.Blend(facial_color, ICON_ADD)

			face_standing.Blend(facial_s, ICON_OVERLAY)
			if(head_organ.nonsolid)
				face_standing += rgb(,,,120)


	if(h_style && !(head && (head.flags_inv & BLOCKHEADHAIR)))
		var/icon/grad_s = null
		var/datum/sprite_accessory/hair/hair_style = GLOB.hair_styles_list[h_style]
		if(hair_style && (src.species.get_bodytype() in hair_style.species_allowed))
			var/icon/hair_s = new/icon(hair_style.icon, hair_style.icon_state)
			if(grad_style)
				grad_s = new/icon("icon" = 'icons/mob/hair_gradients.dmi', "icon_state" = hair_gradients_list[grad_style])
				grad_s.Blend(hair_s, ICON_AND)
				grad_s.Blend(grad_color, ICON_ADD)
			if(hair_style.colored_layers)
				hair_s.Blend(hair_color, ICON_ADD)
				if(!isnull(grad_s))
					hair_s.Blend(grad_s, ICON_OVERLAY)

			face_standing.Blend(hair_s, ICON_OVERLAY)
			if(head_organ.nonsolid)
				face_standing += rgb(,,,120)

	overlays_standing[HAIR_LAYER]	= image(face_standing)


	if(update_icons)   update_icons()

/mob/living/carbon/human/update_mutations(var/update_icons=1)

	var/image/standing = image("icon" = 'icons/effects/genetics.dmi')
	var/add_image = 0
	var/g = "m"
	if(gender == FEMALE)	g = "f"
	// DNA2 - Drawing underlays.
	for(var/datum/dna/gene/gene in dna_genes)
		if(!gene.block)
			continue
		if(gene.is_active(src))
			var/underlay=gene.OnDrawUnderlays(src,g,form)
			if(underlay)
				standing.underlays += underlay
				add_image = 1
	for(var/mut in mutations)
		switch(mut)
			if(LASER)
				standing.add_overlay("lasereyes_s")
				add_image = 1
	if(add_image)
		overlays_standing[MUTATIONS_LAYER]	= standing
	else
		overlays_standing[MUTATIONS_LAYER]	= null
	if(update_icons)   update_icons()

/mob/proc/update_implants(var/update_icons = 1)
	return

/mob/living/carbon/human/update_implants(var/update_icons = 1)
	var/image/standing = image('icons/mob/mob.dmi', "blank")
	var/have_icon = FALSE
	for(var/obj/item/implant/I in src)
		if(I.is_external() && I.wearer == src)
			var/image/mob_icon = I.get_mob_overlay(gender, form)
			if(mob_icon)
				standing.add_overlay(mob_icon)
				have_icon = TRUE

	if(have_icon)
		overlays_standing[IMPLANTS_LAYER] = standing
	else
		overlays_standing[IMPLANTS_LAYER] = null

	if(update_icons) update_icons()

//Markings
/mob/living/carbon/human/proc/update_marking(var/update_icons = 1)
	if(QDESTROYING(src))
		return

	overlays_standing[MARKINGS_LAYER] = null

	var/marking_image = get_marking_image()
	if(marking_image)
		overlays_standing[MARKINGS_LAYER] = marking_image
		if(update_icons) update_icons()

/mob/living/carbon/human/proc/get_marking_image()
	if(!body_markings) return
	var/icon/marking_icon
	for(var/markname in body_markings)
		var/datum/sprite_accessory/marking/real_marking = GLOB.body_marking_list[markname]
		var/list/valid_body_parts = list()
		for(var/part in real_marking.body_parts)
			//Eris lacks hands and feet. This code should allow hands and feet.
			//This exists because the sprites are separated over all limbs whereas this codebase doesn't have hands or feet.
			//Apparently chest and groin are considered disembodied, which I otherwise used to exclude severed limbs.
			var/valid = (part in organs_by_name) && organs_by_name[part] && ((part in BP_BASE_PARTS) || organs_by_name[part]:nerve_struck >= 0)
			if(!valid)
				for(var/organ in organs_by_name)
					var/obj/item/organ/external/O = organs_by_name[organ]
					if(O.nerve_struck >= 0 && (part in O.additional_limb_parts))
						valid = TRUE
						break
			if(valid && ("[real_marking.icon_state]-[part]" in icon_states(real_marking.icon)))
				valid_body_parts += part
			CHECK_TICK
		var/icon/specific_marking_icon
		var/cache_key = "[markname]-[valid_body_parts.Join("_")]"
		var/advanced_cache_key = "B*[cache_key]*[body_markings[markname]]*[real_marking.blend]" //The *B is there to prevent collisions.
		cache_key = "A*[cache_key]" //To prevent collisions.
		if(marking_cache[advanced_cache_key]) //Done like this in case the result is null.
			specific_marking_icon = new /icon(marking_cache[advanced_cache_key])
		else
			if(marking_cache[cache_key]) //We have the grey version but not the colored.
				specific_marking_icon = new /icon(marking_cache[cache_key])
			else
				specific_marking_icon = new()
				for(var/part in valid_body_parts)
					var/icon/specific_marking_subicon = icon(real_marking.icon, "[real_marking.icon_state]-[part]")
					specific_marking_subicon.Blend(specific_marking_icon, ICON_UNDERLAY)
					specific_marking_icon = specific_marking_subicon
				marking_cache[cache_key] = new /icon(specific_marking_icon)
			specific_marking_icon.Blend(body_markings[markname], real_marking.blend) //This should be a colour.
			marking_cache[advanced_cache_key] = new /icon(specific_marking_icon)
		if(marking_icon)
			marking_icon.Blend(specific_marking_icon, ICON_OVERLAY)
		else //WARNING: THIS WILL BREAK IF WE EVER USE INCONSISTENT MARKING SIZES
			marking_icon = specific_marking_icon
		CHECK_TICK
	return image(marking_icon)

//Insert Furry Bits
/mob/living/carbon/human/proc/update_ears(var/update_icons = 1)
	if(QDESTROYING(src))
		return

	overlays_standing[CUSTOM_EARS_LAYER] = null
	if(head && head.flags_inv & HIDEEARS)
		if(update_icons) update_icons()
		return


	var/image/ears_image = get_ears_image()
	if(ears_image)
		var/obj/item/organ/external/head = organs_by_name[BP_HEAD]
		ears_image.alpha = head?.nonsolid ? 180 : 255
		overlays_standing[CUSTOM_EARS_LAYER] = ears_image
		if(update_icons) update_icons()

/mob/living/carbon/human/proc/get_ears_image()
	if(!ears) return
	var/cache_key = "[ears.name][ears.colored_layers][ears_colors.Join("", 1, ears.colored_layers+1)]"
	if(ears_icon_cache[cache_key])
		return ears_icon_cache[cache_key]

	var/datum/sprite_accessory/ears/earstype = ears
	var/icon/ears_icon = icon(earstype.icon, earstype.icon_state)
	if(earstype.colored_layers)
		ears_icon.Blend(ears_colors[1], earstype.blend)
	for(var/i = 2, i <= earstype.colored_layers, i++)
		var/icon/extra_overlay = icon(earstype.icon, (earstype.extra_overlay ? earstype.extra_overlay : earstype.icon_state)+"[(i-1)]")
		extra_overlay.Blend(ears_colors[i], earstype.blend)
		ears_icon.Blend(extra_overlay, ICON_OVERLAY)

	var/ears_image = image(ears_icon)
	ears_icon_cache[cache_key] = ears_image
	return ears_image

/mob/living/carbon/human/proc/update_tail(var/update_icons = 1)
	if(QDESTROYING(src))
		return

	overlays_standing[CUSTOM_TAIL_LAYER] = null
	overlays_standing[CUSTOM_TAIL_LAYER_ALT] = null// Technique ripped from VORE, alternate tail layer
	/*
	if(wear_suit && wear_suit.flags_inv & HIDETAIL && !(istype(tail, /datum/sprite_accessory/tail/taur) || wear_suit.flags_inv & HIDETAUR))
		if(update_icons) update_icons()
		return
	*/
	var/active_tail_layer = tail_over ? CUSTOM_TAIL_LAYER_ALT : CUSTOM_TAIL_LAYER
	var/obj/item/organ/external/chest = organs_by_name[BP_TORSO]

	var/image/tail_image = get_tail_image()
	if(tail_image)
		overlays_standing[active_tail_layer] = tail_image
		tail_image.alpha = chest?.nonsolid ? 180 : 255
		if(update_icons) update_icons()

/*	var/species_tail = species.get_tail(src) // Species tail icon_state prefix.

	//This one is actually not that bad I guess.
	if(species_tail && !(wear_suit && wear_suit.flags_inv & HIDETAIL))
		var/icon/tail_s = get_tail_icon()
		overlays_standing[used_tail_layer] = image(icon = tail_s, icon_state = "[species_tail]_s", layer = BODY_LAYER+used_tail_layer) // VOREStation Edit - Alt Tail Layer
		animate_tail_reset()*/

/mob/living/carbon/human/proc/get_tail_image()
	if(!tail) return
	var/cache_key = "[tail.name][tail.colored_layers][tail_colors.Join("", 1, tail.colored_layers+1)]"
	if(tail_icon_cache[cache_key])
		return tail_icon_cache[cache_key]

	var/datum/sprite_accessory/tail/tailtype = tail
	var/icon/tail_icon = icon(tailtype.icon, tailtype.icon_state)
	if(tailtype.colored_layers)
		tail_icon.Blend(tail_colors[1], tailtype.blend)
	for(var/i = 2, i <= tailtype.colored_layers, i++)
		var/icon/extra_overlay = icon(tailtype.icon, (tailtype.extra_overlay ? tailtype.extra_overlay : tailtype.icon_state)+"[(i-1)]")
		extra_overlay.Blend(tail_colors[i], tailtype.blend)
		tail_icon.Blend(extra_overlay, ICON_OVERLAY)
	//if(istype(tailtype, /datum/sprite_accessory/tail/taur)) return image(tail_icon, "pixel_x" = -16)

	var/tail_image = image(tail_icon)
	tail_icon_cache[cache_key] = tail_image
	return tail_image

/mob/living/carbon/human/proc/update_wings(var/update_icons = 1)
	if(QDESTROYING(src))
		return

	overlays_standing[CUSTOM_WINGS_LAYER] = null
	if(wear_suit && wear_suit.flags_inv & HIDEWINGS)
		if(update_icons) update_icons()
		return

	var/obj/item/organ/external/chest = organs_by_name[BP_TORSO]

	var/image/wings_image = get_wings_image()
	if(wings_image)
		overlays_standing[CUSTOM_WINGS_LAYER] = wings_image
		wings_image.alpha = chest?.nonsolid ? 180 : 255
		if(update_icons) update_icons()

mob/living/carbon/human/proc/get_wings_image()
	if(!wings) return
	var/cache_key = "[wings.name][wings.colored_layers][wings_colors.Join("", 1, wings.colored_layers+1)]"
	if(wings_icon_cache[cache_key])
		return wings_icon_cache[cache_key]

	var/datum/sprite_accessory/wings/wingstype = wings
	var/icon/wings_icon = icon(wingstype.icon, wingstype.icon_state)
	if(wingstype.colored_layers)
		wings_icon.Blend(wings_colors[1], wingstype.blend)
	for(var/i = 2, i <= wingstype.colored_layers, i++)
		var/icon/extra_overlay = icon(wingstype.icon, (wingstype.extra_overlay ? wingstype.extra_overlay : wingstype.icon_state)+"[(i-1)]")
		extra_overlay.Blend(wings_colors[i], wingstype.blend)
		wings_icon.Blend(extra_overlay, ICON_OVERLAY)

	var/wings_image = image(wings_icon)
	wings_icon_cache[cache_key] = wings_image
	return wings_image

/* --------------------------------------- */
//For legacy support.
/mob/living/carbon/human/regenerate_icons()
	..()
	if(HasMovementHandler(/datum/movement_handler/mob/transformation) || QDELETED(src))		return

	update_mutations(0)
	update_implants(0)
	update_body(0)
	update_underwear(0)
	update_hair(0)
	update_hud()//Hud Stuff
	update_inv_w_uniform(0)
	update_inv_wear_id(0)
	update_inv_gloves(0)
	update_inv_glasses(0)
	update_inv_ears(0)
	update_inv_shoes(0)
	update_inv_s_store(0)
	update_inv_wear_mask(0)
	update_inv_head(0)
	update_inv_belt(0)
	update_inv_back(0)
	update_inv_wear_suit(0)
	update_inv_r_hand(0)
	update_inv_l_hand(0)
	update_inv_handcuffed(0)
	update_inv_legcuffed(0)
	update_inv_pockets(0)
	update_fire(0)
	update_surgery(0)
	/*update_marking(0)
	update_ears(0)
	update_tail(0)
	update_wings(0)*/
	UpdateDamageIcon()
	update_icons()

/* --------------------------------------- */
#define WORN_LHAND	"_lh"
#define WORN_RHAND	"_rh"
#define WORN_LSTORE	"_ls"
#define WORN_RSTORE "_rs"
#define WORN_SSTORE "_ss"
#define WORN_LEAR 	"_le"
#define WORN_REAR 	"_re"
#define WORN_HEAD 	"_he"
#define WORN_UNDER 	"_un"
#define WORN_SUIT 	"_su"
#define WORN_GLOVES	"_gl"
#define WORN_SHOES	"_sh"
#define WORN_EYES	"_ey"
#define WORN_BELT	"_be"
#define WORN_BACK	"_ba"
#define WORN_ID		"_id"
#define WORN_MASK	"_ma"

// Proc to instantly switch the user's clothing to either male or female version upon being worn
// This is goodbye to a lot of alt style procs on clothing (and crossdressing)

/mob/living/carbon/human/proc/get_gender_icon(var/g = MALE, var/slot)
	var/list/icons = list(
		"uniform"		= (g == MALE) ? 'icons/inventory/uniform/mob.dmi' : 'icons/inventory/uniform/mob_fem.dmi',
		"suit"			= (g == MALE) ? 'icons/inventory/suit/mob.dmi' : 'icons/inventory/suit/mob_fem.dmi',
		"gloves"		= 'icons/inventory/hands/mob.dmi',
		"glasses"		= 'icons/inventory/eyes/mob.dmi',
		"ears"			= 'icons/inventory/ears/mob.dmi',
		"mask"			= 'icons/inventory/face/mob.dmi',
		"hat"			= 'icons/inventory/head/mob.dmi',
		"shoes"			= 'icons/inventory/feet/mob.dmi',
		"misc"			= 'icons/mob/mob.dmi',
		"belt"			= 'icons/inventory/belt/mob.dmi',
		"s_store"		= 'icons/inventory/on_suit/mob.dmi',
		"backpack"		= 'icons/inventory/back/mob.dmi',
		"underwear"		= 'icons/inventory/underwear/mob.dmi'
		)
	return icons[slot]

// Contained sprite gender icons
/mob/living/carbon/human/proc/get_gender_icon_contained(var/g = MALE)
	if (g == FEMALE)
		return "_f"
	else
		return

//vvvvvv UPDATE_INV PROCS vvvvvv

/mob/living/carbon/human/update_inv_w_uniform(var/update_icons=1)
	overlays_standing[UNIFORM_LAYER]	= null
	if(check_draw_underclothing())
		//determine the icon to use
		var/icon/under_icon
		var/under_state = ""

		if(w_uniform.contained_sprite)//Do all the containedsprite stuff in one place
			if(w_uniform.icon_override)
				under_icon = w_uniform.icon_override
			else
				under_icon = w_uniform.icon

			under_state += w_uniform.icon_state + WORN_UNDER + get_gender_icon_contained(gender)

		else if(w_uniform.icon_override)
			under_icon = w_uniform.icon_override
		else
			under_icon = get_gender_icon(gender, "uniform")

		//determine state to use
		if (!under_state)
			if(w_uniform.item_state_slots && w_uniform.item_state_slots[slot_w_uniform_str])
				under_state = w_uniform.item_state_slots[slot_w_uniform_str]
			else if(w_uniform.icon_state)
				under_state = w_uniform.icon_state
			else
				under_state = w_uniform.item_state

		// Rolldowns
		if (istype(w_uniform, /obj/item/clothing/under))//Anti-runtime stuff
			var/obj/item/clothing/under/uniformcheck = w_uniform
			if (uniformcheck.rolldown)//Are we rolled down?
				var/icon/originalicon = icon(under_icon, icon_state = under_state)
				var/icon/rollalpha = icon('icons/inventory/overlays.dmi', icon_state = "rolldown")//If we are, grab the overlay
				originalicon.Blend(rollalpha, ICON_MULTIPLY)//Then apply the transform to the standing icon.
				under_icon = originalicon

		//need to append _s to the icon state for legacy compatibility
		var/image/standing = image(icon = under_icon, icon_state = under_state)
		standing.color = w_uniform.color

		//apply blood overlay
		if(w_uniform.blood_DNA)
			var/image/bloodsies	= image(icon = form.blood_mask, icon_state = "uniformblood")
			bloodsies.color		= w_uniform.blood_color
			standing.add_overlay(bloodsies)

		//accessories
		if (istype(w_uniform, /obj/item/clothing/under))//Prevent runtime errors with unusual objects
			var/obj/item/clothing/under/under = w_uniform
			if(under.accessories.len)
				for(var/obj/item/clothing/accessory/A in under.accessories)
					standing.add_overlay(A.get_mob_overlay())

		overlays_standing[UNIFORM_LAYER]	= standing
	else
		overlays_standing[UNIFORM_LAYER]	= null

	if(update_icons)
		update_icons()

/mob/living/carbon/human/update_inv_wear_id(var/update_icons=1)
	overlays_standing[ID_LAYER]	= null
	if(wear_id)

		if(w_uniform && w_uniform:displays_id)
			if(wear_id.contained_sprite)
				var/image/standing
				if(wear_id.icon_override)
					standing = image("icon" = wear_id.icon_override, "icon_state" = "[icon_state]")

				else
					standing = wear_id.icon

				overlays_standing[ID_LAYER] = standing
			else
				overlays_standing[ID_LAYER]	= image("icon" = 'icons/mob/mob.dmi', "icon_state" = "id")

	BITSET(hud_updateflag, ID_HUD)
	BITSET(hud_updateflag, WANTED_HUD)

	if(update_icons)   update_icons()

/mob/living/carbon/human/update_inv_gloves(var/update_icons=1)
	overlays_standing[GLOVES_LAYER]	= null
	if(check_draw_gloves())
		var/t_state = gloves.icon_state
		if(!t_state)
			t_state = gloves.item_state



		var/image/standing
		if(gloves.contained_sprite)
			var/state = ""
			state += "[gloves.item_state][WORN_GLOVES]"
			if(gloves.icon_override)
				standing = image("icon" = gloves.icon_override, "icon_state" = state)
			else
				standing = image("icon" = gloves.icon, "icon_state" = state)
		else if(gloves.icon_override)
			standing = image(icon = gloves.icon_override, icon_state = t_state)
		else
			standing = image(icon = form.get_mob_icon("gloves"), icon_state = t_state)

		if(gloves.blood_DNA)
			var/image/bloodsies	= image("icon" = form.blood_mask, "icon_state" = "bloodyhands")
			bloodsies.color = gloves.blood_color
			standing.add_overlay(bloodsies)
		if(gloves.color)
			standing.color = gloves.color
		overlays_standing[GLOVES_LAYER]	= standing
	else
		if(blood_DNA)
			var/image/bloodsies	= image("icon" = form.blood_mask, "icon_state" = "bloodyhands")
			bloodsies.color = hand_blood_color
			overlays_standing[GLOVES_LAYER]	= bloodsies
	if(update_icons)
		update_icons()


/mob/living/carbon/human/update_inv_glasses(var/update_icons=1)
	overlays_standing[GLASSES_LAYER] = null
	if(check_draw_glasses())
		if(glasses.contained_sprite)
			var/state = ""
			state += "[glasses.item_state][WORN_EYES]"

			if(glasses.icon_override)
				overlays_standing[GLASSES_LAYER] = image("icon" = glasses.icon_override, "icon_state" = state)
			else
				overlays_standing[GLASSES_LAYER] = image("icon" = glasses.icon, "icon_state" = state)

		else if (glasses.icon_override)
			overlays_standing[GLASSES_LAYER] = image(icon = glasses.icon_override,   icon_state = glasses.icon_state)

		else
			overlays_standing[GLASSES_LAYER] = image(icon = form.get_mob_icon("glasses"), icon_state = glasses.icon_state)

	if(update_icons)   update_icons()


/mob/living/carbon/human/update_inv_ears(var/update_icons=1)
	overlays_standing[L_EAR_LAYER] = null
	overlays_standing[R_EAR_LAYER] = null

	if (!check_draw_ears())
		if(update_icons)   update_icons()
		return

	else
		if(l_ear)
			var/t_type = l_ear.icon_state
			if(l_ear.contained_sprite)
				t_type = ""
				t_type += "[l_ear.item_state][WORN_LEAR]"
				if(l_ear.icon_override)
					overlays_standing[L_EAR_LAYER] = image(icon = l_ear.icon_override, icon_state = t_type)
				else
					overlays_standing[L_EAR_LAYER] = image(icon = l_ear.icon, icon_state = t_type)
			else if(l_ear.icon_override)
				t_type = "[t_type]_l"
				overlays_standing[L_EAR_LAYER] = image(icon = l_ear.icon_override, icon_state = t_type)

			else
				overlays_standing[L_EAR_LAYER] = image(icon = form.get_mob_icon("ears"), icon_state = t_type)

		if(r_ear)
			var/t_type = r_ear.icon_state
			if(r_ear.contained_sprite)
				t_type = ""
				t_type += "[r_ear.item_state][WORN_REAR]"
				if(r_ear.icon_override)
					overlays_standing[R_EAR_LAYER] = image(icon = r_ear.icon_override, icon_state = t_type)
				else
					overlays_standing[R_EAR_LAYER] = image(icon = r_ear.icon, icon_state = t_type)

			else if(r_ear.icon_override)
				t_type = "[t_type]_r"
				overlays_standing[R_EAR_LAYER] = image(icon = r_ear.icon_override, icon_state = t_type)

			else
				overlays_standing[R_EAR_LAYER] = image(icon = form.get_mob_icon("ears"), icon_state = t_type)

	if(update_icons)   update_icons()

/mob/living/carbon/human/update_inv_shoes(var/update_icons=1)
	overlays_standing[SHOES_LAYER] = null
	if(check_draw_shoes())
		var/image/standing
		if(shoes.contained_sprite)
			var/state = ""
			state += "[shoes.item_state][WORN_SHOES]"

			if(shoes.icon_override)
				standing = image(icon = shoes.icon_override, icon_state = state)
			else
				standing = image(icon = shoes.icon, icon_state = state)

		else if(shoes.icon_override)
			standing = image(icon = shoes.icon_override,   icon_state = shoes.icon_state)

		else
			standing = image(icon = form.get_mob_icon("shoes"), icon_state = shoes.icon_state)

		if(shoes.blood_DNA)
			var/image/bloodsies = image("icon" = form.blood_mask, "icon_state" = "shoeblood")
			bloodsies.color = shoes.blood_color
			standing.add_overlay(bloodsies)
		standing.color = shoes.color
		overlays_standing[SHOES_LAYER] = standing
	else
		if(feet_blood_DNA)
			var/image/bloodsies = image("icon" = form.blood_mask, "icon_state" = "shoeblood")
			bloodsies.color = feet_blood_color
			overlays_standing[SHOES_LAYER] = bloodsies

	if(update_icons)   update_icons()


/mob/living/carbon/human/update_inv_s_store(var/update_icons=1)
	if(s_store)
		//Determine the state to use
		var/t_state
		if(s_store.item_state_slots && s_store.item_state_slots[slot_s_store_str])
			t_state = s_store.item_state_slots[slot_s_store_str]
		else if(s_store.item_state)
			t_state = s_store.item_state
		else
			t_state = s_store.icon_state

		//Determine the icon to use
		var/t_icon
		if(s_store.item_icons && (slot_s_store_str in s_store.item_icons))
			t_icon = s_store.item_icons[slot_s_store_str]
		else
			t_icon = form.get_mob_icon("s_store")

		//Special case here. We will check if the suit store icon contains our desired iconstate
		//If not we will use the mob's back icon instead. This allows reusing back icons for shoulder-slung guns
		var/icon/test = new (t_icon)
		if (!(t_state in icon_states(test)))
			t_icon = get_back_icon(s_store)


		overlays_standing[SUIT_STORE_LAYER]	= image(icon = t_icon, icon_state = t_state)
	else
		overlays_standing[SUIT_STORE_LAYER]	= null

	if(update_icons)   update_icons()


/mob/living/carbon/human/update_inv_head(var/update_icons=1)
	overlays_standing[HEAD_LAYER]	= null
	update_ears(update_icons)
	if(head)
		var/image/standing = null
		//Determine the icon to use
		var/t_icon
		if(head.contained_sprite)
			var/state = ""
			state += "[head.item_state][WORN_HEAD]"

			if(head.icon_override)
				standing = image(icon = head.icon_override, icon_state = state)
			else
				standing = image(icon = head.icon, icon_state = state)
		else if(head.icon_override)
			t_icon = head.icon_override

		else if(head.item_icons && (slot_head_str in head.item_icons))
			t_icon = head.item_icons[slot_head_str]
		else
			t_icon = form.get_mob_icon("head")

		if (!standing)
			//Determine the state to use
			var/t_state = head.icon_state

			//Create the image
			standing = image(icon = t_icon, icon_state = t_state)

		if(head.blood_DNA)
			var/image/bloodsies = image("icon" = form.blood_mask, "icon_state" = "helmetblood")
			bloodsies.color = head.blood_color
			standing.add_overlay(bloodsies)

		if(istype(head,/obj/item/clothing/head))
			var/obj/item/clothing/head/hat = head
			var/cache_key = "[hat.light_overlay]_[species.get_bodytype()]"
			if(hat.on && light_overlay_cache[cache_key])
				standing.overlays |= (light_overlay_cache[cache_key])

		standing.color = head.color
		overlays_standing[HEAD_LAYER] = standing

	if(update_icons)   update_icons()


/mob/living/carbon/human/update_inv_belt(var/update_icons=1)
	overlays_standing[BELT_LAYER] = null
	overlays_standing[BELT_LAYER_ALT] = null
	if(belt)
		var/t_state = belt.icon_state
		var/t_icon = belt.icon
		if(!t_state)	t_state = belt.item_state
		var/image/standing	= image(icon_state = t_state)

		if(belt.contained_sprite)
			t_state = ""
			t_state += "[belt.item_state][WORN_BELT]"

			if(belt.icon_override)
				t_icon = belt.icon_override

		else if(belt.icon_override)
			t_icon = belt.icon_override

		else
			t_icon = form.get_mob_icon("belt")

		var/icon/test = new (t_icon)
		if (!(t_state in icon_states(test)))
			t_icon = get_back_icon(belt)
			t_state = "back"

		standing = image(icon = t_icon, icon_state = t_state)

		var/beltlayer = BELT_LAYER
		var/otherlayer = BELT_LAYER_ALT
		if(!(t_state in icon_states(test)))
			beltlayer = BELT_LAYER_ALT
			otherlayer = BELT_LAYER
		if(istype(belt, /obj/item/storage/belt))
			var/obj/item/storage/belt/ubelt = belt
			if(ubelt.show_above_suit)
				beltlayer = BELT_LAYER_ALT
				otherlayer = BELT_LAYER

		overlays_standing[beltlayer] = standing
		overlays_standing[otherlayer] = null

	if(update_icons)   update_icons()


/mob/living/carbon/human/update_inv_wear_suit(var/update_icons=1)
	update_tail(update_icons)
	update_wings(update_icons)
	if( wear_suit && istype(wear_suit, /obj/item/) )
		var/image/standing
		var/t_icon = get_gender_icon(gender, "suit")
		var/suit_state = ""
		if(wear_suit.contained_sprite)
			var/state = ""
			state += "[wear_suit.item_state][WORN_SUIT]"

			if(wear_suit.icon_override)
				t_icon = image(icon = wear_suit.icon_override, icon_state = state)
			else
				t_icon = image(icon = wear_suit.icon, icon_state = state)

			suit_state += wear_suit.icon_state + WORN_SUIT + get_gender_icon_contained(gender)

		else if(wear_suit.icon_override)
			t_icon = wear_suit.icon_override
		else if(wear_suit.item_icons && wear_suit.item_icons[slot_wear_suit_str])
			t_icon = wear_suit.item_icons[slot_wear_suit_str]

		//determine state to use
		if (!suit_state)
			if(wear_suit.item_state_slots && wear_suit.item_state_slots[slot_wear_suit_str])
				suit_state = wear_suit.item_state_slots[slot_wear_suit_str]
			else if(wear_suit.icon_state)
				suit_state = wear_suit.icon_state
			else
				suit_state = wear_suit.item_state

		standing = image(icon = t_icon, icon_state = suit_state)
		standing.color = wear_suit.color

		if( istype(wear_suit, /obj/item/clothing/suit/straight_jacket) ) //TODO: Should be handled elsewhere
			drop_from_inventory(handcuffed)
			drop_l_hand()
			drop_r_hand()

		if(wear_suit.blood_DNA)
			var/obj/item/clothing/suit/S = wear_suit
			var/image/bloodsies = image("icon" = form.blood_mask, "icon_state" = "[S.blood_overlay_type]blood")
			bloodsies.color = S.blood_color
			standing.add_overlay(bloodsies)

		// Accessories - copied from uniform, BOILERPLATE because fuck this system.
		var/obj/item/clothing/suit/suit = wear_suit
		if(istype(suit) && suit.accessories.len)
			for(var/obj/item/clothing/accessory/A in suit.accessories)
				standing.add_overlay(A.get_mob_overlay())

		overlays_standing[SUIT_LAYER]	= standing

	else
		overlays_standing[SUIT_LAYER]	= null
		update_inv_shoes(0)

	update_collar(0)

	if(update_icons)   update_icons()


/mob/living/carbon/human/update_inv_pockets(var/update_icons=1)
	return


/mob/living/carbon/human/update_inv_wear_mask(var/update_icons=1)
	overlays_standing[FACEMASK_LAYER] = null
	if(check_draw_mask())

		var/image/standing
		if(wear_mask.contained_sprite)
			var/state = ""
			state += "[wear_mask.item_state][WORN_MASK]"

			if(wear_mask.icon_override)
				standing = image("icon" = wear_mask.icon_override, "icon_state" = state)
			else
				standing = image("icon" = wear_mask.icon, "icon_state" = state)
		else if(wear_mask.icon_override)
			standing = image(icon = wear_mask.icon_override, icon_state = wear_mask.icon_state)

		else
			standing = image(icon = form.get_mob_icon("mask"), icon_state = wear_mask.icon_state)
		standing.color = wear_mask.color

		if( !istype(wear_mask, /obj/item/clothing/mask/smokable/cigarette) && wear_mask.blood_DNA )
			var/image/bloodsies = image("icon" = form.blood_mask, "icon_state" = "maskblood")
			bloodsies.color = wear_mask.blood_color
			standing.add_overlay(bloodsies)
		overlays_standing[FACEMASK_LAYER]	= standing

	if(update_icons)   update_icons()


//Seperate proc because this is reused for suit storage
/mob/living/carbon/human/proc/get_back_icon(var/obj/item/test = null)
	if(!test && back)
		test = back

	if (test)
		//determine the icon to use
		var/icon/overlay_icon
		var/overlay_state = ""

		if(test.contained_sprite)
			overlay_state += "[test.item_state][WORN_BACK]"

			if(test.icon_override)
				overlay_icon = test.icon_override
			else
				overlay_icon = test.icon
		else if(test.icon_override)
			overlay_icon = test.icon_override
		else if(istype(test, /obj/item/rig))
			//If this is a rig and a mob_icon is set, it will take species into account in the rig update_icon() proc.
			var/obj/item/rig/rig = test
			overlay_icon = rig.mob_icon

		else if(test.item_icons && (slot_back_str in test.item_icons))
			overlay_icon = test.item_icons[slot_back_str]
		else
			overlay_icon = form.get_mob_icon("back")

		return overlay_icon

	else return form.get_mob_icon("back")


/mob/living/carbon/human/update_inv_back(var/update_icons=1)
	overlays_standing[BACK_LAYER] = null

	//determine the icon to use
	var/icon/overlay_icon = get_back_icon()
	var/overlay_state = ""
	if(back && overlay_icon)
		if(back.contained_sprite)
			overlay_state += "[back.item_state][WORN_BACK]"

			if(back.icon_override)
				overlay_icon = back.icon_override
			else
				overlay_icon = back.icon
		else if(back.icon_override)
			overlay_icon = back.icon_override

		//determine state to use
		if(back.item_state_slots && back.item_state_slots[slot_back_str])
			overlay_state = back.item_state_slots[slot_back_str]

		//apply color
		var/image/standing = image(icon = overlay_icon, icon_state = overlay_state)
		standing.color = back.color

		//create the image
		overlays_standing[BACK_LAYER] = standing

	if(update_icons)
		update_icons()




/mob/living/carbon/human/update_inv_handcuffed(var/update_icons=1)
	if(handcuffed)
		drop_r_hand()
		drop_l_hand()
		stop_pulling()	//TODO: should be handled elsewhere
		handcuffed.equip_slot = slot_handcuffed

		var/image/standing
		if(handcuffed.icon_override)
			standing = image(icon = handcuffed.icon_override, icon_state = "handcuff1")

		else
			standing = image(icon = 'icons/mob/mob.dmi', icon_state = "handcuff1")
		overlays_standing[HANDCUFF_LAYER] = standing

	else
		overlays_standing[HANDCUFF_LAYER]	= null
	if(update_icons)   update_icons()

/mob/living/carbon/human/update_inv_legcuffed(var/update_icons=1)
	if(legcuffed)

		var/image/standing
		if(legcuffed.icon_override)
			standing = image(icon = legcuffed.icon_override, icon_state = "legcuff1")

		else
			standing = image(icon = 'icons/mob/mob.dmi', icon_state = "legcuff1")
		overlays_standing[LEGCUFF_LAYER] = standing


	else
		overlays_standing[LEGCUFF_LAYER]	= null
	if(update_icons)   update_icons()


/mob/living/carbon/human/update_inv_r_hand(var/update_icons=1)
	overlays_standing[R_HAND_LAYER] = null
	if(r_hand)
		//determine icon state to use
		var/t_state
		if(r_hand.contained_sprite)
			t_state += "[r_hand.item_state][WORN_RHAND]"

			if(r_hand.icon_override)
				overlays_standing[R_HAND_LAYER] = image(icon = r_hand.icon_override, icon_state = t_state)
			else
				overlays_standing[R_HAND_LAYER] = image(icon = r_hand.icon, icon_state = t_state)

		else
			if(r_hand.item_state_slots && r_hand.item_state_slots[slot_r_hand_str])
				t_state = r_hand.item_state_slots[slot_r_hand_str]
			else if(r_hand.item_state)
				t_state = r_hand.item_state
			else
				t_state = r_hand.icon_state

			//determine icon to use
			var/icon/t_icon
			if(r_hand.item_icons && (slot_r_hand_str in r_hand.item_icons))
				t_icon = r_hand.item_icons[slot_r_hand_str]
			else if(r_hand.icon_override)
				t_state += "_r"
				t_icon = r_hand.icon_override
			else
				t_icon = INV_R_HAND_DEF_ICON

			//apply color
			var/image/standing = image(icon = t_icon, icon_state = t_state)
			standing.color = r_hand.color

			overlays_standing[R_HAND_LAYER] = standing

		if (handcuffed) drop_r_hand() //this should be moved out of icon code

	if(update_icons) update_icons()


/mob/living/carbon/human/update_inv_l_hand(var/update_icons=1)
	overlays_standing[L_HAND_LAYER] = null
	if(l_hand)
		//determine icon state to use
		var/t_state
		if(l_hand.contained_sprite)
			t_state += "[l_hand.item_state][WORN_LHAND]"

			if(l_hand.icon_override)
				overlays_standing[L_HAND_LAYER] = image(icon = l_hand.icon_override, icon_state = t_state)
			else
				overlays_standing[L_HAND_LAYER] = image(icon = l_hand.icon, icon_state = t_state)

		else
			if(l_hand.item_state_slots && l_hand.item_state_slots[slot_l_hand_str])
				t_state = l_hand.item_state_slots[slot_l_hand_str]
			else if(l_hand.item_state)
				t_state = l_hand.item_state
			else
				t_state = l_hand.icon_state

			//determine icon to use
			var/icon/t_icon
			if(l_hand.item_icons && (slot_l_hand_str in l_hand.item_icons))
				t_icon = l_hand.item_icons[slot_l_hand_str]
			else if(l_hand.icon_override)
				t_state += "_l"
				t_icon = l_hand.icon_override
			else
				t_icon = INV_L_HAND_DEF_ICON

			//apply color
			var/image/standing = image(icon = t_icon, icon_state = t_state)
			standing.color = l_hand.color

			overlays_standing[L_HAND_LAYER] = standing

		if (handcuffed) drop_l_hand() //This probably should not be here

	if(update_icons) update_icons()

//Adds a collar overlay above the helmet layer if the suit has one
//	Suit needs an identically named sprite in icons/mob/collar.dmi
/mob/living/carbon/human/proc/update_collar(var/update_icons=1)
	var/icon/C = new('icons/mob/collar.dmi')
	var/image/standing = null

	if(wear_suit)
		if(wear_suit.icon_state in C.IconStates())
			standing = image("icon" = C, "icon_state" = "[wear_suit.icon_state]")

	overlays_standing[COLLAR_LAYER]	= standing

	if(update_icons)   update_icons()


/mob/living/carbon/human/update_fire(var/update_icons=1)
	overlays_standing[FIRE_LAYER] = null
	if(on_fire)
		overlays_standing[FIRE_LAYER] = image("icon"='icons/mob/OnFire.dmi', "icon_state"="Standing", "layer"=FIRE_LAYER)

	if(update_icons)   update_icons()

/mob/living/carbon/human/proc/update_block_overlay(var/update_icons=1)
	overlays_standing[BLOCKING_LAYER] = null
	if(blocking)
		overlays_standing[BLOCKING_LAYER] = image("icon"='icons/mob/misc_overlays.dmi', "icon_state"="block", "layer"=BLOCKING_LAYER)

	update_icons()

/mob/living/carbon/human/proc/update_surgery(var/update_icons=1)
	overlays_standing[SURGERY_LAYER] = null
	var/image/total = null

	for(var/obj/item/organ/external/E in organs)
		if(E.open)
			if(total == null)
				total = new

			var/image/I = image("icon"='icons/mob/surgery.dmi', "icon_state"="[E.name][round(E.open)]", "layer"=-SURGERY_LAYER)
			total.add_overlay(I)
	overlays_standing[SURGERY_LAYER] = total
	if(update_icons)   update_icons()

//Drawcheck functions
//These functions check if an item should be drawn, or if its covered up by something else
/mob/living/carbon/human/proc/check_draw_gloves()
	if (!gloves)
		return 0
	else if (gloves.flags_inv & ALWAYSDRAW)
		return 1
	else if (wear_suit && (wear_suit.flags_inv & HIDEGLOVES))
		return 0
	else
		return 1

/mob/living/carbon/human/proc/check_draw_ears()
	if (!l_ear && !r_ear)
		return 0
	else if ((l_ear && (l_ear.flags_inv & ALWAYSDRAW)) || (r_ear && (r_ear.flags_inv & ALWAYSDRAW)))
		return 1
	else if( (head && (head.flags_inv & (HIDEEARS))) || (wear_mask && (wear_mask.flags_inv & (HIDEEARS))))
		return 0
	else
		return 1

/mob/living/carbon/human/proc/check_draw_glasses()
	if (!glasses)
		return 0
	else if (glasses.flags_inv & ALWAYSDRAW)
		return 1
	else if( (head && (head.flags_inv & (HIDEEYES))) || (wear_mask && (wear_mask.flags_inv & (HIDEEYES))))
		return 0
	else
		return 1


/mob/living/carbon/human/proc/check_draw_mask()
	if (!wear_mask)
		return 0
	else if (wear_mask.flags_inv & ALWAYSDRAW)
		return 1
	else if( head && (head.flags_inv & HIDEEYES))
		return 0
	else
		return 1

/mob/living/carbon/human/proc/check_draw_shoes()
	if (!shoes)
		return 0
	else if (shoes.flags_inv & ALWAYSDRAW)
		return 1
	else if(wear_suit && (wear_suit.flags_inv & HIDESHOES))
		return 0
	else
		return 1


/mob/living/carbon/human/proc/check_draw_underclothing()
	if (!w_uniform)
		return 0
	else if (w_uniform.flags_inv & ALWAYSDRAW)
		return 1
	else if(wear_suit && (wear_suit.flags_inv & HIDEJUMPSUIT))
		return 0
	else
		return 1

// Contained sprite defines
#undef WORN_LHAND
#undef WORN_RHAND
#undef WORN_LSTORE
#undef WORN_RSTORE
#undef WORN_SSTORE
#undef WORN_LEAR
#undef WORN_REAR
#undef WORN_HEAD
#undef WORN_UNDER
#undef WORN_SUIT
#undef WORN_GLOVES
#undef WORN_SHOES
#undef WORN_EYES
#undef WORN_BELT
#undef WORN_BACK
#undef WORN_ID
#undef WORN_MASK

//Human over-lays Indexes/////////
#undef MARKINGS_LAYER
#undef MUTATIONS_LAYER
#undef DAMAGE_LAYER
#undef SURGERY_LAYER
#undef UNDERWEAR_LAYER
#undef IMPLANTS_LAYER
#undef UNIFORM_LAYER
#undef ID_LAYER
#undef SHOES_LAYER
#undef GLOVES_LAYER
#undef L_EAR_LAYER
#undef R_EAR_LAYER
#undef CUSTOM_EARS_LAYER
#undef SUIT_LAYER
#undef CUSTOM_TAIL_LAYER
#undef GLASSES_LAYER
#undef FACEMASK_LAYER
#undef BELT_LAYER
#undef SUIT_STORE_LAYER
#undef BACK_LAYER
#undef HAIR_LAYER
#undef HEAD_LAYER
#undef COLLAR_LAYER
#undef HANDCUFF_LAYER
#undef LEGCUFF_LAYER
#undef L_HAND_LAYER
#undef R_HAND_LAYER
#undef FIRE_LAYER
#undef CUSTOM_TAIL_LAYER_ALT
#undef TOTAL_LAYERS
