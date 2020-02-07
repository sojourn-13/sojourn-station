/obj/structure/closet/secure_closet/reinforced/commander
	name = "militia commander's locker"
	req_access = list(access_hos)
	icon_state = "mc"

/obj/structure/closet/secure_closet/reinforced/commander/populate_contents()
	if(prob(50))
		new /obj/item/ammo_magazine/c10mm/lethal(src)
	else
		new /obj/item/ammo_magazine/c10mm/hv(src)
	new /obj/item/ammo_magazine/c10mm/lethal(src)
	new /obj/item/weapon/storage/backpack/security(src)
	new /obj/item/weapon/storage/backpack/satchel/ironhammer(src)
	new /obj/item/clothing/head/rank/milcom/beret(src)
	new /obj/item/clothing/head/rank/milcom(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/suit/armor/commander/militia(src)
	new /obj/item/clothing/under/rank/commander(src)
	new /obj/item/clothing/under/rank/commander/formal(src)
	new /obj/item/clothing/head/rank/instructor_hat(src)
	new /obj/item/weapon/gun/projectile/automatic/omnirifle/scoped(src)
	new /obj/item/clothing/glasses/ballistic(src)
	new /obj/item/weapon/storage/belt/security(src)
	new /obj/item/clothing/gloves/stungloves(src)
	new /obj/item/clothing/accessory/armband/militia(src)
	new /obj/item/weapon/gun/projectile/lamia/dark_lamia(src)
	new /obj/item/ammo_magazine/cl44(src)
	new /obj/item/ammo_magazine/cl44(src)
	new /obj/item/clothing/accessory/holster/hip(src)
	new /obj/item/weapon/melee/telebaton(src)
	new /obj/item/weapon/storage/pouch/ammo(src)
	new /obj/item/weapon/storage/pouch/baton_holster(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)

/obj/structure/closet/secure_closet/armorer
	name = "supply specialist's locker"
	req_access = list(access_armory)
	icon_state = "armorer"

/obj/structure/closet/secure_closet/armorer/populate_contents()
	if(prob(55))
		new /obj/item/clothing/head/helmet/ballistic/militia(src)
	else
		new /obj/item/clothing/head/helmet/ballistic/green(src)
	if(prob(50))
		new /obj/item/weapon/storage/backpack/military(src)
	else
		new /obj/item/weapon/storage/backpack/security(src)
	if(prob(50))
		new /obj/item/weapon/gun/projectile/automatic/omnirifle/standard(src)
	else
		new /obj/item/weapon/gun/projectile/automatic/omnirifle/scoped(src)
	if(prob(50))
		new /obj/item/ammo_magazine/c10mm/lethal(src)
	else
		new /obj/item/ammo_magazine/c10mm/hv(src)
	new /obj/item/ammo_magazine/c10mm(src)
	new /obj/item/weapon/storage/backpack/satchel/ironhammer(src)
	new /obj/item/clothing/under/rank/armorer(src)
	new /obj/item/clothing/head/rank/armorer/beret(src)
	new /obj/item/clothing/head/rank/instructor_hat(src)
	new /obj/item/clothing/under/instructor(src)
	new /obj/item/clothing/head/rank/armorer/cap(src)
	new /obj/item/weapon/storage/belt/security(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/ammo_magazine/a10mm(src)
	new /obj/item/ammo_magazine/a10mm(src)
	new /obj/item/weapon/gun/projectile/colt/ten/dark(src)
	new /obj/item/weapon/storage/pouch/baton_holster(src)
	new /obj/item/clothing/accessory/holster/leg(src)
	new /obj/item/weapon/melee/telebaton(src)
	new /obj/item/weapon/storage/pouch/ammo(src)
	new /obj/item/clothing/glasses/ballistic(src)
	new /obj/item/clothing/accessory/armband/militia(src)
	new /obj/item/clothing/under/rank/armorer/green(src)
	new /obj/item/clothing/suit/armor/flackvest/militia(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)

/obj/structure/closet/secure_closet/personal/trooper
	name = "blackshield trooper's locker"
	req_access = list(access_hos)
	access_occupy = list(access_brig)
	icon_state = "trooper"

/obj/structure/closet/secure_closet/personal/trooper/populate_contents()
	if(prob(50))
		new /obj/item/clothing/suit/armor/platecarrier(src)
	else
		new /obj/item/clothing/suit/armor/platecarrier/militia(src)
	if(prob(50))
		new /obj/item/clothing/head/helmet/ballistic/militia(src)
	else
		new /obj/item/clothing/head/helmet/ballistic(src)
	if(prob(50))
		new /obj/item/weapon/storage/backpack/military(src)
	else
		new /obj/item/weapon/storage/backpack/security(src)
	if(prob(5))
		new /obj/item/weapon/gun/projectile/automatic/omnirifle(src)
	else if(prob(70))
		new /obj/item/weapon/gun/projectile/automatic/omnirifle/standard(src)
	else
		new /obj/item/weapon/gun/projectile/automatic/omnirifle/scoped(src)
	if(prob(50))
		new /obj/item/ammo_magazine/c10mm/lethal(src)
	else
		new /obj/item/ammo_magazine/c10mm/hv(src)
	if(prob(50))
		new /obj/item/weapon/storage/pouch/medium_generic(src)
	else
		new /obj/item/weapon/storage/pouch/ammo(src)
	if(prob(50))
		new /obj/item/clothing/under/rank/trooper/green(src)
	else
		new /obj/item/clothing/under/rank/trooper/tan(src)
	new /obj/item/ammo_magazine/c10mm(src)
	new /obj/item/ammo_magazine/c10mm(src)
	new /obj/item/clothing/under/rank/trooper(src)
	new /obj/item/weapon/storage/backpack/satchel/ironhammer(src)
	new /obj/item/weapon/storage/belt/security(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/mask/balaclava/tactical(src)
	new /obj/item/ammo_magazine/a10mm(src)
	new /obj/item/ammo_magazine/a10mm(src)
	new /obj/item/weapon/gun/projectile/colt/ten/dark(src)
	new /obj/item/weapon/storage/pouch/baton_holster(src)
	new /obj/item/clothing/accessory/holster/leg(src)
	new /obj/item/weapon/melee/telebaton(src)
	new /obj/item/clothing/glasses/ballistic(src)
	new /obj/item/clothing/accessory/armband/militia(src)
	new /obj/item/clothing/head/rank/trooper/beret(src)
	new /obj/item/clothing/head/rank/trooper/cap(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)

/obj/structure/closet/secure_closet/personal/corpsman
	name = "blackshield medical corpsman locker"
	req_access = list(access_medspec)
	icon_state = "corpsman"
/obj/item/clothing/glasses/hud/health
/obj/structure/closet/secure_closet/personal/corpsman/populate_contents()
	if(prob(50))
		new /obj/item/weapon/storage/belt/webbing/black(src)
	else
		new /obj/item/weapon/storage/belt/webbing
	if(prob(60))
		new /obj/item/weapon/gun/projectile/automatic/omnirifle/omnicarbine(src)
	else
		new /obj/item/weapon/gun/projectile/automatic/omnirifle/omnicarbine/rds(src)
	if(prob(50))
		new /obj/item/weapon/storage/backpack/military(src)
	else
		new /obj/item/weapon/storage/backpack/security(src)
	if(prob(50))
		new /obj/item/ammo_magazine/c10mm/lethal(src)
	else
		new /obj/item/ammo_magazine/c10mm/hv(src)
	new /obj/item/ammo_magazine/c10mm(src)
	new /obj/item/clothing/suit/armor/platecarrier/corpsman(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/under/rank/corpsman(src)
	new /obj/item/clothing/head/helmet/ballistic/militia(src)
	new /obj/item/clothing/mask/balaclava/tactical(src)
	new /obj/item/ammo_magazine/a10mm(src)
	new /obj/item/ammo_magazine/a10mm(src)
	new /obj/item/weapon/gun/projectile/colt/ten/dark(src)
	new /obj/item/clothing/accessory/holster/leg(src)
	new /obj/item/weapon/storage/belt/medical/emt(src)
	new /obj/item/device/scanner/health(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/clothing/accessory/armband/corpsman(src)
	new /obj/item/clothing/head/rank/corpsman/beret(src)
	new /obj/item/clothing/head/rank/corpsman/cap(src)
	new /obj/item/clothing/head/helmet/ballistic/militia(src)
	new /obj/item/clothing/gloves/latex(src)
	new /obj/item/weapon/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/weapon/reagent_containers/glass/bottle/antitoxin(src)
	new /obj/item/weapon/storage/firstaid/adv(src)
	new /obj/item/weapon/storage/firstaid/ifak(src)
	new /obj/item/weapon/storage/pill_bottle/tramadol(src)

/obj/structure/closet/secure_closet/militia/armor
	name = "blackshield armor locker"
	req_access = list(access_brig)
	icon_state = "trooper"

/obj/structure/closet/secure_closet/militia/armor/populate_contents()
	if(prob(60))
		new /obj/item/clothing/suit/armor/flackvest(src)
	else
		new /obj/item/clothing/suit/armor/flackvest/green(src)
	new /obj/item/clothing/suit/armor/platecarrier(src)
	if(prob(50))
		new /obj/item/clothing/head/helmet/ballistic/militia(src)
	else
		new /obj/item/clothing/head/helmet/ballistic/green(src)
	new /obj/item/clothing/suit/armor/platecarrier(src)
	if(prob(50))
		new /obj/item/clothing/head/helmet/ballistic(src)
	else
		new /obj/item/clothing/head/helmet/ballistic/tan(src)
	new /obj/item/clothing/suit/armor/platecarrier(src)
	if(prob(50))
		new /obj/item/clothing/suit/armor/platecarrier/militia(src)
	else
		new /obj/item/clothing/suit/armor/platecarrier/tan(src)
	new /obj/item/clothing/suit/armor/platecarrier/militia(src)
	new /obj/item/clothing/suit/armor/flackvest(src)
	new /obj/item/clothing/suit/armor/flackvest/militia(src)
	new /obj/item/clothing/head/helmet/ballistic(src)
	new /obj/item/clothing/head/helmet/ballistic(src)
	new /obj/item/clothing/head/helmet/ballistic/militia(src)
	new /obj/item/clothing/head/helmet/ballistic/militia(src)
	new /obj/item/weapon/storage/belt/webbing/black(src)
	new /obj/item/weapon/storage/belt/webbing/black(src)
	new /obj/item/weapon/storage/belt/webbing(src)
	new /obj/item/weapon/storage/belt/webbing/black(src)
	new /obj/item/weapon/storage/belt/webbing/green(src)
	new /obj/item/weapon/storage/belt/webbing(src)
