/*
	Defines a firing mode for a gun.

	A firemode is created from a list of fire mode settings. Each setting modifies the value of the gun var with the same name.
	If the fire mode value for a setting is null, it will be replaced with the initial value of that gun's variable when the firemode is created.
	Obviously not compatible with variables that take a null value. If a setting is not present, then the corresponding var will not be modified.

	Fire delay 1 = 600 rounds per minute
	Fire delay 2 = 300 rounds per minute
	Fire delay 3 = 200 rounds per minute
	Fire delay 4 = 150 rounds per minute
	Fire delay 5 = 120 rounds per minute
	Fire delay 6 = 100 rounds per minute
	Fire delay 7 = 85~ rounds per minute
	Fire delay 8 = 75  rounds per minute
	Fire delay 9 = 66  rounds per minute
	Fire delay 10 = 60 rounds per minute
	Fire delay 11 = 54 rounds per minute
	Fire delay 12 = 50 rounds per minute
	Fire delay 13 = 46 rounds per minute
	Fire delay 14 = 42 rounds per minute
	Fire delay 15 = 40 rounds per minute

*/

/datum/firemode
	var/name = "default"
	var/desc = "The default firemode"
	var/icon_state
	var/list/settings = list()
	var/obj/item/gun/gun = null

/datum/firemode/New(obj/item/gun/_gun, list/properties = null)
	..()
	if(!properties || !properties.len) return

	gun = _gun
	for(var/propname in properties)
		var/propvalue = properties[propname]

		if(propname == "mode_name")
			name = propvalue
		else if(propname == "mode_desc")
			desc = propvalue
		else if(propname == "icon")
			icon_state = properties["icon"]
		else if(isnull(propvalue))
			settings[propname] = gun.vars[propname] //better than initial() as it handles list vars like dispersion
		else
			settings[propname] = propvalue

/datum/firemode/Destroy()
	gun = null
	return ..()

/datum/firemode/proc/apply_to(obj/item/gun/_gun)
	gun = _gun

	for(var/propname in settings)
		if(propname == "damage_mult_add")
			gun.damage_multiplier += settings[propname]
			continue

		try
			gun.vars[propname] = settings[propname]

			// Apply gunmods effects that have been erased by the previous line
			if(propname == "charge_cost")
				for(var/obj/I in gun.item_upgrades)
					var/datum/component/item_upgrade/IU = I.GetComponent(/datum/component/item_upgrade)
					if(IU.weapon_upgrades[GUN_UPGRADE_CHARGECOST])
						gun.vars["charge_cost"] *= IU.weapon_upgrades[GUN_UPGRADE_CHARGECOST]
			else if(propname == "fire_delay")
				for(var/obj/I in gun.item_upgrades)
					var/datum/component/item_upgrade/IU = I.GetComponent(/datum/component/item_upgrade)
					if(IU.weapon_upgrades[GUN_UPGRADE_FIRE_DELAY_MULT])
						gun.vars["fire_delay"] *= IU.weapon_upgrades[GUN_UPGRADE_FIRE_DELAY_MULT]
		catch
			// throw away exception, we don't care
			continue



//Called whenever the firemode is switched to, or the gun is picked up while its active
/datum/firemode/proc/update()
	return

/datum/firemode/proc/force_deselect(mob/user)
	return
