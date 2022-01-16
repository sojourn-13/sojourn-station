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
	uniform = /obj/item/clothing/suit/armor/paramedic
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	r_pocket = /obj/item/device/lighting/toggleable/flashlight/pen
	id_type = /obj/item/card/id/cmo
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	r_ear  = /obj/item/reagent_containers/syringe/large
	belt = /obj/item/storage/belt/medical
	glasses = /obj/item/clothing/glasses/hud/health
	backpack_contents = list(/obj/item/storage/firstaid/soteria = 1, /obj/item/modular_computer/tablet/moebius/preset = 1, /obj/item/gun/projectile/automatic/c20r/sci/preloaded = 1, \
							/obj/item/gun_upgrade/trigger/dnalock = 1, /obj/item/gun_upgrade/muzzle/silencer = 1, /obj/item/bodybag/cryobag = 2, \
							/obj/item/storage/firstaid/blackshield/large = 1, /obj/item/storage/firstaid/surgery/si = 1, /obj/item/roller/compact  = 1, /obj/item/device/defib_kit/compact/combat/adv/loaded = 1)
	id_slot = slot_wear_id
	id_type = /obj/item/card/id/medical_command