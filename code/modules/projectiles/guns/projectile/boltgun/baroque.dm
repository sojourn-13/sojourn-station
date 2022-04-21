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
/obj/item/gun/projectile/boltgun/baroque
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
	extra_damage_mult_scoped = 0.4
	one_hand_penalty = 80
	zoom_factor = 1.3
	twohanded = TRUE
	sharp = FALSE
	saw_off = FALSE //Todo. Pistole verson
	eject_animatio = FALSE //Todo: this
	bolt_training = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_SIGHT)
	serial_type = "Kriosan"