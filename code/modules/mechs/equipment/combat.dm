/obj/item/gun/energy/get_hardpoint_maptext()
	return "[round(cell.charge / charge_cost)]/[round(cell.maxcharge / charge_cost)]"

/obj/item/gun/energy/get_hardpoint_status_value()
	var/obj/item/cell/C = get_cell()
	if(istype(C))
		return C.charge/C.maxcharge
	return null

/obj/item/mech_equipment/mounted_system/taser
	name = "PBT \"Pacifier\" mounted taser"
	desc = "A dual fire mode taser system connected to the exosuit's targetting system."
	icon_state = "mech_taser"
	holding_type = /obj/item/gun/energy/taser/carbine/mounted/mech
	restricted_hardpoints = list(HARDPOINT_LEFT_HAND, HARDPOINT_RIGHT_HAND)
	restricted_software = list(MECH_SOFTWARE_WEAPONS)
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 3)
	matter = list(MATERIAL_PLASTEEL = 24, MATERIAL_PLASTIC = 10, MATERIAL_SILVER = 3)

/obj/item/gun/energy/taser/carbine/mounted
	spawn_tags = null

/obj/item/gun/energy/taser/carbine/mounted/mech
	name = "PBT \"Pacifier\" mounted taser"
	use_external_power = TRUE
	restrict_safety = TRUE
	self_recharge = TRUE
	twohanded = FALSE
	charge_cost = MECH_WEAPON_POWER_COST * 0.5 // Pew pew pew pew pew pew pew pew pew pew
	burst = 3
	burst_delay = 1 // PEW PEW PEW
	recoil_buildup = 2 // pew in all directions
	matter = list()
	cell_type = /obj/item/cell/medium/mech

/obj/item/mech_equipment/mounted_system/taser/ion
	name = "mounted ion rifle"
	desc = "An exosuit-mounted ion rifle. Handle with care."
	icon_state = "mech_ionrifle"
	holding_type = /obj/item/gun/energy/ionrifle/mounted/mech
	matter = list(MATERIAL_PLASTEEL = 24, MATERIAL_SILVER = 10)
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 4)

/obj/item/gun/energy/ionrifle/mounted
	spawn_tags = null

/obj/item/gun/energy/ionrifle/mounted/mech
	use_external_power = TRUE
	restrict_safety = TRUE
	self_recharge = TRUE
	twohanded = FALSE
	charge_cost = MECH_WEAPON_POWER_COST * 0.75
	cell_type = /obj/item/cell/medium/mech
	matter = list()

/obj/item/mech_equipment/mounted_system/taser/laser
	name = "CH-PS \"Immolator\" laser"
	desc = "An exosuit-mounted laser rifle. Handle with care."
	icon_state = "mech_lasercarbine"
	holding_type = /obj/item/gun/energy/laser/mounted/mech
	matter = list(MATERIAL_PLASTEEL = 26, MATERIAL_SILVER = 5)
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 3)

/obj/item/gun/energy/laser/mounted
	spawn_tags = null

/obj/item/gun/energy/laser/mounted/mech
	name = "CH-PS \"Immolator\" laser"
	use_external_power = TRUE
	restrict_safety = TRUE
	self_recharge = TRUE
	twohanded = FALSE
	charge_cost = MECH_WEAPON_POWER_COST
	burst = 2
	burst_delay = 1.5
	matter = list()
	cell_type = /obj/item/cell/medium/mech

/obj/item/mech_equipment/mounted_system/taser/laser
	name = "CH-LC \"Solaris\" laser cannon"
	desc = "An exosuit mounted laser cannon. Twice the weight, twice the power."
	icon_state = "mecha_laser"
	holding_type = /obj/item/gun/energy/laser/mounted/mech/heavy
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_SILVER = 7, MATERIAL_GOLD = 3)
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 4)

/obj/item/gun/energy/laser/mounted/mech/heavy
	name = "CH-LC \"Solaris\" laser cannon"
	use_external_power = TRUE
	restrict_saftey = TRUE
	self_recharge = TRUE
	twohanded_ FALSE
	charge_cost = MECH_WEAPON_POWER_COST_HEAVY
	burst = 1
	burst_delay = 2
	matter = list()
	cell_type = /obj/item/cell/medium/mech

/obj/item/mech_equipment/mounted_system/taser/plasma
	name = "mounted plasma cutter"
	desc = "An industrial plasma cutter mounted onto the chassis of the mech. "
	icon_state = "railauto" //TODO: Make a new sprite that doesn't get sec called on you.
	holding_type = /obj/item/gun/energy/plasmacutter/mounted/mech
	restricted_hardpoints = list(HARDPOINT_LEFT_HAND, HARDPOINT_RIGHT_HAND, HARDPOINT_LEFT_SHOULDER, HARDPOINT_RIGHT_SHOULDER)
	origin_tech = list(TECH_MATERIAL = 4, TECH_PLASMA = 4, TECH_ENGINEERING = 6, TECH_COMBAT = 3)
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 5)

/obj/item/gun/energy/plasmacutter

/obj/item/gun/energy/plasmacutter/mounted
	spawn_tags = null

/obj/item/gun/energy/plasmacutter/mounted/mech
	use_external_power = TRUE
	restrict_safety = TRUE
	twohanded = FALSE
	self_recharge = TRUE
	charge_cost = MECH_WEAPON_POWER_COST * 1.5
	projectile_type = /obj/item/projectile/beam/cutter
	matter = list()
	cell_type = /obj/item/cell/medium/mech

/obj/item/gun/projectile/get_hardpoint_maptext()
	return "[get_ammo()]/[ammo_magazine.max_ammo]"

/obj/item/gun/projectile/get_hardpoint_status_value()
	if(ammo_magazine)
		return get_ammo()/ammo_magazine.max_ammo
	return null

/obj/item/mech_equipment/mounted_system/ballistic

/obj/item/mech_equipment/mounted_system/ballistic/pk
	name = "SA \"VJP\""
	desc = "A reverse engineered Pulemyot Kalashnikova fitted for mech use. Fires in 15 round bursts. Horribly inaccurate, but packs quite a punch."
	icon_state = "mech_pk"
	holding_type = /obj/item/gun/projectile/automatic/lmg/pk/mounted/mech
	restricted_hardpoints = list(HARDPOINT_LEFT_HAND, HARDPOINT_RIGHT_HAND)
	restricted_software = list(MECH_SOFTWARE_WEAPONS)
	origin_tech = list(TECH_COMBAT = 5, TECH_MAGNET = 3)
	matter = list(MATERIAL_PLASTEEL = 60)

/obj/item/gun/projectile/automatic/lmg/pk/mounted

/obj/item/gun/projectile/automatic/lmg/pk/mounted/mech
	name = 	"SA \"VJP\""
	desc = "A reverse engineered Pulemyot Kalashnikova fitted for mech use. Fires in 5 round bursts. Slightly inaccurate, but packs quite a punch."
	restrict_safety = TRUE
	twohanded = FALSE
	init_firemodes = list(
		list(mode_name="spit fire",  burst=5, burst_delay=0.8, move_delay=5,  icon="burst")
		)
	spawn_tags = null
	matter = list()
	magazine_type = /obj/item/mech_ammo_box/lmg


/obj/item/gun/projectile/automatic/lmg/pk/mounted/mech/Initialize()
	. = ..()
	ammo_magazine = new /obj/item/mech_ammo_box/lmg(src)

/obj/item/gun/projectile/automatic/lmg/pk/mounted/mech/afterattack(atom/A, mob/living/user)
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo && !ammo_magazine.stored_ammo.len)
		qdel(ammo_magazine)
		playsound(src.loc, 'sound/weapons/guns/interact/lmg_open.ogg', 100, 1)
		var/mob/living/exosuit/E = loc
		if(istype(E))
			var/obj/item/cell/cell = E.get_cell()
			if(istype(cell))
				cell.use(500)
		ammo_magazine = new /obj/item/ammo_magazine/lrifle/pk/mech(src)
		spawn(1)
			playsound(src.loc, 'sound/weapons/guns/interact/lmg_cock.ogg', 100, 1)
		spawn(2)
			playsound(src.loc, 'sound/weapons/guns/interact/lmg_close.ogg', 100, 1)

//////////////////////////////////
//Sojourn melee mech attachments//
//////////////////////////////////

/obj/item/mecha_parts/mecha_equipment/melee_weapon
	name = "mecha melee weapon"
	desc = "guh."
	restricted_hardpoints = list(HARDPOINT_LEFT_HAND, HARDPOINT_RIGHT_HAND)
	restricted_software = list(MECH_SOFTWARE_WEAPONS)
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	matter = list(MATERIAL_STEEL = 15)
	equip_cooldown = 15
	energy_drain = 10
	structure_damage_factor = 2
	force = 20
	embed_mult = 0 // Mech mounted weapons, shouldn't embed

/obj/item/mecha_parts/mecha_equipment/melee_weapon/sword
	name = "mech sword"
	desc = "A huge sword designed to be wielded by an exosuit."
	icon_state = "mech_sword"
	sharp = TRUE
	edge = TRUE
	tool_qualities = list(QUALITY_CUTTING = 35, QUALITY_SAWING = 20) // It's a literal mech sized blade
	armor_penetration = ARMOR_PEN_DEEP
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	hitsound = 'sound/weapons/bladeslice.ogg'
	var/icon/melee_overlay
	force = 60 // Big sword make big boo boo - R4d6 / Upped further because delay - Wizard

/obj/item/mecha_parts/mecha_equipment/melee_weapon/cutlass
	name = "mech energy cutlass"
	desc = "A huge energy cutlass designed to be wielded by an exosuit."
	icon_state = "mecha_cutlass"
	sharp = TRUE
	edge = TRUE
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_WIRE_CUTTING = 20) //Same as E-cutlasses
	origin_tech = list(TECH_MAGNET = 5, TECH_POWER = 6, TECH_COMBAT = 3) //Same as E-cutlasses
	matter = list(MATERIAL_STEEL = 15, MATERIAL_SILVER = 1, MATERIAL_GOLD = 1) //WAY LESS then normal E-cutlasses do to the only being 5 more damage
	armor_penetration = ARMOR_PEN_DEEP
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	hitsound = 'sound/weapons/bladeslice.ogg'
	var/icon/melee_overlay
	force = 65 //5 more for all its extra costs is the balancing


/obj/item/mecha_parts/mecha_equipment/melee_weapon/shockmaul
	name = "mech shock maul"
	desc = "A massive, plasteel maul designed to be wielded by an exosuit"
	icon_state = "mech_maul"
	hitsound = 'sound/weapons/Egloves.ogg'
	matter = list(MATERIAL_STEEL = 10, MATERIAL_SILVER = 2)
	var/icon/melee_overlay
	var/agonyforce = 80
	var/stunforce = 0

/obj/item/mecha_parts/mecha_equipment/melee_weapon/shockmaul/attack(mob/living/M, mob/living/user, target_zone)
	M.stun_effect_act(stunforce, agonyforce, target_zone, src)
	return ..()
