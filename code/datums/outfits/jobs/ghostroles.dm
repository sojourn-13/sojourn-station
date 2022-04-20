/decl/hierarchy/outfit/escapedprisoner
	name = "Escaped Prisoner"
	uniform = /obj/item/clothing/under/orange
	mask = /obj/item/clothing/mask/breath
	shoes = /obj/item/clothing/shoes/orange
	r_pocket = /obj/item/tank/emergency_oxygen
	back = /obj/item/storage/backpack/sport/orange

/decl/hierarchy/outfit/escapedprisoner/hobo
	belt = /obj/item/gun/projectile/revolver/handmade
	l_pocket = /obj/item/ammo_casing/magnum_40/scrap/prespawned

/obj/effect/mob_spawn/human/prisoner_transport/hobo
	outfit = /decl/hierarchy/outfit/escapedprisoner/hobo

/decl/hierarchy/outfit/scavenger
	name = "Scavenger"
	uniform = /obj/item/clothing/under/genericb
	head = /obj/item/clothing/head/helmet/steelpot
	shoes = /obj/item/clothing/shoes/color/black
	suit = /obj/item/clothing/suit/armor/flackvest
	suit_store = /obj/item/gun/projectile/boltgun
	back = /obj/item/storage/backpack/satchel
	r_pocket = /obj/item/ammo_magazine/speed_loader_rifle_75
	id_slot = slot_wear_id
	id_type = /obj/item/card/id

/decl/hierarchy/outfit/si_medical_ert
	name = "Medical Emergency Personnel"
	l_ear  =/obj/item/device/radio/headset/heads/cmo
	head = /obj/item/clothing/head/helmet/faceshield/paramedic
	uniform = /obj/item/clothing/under/rank/moebius_biolab_officer
	suit = /obj/item/clothing/suit/armor/paramedic
	r_pocket = /obj/item/device/lighting/toggleable/flashlight/pen
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	r_ear  = /obj/item/reagent_containers/syringe/large
	belt = /obj/item/storage/belt/medical
	glasses = /obj/item/clothing/glasses/hud/health
	shoes = /obj/item/clothing/shoes/reinforced/medical
	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/storage/firstaid/soteria = 1, /obj/item/modular_computer/tablet/moebius/preset = 1, /obj/item/gun/projectile/automatic/c20r/sci/preloaded = 1, \
							/obj/item/gun_upgrade/trigger/dnalock = 1, /obj/item/gun_upgrade/muzzle/silencer = 1, /obj/item/bodybag/cryobag = 2, \
							/obj/item/storage/firstaid/blackshield/large = 1, /obj/item/storage/firstaid/surgery/si = 1, /obj/item/roller/compact  = 1, /obj/item/device/defib_kit/compact/combat/adv/loaded = 1)
	l_pocket = /obj/item/card/id/medical_command

/decl/hierarchy/outfit/marshal_ert
	name = "Marshal Agent"
	l_ear  =/obj/item/device/radio/headset/heads/hos
	uniform = /obj/item/clothing/under/rank/ih_commander
	suit = /obj/item/clothing/suit/armor/platecarrier/ih
	suit_store = /obj/item/gun/projectile/automatic/pitbull
	r_pocket = /obj/item/clothing/accessory/badge/marshal
	l_pocket = /obj/item/card/id/secert
	gloves = /obj/item/clothing/gloves/stungloves
	glasses = /obj/item/clothing/glasses/sechud/tactical
	shoes = /obj/item/clothing/shoes/jackboots
	belt = /obj/item/storage/belt/security/tactical/marshalert
	head = /obj/item/clothing/head/seccap
	back = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/ammo_magazine/light_rifle_257 = 5, /obj/item/ammo_magazine/light_rifle_257/highvelocity = 3, /obj/item/ammo_casing/grenade/flash = 2, /obj/item/ammo_casing/grenade/blast = 2 )

/decl/hierarchy/outfit/doggo
	name = "Kriosan trooper"
	l_ear  =/obj/item/device/radio/headset
	head = /obj/item/clothing/head/helmet/generic_full
	uniform = /obj/item/clothing/under/kriosansuit
	suit = /obj/item/clothing/suit/armor/flackvest/full
	r_pocket = /obj/item/storage/firstaid/ifak
	belt = /obj/item/storage/belt/webbing
	gloves = /obj/item/clothing/gloves/thick/brown
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel/security
	backpack_contents = list(/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 2, /obj/item/ammo_magazine/ammobox/kurtz_50 = 2, /obj/item/device/binoculars = 1, \
	/obj/item/device/radio = 1, /obj/item/tool_upgrade/productivity/ergonomic_grip = 1, /obj/item/tool_upgrade/refinement/laserguide = 1, /obj/item/clothing/accessory/holster/leg = 1, \
	/obj/item/tool/knife/boot = 1, /obj/item/reagent_containers/food/snacks/openable/mre = 1, /obj/item/clothing/mask/gas = 1)
	l_pocket = /obj/item/storage/pouch/ammo