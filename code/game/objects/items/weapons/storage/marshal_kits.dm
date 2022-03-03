/obj/item/storage/box/m_kit
	name = "\improper Marshal Kit"
	desc = "A standard kit."
	cant_hold = list(/obj/item) //stops them from being used as storage solutions - items can't be put back in.
	w_class = ITEM_SIZE_BULKY //these carry guns and lots of items! Makes sense to make them bigger than some tiny box
	icon_state = "box"

// Primary kits
/obj/item/storage/box/m_kit/thompson
	name = "\improper Thompson Kit"
	desc = "The standard Marshal box kit containing a thompson submachine gun.An SMG worthy of main-carry, as long as one doesn't mind looking a bit dated "

	populate_contents()
		new /obj/item/gun/projectile/automatic/thompson(src)
		new /obj/item/ammo_magazine/smg_magnum_40/rubber(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)

/obj/item/storage/box/m_kit/state_auto
	name = "\improper State Auto-Shotgun Kit"
	desc = "The standard Marshal box kit containing a state auto shotgun. What is lacks in penetration it makes up for with ammo capacity and fire rate."

	populate_contents()
		new /obj/item/gun/projectile/automatic/riot_autoshotgun(src)
		new /obj/item/ammo_casing/shotgun/beanbag/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)

/obj/item/storage/box/m_kit/bulldog
	name = "\improper Bulldog Kit"
	desc = "The standard Marshal box kit containing a bulldog, a proper carbine for a proper policemen."

	populate_contents()
		new /obj/item/gun/projectile/automatic/bulldog(src)
		new /obj/item/ammo_magazine/light_rifle_257/rubber(src)
		new /obj/item/ammo_magazine/light_rifle_257(src)
		new /obj/item/ammo_magazine/light_rifle_257(src)

/obj/item/storage/box/m_kit/gear_lasgun
	name = "\improper Gear Lasgun Kit"
	desc = "The standard Marshal box kit containing a modified cog that fires stun beams only. For the economic officer."

	populate_contents()
		new /obj/item/gun/energy/cog/gear(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
//supply-specs kits
/obj/item/storage/box/m_kit/typewriter
	name = "\improper Sunrise Laser SMG kit"
	desc = "The standard Marshal box kit containing a Marshal Gunsmith made laser SMG, for the discerning specialist."

	populate_contents()
		new /obj/item/gun/energy/sunrise(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)

/obj/item/storage/box/m_kit/pug
	name = "\improper Pug Kit"
	desc = "The standard Marshal box kit containing a Pug, a full auto shotgun best suited to handling troublesome intruders in the armory."

	populate_contents()
		new /obj/item/gun/projectile/shotgun/pug(src)
		new /obj/item/ammo_magazine/m12/beanbag(src)
		new /obj/item/ammo_magazine/m12(src)
		new /obj/item/ammo_magazine/m12(src)

// Secondary kits
/obj/item/storage/box/m_kit/wirbelwind
	name = "\improper Wirbelwind Kit"
	desc = "The standard Marshal box kit containing a wirbelwind submachine gun. Capable of fitting a holster and going full auto because who needs accuracy?"

	populate_contents()
		new /obj/item/gun/projectile/automatic/wirbelwind(src)
		new /obj/item/ammo_magazine/smg_35/rubber(src)
		new /obj/item/ammo_magazine/smg_35/rubber(src)
		new /obj/item/ammo_magazine/smg_35(src)

/obj/item/storage/box/m_kit/firefly
	name = "\improper Firefly Secondary Kit"
	desc = "The standard Marshal box kit containing a firefly .35 pistol. An all round solid firearm that provides good qualities in every area. Has less recoil than the colt and auto ejects its magazine."

	populate_contents()
		new /obj/item/gun/projectile/firefly(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)

/obj/item/storage/box/m_kit/colt
	name = "\improper Colt Secondary Kit"
	desc = "The standard Marshal box kit containing a colt pistol. A dependable if cheap pistol that is all round a solid choice. Stronger than the firefly per shot."

	populate_contents()
		new /obj/item/gun/projectile/colt/NM_colt(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)

/obj/item/storage/box/m_kit/ladon
	name = "\improper Ladon Secondary Kit"
	desc = "The standard Marshal box kit containing a ladon pistol. A good choice for .40 magnums with better recoil control and more penetration than the firefly and colt respectively but \
	has a much lower magazine capacity, making it a favorite for those with excellent aim."

	populate_contents()
		new /obj/item/gun/projectile/ladon(src)
		new /obj/item/ammo_magazine/magnum_40/rubber(src)
		new /obj/item/ammo_magazine/magnum_40/rubber(src)
		new /obj/item/ammo_magazine/magnum_40(src)

/obj/item/storage/box/m_kit/glock
	name = "\improper Sky Secondary Kit"
	desc = "The standard Marshal box kit containing a sky model glock pistol. A reasonably well made .35 pistol that has both semi-auto and burst fire options. Considered highly desirable \
	for its low recoil and ability to take .35 drum mags and silencers."

	populate_contents()
		new /obj/item/gun/projectile/glock(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)

// Armor Kits
/obj/item/storage/box/m_kit/standard_armor
	name = "\improper Standard Visor Armor Kit"
	desc = "An standard Marshal armor kit with a plate carrier and visor helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/platecarrier/ih(src)
		new /obj/item/clothing/head/helmet/faceshield/helmet_visor(src)

/obj/item/storage/box/m_kit/bullet_proof
	name = "\improper Bullet Proof Kit"
	desc = "An standard Marshal armor kit containing bullet proof armor and a helmet, perfect for dealing with hostile colonist and infiltrators, but bulky and slowing."

	populate_contents()
		new /obj/item/clothing/suit/armor/bulletproof/ironhammer(src)
		new /obj/item/clothing/head/helmet/marshal_full(src)

/obj/item/storage/box/m_kit/laser_armor
	name = "\improper Ablative Armor Kit"
	desc = "An standard Marshal armor kit containing a full ablative marshal branded suit for countering laser weaponry."

	populate_contents()
		new /obj/item/clothing/suit/armor/vest/ablative(src)
		new /obj/item/clothing/head/helmet/laserproof(src)
		new /obj/item/clothing/gloves/thick/ablasive(src)
		new /obj/item/clothing/shoes/ablasive(src)

/obj/item/storage/box/m_kit/riot
	name = "\improper Riot Armor Kit"
	desc = "An standard Marshal armor kit containing riot armor and a riot helmet, perfect for dealing with hostile fauna and anyone in melee, but bulky and slowing."

	populate_contents()
		new /obj/item/clothing/suit/armor/heavy/riot/ironhammer(src)
		new /obj/item/clothing/head/helmet/faceshield/riot(src)

/obj/item/gunbox/warrantofficer //credit goes to Hestia both for the idea of loadout gun box and for the code, and sprite.
	name = "\improper Warrant Officers equipment kit"
	desc = "A secure box containing the Warrant Officers primary weapon."
	icon = 'icons/obj/storage.dmi'
	icon_state = "rifle_case"

/obj/item/gunbox/warrantofficer/attack_self(mob/living/user)
	..()
	var/stamped
	if(!stamped)
		stamped = TRUE
		var/list/options = list()
		options["Osprey - precision rifle"] = list(/obj/item/gun/projectile/automatic/omnirifle/fancy,/obj/item/ammo_magazine/heavy_rifle_408,/obj/item/ammo_magazine/heavy_rifle_408, /obj/item/ammo_magazine/heavy_rifle_408/rubber)
		options["SWAT - combat shotgun"] = list(/obj/item/gun/projectile/shotgun/pump/swat, /obj/item/ammo_magazine/ammobox/shotgun/beanbags, /obj/item/ammo_magazine/ammobox/c10x24_small)
		var/choice = input(user,"What type of equipment?") as null|anything in options
		if(src && choice)
			var/list/things_to_spawn = options[choice]
			for(var/new_type in things_to_spawn)
				var/atom/movable/AM = new new_type(get_turf(src))
				if(istype(AM, /obj/item/gun/))
					to_chat(user, "You have chosen \the [AM].")
			qdel(src)
		else
			stamped = FALSE