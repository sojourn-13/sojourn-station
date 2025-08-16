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
	suit = /obj/item/clothing/suit/armor/flakvest
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
	l_pocket = /obj/item/modular_computer/tablet/moebius/preset
	pda_type = /obj/item/modular_computer/pda/heads/cmo
	r_ear  = /obj/item/reagent_containers/syringe/large
	belt = /obj/item/storage/belt/medical
	glasses = /obj/item/clothing/glasses/hud/health
	shoes = /obj/item/clothing/shoes/reinforced/medical
	back = /obj/item/storage/backpack/satchel/medical
	backpack_contents = list(/obj/item/storage/firstaid/soteria = 1,
							/obj/item/gun/projectile/automatic/c20r/sci/preloaded = 1,
							/obj/item/gun_upgrade/trigger/dnalock = 1,
							/obj/item/gun_upgrade/muzzle/silencer = 1,
							/obj/item/bodybag/cryobag = 2,
							/obj/item/storage/firstaid/blackshield/large = 1,
							/obj/item/storage/firstaid/surgery/si = 1,
							/obj/item/roller/compact  = 1,
							/obj/item/device/defib_kit/compact/combat/adv/loaded = 1)
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/ert/aa/medical_ert

/decl/hierarchy/outfit/marshal_ert
	name = "Marshal Agent"
	l_ear  =/obj/item/device/radio/headset/heads/hos/bowman
	uniform = /obj/item/clothing/under/rank/ih_commander
	suit = /obj/item/clothing/suit/armor/vest/ironhammer/full
	suit_store = /obj/item/gun/projectile/automatic/mamba/copperhead
	r_pocket = /obj/item/clothing/accessory/badge/marshal
	gloves = /obj/item/clothing/gloves/stungloves
	glasses = /obj/item/clothing/glasses/sechud/tactical
	shoes = /obj/item/clothing/shoes/jackboots
	belt = /obj/item/storage/belt/security/tactical/marshalert
	head = /obj/item/clothing/head/soft/sarge2soft
	back = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/ammo_magazine/rifle_75_drum = 3,
							/obj/item/ammo_magazine/rifle_75_drum/highvelocity = 2,
							/obj/item/ammo_casing/grenade/flash = 2,
							/obj/item/ammo_casing/grenade/blast = 2,
							/obj/item/modular_computer/tablet/lease/preset/command = 1 )
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/ert/aa/marshal_ert

/decl/hierarchy/outfit/blackshield_ert
	name = "Blackshield Specialist"
	l_ear  =/obj/item/device/radio/headset/heads/bscom/bowman
	mask = /obj/item/clothing/mask/gas/blackshield_gasmask
	uniform = /obj/item/clothing/under/rank/commander
	//suit_store = /obj/item/gun/projectile/automatic/omnirifle/rds
	r_pocket = /obj/item/clothing/accessory/badge/militiaagent
	gloves = /obj/item/clothing/gloves/thick/swat/blackshield
	glasses = /obj/item/clothing/glasses/sechud/tactical
	shoes = /obj/item/clothing/shoes/swat
	belt = /obj/item/storage/belt/security/tactical/shieldert
	back = /obj/item/storage/backpack/militia
	backpack_contents = list(/obj/item/modular_computer/tablet/lease/preset/command = 1, /obj/item/storage/pouch/ammo = 1)
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/ert/aa/blackshield_ert

/decl/hierarchy/outfit/engi_ert
	name = "Guild Emergency Personnel"
	l_ear = /obj/item/device/radio/headset/heads/ce
	head = /obj/item/clothing/head/firefighter/guild_emergency
	mask = /obj/item/clothing/mask/gas/artificer
	uniform = /obj/item/clothing/under/rank/engineer/adv_master
	suit = /obj/item/clothing/suit/storage/hazardvest
	r_pocket = /obj/item/device/t_scanner/advanced
	pda_type = /obj/item/modular_computer/pda/heads/ce
	belt = /obj/item/storage/belt/webbing/artificer/ert
	glasses = /obj/item/clothing/glasses/powered/meson
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/insulated/guild
	back = /obj/item/storage/backpack/industrial
	backpack_contents = list(/obj/item/rcd/industrial = 1, \
							/obj/item/stack/material/compressed_matter/full = 1, \
							/obj/item/stack/material/glass/plasmarglass/full = 1, \
							/obj/item/stack/material/plasteel/full = 1, \
							/obj/item/stack/material/steel/full = 1, \
							/obj/item/stack/material/plastic/full = 1, \
							/obj/item/stack/cable_coil/random = 2, \
							/obj/item/rpd = 1, \
							/obj/item/modular_computer/tablet/lease/preset/command = 1,\
							/obj/item/extinguisher/mini = 1)
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/ert/aa/guild_ert

/decl/hierarchy/outfit/lss_ert
	name = "Internal Affairs Agent"
	l_ear = /obj/item/device/radio/headset/heads/merchant
	uniform = /obj/item/clothing/under/suit_jacket/executive
	r_pocket = /obj/item/device/t_scanner/advanced
	pda_type = /obj/item/modular_computer/pda/heads
	glasses = /obj/item/clothing/glasses/sunglasses/big
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/paper_bin  = 1,
							/obj/item/clipboard = 1,
							/obj/item/device/taperecorder = 1,
							/obj/item/pen/multi = 1,
							/obj/item/reagent_containers/glass/paint/red = 1, //For the papers, in case they want to make a paper red with red link to REALY show that they mean something
							/obj/item/modular_computer/tablet/lease/preset/command = 1)
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/ert/aa/auditor_ert

/decl/hierarchy/outfit/church_ert
	name = "Inquisitor"
	l_ear = /obj/item/device/radio/headset/heads/preacher
	id_slot = slot_wear_id
	id_type = /obj/item/card/id/syndicate/ert/aa/church_ert
	uniform = /obj/item/clothing/under/rank/preacher
	suit = /obj/item/clothing/suit/storage/chaplain/coat
	suit_store = /obj/item/gun/energy/plasma //Dominion plasma rifle
	head = /obj/item/clothing/head/preacher
	shoes = /obj/item/clothing/shoes/reinforced
	belt = /obj/item/storage/belt/security/neotheology
	gloves = /obj/item/clothing/gloves/thick
	back = /obj/item/storage/backpack/satchel/neotheology
	backpack_contents = list(/obj/item/book/ritual/cruciform/priest = 1,
							/obj/item/gun/energy/taser = 1, //Counselor stun gun
							/obj/item/cell/medium/neotheology/plasma = 4

	)

/decl/hierarchy/outfit/si_ert
	name = "Ethics Committee investigator"
	l_ear = /obj/item/device/radio/headset/heads/rd
	mask = /obj/item/clothing/mask/gas
	uniform = /obj/item/clothing/under/suit_jacket/executive //we're basically an SI IAA
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	pda_type = /obj/item/modular_computer/pda/heads/rd
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/storage/backpack/satchel/purple/scientist
	gloves = /obj/item/clothing/gloves/latex
	backpack_contents = list(
							/obj/item/clipboard = 1,
							/obj/item/device/taperecorder = 1,
							/obj/item/pen/multi = 1,
							/obj/item/paper_bin = 1,
							/obj/item/modular_computer/tablet/lease/preset/command = 1)
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/ert/aa/research_ert

/decl/hierarchy/outfit/prospector_ert //criminy
	name = "Underboss"
	l_ear  =/obj/item/device/radio/headset/heads/foreman
	uniform = /obj/item/clothing/under/top/crewtopplain
	suit = /obj/item/clothing/suit/storage/vest/merc
	gloves = /obj/item/clothing/gloves/thick/combat
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/syndigaloshes
	belt = /obj/item/storage/belt/webbing/artificer/ert //We come ready to fight OR break and enter
	back = /obj/item/storage/backpack/satchel
	r_pocket = /obj/item/clothing/accessory/holster/leg
	l_pocket = /obj/item/storage/pouch/ammo
	backpack_contents = list(/obj/item/modular_computer/tablet/lease/preset/command = 1, /obj/item/gun/projectile/silvereye = 1, /obj/item/ammo_magazine/kurz_50/hv = 5, /obj/item/clothing/head/helmet/mercenary = 1, /obj/item/clothing/mask/gas  = 1)
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/ert/aa/prospector_ert

/decl/hierarchy/outfit/doggo
	name = "Kriosan trooper"
	l_ear  =/obj/item/device/radio/headset
	head = /obj/item/clothing/head/helmet/generic_full
	uniform = /obj/item/clothing/under/kriosansuit
	suit = /obj/item/clothing/suit/armor/flakvest/full
	r_pocket = /obj/item/storage/firstaid/ifak
	belt = /obj/item/storage/belt/webbing
	gloves = /obj/item/clothing/gloves/thick/brown
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack/satchel/security
	backpack_contents = list(/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 2, /obj/item/ammo_magazine/ammobox/kurz_50 = 2, /obj/item/device/binoculars = 1, \
	/obj/item/device/radio = 1, /obj/item/tool_upgrade/productivity/ergonomic_grip = 1, /obj/item/tool_upgrade/refinement/laserguide = 1, /obj/item/clothing/accessory/holster/leg = 1, \
	/obj/item/tool/knife/boot = 1, /obj/item/reagent_containers/snacks/openable/mre = 1, /obj/item/clothing/mask/gas = 1)
	l_pocket = /obj/item/storage/pouch/ammo

//Solfed shit. Use sparingly.


/decl/hierarchy/outfit/solfed_survivor
	name = "Solarian Reconnoiterer"
	l_ear  = /obj/item/device/radio/headset/headset_blackshield/bowman/solfed
	r_ear = /obj/item/storage/fancy/cigarettes/frozen
	head = /obj/item/clothing/head/rank/solfedrecon
	mask = /obj/item/clothing/mask/gas/old
	uniform = /obj/item/clothing/under/rank/fatigues/camo/solfed
	suit_store = /obj/item/gun/projectile/automatic/omnirifle/scoped
	l_pocket = /obj/item/storage/pouch/ammo
	r_pocket = /obj/item/clothing/accessory/passcard/passport_sol
	gloves = /obj/item/clothing/gloves/thick/swat
	glasses = /obj/item/clothing/glasses/ballistic
	shoes = /obj/item/clothing/shoes/swat
	belt = /obj/item/storage/belt/security/tactical/solfed
	back = /obj/item/storage/backpack/military

	backpack_contents = list(/obj/item/rig/combat/solfed/equipped = 1,
	/obj/item/ammo_magazine/heavy_rifle_408/hv = 5,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv = 1,
	/obj/item/storage/firstaid/combat = 1,
	/obj/item/storage/firstaid/ifak =1,
	/obj/item/gun/projectile/lamia/socom = 1,
	/obj/item/clothing/accessory/holster/leg = 1
	)
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/solfed


/decl/hierarchy/outfit/solfed_survivor_medic
	name = "Solarian Combat Medic"
	l_ear  = /obj/item/device/radio/headset/headset_blackshield/bowman/solfed
	r_ear = /obj/item/storage/fancy/cigarettes/frozen
	head = /obj/item/clothing/head/rank/solfedmed
	mask = /obj/item/clothing/mask/gas/old
	uniform = /obj/item/clothing/under/rank/fatigues/camo/solfed
	suit = /obj/item/clothing/suit/armor/platecarrier/solfed/corpsman
	suit_store = /obj/item/gun/projectile/automatic/omnirifle/rds
	l_pocket = /obj/item/storage/pouch/ammo
	r_pocket = /obj/item/clothing/accessory/passcard/passport_sol
	gloves = /obj/item/clothing/gloves/thick/swat/blackshield_corpsman
	glasses = /obj/item/clothing/glasses/ballistic/med
	shoes = /obj/item/clothing/shoes/swat
	belt = /obj/item/storage/belt/security/tactical/solfed
	back = /obj/item/storage/backpack/duffelbag

	backpack_contents = list(/obj/item/ammo_magazine/heavy_rifle_408/hv = 5,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv = 1,
	/obj/item/storage/firstaid/combat = 1,
	/obj/item/storage/pouch/large_generic/advmedic = 2,
	/obj/item/storage/firstaid/adv = 1,
	/obj/item/tool/medmultitool = 1,
	/obj/item/gun/projectile/ladon = 1,
	/obj/item/ammo_magazine/magnum_40/hv = 3,
	/obj/item/clothing/accessory/holster/leg = 1
	)
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/solfed

/decl/hierarchy/outfit/solfed_survivor_aux
	name = "Solarian Auxilliary"
	l_ear  = /obj/item/device/radio/headset/headset_blackshield/bowman/solfed
	r_ear = /obj/item/storage/fancy/cigarettes/frozen
	head = /obj/item/clothing/head/rank/solfedrecon
	mask = /obj/item/clothing/mask/gas/old
	uniform = /obj/item/clothing/under/rank/fatigues/camo/solfed
	suit = /obj/item/clothing/suit/armor/platecarrier/solfed
	suit_store = /obj/item/gun/projectile/automatic/omnirifle
	l_pocket = /obj/item/storage/pouch/ammo
	r_pocket = /obj/item/clothing/accessory/passcard/passport_sol
	gloves = /obj/item/clothing/gloves/thick/swat
	glasses = /obj/item/clothing/glasses/ballistic
	shoes = /obj/item/clothing/shoes/swat
	belt = /obj/item/storage/belt/security/tactical/solfed
	back = /obj/item/storage/backpack/military

	backpack_contents = list(/obj/item/ammo_magazine/heavy_rifle_408/hv = 5,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv = 1,
	/obj/item/storage/firstaid/ifak =1,
	/obj/item/gun/projectile/lamia = 1,
	/obj/item/clothing/accessory/holster/leg = 1
	)
	id_slot = slot_wear_id
	id_type =  /obj/item/card/id/syndicate/solfed
