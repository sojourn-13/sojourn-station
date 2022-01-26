/obj/item/gun/matter/holybook
	name = "Book of Jugments"
	desc = "A book from the faiths that are used to punish the sinful."
	icon_state = "biblegun"
	icon = 'icons/obj/guns/matter/books.dmi'
	slot_flags = SLOT_BELT
	fire_sound = 'sound/weapons/Taser.ogg'
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2, TECH_BIO = 6)
	matter_type = MATERIAL_BIOMATTER
	max_stored_matter = 15
	stored_matter = 0 //We do not print with free biomatter
	projectile_cost = 1
	projectile_type = /obj/item/projectile/beam/sniper/judgement
	max_upgrades = 0 //Its a book or staff...

/obj/item/gun/matter/holybook/Fire(atom/target, mob/living/user, clickparams, pointblank=0, reflex=0)
	var/obj/item/implant/core_implant/I = user.get_core_implant(/obj/item/implant/core_implant/cruciform)
	if(!I) //Do we have a core implant?
		to_chat(user, SPAN_WARNING("[src] is useless in your hand..."))
		return
	if(!I.active) //Is it active?
		to_chat(user, SPAN_WARNING("[src] is useless in your hand..."))
		return
	..()

/obj/item/gun/matter/holybook/sin
	name = "Sin within"
	desc = "A book from the faiths that are used to show the sinful."
	projectile_type = /obj/item/projectile/beam/sniper/sin_within

/obj/item/gun/matter/holybook/healing
	name = "Book of Grace"
	desc = "A book showing the mercy of the faith."
	projectile_type = /obj/item/projectile/beam/sniper/healing

/obj/item/gun/matter/holybook/staff
	name = "Harmony Scepter"
	desc = "A golden scepter with a leather wrapped around its handle, can be loaded with biomatter to heal those to cast its light onto. \
	Can be used to brash people over the head but it will be unwieldly"
	icon = 'icons/obj/guns/matter/harmony_scepter.dmi'
	projectile_type = /obj/item/projectile/beam/sniper/healing/staff
	//Theirs better weapons then this!
	force = WEAPON_FORCE_ROBUST
	armor_penetration = ARMOR_PEN_EXTREME
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	max_stored_matter = 20
	matter = list(MATERIAL_STEEL = 5, MATERIAL_BIOMATTER = 20, MATERIAL_GOLD = 10)
	price_tag = 3000 //So its worth stealing >:D
	w_class = ITEM_SIZE_HUGE

/obj/item/gun/matter/holybook/staff/attack()
	..()
	usr.setClickCooldown(DEFAULT_ATTACK_COOLDOWN*1.2)
