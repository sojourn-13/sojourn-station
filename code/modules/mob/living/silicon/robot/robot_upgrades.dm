// robot_upgrades.dm
// Contains various borg upgrades.

/obj/item/borg/upgrade
	name = "borg upgrade module."
	desc = "Protected by FRM."
	icon = 'icons/obj/module.dmi'
	icon_state = "cyborg_upgrade"
	matter = list(MATERIAL_STEEL = 10)
	var/locked = 0
	var/require_module = FALSE
	var/installed = 0
	var/robot_traits = null
	var/permanent = TRUE // is this upgrade permanent or is it a one-time use ?

/obj/item/borg/upgrade/proc/action(mob/living/silicon/robot/R)
	if(R.stat == DEAD)
		to_chat(usr, SPAN_WARNING("The [src] will not function on a deceased robot."))
	if(robot_traits)
		R.AddTrait(robot_traits)
	return FALSE

/obj/item/borg/upgrade/proc/unaction(mob/living/silicon/robot/R)
	if(robot_traits)
		R.RemoveTrait(robot_traits)

/obj/item/borg/upgrade/reset
	name = "robotic module reset board"
	desc = "Used to reset a cyborg's module. Destroys any other upgrades applied to the robot."
	icon_state = "cyborg_upgrade1"
	matter = list(MATERIAL_STEEL = 12, MATERIAL_GLASS = 6, MATERIAL_PLASTIC = 6)
	require_module = TRUE
	permanent = FALSE

/obj/item/borg/upgrade/reset/action(mob/living/silicon/robot/R)
	if(..()) return FALSE
	R.uneq_all()
	R.modtype = initial(R.modtype)

	R.notify_ai(ROBOT_NOTIFICATION_MODULE_RESET, R.module.name)
	R.module.Reset(R)
	R.module = null
	R.updatename("Default")

	R.icon = 'icons/mob/robots.dmi'
	R.pixel_x = 0
	R.old_x = 0
	R.default_pixel_x = 0
	R.stats.removeAllPerks() //We dont want to stack perks on perks so we remove them all, sads
	qdel(src)
	return TRUE

/obj/item/borg/upgrade/rename
	name = "robot reclassification board"
	desc = "Used to rename a cyborg."
	icon_state = "cyborg_upgrade1"
	var/heldname = "default name"
	permanent = FALSE

/obj/item/borg/upgrade/rename/attack_self(mob/user as mob)
	heldname = sanitizeSafe(input(user, "Enter new robot name", "Robot Reclassification", heldname), MAX_NAME_LEN)

/obj/item/borg/upgrade/rename/action(var/mob/living/silicon/robot/R)
	if(..()) return FALSE
	R.notify_ai(ROBOT_NOTIFICATION_NEW_NAME, R.name, heldname)
	R.name = heldname
	R.custom_name = heldname
	R.real_name = heldname
	qdel(src)

	return TRUE

/obj/item/borg/upgrade/floodlight
	name = "robot floodlight module"
	desc = "Used to boost cyborg's light intensity."
	icon_state = "cyborg_upgrade1"

/obj/item/borg/upgrade/floodlight/action(mob/living/silicon/robot/R)
	if(..()) return FALSE

	if(R.intenselight)
		to_chat(usr, "This cyborg's light was already upgraded")
		return FALSE
	else
		R.intenselight = 1
		R.update_robot_light()
		to_chat(R, "Lighting systems upgrade detected.")
	return TRUE

/obj/item/borg/upgrade/floodlight/unaction(mob/living/silicon/robot/R)
	..()
	R.intenselight = 0
	R.update_robot_light()

/obj/item/borg/upgrade/restart
	name = "robot emergency restart module"
	desc = "Used to force a restart of a disabled-but-repaired robot, bringing it back online."
	icon_state = "cyborg_upgrade1"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_GLASS = 5)
	permanent = FALSE

/obj/item/borg/upgrade/restart/action(var/mob/living/silicon/robot/R)
	if(R.health < 0)
		to_chat(usr, "You have to repair the robot before using this module!")
		return FALSE

	if(!R.key)
		for(var/mob/observer/ghost/ghost in GLOB.player_list)
			if(ghost.mind && ghost.mind.current == R)
				R.key = ghost.key

	R.stat = CONSCIOUS
	GLOB.dead_mob_list -= R
	GLOB.living_mob_list |= R
	R.death_notified = FALSE
	R.vtech_added_speed = 0
	R.notify_ai(ROBOT_NOTIFICATION_NEW_UNIT)
	qdel(src)
	return TRUE

/obj/item/borg/upgrade/vtec
	name = "robotic VTEC Module"
	desc = "Used to kick in a robot's VTEC systems, increasing their speed."
	icon_state = "cyborg_upgrade2"
	matter = list(MATERIAL_STEEL = 8, MATERIAL_GLASS = 6, MATERIAL_GOLD = 5)
	var/speed_buff = 0.5
	robot_traits = CYBORG_TRAIT_SPEED_BOOSTED

/obj/item/borg/upgrade/vtec/action(var/mob/living/silicon/robot/R)
	if(..())
		return FALSE
	if(R.vtech_added_speed > 0)
		return FALSE

	R.speed_factor += speed_buff
	return TRUE

/obj/item/borg/upgrade/vtec/unaction(mob/living/silicon/robot/R)
	..()
	R.speed_factor -= speed_buff

/obj/item/borg/upgrade/power_saver
	name = "robotic Power Saver Module"
	desc = "Used to kick in a robot's Power Saver systems, increasing their power efficiency."
	icon_state = "cyborg_upgrade2"
	matter = list(MATERIAL_STEEL = 8, MATERIAL_GLASS = 6, MATERIAL_GOLD = 2, MATERIAL_SILVER = 2)
	require_module = TRUE
	var/pwer_gamer = 0.5
	robot_traits = CYBORG_TRAIT_POWER_SAVER

/obj/item/borg/upgrade/power_saver/action(var/mob/living/silicon/robot/R)
	if(..())
		return FALSE

	R.power_efficiency += pwer_gamer
	return TRUE

/obj/item/borg/upgrade/tasercooler
	name = "robotic Rapid Taser Cooling Module"
	desc = "Used to cool a mounted taser, increasing the potential current in it and thus its recharge rate."
	icon_state = "cyborg_upgrade3"
	matter = list(MATERIAL_STEEL = 8, MATERIAL_GLASS = 6, MATERIAL_GOLD = 2, MATERIAL_DIAMOND = 2)
	require_module = TRUE
	var/cooling_buff = 4


/obj/item/borg/upgrade/tasercooler/action(var/mob/living/silicon/robot/R)
	if(..()) return 0

	if(!R.module || !(type in R.module.supported_upgrades))
		to_chat(R, "Upgrade mounting error!  No suitable hardpoint detected!")
		to_chat(usr, "There's no mounting point for the module!")
		return 0

	var/obj/item/gun/energy/taser/mounted/cyborg/T = locate() in R.module
	if(!T)
		T = locate() in R.module.contents
	if(!T)
		T = locate() in R.module.modules
	if(!T)
		to_chat(usr, "This robot has had its taser removed!")
		return 0

	if(T.recharge_time <=  cooling_buff / 2)
		to_chat(R, "Maximum cooling achieved for this hardpoint!")
		to_chat(usr, "There's no room for another cooling unit!")
		return 0

	else
		T.recharge_time = max(2 , T.recharge_time - cooling_buff)

	return 1

/obj/item/borg/upgrade/tasercooler/unaction(mob/living/silicon/robot/R)
	..()
	if(!R.module || !(type in R.module.supported_upgrades))
		to_chat(R, "Upgrade mounting error! No suitable hardpoint detected!")
		to_chat(usr, "There\'s no mounting point for the module!")
		return 0

	var/obj/item/gun/energy/taser/mounted/cyborg/T = locate() in R.module
	if(!T)
		T = locate() in R.module.contents
	if(!T)
		T = locate() in R.module.modules
	if(!T)
		return FALSE // we have failed :(
	T.recharge_time += cooling_buff
/obj/item/borg/upgrade/jetpack
	name = "mining robot jetpack"
	desc = "A carbon dioxide jetpack suitable for low-gravity mining operations."
	icon_state = "cyborg_upgrade3"
	require_module = TRUE
	var/ref_to_jetpack = null

/obj/item/borg/upgrade/jetpack/action(var/mob/living/silicon/robot/R)
	if(..()) return 0

	if(!R.module || !(type in R.module.supported_upgrades))
		to_chat(R, "Upgrade mounting error!  No suitable hardpoint detected!")
		to_chat(usr, "There's no mounting point for the module!")
		return 0
	else
		ref_to_jetpack = new /obj/item/tank/jetpack/carbondioxide
		R.module.modules += ref_to_jetpack
//		for(var/obj/item/tank/jetpack/carbondioxide in R.module.modules)
//			R.internals = src
		//R.icon_state="Miner+j"
		R.module.Initialize() //Fixes layering and possible tool issues
		return 1

/obj/item/borg/upgrade/jetpack/unaction(mob/living/silicon/robot/R)
	..()
	R.module.modules -= ref_to_jetpack
	var/ref1 = ref_to_jetpack
	ref_to_jetpack = null
	qdel(ref1)

/obj/item/borg/upgrade/rcd
	name = "engineering robot RCD"
	desc = "A rapid construction device module for use during construction operations."
	icon_state = "cyborg_upgrade3"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASMA = 10, MATERIAL_URANIUM = 10)
	require_module = TRUE
	var/ref_to_rcd = null

/obj/item/borg/upgrade/rcd/action(var/mob/living/silicon/robot/R)
	if(..()) return FALSE

	if(!R.module || !(type in R.module.supported_upgrades))
		to_chat(R, "Upgrade mounting error!  No suitable hardpoint detected!")
		to_chat(usr, "There's no mounting point for the module!")
		return FALSE
	else
		R.module.modules += new/obj/item/rcd/borg(R.module)
		R.module.Initialize() //Fixes layering and possible tool issues
		return TRUE

/obj/item/borg/upgrade/rcd/unaction(mob/living/silicon/robot/R)
	..()
	R.module.modules -= ref_to_rcd
	var/ref1 = ref_to_rcd
	ref_to_rcd = null
	qdel(ref1)

/obj/item/borg/upgrade/arc_welder
	name = "engineering robot arc welder"
	desc = "An electric based, safe welder that runs on its own mini reactor. Use during construction operations."
	icon_state = "cyborg_upgrade3"
	matter = list(MATERIAL_PLASTEEL = 6, MATERIAL_SILVER = 1, MATERIAL_STEEL = 10)
	require_module = TRUE
	var/ref_to_welder = null

/obj/item/borg/upgrade/arc_welder/action(var/mob/living/silicon/robot/R)
	if(..()) return 0
	if(!R.module || !(type in R.module.supported_upgrades))
		to_chat(R, "Upgrade mounting error!  No suitable hardpoint detected!")
		to_chat(usr, "There's no mounting point for the module!")
		return 0
	else
		R.module.modules += new/obj/item/tool/baton/arcwelder/cyborg(R.module)
		R.module.Initialize() //Fixes layering and possible tool issues
		return 1

/obj/item/borg/upgrade/arc_welder/unaction(mob/living/silicon/robot/R)
	..()
	R.module.modules -= ref_to_welder
	var/ref1 = ref_to_welder
	ref_to_welder = null
	qdel(ref1)

/obj/item/borg/upgrade/hypospray_medical
	name = "medical cyborg hypospray advanced synthesiser"
	desc = "An upgrade to the Medical module cyborg's hypospray, allowing it \
		to produce more advanced and complex medical reagents."
	var/ref_to_hypo = null

/obj/item/borg/upgrade/hypospray_medical/action(var/mob/living/silicon/robot/R)
	if(..()) return 0
	if(!R.module || !(type in R.module.supported_upgrades))
		to_chat(R, "Upgrade mounting error!  No suitable hardpoint detected!")
		to_chat(usr, "There's no mounting point for the module!")
		return 0
	else
		R.module.modules += new/obj/item/reagent_containers/borghypo/medical_adv(R.module)
		R.module.Initialize() //Fixes layering and possible tool issues
		return 1

/obj/item/borg/upgrade/hypospray_medical/unaction(mob/living/silicon/robot/R)
	..()
	R.module.modules -= ref_to_hypo
	var/ref1 = ref_to_hypo
	ref_to_hypo = null
	qdel(ref1)

/obj/item/borg/upgrade/hypospray_rescue
	name = "rescue cyborg hypospray advanced synthesiser"
	desc = "An upgrade to the Rescue module cyborg's hypospray, allowing it \
		to produce more advanced and complex medical reagents."
	var/ref_to_hypo = null

/obj/item/borg/upgrade/hypospray_rescue/action(var/mob/living/silicon/robot/R)
	if(..()) return 0
	if(!R.module || !(type in R.module.supported_upgrades))
		to_chat(R, "Upgrade mounting error!  No suitable hardpoint detected!")
		to_chat(usr, "There's no mounting point for the module!")
		return 0
	else
		R.module.modules += new/obj/item/reagent_containers/borghypo/rescue_adv(R.module)
		R.module.Initialize() //Fixes layering and possible tool issues
		return 1

/obj/item/borg/upgrade/hypospray_rescue/unaction(mob/living/silicon/robot/R)
	..()
	R.module.modules -= ref_to_hypo
	var/ref1 = ref_to_hypo
	ref_to_hypo = null
	qdel(ref1)

/obj/item/borg/upgrade/syndicate
	name = "Overclocking equipment module"
	desc = "Unlocks hidden, deadlier functions of a robot or overclocked equipment."
	icon_state = "cyborg_upgrade3"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_GLASS = 15, MATERIAL_DIAMOND = 5)
	require_module = TRUE
	robot_traits = CYBORG_TRAIT_EMAGGED

/obj/item/borg/upgrade/bigknife
	name = "large knife equipment module"
	desc = "Mounts a large knife onto sec class borgs"
	icon_state = "cyborg_upgrade3"
	matter = list(MATERIAL_STEEL = 25)
	require_module = TRUE
	var/ref_to_knife = null

/obj/item/borg/upgrade/bigknife/action(var/mob/living/silicon/robot/R)
	if(..()) return 0
	if(!R.module || !(type in R.module.supported_upgrades))
		to_chat(R, "Upgrade mounting error!  No suitable hardpoint detected!")
		to_chat(usr, "There's no mounting point for the module!")
		return 0
	else
		R.module.modules += new/obj/item/tool/sword/machete(R.module)
		R.module.Initialize() //Fixes layering and possible tool issues
		return 1

/obj/item/borg/upgrade/bigknife/unaction(mob/living/silicon/robot/R)
	..()
	R.module.modules -= ref_to_knife
	var/ref1 = ref_to_knife
	ref_to_knife = null
	qdel(ref1)

/obj/item/borg/upgrade/satchel_of_holding_for_borgs
	name = "satchel of holding equipment module"
	desc = "Mounts a unstable bluespace satchel of holding borgs"
	icon_state = "cyborg_upgrade2"
	matter = list(MATERIAL_STEEL = 12, MATERIAL_GOLD = 6, MATERIAL_DIAMOND = 2, MATERIAL_URANIUM = 2)
	require_module = TRUE
	var/ref_to_bag = null

/obj/item/borg/upgrade/satchel_of_holding_for_borgs/action(var/mob/living/silicon/robot/R)
	if(..()) return 0
	if(!R.module || !(type in R.module.supported_upgrades))
		to_chat(R, "Upgrade mounting error!  No suitable hardpoint detected!")
		to_chat(usr, "There's no mounting point for the module!")
		return 0
	else
		R.module.modules += new/obj/item/storage/bag/robotic/holding(R.module)
		R.module.Initialize() //Fixes layering and possible tool issues
		return 1

/obj/item/borg/upgrade/satchel_of_holding_for_borgs/unaction(mob/living/silicon/robot/R)
	..()
	R.module.modules -= ref_to_bag
	var/ref1 = ref_to_bag
	ref_to_bag = null
	qdel(ref1)
