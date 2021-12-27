/obj/item/storage/box/m_kit
	name = "\improper Marshal Kit"
	desc = "A standard kit."
	cant_hold = list(/obj/item) //stops them from being used as storage solutions - items can't be put back in.
	w_class = ITEM_SIZE_BULKY //these carry guns and lots of items! Makes sense to make them bigger than some tiny box
	icon_state = "box"

// Primary kits
/obj/item/storage/box/m_kit/wirbelwind
	name = "\improper Wirbelwind Kit"
	desc = "The standard Marshal box kit containing a wirbelwind submachine gun. Capable of fitting a holster and going full auto because who needs accuracy?"

	populate_contents()
		new /obj/item/gun/projectile/automatic/wirbelwind(src)
		new /obj/item/ammo_magazine/smg_35/rubber(src)
		new /obj/item/ammo_magazine/smg_35/rubber(src)
		new /obj/item/ammo_magazine/smg_35/rubber(src)

/obj/item/storage/box/m_kit/state_auto
	name = "\improper State Auto-Shotgun Kit"
	desc = "The standard Marshal box kit containing a state auto shotgun. What is lacks in penetration it makes up for with ammo capacity and fire rate."

	populate_contents()
		new /obj/item/gun/projectile/automatic/riot_autoshotgun(src)
		new /obj/item/ammo_casing/shotgun/beanbag/prespawned(src)
		new /obj/item/ammo_casing/shotgun/beanbag/prespawned(src)
		new /obj/item/ammo_casing/shotgun/beanbag/prespawned(src)

/obj/item/storage/box/m_kit/bulldog
	name = "\improper Bulldog Kit"
	desc = "The standard Marshal box kit containing a bulldog, a proper carbine for a proper policemen."

	populate_contents()
		new /obj/item/gun/projectile/automatic/bulldog(src)
		new /obj/item/ammo_magazine/light_rifle_257/rubber(src)
		new /obj/item/ammo_magazine/light_rifle_257/rubber(src)
		new /obj/item/ammo_magazine/light_rifle_257/rubber(src)

/obj/item/storage/box/m_kit/gear_lasgun
	name = "\improper Gear Lasgun Kit"
	desc = "The standard Marshal box kit containing a modified cog that fires stun beams only. For the economic officer."

	populate_contents()
		new /obj/item/gun/energy/cog/gear(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)

// Secondary kits
/obj/item/storage/box/m_kit/firefly
	name = "\improper Firefly Secondary Kit"
	desc = "The standard Marshal box kit containing a firefly .35 pistol. An all round solid firearm that provides good qualities in every area. Has less recoil than the colt and auto ejects its magazine."

	populate_contents()
		new /obj/item/gun/projectile/colt/NM_colt(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

/obj/item/storage/box/m_kit/colt
	name = "\improper Colt Secondary Kit"
	desc = "The standard Marshal box kit containing a colt pistol. A dependable if cheap pistol that is all round a solid choice. Stronger than the firefly per shot."

	populate_contents()
		new /obj/item/gun/projectile/firefly(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

/obj/item/storage/box/m_kit/ladon
	name = "\improper Ladon Secondary Kit"
	desc = "The standard Marshal box kit containing a ladon pistol. A good choice for .40 magnums with better recoil control and more penetration than the firefly and colt respectively but \
	has a much lower magazine capacity, making it a favorite for those with excellent aim."

	populate_contents()
		new /obj/item/gun/projectile/ladon/hs(src)
		new /obj/item/ammo_magazine/magnum_40/rubber(src)
		new /obj/item/ammo_magazine/magnum_40/rubber(src)
		new /obj/item/ammo_magazine/magnum_40/rubber(src)

/obj/item/storage/box/m_kit/glock
	name = "\improper Sky Secondary Kit"
	desc = "The standard Marshal box kit containing a sky model glock pistol. A reasonably well made .35 pistol that has both semi-auto and burst fire options. Considered highly desirable \
	for its low recoil and ability to take .35 drum mags and silencers."

	populate_contents()
		new /obj/item/gun/projectile/firefly(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)
		new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

// Armor Kits
/obj/item/storage/box/m_kit/standard_armor
	name = "\improper Standard Visor Armor Kit"
	desc = "An standard Marshal armor kit with a plate carrier and visor helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/platecarrier/ih(src)
		new /obj/item/clothing/head/helmet/faceshield/helmet_visor(src)

/obj/item/storage/box/m_kit/standard_armor_alt
	name = "\improper Standard Full Helmet Armor Kit"
	desc = "An standard Marshal armor kit with a plate carrier and full helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/platecarrier/ih(src)
		new /obj/item/clothing/head/helmet/faceshield/helmet_visor(src)

/obj/item/storage/box/m_kit/laser_armor
	name = "\improper Ablative Armor Kit"
	desc = "An standard Marshal armor kit containing a full ablative suit for countering laser weaponry."

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