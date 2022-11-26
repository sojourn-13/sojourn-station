/obj/item/gun/energy/laser/railgun/pistol/slab
	name = "\"Slab\" rail pistol"
	desc = "A variation upon the Guild's famous \"Myrmidon\" rail pistol, this weapon uses a minaturised fusion reactor based on Greyson Positronics schematics to collect microscopic amounts of scrap from the air \
	and accelerate them to relativistic speeds. Unlike the standard model, this has two firemodes: \"lethal\" and \"more lethal\". It's slow to charge, due to needing consistent maintenance, but an experienced \
	engineer could tune it back up with a multitool. Smells like copper and iron."
	icon = 'icons/obj/guns/energy/slab.dmi'
	icon_state = "slab"
	item_state = "slab"
	charge_meter = FALSE
	item_charge_meter = FALSE
	self_recharge = 1
	recharge_time = 20
	recharge_amount = 30
	charge_cost = 100
	projectile_type = /obj/item/projectile/bullet/kurtz_50/railgun
	damage_multiplier = 1.3 //Less capacity and charge speed than a Posi'd Myrmidion, even when fully tuned; hits like a brick, to compensate.
	penetration_multiplier = 1.3
	cell_type = /obj/item/cell/medium
	origin_tech = list(TECH_COMBAT = 6, TECH_MAGNET = 6, TECH_ENGINEERING = 6)
	init_firemodes = list(
		list(mode_name="kill", mode_desc="fires scrap at relativistic speed", icon="kill"),
		list(mode_name="superkill", mode_desc="blows all your charge on a single, piercing shot", penetrating = 3, penetration_multiplier = 3, fire_delay = 25, charge_cost = 600, icon="destroy"),
	)
	price_tag = 5000

/obj/item/gun/energy/laser/railgun/pistol/slab/attackby(obj/item/I, mob/user)
	if(I.tool_qualities)
		var/successful_fix = FALSE
		var/user_mec = user.stats.getStat(STAT_MEC)
		var/charge_bonus = 0 //How much time are we shaving off the recharge?
		for(var/quality in I.tool_qualities)
			if(I.tool_qualities[quality] >= 10 && quality == QUALITY_PULSING) //Check for pulsing quality of at least 10
				charge_bonus = round(((I.tool_qualities[quality] + user_mec) / 10),1) //Add pulsing quality to MEC, divide by 10, then round to the nearest digit. Subtract from 20; this is the new recharge_time.
				if(charge_bonus > 15)
					charge_bonus = 15 //Don't want recharge time going into the negatives
				if(src.recharge_time == 5)
					successful_fix = TRUE
					to_chat(user, SPAN_NOTICE("The Slab is already running at maximum efficiency!"))
				else if((src.recharge_time) > (20 - charge_bonus))
					successful_fix = TRUE
					src.recharge_time = 20 - charge_bonus
					to_chat(user, SPAN_NOTICE("Through your mechanical knowledge, you manage to overclock the Slab's reactor. It's now running at [round((charge_bonus * 6.6),5)]% efficiency!")) //We can shave up to 15 off recharge_time, so "round((charge_bonus * 6.6),5" rounds that to the nearest 5% of the potential improvement
		if(!successful_fix)
			to_chat(user, SPAN_NOTICE("Try as you might, you can't figure out how to improve the Slab's operation."))
	..()
