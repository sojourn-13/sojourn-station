 // Perks given by the nanogate organ

/datum/perk/nanogate
	name = "Nanogate Implant"
	desc = "At some point you chose to have a nanogate installed in your body, the metallic nanite based implant goes directly at the base of your skull right where your spine connects. While \
	quite powerful and widely useful, but there are side effects. Those with a nanogate find it far more difficult to become inspired. On top of this, nanogates violently attack any mutations \
	it detects in the body, which can be harmful when combined with fast-acting genetic modifications."
	icon_state = "nanogateimplant"
	gain_text = "Your head aches for a moment, the effects of your spine having been seperated and an advanced machine slotted inbetween leaving you with a dull pain that is quickly cured \
	by your nanites."

/datum/perk/nanite_power/nanite_regen
	name = "Nanite Regeneration"
	desc = "You configure your nanite matrix to begin aiding in your natural healing."
	icon_state = "naniteregeneration"
	gain_text = "You feel a dull ache as your nanogate releases newly configured nanites into your body."
	var/regen_rate = 0.7 //This seems low but this is per human handle_chemicals_in_body meaning this is rather robust
	emped_message = "You feel an uncomfortable tingling numbness throughout your entire body, like a limb that has just gone to sleep."
	emped_end_message = "The tingling stops as your nanogate informs you that it has restored its regenerative nanites."

/datum/perk/nanite_power/nanite_regen/on_emp(nano, severity)
	if(severity) //Let's NOT divide by any zeroes!
		emp_duration = (120 SECONDS / severity) //Duration that the regeneration is disabled.
	..()

/datum/perk/nanite_power/nanite_regen/on_process()
	. = ..()
	if(regen_rate && !emped && holder.stat != DEAD) //Check if we're EMP'ed and shouldn't regenerate. Also, don't heal us if we're DEAD.
		holder.heal_overall_damage(regen_rate, regen_rate, 1)

/datum/perk/nanite_power/nanite_muscle
	name = "Nanofiber Muscle Therapy"
	desc = "Through the use of pain killers, implanted nanofibers, and small dispersed drug therapy to critical areas your nanogate has enhanced your physical movement speed and endurance, allowing you to run for \
	longer stretches at a faster pace without tiring."
	icon_state = "nanofibermuscletherapy"
	gain_text = "You feel a dull ache as your nanogate releases newly configured nanites into your body."
	emped_message = "You feel your legs cramp as your nanite-augmented muscles seize."
	emped_end_message = "The pain in your legs fades as mobility returns to your muscles."
	var/speedup = 0.3

/datum/perk/nanite_power/nanite_muscle/on_emp(nano, severity)
	if(severity) //Let's NOT divide by any zeroes!
		emp_duration = (30 SECONDS / severity) //Duration that your speed is disabled.
	..()

/datum/perk/nanite_power/nanite_armor
	name = "Nanite Skin-Weave"
	desc = "Through the use of reactive nanites designed to plate together into a shield your machines can reform at a lightning pace to let you physically resist incoming damage by forming a \
	mesh weave shield just before a strike connects."
	icon_state = "naniteskinweave"
	gain_text = "You feel a dull ache as your nanogate releases newly configured nanites into your body."
	var/max_health_adjust = 0

/datum/perk/nanite_power/nanite_armor/proc/adjustMaxHP()
	holder.maxHealth += max_health_adjust
	holder.health += max_health_adjust

/datum/perk/nanite_power/nanite_armor/remove()
	holder.maxHealth -= max_health_adjust
	holder.health -= max_health_adjust
	..()

/datum/perk/nanite_power/nanite_metal_drinker
	name = "Nanite Metal Drinker"
	desc = "Allows the user to drink metals (like Gold/Silver/Iron/Potassium and more) to regain nutrition."
	gain_text = "You feel a dull ache as your nanogate releases newly configured nanites into your body."

/datum/perk/nanite_power/nanite_chem
	name = "Nanite Chemicals"
	desc = "You programmed and set aside a specific subset of nanites who have a singular purpose that you can call upon at any time to engage their effect, but this only works once."
	gain_text = "You feel a dull ache as your nanogate releases newly configured nanites into your body."
	active = FALSE
	passivePerk = FALSE
	var/chem_id = "nanites"
	var/chem_amount = 15
	var/cooldown_amount = 15 MINUTES

/datum/perk/nanite_power/nanite_chem/activate()
	..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your nanite reserve is still refilling, you'll need to wait longer."))
		return FALSE
	cooldown_time = world.time + cooldown_amount
	to_chat(holder, "You feel a sudden rush as the pre-programed nanites enter your bloodstream.")
	holder.reagents.add_reagent(chem_id, chem_amount)


//Unused, because this kind of nanite doesn't exist?!?!
/datum/perk/nanite_power/nanite_chem/implantoids
	name = "Implantoids Nanites"
	chem_id = "implant nanites"

/datum/perk/nanite_power/nanite_chem/symbiotes
	name = "Symbiote Nanites"
	chem_id = "nanosymbiotes"

/datum/perk/nanite_power/nanite_chem/trauma_control_system
	name = "Trauma Control System Nanites"
	chem_id = "trauma_control_system"

/datum/perk/nanite_power/nanite_chem/control_booster_utility
	name = "Control Booster Utility Nanites"
	chem_id = "cbu"

/datum/perk/nanite_power/nanite_chem/control_booster_combat
	name = "Control Booster Combat Nanites"
	icon_state = "combatnanites"
	chem_id = "cbc"

/datum/perk/nanite_power/nanite_chem/purgers
	name = "Purger Nanites"
	icon_state = "purgernanites"
	chem_id = "nanopurgers"

/datum/perk/nanite_power/nanite_chem/oxyrush
	name = "Oxyrush Nanites"
	icon_state = "oxyrushnanites"
	chem_id = "oxyrush"

/datum/perk/nanite_power/nanite_chem/nantidotes
	name = "Nantidotes"
	chem_id = "nantidotes"

/datum/perk/nanite_power/nanite_ammo
	name = "Munition Fabrication"
	desc = "You programmed and set aside a specific subset of nanites whose singular purpose is to reconstruct themselves into ammunition boxes. The process is quite intensive and requires \
	up to fifteen minutes between uses."
	icon_state = "munitionfabrication"
	gain_text = "You feel a dull ache as your nanogate releases newly configured nanites into your body."
	active = FALSE
	passivePerk = FALSE
	var/cooldown = 15 MINUTES
	var/anti_cheat = FALSE //No more spaming...

/datum/perk/nanite_power/nanite_ammo/activate()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your nanites didn't ready an ammo box yet."))
		return FALSE

	if(anti_cheat)
		to_chat(holder, "Something feels cold.")
		return
	anti_cheat = TRUE

				//illegal bullets go BRRRT!!!
	var/list/blacklisted_types = list(	/obj/item/ammo_magazine/ammobox,
						/obj/item/ammo_magazine/ammobox/pistol_35/laser,
						/obj/item/ammo_magazine/ammobox/pistol_35/biomatter,
						/obj/item/ammo_magazine/ammobox/pistol_35/scrap,
						/obj/item/ammo_magazine/ammobox/pistol_35/hv,
						/obj/item/ammo_magazine/ammobox/pistol_35/large/hv,
						/obj/item/ammo_magazine/ammobox/magnum_40/laser,
						/obj/item/ammo_magazine/ammobox/magnum_40/biomatter,
						/obj/item/ammo_magazine/ammobox/magnum_40/scrap,
						/obj/item/ammo_magazine/ammobox/magnum_40/hv,
						/obj/item/ammo_magazine/ammobox/magnum_40/large/hv,
						/obj/item/ammo_magazine/ammobox/magnum_40/rubber/pepperball,
						/obj/item/ammo_magazine/ammobox/light_rifle_257_small/laser,
						/obj/item/ammo_magazine/ammobox/light_rifle_257_small/hv,
						/obj/item/ammo_magazine/ammobox/light_rifle_257/scrap,
						/obj/item/ammo_magazine/ammobox/light_rifle_257/highvelocity,
						/obj/item/ammo_magazine/ammobox/rifle_75_small/laser,
						/obj/item/ammo_magazine/ammobox/rifle_75/hv,
						/obj/item/ammo_magazine/ammobox/rifle_75_small/hv,
						/obj/item/ammo_magazine/ammobox/rifle_75_small/scrap,
						/obj/item/ammo_magazine/ammobox/laser_223/box,
						/obj/item/ammo_magazine/ammobox/kurtz_50/hv,
						/obj/item/ammo_magazine/ammobox/kurtz_50/laser,
						/obj/item/ammo_magazine/ammobox/antim, //Unlike the small box holds 15
						/obj/item/ammo_magazine/ammobox/antim/scrap,
						/obj/item/ammo_magazine/ammobox/ball,
						/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/laser,
						/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/hv,
						/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/scrap,
						/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv,
						/obj/item/ammo_magazine/ammobox/shotgun/flashshells, //holds 70 shells, its a map item not meant to be common
						/obj/item/ammo_magazine/ammobox/shotgun/biomatter,
						/obj/item/ammo_magazine/ammobox/shotgun/incendiary,
						/obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag,
						/obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet,
						/obj/item/ammo_magazine/ammobox/shotgun/scrap_slug
						)

	var/list/ammo_boxes = list()
	for(var/ammo in subtypesof(/obj/item/ammo_magazine/ammobox))
		if (ammo in blacklisted_types)
			continue
		var/obj/O = ammo
		ammo_boxes[initial(O.name)] = ammo

	var/obj/item/choice = input(usr, "Which type of ammo do you want?", "Ammo Choice", null) as null|anything in ammo_boxes

	if (!choice)	// user can cancel
		anti_cheat = FALSE
		return

	choice = ammo_boxes[choice]
	usr.put_in_hands(new choice(get_turf(usr)))
	cooldown_time = world.time + cooldown

	anti_cheat = FALSE
	return ..()



/datum/perk/nanite_power/nanite_mods
	name = "Modification Fabrication"
	desc = "You programmed and set aside a specific subset of nanites whose singular purpose is to reconstruct themselves into tool modifications. The process is quite intensive and requires \
	an hour between uses."
	icon_state = "munitionfabrication"
	gain_text = "You feel a dull ache as your nanogate releases newly configured nanites into your body."
	active = FALSE
	passivePerk = FALSE
	var/cooldown = 60 MINUTES
	var/anti_cheat = FALSE //No more spaming...

/datum/perk/nanite_power/nanite_mods/activate()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your nanites aren't ready to produce another modification yet."))
		return FALSE

	if(anti_cheat)
		return
	anti_cheat = TRUE
	// Add illegal shit here
	var/list/blacklisted_types = list(	/obj/item/tool_upgrade/reinforcement,
						/obj/item/tool_upgrade/productivity,
						/obj/item/tool_upgrade/refinement,
						/obj/item/tool_upgrade/augment,
						/obj/item/tool_upgrade/armor,
						/obj/item/tool_upgrade/augment/holding_tank,
						/obj/item/tool_upgrade/augment/ai_tool,
						/obj/item/tool_upgrade/augment/ai_tool_excelsior,
						/obj/item/tool_upgrade/augment/repair_nano,
						/obj/item/tool_upgrade/augment/randomizer,
						/obj/item/tool_upgrade/augment/holy_oils,
						/obj/item/tool_upgrade/augment/crusader_seal,
						/obj/item/tool_upgrade/artwork_tool_mod,
						/obj/item/tool_upgrade/augment/sanctifier,	//Has biomatter, sadly nanites are not able to use that
						/obj/item/gun_upgrade/barrel,
						/obj/item/gun_upgrade/muzzle,
						/obj/item/gun_upgrade/mechanism,
						/obj/item/gun_upgrade/trigger,
						/obj/item/gun_upgrade/magwell,
						/obj/item/gun_upgrade/scope,
						/obj/item/gun_upgrade/underbarrel,
						/obj/item/gun_upgrade/barrel/forged,
						/obj/item/gun_upgrade/barrel/bore,
						/obj/item/gun_upgrade/barrel/excruciator,	//Sadly has biomatter
						/obj/item/gun_upgrade/mechanism/upgrade_kit,
						/obj/item/gun_upgrade/mechanism/clock_block,//Brass and unknown tech
						/obj/item/gun_upgrade/trigger/boom,			//Illegal
						/obj/item/gun_upgrade/scope/watchman,
						/obj/item/gun_upgrade/mechanism/glass_widow,
						/obj/item/gun_upgrade/mechanism/greyson_master_catalyst,
						/obj/item/gun_upgrade/mechanism/brass_kit,
						/obj/item/gun_upgrade/trigger/honker,
						/obj/item/gun_upgrade/mechanism/bikehorn,
						/obj/item/gun_upgrade/mechanism/faulty_trapped,
						/obj/item/gun_upgrade/trigger/faulty,
						/obj/item/gun_upgrade/barrel/faulty,
						/obj/item/gun_upgrade/muzzle/faulty,
						/obj/item/gun_upgrade/mechanism/faulty,
						/obj/item/gun_upgrade/scope/faulty
	)

	var/list/choice_mods = list()
	// add new paths into the format of + subtypesof(XXX)
	var/list/types = subtypesof(/obj/item/tool_upgrade) + subtypesof(/obj/item/gun_upgrade)
	for (var/mod in types)
		if (mod in blacklisted_types)
			continue
		var/obj/O = mod
		choice_mods[initial(O.name)] = mod

	var/obj/item/choice = input(usr, "Which modification do you want?", "Mod Choice", null) as null|anything in choice_mods

	if(choice)
		to_chat(src, "You assign some of your nanites to create a modification.")
		choice = choice_mods[choice]
		usr.put_in_hands(new choice(get_turf(src)))
		cooldown_time = world.time + cooldown

	anti_cheat = FALSE
	return ..()
