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
	desc = "The standard Blackshield equipment kit containing a mosin bolt action rifle and a basic scope. The most powerful weapon any trooper can get from their kit vendor, but often neglected given its age and style."

	populate_contents()
		new /obj/item/gun/projectile/boltgun(src)
		new /obj/item/gun_upgrade/scope/acog(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/duty
	name = "\improper Duty Primary Kit"
	desc = "The standard Blackshield equipment kit containing a Duty heavy carbine, a locally made rifle with a sharp knife at the end, good for just about any trooper. Can even be speed loaded to quickly reload the mag inside."

	populate_contents()
		new /obj/item/gun/projectile/automatic/duty(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
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

/obj/item/storage/box/bs_kit/watchtower
	name = "\improper DMR watchtower Kit"
	desc = "The standard Blackshield equipment kit containing an Watchtower DMR, a longer range rifle simular to the Strelki but with much better recoil controle at the cost of penitration power and scope range."

	populate_contents()
		new /obj/item/gun/projectile/automatic/nordwind/watchtower(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/storage/pouch/ammo(src)

//Sargents

/obj/item/storage/box/bs_kit/sts_para
	name = "\improper STS Para Primary Kit"
	desc = "The standard Blackshield equipment kit containing an STS Para rifle, a powerful and all round deadly rifle that performs well in any circumstance."

	populate_contents()
		new /obj/item/gun/projectile/automatic/sts/rifle/blackshield(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
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

/obj/item/storage/box/bs_kit/triage
	name = "\improper Triage Kit"
	desc = "A box containing a standard issue Triage Smg issued uniquely to corpsmen. Boasting a compact frame, low rate of fire but decent stopping power to deal with armored threats."

	populate_contents()
		new /obj/item/gun/projectile/automatic/triage(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)

/obj/item/storage/box/bs_kit/buckler
	name = "\improper Buckler Gun Primary Kit"
	desc = "The standard Blackshield equipment kit containing a buckler smg, a choice for speed with its rather high rate of fire and good recoil controle comes with a folding stock."

	populate_contents()
		new /obj/item/gun/projectile/automatic/buckler(src)
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

/obj/item/storage/box/bs_kit/rushing_bull
	name = "\improper Rushing Bull Primary Kit"
	desc = "The standard Blackshield equipment kit containing a tactical shotgun. While a higher powered weapon by most other issued geared, standard slug are a powerful choice even in this."

	populate_contents()
		new /obj/item/gun/projectile/automatic/bull_autoshotgun(src)
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

/obj/item/storage/box/bs_kit/makarov
	name = "\improper Makarov Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a standard makarov. Its power comes form its size making a good holdout pistol or able to be placed in almost any storage container making it deal for a overloaded trooper."

	populate_contents()
		new /obj/item/gun/projectile/clarissa/makarov(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src) //Highcaps
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
		new /obj/item/clothing/head/helmet/ballistic/shieldfull(src)

/obj/item/storage/box/bs_kit/flak_armor
	name = "\improper Flak Armor Kit"
	desc = "An armor kit containing a blackshield flack vest and ballistic helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/flackvest/militia(src)
		new /obj/item/clothing/head/helmet/ballistic/shieldfull(src)

/obj/item/storage/box/bs_kit/bullet_armor
	name = "\improper Bullet Armor Kit"
	desc = "An armor kit containing a kevlar reinforced suit and ballistic helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/bulletproof/ironhammer/militia(src)
		new /obj/item/clothing/head/helmet/ballistic/bulletproof/militia(src)
		new /obj/item/clothing/gloves/thick/swat/militia(src)

/obj/item/storage/box/bs_kit/laser_armor
	name = "\improper Ablative Armor Kit"
	desc = "An armor kit containing an ablative full body suit designed to counter laser weaponry."

	populate_contents()
		new /obj/item/clothing/suit/armor/vest/ablative/militia(src)
		new /obj/item/clothing/head/helmet/laserproof/militia(src)
		new /obj/item/clothing/gloves/thick/ablasive/militia(src)

/obj/item/storage/box/bs_kit/standard_armor_corpsman
	name = "\improper Standard Corpsman Armor Kit"
	desc = "An armor kit containg a corpsman plate carrier and a ballistic helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/platecarrier/corpsman(src)
		new /obj/item/clothing/head/helmet/ballistic/shieldfull/corpsman(src)
