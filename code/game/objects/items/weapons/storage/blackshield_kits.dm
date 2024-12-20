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
		new /obj/item/gun/projectile/colt/ten(src)
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

/obj/item/storage/box/bs_kit/duty
	name = "\improper Duty Primary Kit"
	desc = "The standard Blackshield equipment kit containing an Duty carbine, a powerful battle rifle chambered in 6.5 carbine. Perfect for accurate albiet slow full-automatic fire."

	populate_contents()
		new /obj/item/gun/projectile/automatic/duty(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/light_rifle_257_short(src)
		new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
		new /obj/item/ammo_magazine/speed_loader_light_rifle_257(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/vintorez
	name = "\improper Vintorez Kit"
	desc = "The standard Blackshield equipment kit containing an Vintorez, a longer range rifle simular to the the base AK platform but with much better recoil control and a scope at the sacrifice of its fire rate."

	populate_contents()
		new /obj/item/gun/projectile/automatic/vintorez/NM_colony(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/ammo_magazine/rifle_75_short(src)
		new /obj/item/storage/pouch/ammo(src)

//Seargents

/obj/item/storage/box/bs_kit/sts_para
	name = "\improper STS Para Primary Kit"
	desc = "The standard Blackshield equipment kit containing an STS PARA rifle, a powerful and all round deadly rifle that performs well in any circumstance."

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
		new /obj/item/gun/projectile/automatic/omnirifle/rds(src)
		new /obj/item/ammo_magazine/heavy_rifle_408(src)
		new /obj/item/ammo_magazine/heavy_rifle_408(src)
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
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/storage/pouch/tubular(src)

/obj/item/storage/box/bs_kit/lascore
	name = "\improper Lascore Primary Kit"
	desc = "A kit holding an energy based weaponry kit. Far more high powered, these custom tooled lascore carbines are the best of power and efficiency. Their cost \
	prohibits their standardization."

	populate_contents()
		new /obj/item/gun/energy/lasercore/militia(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/storage/pouch/tubular(src)

/obj/item/storage/box/bs_kit/drozd
	name = "\improper Drozd Kit"
	desc = "A box containing a standard issue Drozd SMG issued uniquely to corpsmen. Boasting a compact frame, low rate of fire but decent stopping power to deal with armored threats."

	populate_contents()
		new /obj/item/gun/projectile/automatic/drozd/NM_colony(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)
		new /obj/item/ammo_magazine/smg_magnum_40(src)

/obj/item/storage/box/bs_kit/ekaterina
	name = "\improper Ekaterina SMG Primary Kit"
	desc = "The standard Blackshield equipment kit containing a Ekaterina smg, a choice for speed with its rather high rate of fire and drum capatiblility."

	populate_contents()
		new /obj/item/gun/projectile/automatic/ppsh/NM_colony(src)
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


/obj/item/storage/box/bs_kit/bounty
	name = "\improper Bounty Primary Kit"
	desc = "The standard Blackshield equipment kit containing a Bounty lever action shotgun. While run-of-the-mill in terms of stopping power and sporting no 'advanced technology' this firearm sports an uncommon feature. \
	That of a lever instead of a pump. While it makes the shotgun harder to use in a prone or cramped condition it also allows an incresed firerate compared to its peers."

	populate_contents()
		new /obj/item/gun/projectile/boltgun/lever/shotgun/bounty(src)
		new /obj/item/ammo_magazine/speed_loader_shotgun(src)
		new /obj/item/ammo_magazine/speed_loader_shotgun(src)
		new /obj/item/ammo_magazine/speed_loader_shotgun(src)
		new /obj/item/ammo_magazine/speed_loader_shotgun(src)
		new /obj/item/ammo_magazine/speed_loader_shotgun(src)
		new /obj/item/storage/pouch/ammo(src)

/obj/item/storage/box/bs_kit/saiga
	name = "\improper Saiga Primary Kit"
	desc = "The standard Blackshield equipment kit containing a Saiga shotgun. A fast-firing shotgun based of a modular AK platform. While not known for reliability it easily outshines many other variations of automatic shotgun."

	populate_contents()
		new /obj/item/gun/projectile/automatic/ak47/saiga/NM_colony(src)
		new /obj/item/ammo_magazine/sbaw(src)
		new /obj/item/ammo_magazine/sbaw(src)
		new /obj/item/ammo_magazine/sbaw(src)
		new /obj/item/ammo_magazine/sbaw(src)
		new /obj/item/ammo_magazine/sbaw(src)
		new /obj/item/storage/pouch/ammo(src)

// Side-arms Kits
/obj/item/storage/box/bs_kit/delta
	name = "\improper Delta Elite Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a Delta Elite, a design based of the original M1911, modernized. Unlike the \
	standard colt, it uses 10mm magnum rounds."

	populate_contents()
		new /obj/item/gun/projectile/colt/ten(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/ammo_magazine/magnum_40(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/rex10
	name = "\improper Cowboy Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a cowboy break-action revolver, a dependeble choice for a 9mm caliber revolver. Due to its cheap cost, this box comes with two \
	speed loaders and a bonus box of high velocity rounds, making it a favorite for those who like a well stocked side-arm."

	populate_contents()
		new /obj/item/gun/projectile/revolver/rev10/rex10(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35/hv(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35/hv(src)
		new /obj/item/ammo_magazine/ammobox/pistol_35/hv(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/pilgrim
	name = "\improper Pilgrim Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a Pilgrim revolver. A ballistic design by the Absolute's Old Testament arms division. A tricky choice, as a gift from the church it \
	comes with a box of 10mm magnum caustic rounds which are poison rounds that cause a great deal of pain and toxin damage. A good choice for gunning down people and most animals. The internal design requires \
	unloading each shot from the revolver individually but it boasts a underslung shotgun, five 20mm buckshot shells, and can have all nine chambers loaded at once using an ammobox."

	populate_contents()
		new /obj/item/gun/projectile/revolver/lemant(src)
		new /obj/item/ammo_magazine/ammobox/magnum_40/biomatter(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/makarov
	name = "\improper Makarov Secondary Kit"
	desc = "The standard Blackshield equipment kit containing a standard makarov. Its power comes form its size making a good holdout pistol or able to be placed in almost any storage container making it deal for a overloaded trooper."

	populate_contents()
		new /obj/item/gun/projectile/makarov(src)
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

// Commander's secondary weapons.

/obj/item/storage/box/bs_kit/spider
	name = "\improper \"Spider Rose\" energy pistol kit"
	desc = "An equipment kit containing a generic energy sidearm, yet the only one with any kind of nonlethal capacity, should it ever be required."

	populate_contents()
		new /obj/item/gun/energy/gun(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/cell/medium/high(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/mateba
	name = "\improper Mateba Secondary Kit"
	desc = "An equipment kit containing a specialized semiautomatic 12mm revolver. Great recoil control and even better stopping power, a flashy weapon of high-ranked officers."

	populate_contents()
		new /obj/item/gun/projectile/revolver/rev10/mateba(src)
		new /obj/item/ammo_magazine/speed_loader_kurtz_50(src)
		new /obj/item/ammo_magazine/speed_loader_kurtz_50(src)
		new /obj/item/clothing/accessory/holster/leg(src)

/obj/item/storage/box/bs_kit/gemini
	name = "\"Gemini\" Secondary Kit"
	desc = "A kit containing a highly specialized 12mm pistol with smart-linked optics and stabilizers."

	populate_contents()
		new /obj/item/gun/projectile/lamia/gemini(src)
		new /obj/item/ammo_magazine/kurtz_50(src)
		new /obj/item/ammo_magazine/kurtz_50(src)
		new /obj/item/clothing/accessory/holster/leg(src)

// Armor Kits
/obj/item/storage/box/bs_kit/standard_armor
	name = "\improper Standard Armor Kit"
	desc = "An armor kit containg a blackshield plate carrier and a ballistic helmet."

	populate_contents()
		new /obj/item/clothing/suit/armor/platecarrier/militia(src)
		new /obj/item/clothing/head/helmet/ballistic/militia/full(src)

/obj/item/storage/box/bs_kit/militia_overcoat
	name = "\improper Armored Overcoat Armor Kit"
	desc = "An armor kit containg a militia overcoat and a ballistic helmet."

	populate_contents()
		new /obj/item/clothing/suit/storage/armor/militia_overcoat(src)
		new /obj/item/clothing/head/helmet/ballistic/militia/full(src)

/obj/item/storage/box/bs_kit/flak_armor
	name = "\improper Flak Armor Kit"
	desc = "An armor kit containing a blackshield flak vest and an altyn."

	populate_contents()
		new /obj/item/clothing/suit/armor/flakvest/militia(src)
		new /obj/item/clothing/head/helmet/faceshield/altyn/milisha(src)

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
		new /obj/item/clothing/head/helmet/ballistic/militia/full/corpsman(src)
