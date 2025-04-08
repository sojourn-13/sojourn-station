/obj/structure/closet/secure_closet/medicine
	name = "medicine closet"
	desc = "Filled with medical junk."
	icon_state = "med"
	req_access = list(access_medical_equip)

/obj/structure/closet/secure_closet/medicine/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/storage/box/autoinjectors(src)
	new /obj/item/storage/box/syringes(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/reagent_containers/glass/beaker(src)
	new /obj/item/reagent_containers/glass/beaker(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/antitoxin(src)
	new /obj/item/reagent_containers/glass/bottle/antitoxin(src)
	new /obj/item/storage/hcases/med(src)

/obj/structure/closet/secure_closet/anesthetics
	name = "anesthetics closet"
	desc = "Used to knock people out."
	icon_state = "med"
	req_access = list(access_moebius)

/obj/structure/closet/secure_closet/anesthetics/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/tank/anesthetic(src)
	new /obj/item/tank/anesthetic(src)
	new /obj/item/tank/anesthetic(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/tool/wrench(src)

/obj/structure/closet/secure_closet/personal/doctor
	name = "Soteria Doctor's locker"
	req_access = list(access_cmo)
	access_occupy = list(access_medical_equip)
	icon_state = "med"

/obj/structure/closet/secure_closet/personal/doctor/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	if(prob(50))
		new /obj/item/storage/backpack/medical(src)
	else
		new /obj/item/storage/backpack/satchel/medical(src)
	switch(pick("blue", "green", "purple"))
		if ("blue")
			new /obj/item/clothing/under/scrubs(src)
			new /obj/item/clothing/head/surgery(src)
		if ("green")
			new /obj/item/clothing/under/scrubs/green(src)
			new /obj/item/clothing/head/surgery/green(src)
		if ("purple")
			new /obj/item/clothing/under/scrubs/purple(src)
			new /obj/item/clothing/head/surgery/purple(src)
	switch(pick("blue", "green", "purple"))
		if ("blue")
			new /obj/item/clothing/under/scrubs(src)
			new /obj/item/clothing/head/surgery(src)
		if ("green")
			new /obj/item/clothing/under/scrubs/green(src)
			new /obj/item/clothing/head/surgery/green(src)
		if ("purple")
			new /obj/item/clothing/under/scrubs/purple(src)
			new /obj/item/clothing/head/surgery/purple(src)
	new /obj/item/clothing/under/rank/medical(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/clothing/shoes/reinforced/medical(src)
	new /obj/item/clothing/head/soft/medical(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/device/radio/headset/headset_med(src)
	new /obj/item/taperoll/medical(src)
	new /obj/item/storage/belt/medical/emt(src)
	new /obj/item/storage/belt/medical/(src)
	new /obj/item/clothing/suit/storage/surgical_apron(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/clothing/accessory/stethoscope(src)

/obj/structure/closet/secure_closet/personal/paramedic
	name = "Soteria Field Doctor's locker"
	req_access = list(access_cmo)
	access_occupy = list(access_medical_equip)
	icon_state = "med"


/obj/structure/closet/secure_closet/personal/paramedic/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	if(prob(50))
		new /obj/item/storage/backpack/medical(src)
	else
		new /obj/item/storage/backpack/satchel/medical(src)
	switch(pick("blue", "green", "purple"))
		if ("blue")
			new /obj/item/clothing/under/scrubs(src)
			new /obj/item/clothing/head/surgery(src)
		if ("green")
			new /obj/item/clothing/under/scrubs/green(src)
			new /obj/item/clothing/head/surgery/green(src)
		if ("purple")
			new /obj/item/clothing/under/scrubs/purple(src)
			new /obj/item/clothing/head/surgery/purple(src)
	new /obj/item/clothing/shoes/reinforced/medical(src)
	new /obj/item/clothing/head/soft/medical(src)
	new /obj/item/device/flash(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/device/lighting/toggleable/flashlight(src)
	new /obj/item/device/radio(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/extinguisher/mini(src)
	new /obj/item/clothing/shoes/reinforced(src)
	new /obj/item/device/radio/headset/headset_med(src)
	new /obj/item/taperoll/medical(src)
	new /obj/item/storage/belt/medical/emt(src)
	new /obj/item/clothing/suit/storage/hazardvest(src)
	new /obj/item/storage/pouch/medical_supply(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/clothing/accessory/stethoscope(src)
	new /obj/item/clothing/glasses/hud/health(src)

/obj/structure/closet/secure_closet/personal/orderly
	name = "soteria Lifeline Technician locker"
	req_access = list(access_cmo)
	access_occupy = list(access_orderly)
	icon_state = "traumateam"


/obj/structure/closet/secure_closet/personal/orderly/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	if(prob(50))
		new /obj/item/storage/backpack/medical(src)
	else
		new /obj/item/storage/backpack/satchel/medical(src)
	new /obj/item/clothing/under/rank/paramedic(src) // Not a surgery-oriented job, they don't need scrubs.
	new /obj/item/device/lighting/toggleable/flashlight(src)
	new /obj/item/device/radio(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/extinguisher/mini(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/shoes/reinforced/medical(src)
	new /obj/item/device/radio/headset/headset_med(src)
	new /obj/item/taperoll/medical(src)
	new /obj/item/storage/belt/medical/emt(src)
	new /obj/item/clothing/suit/storage/hazardvest(src)
	new /obj/item/tool/baton(src)
	new /obj/item/storage/pouch/baton_holster(src)
	new /obj/item/storage/pouch/medical_supply(src)
	new /obj/item/storage/hcases/med(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/medspec(src)

/obj/structure/closet/secure_closet/reinforced/CMO
	name = "Soteria Biolab Overseer's locker"
	req_access = list(access_cmo)
	icon_state = "cmo"

/obj/structure/closet/secure_closet/reinforced/CMO/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	if(prob(50))
		new /obj/item/storage/backpack/medical(src)
	else
		new /obj/item/storage/backpack/satchel(src)
	new /obj/item/clothing/suit/bio_suit/cmo(src)
	new /obj/item/clothing/head/bio_hood/cmo(src)
	new /obj/item/clothing/shoes/color(src)
	switch(pick("blue", "green", "purple"))
		if ("blue")
			new /obj/item/clothing/under/scrubs(src)
			new /obj/item/clothing/head/surgery(src)
		if ("green")
			new /obj/item/clothing/under/scrubs/green(src)
			new /obj/item/clothing/head/surgery/green(src)
		if ("purple")
			new /obj/item/clothing/under/scrubs/purple(src)
			new /obj/item/clothing/head/surgery/purple(src)
	new /obj/item/clothing/under/rank/moebius_biolab_officer(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/cmo(src)
	new /obj/item/clothing/gloves/latex(src)
	new /obj/item/clothing/accessory/halfcape/cbo(src)
	new /obj/item/clothing/accessory/job/cape/mbo(src) // Both versions of capes for consistency - Seb
	new /obj/item/rig/cmo(src)
	new /obj/item/storage/belt/medical(src)
	new /obj/item/clothing/shoes/color/brown(src)
	new /obj/item/device/radio/headset/heads/cmo(src)
	new /obj/item/device/flash(src)
	new /obj/item/reagent_containers/hypospray(src)
	new /obj/item/storage/pouch/medical_supply(src)
	new /obj/item/clothing/shoes/reinforced/medical(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/pc_part/drive/disk/design/medical/advanced/cmo(src)
	new /obj/item/pc_part/drive/disk/design/xenobio/rd(src)
	new /obj/item/device/defib_kit/compact/combat/adv/loaded/cbo(src)
//	new /obj/item/circuitboard/sleeper/hyper(src)
	new /obj/item/oddity/chem_book(src)
	new /obj/item/storage/hcases/med(src)
	new /obj/item/clothing/accessory/holster/saber/rapiermed/occupied(src)

/obj/structure/closet/secure_closet/animal
	name = "animal control closet"
	req_access = list(access_surgery)
	icon_state = "sec"

/obj/structure/closet/secure_closet/animal/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/device/assembly/signaler(src)
	new /obj/item/device/radio/electropack(src)
	new /obj/item/device/radio/electropack(src)
	new /obj/item/device/radio/electropack(src)

/obj/structure/closet/secure_closet/chemical
	name = "chemical closet"
	desc = "Store dangerous chemicals in here."
	icon_state = "med"
	icon_door = "chemical"
	req_access = list(access_chemistry)

/obj/structure/closet/secure_closet/chemical/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/storage/box/pillbottles(src)
	new /obj/item/storage/box/pillbottles(src)
	new /obj/item/storage/pouch/tubular/vial(src)
	new /obj/item/storage/bag/chemistry(src)
	new /obj/item/storage/bag/chemistry(src)
