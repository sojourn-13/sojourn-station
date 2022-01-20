/obj/item/storage/box/bs_kit
	name = "\improper Blackshield Kit"
	desc = "A standard kit."
	cant_hold = list(/obj/item) //stops them from being used as storage solutions - items can't be put back in.
	w_class = ITEM_SIZE_BULKY //these carry guns and lots of items! Makes sense to make them bigger than some tiny box
	icon_state = "box"

// All-in-one kit
/obj/item/storage/box/bs_kit/default
	name = "\improper Default Blackshield Kit"
	desc = "The standard Blackshield equipment kit."

	populate_contents()
		new /obj/item/gun/projectile/boltgun(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/gun/projectile/colt/ten/dark(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/clothing/accessory/holster/leg(src)
		new /obj/item/clothing/suit/armor/platecarrier/militia(src)
		new /obj/item/clothing/head/helmet/ballistic/militia(src)
		new /obj/item/storage/pouch/ammo(src)

// Primary Weapon Kits
/obj/item/storage/box/bs_kit/mosin
	name = "\improper Mosin Primary Kit"
	desc = "The standard Blackshield equipment kit containing a mosin bolt action rifle. The most powerful weapon any trooper can get from their kit vendor, but often neglected given its age and style."

	populate_contents()
		new /obj/item/gun/projectile/boltgun(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/roe
	name = "\improper Roe Primary Kit"
	desc = "The standard Blackshield equipment kit containing a roe boltgun, a bolt gun with less penetration and damage than a mosin, but with far better recoil control and built in scope."

	populate_contents()
		new /obj/item/gun/projectile/boltgun/light_wood(src)
		new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
		new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
		new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
		new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
		new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/sts
	name = "\improper STS Primary Kit"
	desc = "The standard Blackshield equipment kit containing an STS carbine, a powerful and all round deadly rifle that performs well in any circumstance."

	populate_contents()
		new /obj/item/gun/projectile/automatic/sts(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/sts_para
	name = "\improper STS Primary Kit"
	desc = "The standard Blackshield equipment kit containing an STS carbine, a powerful and all round deadly rifle that performs well in any circumstance."

	populate_contents()
		new /obj/item/gun/projectile/automatic/sts/rifle/blackshield(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/rds_omnicarbine
	name = "\improper Warthog Omni Primary Kit"
	desc = "The standard Blackshield equipment kit containing an STS carbine, a powerful and all round deadly rifle that performs well in any circumstance."

	populate_contents()
		new /obj/item/gun/projectile/automatic/omnirifle/omnicarbine/rds(src)
		new /obj/item/ammo_magazine/heavy_rifle_408(src)
		new /obj/item/ammo_magazine/heavy_rifle_408(src)
		new /obj/item/ammo_magazine/heavy_rifle_408(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/cog
	name = "\improper Cog Primary Kit"
	desc = "A kit designed for energy-based weaponry holding the cog rifle. While not as powerful or versatile as some ballistic options, its easy to produce and recharge-able energy cells make it an \
	economic and solid choice for those who prefer volume of shots over impact."

	populate_contents()
		new /obj/item/gun/energy/cog(src)
		new /obj/item/cell/medium(src)
		new /obj/item/cell/medium(src)
		new /obj/item/cell/medium(src)
		new /obj/item/cell/medium(src)
		new /obj/item/cell/medium(src)
		new /obj/item/storage/pouch/tubular(src)

/obj/item/storage/box/bs_kit/greasegun
	name = "\improper Grease Gun Primary Kit"
	desc = "The standard Blackshield equipment kit containing a grease gun, an unusual choice as its low damage and slow firing rate make it more of a specialist option. The built in silencer \
	and high capacity submachine magazines are perfect for cover fire and hiding your position."

	populate_contents()
		new /obj/item/gun/projectile/automatic/greasegun(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/grizzly
	name = "\improper Grizzly Primary Kit"
	desc = "The standard Blackshield equipment kit containing a grizzly shotgun. While outshone by most other shotguns, standard slug and buckshot are a powerful choice even in this. \
	Can be sawn down to modify size and specs, making it highly modular."

	populate_contents()
		new /obj/item/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/storage/pouch/ammo(src)

// Side-arms Kits
/obj/item/storage/box/bs_kit/stallion
	name = "\improper Stallion Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a stallion, a design based of the original M1911, modernized and given an auto eject system with built in audio alerts. Unlike the \
	standard colt, it uses .40 magnum rounds."

	populate_contents()
		new /obj/item/gun/projectile/colt/ten/dark(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/lamia
	name = "\improper Lamia Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a lamia, a .50 caliber pistol boasting high damage and armor penetration but low magazine size and hefty recoil. A favorite for sharp \
	shooters and people with something to compensate for."

	populate_contents()
		new /obj/item/gun/projectile/lamia/dark(src)
		new /obj/item/ammo_magazine/kurtz_50/lethal(src)
		new /obj/item/ammo_magazine/kurtz_50/lethal(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/rex10
	name = "\improper Cowboy Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a cowboy break-action revolver, a dependeble choice for a .35 caliber revolver. Due to its cheap cost, this box comes with two \
	speed loaders and a bonus box of high velocity rounds, making it a favorite for those who like a well stocked side-arm."

	populate_contents()
		new /obj/item/gun/projectile/revolver/rev10/rex10(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35/hv(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35/hv(src)
		new /obj/item/ammo_magazine/ammobox/pistol_35/hv(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/pilgrim
	name = "\improper Pilgrim Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a pilgrim revolver. A ballistic design by the church new testament arms division. A tricky choice, as a gift from the church it \
	comes with a box of .40 magnum caustic rounds which are poison rounds that cause a great deal of pain and toxin damage. A good choice of gunning down people and most animals. The internal design requires \
	unloading each shot from the revolver individually but it boasts a underslung shotgun, five 20mm buckshot shells, and can have all nine chambers loaded at once using an ammobox. Some \
	upgrade it into the pilgrim claw to enhance its melee damage."

	populate_contents()
		new /obj/item/gun/projectile/revolver/lemant(src)
		new /obj/item/ammo_magazine/ammobox/magnum_40/biomatter(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/colt
	name = "\improper Colt Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a standard colt. While not as powerful as its .40 magnum variant, the stallion, this cheap firearm boasts a higher magazine capacity \
	and comes with an additional magazine. For when you prefer capacity over power or penetration."

	populate_contents()
		new /obj/item/gun/projectile/colt(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src) //Highcaps
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/martin
	name = "\improper Martin Secondary Kit"
	desc = "A kit designed for energy-based weaponry containing a martin. A largely terrible choice for a member of blackshield but the only option with a non-lethal variant."

	populate_contents()
		new /obj/item/gun/energy/gun/martin(src)
		new /obj/item/cell/small/high(src)
		new /obj/item/cell/small/high(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/sawn_shotgun
	name = "\improper Sawn-Down Double Barrel Secondary Kit"
	desc = "A standard Blackshield equipment kit containing a sawn down double barrel shotgun. Capable of fitting a holster and coming with your choice of five slugs and five buckshot. \
	Easily a great option for a back up or hold out for its potential to quick draw and fire at point blank range. Not effective at a distance."

	populate_contents()
		new /obj/item/gun/projectile/shotgun/doublebarrel/sawn(src)
		new /obj/item/ammo_casing/shotgun/prespawned(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		new /obj/item/clothing/accessory/holster/leg(src)

// Armor Kits
/obj/item/storage/box/bs_kit/standard_armor
	name = "\improper Standard Armor Kit"
	desc = "An armor kit containg a blackshield plate carrier and a ballistic helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/platecarrier/militia(src)
		new /obj/item/clothing/head/helmet/ballistic/militia(src)

/obj/item/storage/box/bs_kit/flak_armor
	name = "\improper Flak Armor Kit"
	desc = "An armor kit containing a blackshield flack vest and ballistic helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/flackvest/militia(src)
		new /obj/item/clothing/head/helmet/ballistic/militia(src)

/obj/item/storage/box/bs_kit/bullet_armor
	name = "\improper Bullet Armor Kit"
	desc = "An armor kit containing a kevlar reinforced vest and ballistic helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/bulletproof(src)
		new /obj/item/clothing/head/helmet/ballistic/militia(src)

/obj/item/storage/box/bs_kit/laser_armor
	name = "\improper Ablative Armor Kit"
	desc = "An armor kit containing an ablative full body suit designed to counter laser weaponry."

	populate_contents()
		new /obj/item/clothing/suit/armor/vest/ablative(src)
		new /obj/item/clothing/head/helmet/laserproof(src)
		new /obj/item/clothing/gloves/thick/ablasive(src)
		new /obj/item/clothing/shoes/ablasive(src)

/obj/item/storage/box/bs_kit/standard_armor_corpsman
	name = "\improper Standard Corpsman Armor Kit"
	desc = "An armor kit containg a corpsman plate carrier and a ballistic helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/platecarrier/corpsman(src)
		new /obj/item/clothing/head/helmet/ballistic/militia(src)