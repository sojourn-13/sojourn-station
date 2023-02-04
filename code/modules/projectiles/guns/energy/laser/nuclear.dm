/obj/item/gun/energy/gun/nuclear
	name = "\"EBR-IV\" Nuclear Particle Rifle"
	desc = "A prototype of a 'self-sustaining' experimental breeder rifle feeding itself off a built-in nuclear reactor. Projecting either high powered tazer shots or deadly particle beams at will of it's user. \
	Neither Soteria nor Sol Military take any responsiblity for deaths of it's users."
	icon = 'icons/obj/guns/energy/nucgun.dmi'
	icon_state = "nucgun"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/aer14fire.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 5, TECH_POWER = 3)
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL //looks heavier than a pistol
	self_recharge = 1
	modifystate = null
	matter = list(MATERIAL_STEEL = 20, MATERIAL_URANIUM = 10)
	price_tag = 1700
	charge_cost = 50
	can_dual = FALSE
	twohanded = TRUE
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE) //Were all three and can have a scope if someone wants
	init_firemodes = list(
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_sound = 'sound/weapons/energy/Taser.ogg', fire_delay=35, icon="stun"),
		list(mode_name="nuclear beam", projectile_type=/obj/item/projectile/beam/radiation, fire_sound='sound/weapons/energy/aer14fire.ogg', fire_delay=10, icon="kill"),
	)

	var/lightfail = 0
	serial_type = "SI"

//override for failcheck behaviour
/obj/item/gun/energy/gun/nuclear/Process()
	charge_tick++
	if(charge_tick < 4) return 0
	charge_tick = 0
	if(!cell) return 0
	if((cell.charge / cell.maxcharge) != 1)
		cell.give(charge_cost)
		update_icon()
	return 1

/obj/item/gun/energy/gun/nuclear/proc/update_charge()
	var/ratio = cell.charge / cell.maxcharge
	ratio = round(ratio, 0.20) * 100
	add_overlay("nucgun-[ratio]")
	set_item_state("-[ratio]")

/obj/item/gun/energy/gun/nuclear/proc/update_reactor()
	if(lightfail)
		add_overlay("nucgun-medium")
	else if ((cell.charge/cell.maxcharge) <= 0.5)
		add_overlay("nucgun-light")
	else
		add_overlay("nucgun-clean")

/obj/item/gun/energy/gun/nuclear/proc/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	switch(current_mode.name)
		if("stun") add_overlay("nucgun-stun")
		if("kill") add_overlay("nucgun-kill")

/obj/item/gun/energy/gun/nuclear/update_icon()
	cut_overlays()
	if(cell)
		update_charge()
		update_reactor()
	update_mode()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)
