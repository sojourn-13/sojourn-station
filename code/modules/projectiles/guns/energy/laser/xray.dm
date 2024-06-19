/obj/item/gun/energy/xray
	name = "\"X-RAY\" laser rifle"
	desc = "A brandless modern laser rifle capable of delivering powered blasts even across solid surfaces accompanied by signature high pitched screech. Due to this it has been banned from commercial use but still finds itself in hands of many mercenary groups."
	icon = 'icons/obj/guns/energy/xray.dmi'
	icon_state = "xray"
	item_state = "xray"
	fire_sound = 'sound/weapons/energy/laser3.ogg'
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ILLEGAL = 2)
	price_tag = 2000
	projectile_type = /obj/item/projectile/beam/xray
	charge_cost = 100
	init_recoil = CARBINE_RECOIL(0.1)
	twohanded = TRUE
	gun_tags = list(GUN_LASER, GUN_ENERGY) //No more scope so people can't cheese with it
	serial_type = "INDEX"
	serial_shown = FALSE

/obj/item/gun/energy/IRKDissolver //IRK = Irkalla, marker so people can have an easier time saying what I made
	name = "\"TRR-II\" Dissolver" //Tactical Radiation Rifle Dissolver or for the whole 3 Star Trek enjoyers with us Thalaron Radiation Rifle
	desc = "The fruit of a collaboration of SI and Guild; The TRR-II Dissolver is build upon an EBR-4 Nuclear rifle. Using several components of SI and Guild this weapon effectively looses its stun mode but gains a penetrating beam mode of some sort. Some quirk with the enhancements provided by SI with the Guilds ingenuity resulted in the weapon also being able to fire debilitating kinetic blasts. Every setting but DEBILITATE seems to irradiate any target hit. It is unclear how exactly the reactor of the weapon works."
	icon = 'icons/obj/guns/energy/nucgun2.dmi'
	icon_state = "nucgun2"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/aer14fire.ogg'
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 5, TECH_MAGNET = 5, TECH_ILLEGAL = 4) //Its basically a handheld warcrime machine what do you expect
	force = WEAPON_FORCE_PAINFUL //looks heavier than a pistol
	self_recharge = 1
	modifystate = null
	matter = list(MATERIAL_STEEL = 20, MATERIAL_URANIUM = 10, MATERIAL_PLASTEEL = 10, MATERIAL_PLATINUM = 2) //Recovers the plasteel and platinum used in its construction
	price_tag = 1700
	charge_cost = 50
	can_dual = FALSE //Lol no
	twohanded = TRUE
	blacklist_upgrades = list(/obj/item/gun_upgrade/mechanism/greyson_master_catalyst = TRUE)
	gun_tags = list(GUN_LASER, GUN_ENERGY) //Xray laser with a scope? Yeah no.
	init_firemodes = list(
		list(mode_name="DEBILITATE", projectile_type=/obj/item/projectile/IRKdebilitate, fire_sound = 'sound/weapons/energy/burn.ogg', fire_delay=8, icon="destroy"),
		list(mode_name="DISSOLVE", projectile_type=/obj/item/projectile/beam/IRKdissolver, fire_sound='sound/weapons/energy/SuperHeavyLaser.ogg', fire_delay=8, icon="kill"),
		list(mode_name="DESOLATE", projectile_type=/obj/item/projectile/beam/IRKdesolator, fire_sound='sound/weapons/energy/vaporize.ogg', fire_delay=10, icon="vaporize"),
	)
	
	var/lightfail = 0
	serial_type = "SI"

//override for failcheck behaviour
/obj/item/gun/energy/IRKDissolver/Process()
	charge_tick++
	if(charge_tick < 4) return 0
	charge_tick = 0
	if(!cell) return 0
	if((cell.charge / cell.maxcharge) != 1)
		cell.give(charge_cost)
		update_icon()
	return 1

/obj/item/gun/energy/IRKDissolver/proc/update_charge()
	var/ratio = cell.charge / cell.maxcharge
	ratio = round(ratio, 0.20) * 100
	add_overlay("nucgun-[ratio]")
	set_item_state("-[ratio]")

/obj/item/gun/energy/IRKDissolver/proc/update_reactor()
	if(lightfail)
		add_overlay("nucgun2-medium")
	else if ((cell.charge/cell.maxcharge) <= 0.5)
		add_overlay("nucgun2-light")
	else
		add_overlay("nucgun2-clean")

/obj/item/gun/energy/IRKDissolver/proc/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	switch(current_mode.name)
		if("DEBILITATE") add_overlay("nucgun2-debilitate") // DONT FORGET THE ICONS
		if("DISSOLVE") add_overlay("nucgun2-dissolve") // DONT FORGET THE ICONS
		if("DESOLATE") add_overlay("nucgun2-desolate") // DONT FORGET THE ICONS

/obj/item/gun/energy/IRKDissolver/update_icon()
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

	
