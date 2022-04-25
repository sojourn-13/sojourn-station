//GUN KIT
GLOBAL_LIST_EMPTY(unlocked_gun_replication) //Every unlocked gun

var/list/name_to_gunpart

/obj/item/gunkit
	name = "Marshal Gunsmith Kit"
	desc = ""
	icon = 'icons/obj/forensics.dmi'
	icon_state = "case"
	item_state = "case"
	w_class = ITEM_SIZE_HUGE //Its a huge case for gun building and
	extra_bulk = 12 //Ye no lets not see combat gun smithing on the battle field
	price_tag = 12000
	var/perk_locked = TRUE
	var/perk_to_use = PERK_GUN_WIZ
	var/parts_stored = list(\
	PART_HAND = 0,   PART_HAND_L = 0, \
	PART_CIV = 0,    PART_CIV_L = 0, \
	PART_POLICE = 0, PART_POLICE_L = 0, \
	PART_MILSIM = 0, PART_MILSIM_L = 0, \
	PART_SI = 0,     PART_SI_L = 0, \
	PART_CHURCH = 0, PART_CHURCH_L = 0, \
	PART_GUILD = 0,  PART_GUILD_L = 0,
	PART_GP = 0,     PART_GP_L = 0,
	PART_EXODUS = 0, PART_EXODUS_L = 0)


/obj/item/gunkit/examine(mob/user)
	..()
	if(user.stats.getPerk(perk_to_use) && perk_locked)
		to_chat(user, "<span class='info'>A stainless steel-plated carrycase with a robust impressive collection of every tool needed and wanted to take apart a gun but has no use outside of that.</span>")
	else
		to_chat(user, "<span class='info'>A stainless steel-plated carrycase with nothing but junk and scrap broken tools inside,..</span>")


/obj/item/gunkit/attackby(obj/item/I, mob/user)
	if(perk_locked && !user.stats.getPerk(perk_to_use))
		to_chat(user, "<span class='info'>The kit with all its broken scrap tools are useless.</span>")
		return
	if(istype(I, /obj/item/gun))
		var/obj/item/gun/breakingdown = I
		if(!length(breakingdown.get_gun_part()))
			to_chat(user, "<span class='info'>This gun has no useable parts to give.</span>")
			return
		if(breakingdown.oldified)
			to_chat(user, "<span class='info'>This gun is unable to be broken down without being cleaned and restored first.</span>")
			return
		eat_gun(user, breakingdown)

/obj/item/gunkit/proc/eat_gun(mob/living/user, obj/item/gun/eating)

	var/list/total_parts_gained = list()

	var/list/_gun_parts = eating.get_gun_part()
	if(_gun_parts)
		for(var/gun_parts_in_gun in _gun_parts)

			if(!(gun_parts_in_gun in total_parts_gained))
				total_parts_gained[gun_parts_in_gun] = 0

			if(!(gun_parts_in_gun in total_parts_gained))
				total_parts_gained[gun_parts_in_gun] = 0


			var/total_parts = _gun_parts[gun_parts_in_gun]

			total_parts_gained[gun_parts_in_gun] += total_parts

		for(var/gun_parts_to_add in total_parts_gained)
			parts_stored[gun_parts_to_add] += total_parts_gained[gun_parts_to_add]


		var/datum/unlocked_gun_replications/RP = new(eating.name, eating.desc, parts_stored, eating, 3)
		GLOB.unlocked_gun_replication += RP

		to_chat(user, SPAN_NOTICE("You mercilessly disassemble \the [eating] and place the parts in \the [src]."))
		qdel(eating)

/datum/unlocked_gun_replications
	var/name
	var/desc
	var/parts_needed
	var/gun_path
	var/cost_multy = 3

/datum/unlocked_gun_replications/New(name, desc, parts_needed, gun_path, cost_multy)
	..()
	name = name
	desc = desc
	parts_needed = parts_needed
	gun_path = gun_path
	cost_multy = cost_multy

	gun_path *= cost_multy

/obj/item/gunkit/attack_self(mob/user)
	if(perk_locked && !user.stats.getPerk(perk_to_use))
		to_chat(user, "<span class='info'>The kit with all its broken scrap tools are useless.</span>")
		return
	nano_ui_interact(user)

/obj/item/gunkit/ui_data(mob/user)
	var/list/list/data = list()

	data |= gunparts_data()

	for(var/datum/unlocked_gun_replications/G in GLOB.unlocked_gun_replication)
		data["contracts"].Add(list(list(
			"name" = G.name,
			"desc" = G.desc,
			"parts_needed" = G.parts_needed
		)))

	return data

/obj/item/gunkit/nano_ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
//	if(!nano_template)
//		return

	var/list/data = ui_data()

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "gunkit.tmpl", name, 700, 550)
		ui.set_initial_data(data)
		ui.open()

/obj/item/gunkit/proc/gunparts_data()
	var/list/data = list()

	var/list/M = list()
	for(var/mtype in parts_stored)
		if(parts_stored[mtype] <= 0)
			continue

		var/gun_part/MAT = get_gunpart_name(mtype)
		var/list/ME = list("name" = MAT, "id" = mtype, "amount" = parts_stored[mtype])

		M.Add(list(ME))

	data["gunparts"] = M

	return data

/gun_part
	var/name

/proc/get_gunpart_name(name)
	var/gun_part/gun_part = name// = get_gunpart()
	if(gun_part)
		return gun_part

//obj/proc/get_gunpart()
//	return null

/proc/get_gunpart_by_name(name)
	if(!name_to_gunpart)
		populate_gunpart_list()
	var/gun_part/M = name_to_gunpart[lowertext(name)]
	if(!M)
		error("Invalid material given: [name]")
	return M

/proc/populate_gunpart_list(force_remake=0)
	if(name_to_gunpart && !force_remake) return // Already set up!
	name_to_gunpart = list()
	for(var/type in typesof(/gun_part) - /gun_part)
		var/gun_part/new_gunpart = new type
		if(!new_gunpart.name)
			continue
		name_to_gunpart[lowertext(new_gunpart.name)] = new_gunpart
	return 1

/gun_part/handmade
	name = PART_HAND

/gun_part/handmade_l
	name = PART_HAND_L

/gun_part/civ
	name = PART_CIV

/gun_part/civ_l
	name = PART_CIV_L

/gun_part/police
	name = PART_POLICE

/gun_part/police_l
	name = PART_POLICE_L

/gun_part/mil
	name = PART_MILSIM

/gun_part/mil_l
	name = PART_MILSIM_L

/gun_part/si
	name = PART_SI

/gun_part/si_l
	name = PART_SI_L

/gun_part/church
	name = PART_CHURCH

/gun_part/church_l
	name = PART_CHURCH_L

/gun_part/guild
	name = PART_GUILD

/gun_part/guild_l
	name = PART_GUILD_L

/gun_part/greyson
	name = PART_GP

/gun_part/greyson_l
	name = PART_GP_L

/gun_part/advanced
	name = PART_EXODUS

/gun_part/advanced_l
	name = PART_EXODUS_L
