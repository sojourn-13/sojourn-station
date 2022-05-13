/obj/item/storage/box/m_kit
	name = "\improper Marshal Kit"
	desc = "A standard kit."
	cant_hold = list(/obj/item) //stops them from being used as storage solutions - items can't be put back in.
	w_class = ITEM_SIZE_BULKY //these carry guns and lots of items! Makes sense to make them bigger than some tiny box
	icon_state = "box"

// Primary kits
/obj/item/storage/box/m_kit/ppv
	name = "\improper PPV Kit"
	desc = "The standard Marshal box kit containing a \"Semyonovich\" assault submachine gun. An SMG worthy of main-carry, as long as one doesn't mind looking a bit dated "

	populate_contents()
		new /obj/item/gun/projectile/automatic/ppsh/ppv(src)
		new /obj/item/ammo_magazine/smg_35/rubber(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/m_kit/breacher
	name = "\improper Breaching Hammer Kit"
	desc = "The standard Marshal box kit, containing a single heavy-duty breaching hammer. Equally beloved by Marshals more interested in utility than firepower, and those \
	strange enough to take such an unwieldy thing into close combat"

	populate_contents()
		new /obj/item/tool/hammer/ironhammer(src)

/obj/item/storage/box/m_kit/state_auto
	name = "\improper State Auto-Shotgun Kit"
	desc = "The standard Marshal box kit containing a state auto shotgun. What is lacks in penetration it makes up for with ammo capacity and fire rate."

	populate_contents()
		new /obj/item/gun/projectile/automatic/riot_autoshotgun(src)
		new /obj/item/ammo_casing/shotgun/beanbag/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/storage/pouch/tubular(src)

/obj/item/storage/box/m_kit/bulldog
	name = "\improper Bulldog Kit"
	desc = "The standard Marshal box kit containing a bulldog, a proper carbine for a proper policemen."

	populate_contents()
		new /obj/item/gun/projectile/automatic/bulldog(src)
		new /obj/item/ammo_magazine/light_rifle_257/rubber(src)
		new /obj/item/ammo_magazine/light_rifle_257(src)
		new /obj/item/ammo_magazine/light_rifle_257(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/m_kit/gear_lasgun
	name = "\improper Gear Lasgun Kit"
	desc = "The standard Marshal box kit containing a modified cog that fires stun beams only. For the economic officer."

	populate_contents()
		new /obj/item/gun/energy/cog/gear(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/storage/pouch/tubular(src)

//supply-specs kits
/obj/item/storage/box/m_kit/typewriter
	name = "\improper Sunrise Laser SMG kit"
	desc = "The standard Marshal box kit containing a Marshal Gunsmith made laser SMG, for the discerning specialist."

	populate_contents()
		new /obj/item/gun/energy/sunrise(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/storage/pouch/tubular(src)

/obj/item/storage/box/m_kit/pug
	name = "\improper Pug Kit"
	desc = "The standard Marshal box kit containing a Pug, a full auto shotgun best suited to handling troublesome intruders in the armory."

	populate_contents()
		new /obj/item/gun/projectile/shotgun/pug(src)
		new /obj/item/ammo_magazine/m12/beanbag(src)
		new /obj/item/ammo_magazine/m12(src)
		new /obj/item/ammo_magazine/m12(src)
		new /obj/item/storage/pouch/ammo(src)

//Ranger kits
/obj/item/storage/box/m_kit/armstrong
	name = "Armstrong Kit"
	desc = "The standard Marshal box kit containing a Armstrong lever action rifle, a repeating rifle chambered in .40 Magnum."

	populate_contents()
		new /obj/item/gun/projectile/boltgun/lever
		new /obj/item/ammo_magazine/ammobox/magnum_40
		new /obj/item/ammo_magazine/ammobox/magnum_40/rubber

/obj/item/storage/box/m_kit/tommygun
	name = "Thompson SMG Kit"
	desc = "The standard Marshal box kit containing a Thompson submachinegun, a powerhouse of old Sol-based police and gangsters alike."

	populate_contents()
		new /obj/item/gun/projectile/automatic/thompson
		new /obj/item/ammo_magazine/smg_magnum_40/rubber(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)

/obj/item/storage/box/m_kit/peacekeeper
	name = "Peacekeeper ESG Kit"
	desc = "The standard Marshal box kit containing a Peackeeper energy shotgun, a lethal and non-lethal powerhouse of engineering."

	populate_contents()
		new /obj/item/gun/energy/peacekeeper(src)
		new /obj/item/cell/medium/high(src)

// Secondary kits
/obj/item/storage/box/m_kit/wirbelwind
	name = "\improper Wirbelwind Kit"
	desc = "The standard Marshal box kit containing a wirbelwind submachine gun. Capable of fitting a holster and going full auto because who needs accuracy?"

	populate_contents()
		new /obj/item/gun/projectile/automatic/wirbelwind(src)
		new /obj/item/ammo_magazine/smg_35/rubber(src)
		new /obj/item/ammo_magazine/smg_35/rubber(src)
		new /obj/item/ammo_magazine/smg_35(src)

/obj/item/storage/box/m_kit/taser
	name = "\improper Counselor Secondary kit"
	desc = "The standard Marshal box kit containing a counselor stun gun. An all round solid sidearm to round out the Marshals non-lethal kit."

	populate_contents()
		new /obj/item/gun/energy/taser(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)

/obj/item/storage/box/m_kit/bronco
	name = "\improper Bronco Secondary Kit"
	desc = "The standard Marshal box kit containing a bronco pistol. A dependable if cheap pistol that is all round a solid choice. Stronger than the firefly per shot."

	populate_contents()
		new /obj/item/gun/projectile/colt/NM_colt(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)

/obj/item/storage/box/m_kit/makarov
	name = "\improper Makarov Secondary Kit"
	desc = "The standard Marshal box kit containing a makarov pistol. A pocket pistol of the hidden police in old eras, now a days a dependable holdout pistol that fits just about anyware and dependable when in a shootout."

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

// Ranger secondary kits
/obj/item/storage/box/m_kit/deckard
	name = "Deckards Secondary Kit"
	desc = "The standard Marshal box kit containing a Deckard revolver. A handcanon in all but name, its cylinder having the capacity of five .50 Kurtz rounds."

	populate_contents()
		new /obj/item/gun/projectile/revolver/deckard(src)
		new /obj/item/ammo_magazine/speed_loader_kurtz_50/rubber(src)
		new /obj/item/ammo_magazine/speed_loader_kurtz_50/rubber(src)
		new /obj/item/ammo_magazine/speed_loader_kurtz_50/rubber(src)
		new /obj/item/ammo_magazine/speed_loader_kurtz_50/lethal(src)

/obj/item/storage/box/m_kit/judge
	name = "Judge Secondary Kit"
	desc = "The standard Marshal box kit containing a Judge revolver, a large caliber revolver capable of firing a 7.5 round down range effectively. Highly sought after by police forces."

	populate_contents()
		new /obj/item/gun/projectile/revolver/judge(src)
		new /obj/item/ammo_magazine/ammobox/rifle_75_small/rubber(src)

/obj/item/storage/box/m_kit/zwang
	name = "Zwang Secondary Kit"
	desc = "The standard Marshal box kit containing a Lawbringer energy revolver. The cylander of this custom-designed revolver has been replaced with space for an energy cell."

	populate_contents()
		new /obj/item/gun/energy/zwang(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)

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