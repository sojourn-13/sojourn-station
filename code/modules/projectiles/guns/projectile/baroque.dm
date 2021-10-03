/*
Own a musket for department defense, since that's what the founding hunters intended.
 Four ruffians break into my department.
 "What the devil?" As I grab my powdered wig and Baroque bone rifle.
 Blow a golf ball sized hole through the first outsider, he's dead on the spot.
 Draw my crossbow on the second outsider, miss him entirely because it's not hitscan and nails the neighbors cerberis.
 I have to resort to the queen shotgun mounted at the top of the stairs loaded with buck shot,
 "Tally ho lads" the buck shot shreds two outsiders in the blast, the sound and extra shrapnel set off shuttle alarms.
 Fix bayonet sharpener block and charge the last terrified rapscallion.
 He Bleeds out waiting on the marshals to arrive since triangular wounds are impossible to stitch up without surgery.
 Just as the founding hunters intended.
*/
/obj/item/gun/projectile/baroque
	name = "\"Baroque\" bone rifle"
	desc = "A heavy smoothbore lever-action rifle made from dense bones fitted with a plasteel barrel. One of the few rifles produced and widely distributed by Kriosan Jaegers, this \
	particular design imparted by kriosan's favoring the hunting lodge. Fires a single devistating shot which can fell most animals in a single blow, though it struggles to do the same \
	to people as it was designed primarily for game hunting. Still packs a hell of a punch. Uses 30mm rolled shot."
	icon = 'icons/obj/guns/projectile/baroque.dmi'
	icon_state = "baroque"
	item_state = "baroque"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 2)
	caliber = CAL_BALL
	recoil_buildup = 40
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/ball
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/rifle_load.ogg'
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_BONE = 20)
	price_tag = 750
	one_hand_penalty = 80
	var/bolt_open = 0
	zoom_factor = 1.3
	twohanded = TRUE
	gun_tags = list(GUN_PROJECTILE)

/obj/item/gun/projectile/baroque/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (item_suffix)
		itemstring += "[item_suffix]"

	if (bolt_open)
		iconstring += "_open"
	else
		iconstring += "_closed"

	icon_state = iconstring
	set_item_state(itemstring)



/obj/item/gun/projectile/baroque/attack_self(mob/user) //Someone overrode attackself for this class, soooo.
	if(zoom)
		toggle_scope(user)
		return
	bolt_act(user)

/obj/item/gun/projectile/baroque/proc/bolt_act(mob/living/user)
	playsound(src.loc, 'sound/weapons/guns/interact/rifle_boltback.ogg', 75, 1)
	bolt_open = !bolt_open
	if(bolt_open)
		if(chambered)
			to_chat(user, SPAN_NOTICE("You work the bolt open, ejecting [chambered]!"))
			chambered.loc = get_turf(src)
			loaded -= chambered
			chambered = null
		else
			to_chat(user, SPAN_NOTICE("You work the bolt open."))
	else
		to_chat(user, SPAN_NOTICE("You work the bolt closed."))
		playsound(src.loc, 'sound/weapons/guns/interact/rifle_boltforward.ogg', 75, 1)
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/gun/projectile/baroque/special_check(mob/user)
	if(bolt_open)
		to_chat(user, SPAN_WARNING("You can't fire [src] while the bolt is open!"))
		return 0
	return ..()

/obj/item/gun/projectile/baroque/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/gun/projectile/baroque/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()