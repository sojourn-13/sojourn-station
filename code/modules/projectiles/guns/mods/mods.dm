/obj/item/gun_upgrade
	icon = 'icons/obj/guns/mods.dmi'
	w_class = ITEM_SIZE_TINY
	price_tag = 100 //These should be sold in the player market.
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1)
	var/can_remove = TRUE

/obj/item/gun_upgrade/barrel

//Silences the weapon, reduces damage multiplier slightly, Legacy port.
/obj/item/gun_upgrade/muzzle/silencer
	name = "Silencer"
	desc = "A threaded silencer that can be attached to the muzzle of certain guns. Vastly reduces noise."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 1)
	icon_state = "silencer"
	price_tag = 100

/obj/item/gun_upgrade/muzzle/silencer/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_SILENCER = TRUE,
		UPGRADE_BULK = 1
		)
	I.gun_loc_tag = GUN_MUZZLE
	I.req_gun_tags = list(GUN_SILENCABLE)
	I.prefix = "silenced"

/obj/item/gun_upgrade/muzzle/pain_maker
	name = "SA \"PainMaker\" muzzle"
	desc = "A threaded barrel that can be attached to the muzzle of most projectile guns. \
	Threaded barrel device made of a coil sensor and heater. As bullets pass the device they are slowed down and heated up by the coil, causing them to deform when hitting a target and imparting all their painful energy. \
	Typically used when taking a hostages or kidnapping."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 1)
	icon_state = "silencer"
	price_tag = 100

/obj/item/gun_upgrade/muzzle/pain_maker/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		UPGRADE_BULK = 2,
		GUN_UPGRADE_STEPDELAY_MULT = 2,
		GUN_UPGRADE_DAMAGE_MULT = 0.3,
		GUN_UPGRADE_PEN_MULT = 0.5,
		GUN_UPGRADE_PIERC_MULT = -3, //This does a LOT lowering range, as well as most guns being unable to wall bang with it
		GUN_UPGRADE_OFFSET = 25,
		GUN_UPGRADE_RECOIL = 5,
		GUN_UPGRADE_DAMAGE_HALLOSS = 20,
		GUN_UPGRADE_PAIN_MULT = 2
		)
	I.gun_loc_tag = GUN_MUZZLE
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.prefix = "LTL"

//Decreases fire delay. Acquired through loot spawns or guild crafting
/obj/item/gun_upgrade/barrel/forged
	name = "Forged barrel"
	desc = "Despite advancements in 3D printing, a properly forged plasteel barrel can still outperform anything that comes from an autolathe."
	icon_state = "Forged_barrel"
	price_tag = 120

/obj/item/gun_upgrade/barrel/forged/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.8,
		GUN_UPGRADE_STEPDELAY_MULT = 0.9, // Actually useful beyond being a glorified ergo grip
		GUN_UPGRADE_MUZZLEFLASH = 0.75)
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.prefix = "fluted barrel"

//Makes a gun deal more damage. fire faster but recoil heavy
/obj/item/gun_upgrade/barrel/bore
	name = "Heavy barrel"
	desc = "A heavy compensating barrel brake that allows for a more powerful impact due to gas control, but the extra weight impacts recoil and firing speed."
	icon_state = "Forged_heavy_barrel"
	price_tag = 230

/obj/item/gun_upgrade/barrel/bore/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_MULT = 1.2,
		GUN_UPGRADE_FIRE_DELAY_MULT = 1.1, // Better than the mod used to make it
		GUN_UPGRADE_RECOIL = 1.1, // Better than a ported barrel
		UPGRADE_BULK = 1
		)
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.prefix = "polygonal rifled"

//Increases penetration multiplier, projectile speed. Increases fire delay. Acquired via science
/obj/item/gun_upgrade/barrel/mag_accel
	name = "Soteria \"Penetrator\" magnetic accelerator barrel"
	desc = "Uses sympathetic magnetic coiling to increase exit velocity and penetration capabilities of a metal projectile. The added strain to the gun's barrel requires an additional cooldown period between shots."
	icon_state = "Penetrator"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1)
	price_tag = 160

/obj/item/gun_upgrade/barrel/mag_accel/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_PEN_MULT = 1.1,
		GUN_UPGRADE_PIERC_MULT = 1, // Adds 1 to the gun's penetrating value
		GUN_UPGRADE_STEPDELAY_MULT = 0.8,
		GUN_UPGRADE_FIRE_DELAY_MULT = 1.5,
		)
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.prefix = "magnetic barreled"

//Adds +10 burn damage to a bullet, lowers armor penetration, adds a constant projectile offset, increases recoil and fire delay. Acquired via science
/obj/item/gun_upgrade/barrel/overheat
	name = "Soteria \"Caster\" magnetic overheat barrel"
	desc = "Uses magnetic induction to heat the projectile of a weapon. Arguable combat effectiveness, but flashy nonetheless."
	icon_state = "Caster"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1)
	price_tag = 160

/obj/item/gun_upgrade/barrel/overheat/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_PEN_MULT = 0.75,
		GUN_UPGRADE_DAMAGE_BURN = 10,
		GUN_UPGRADE_OFFSET = 5,
		GUN_UPGRADE_RECOIL = 1.3,
		GUN_UPGRADE_FIRE_DELAY_MULT = 1.3,
		)
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.prefix = "barrel heated"

//Meme mod that swaps the firing sound for a bike horn noises at the cost of making every single thing about the gun shitty. Too funny not to put in, takes 2 minutes to remove since its a prank item.
/obj/item/gun_upgrade/mechanism/bikehorn
	name = "Boogaloo bike horn"
	desc = "A strange weapon augment made by someone with a sense of humor. The bulk of the item, not to mention its bolted attachment style, make it a pranksters tool only as it is annoying to use and remove."
	icon_state = "bike_horn"
	price_tag = 420

/obj/item/gun_upgrade/mechanism/bikehorn/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_HONK = TRUE,
		GUN_UPGRADE_RECOIL = 1.2,
		GUN_UPGRADE_DAMAGE_MULT = 0.8,
		GUN_UPGRADE_PEN_MULT = 0.9,
		GUN_UPGRADE_FIRE_DELAY_MULT = 1.2,
		GUN_UPGRADE_MOVE_DELAY_MULT = 1.2,
		GUN_UPGRADE_MUZZLEFLASH = 1.2,
		GUN_UPGRADE_CHARGECOST = 1.2,
		GUN_UPGRADE_OVERCHARGE_MAX = 1.2,
		GUN_UPGRADE_OVERCHARGE_RATE = 0.8
	)
	I.removal_time *= 10
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "boogalooed"

//For energy weapons, increases the damage output, but also the charge cost. Acquired from church bioprinter.
/obj/item/gun_upgrade/barrel/excruciator
	name = "New Testament \"EXCRUCIATOR\" giga lens"
	desc = "It's time for us to shine."
	icon_state = "Excruciator"
	matter = list(MATERIAL_BIOMATTER = 3, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1, MATERIAL_GLASS = 1)
	price_tag = 160

/obj/item/gun_upgrade/barrel/excruciator/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_MULT = 1.3,
		GUN_UPGRADE_CHARGECOST = 1.15,
		UPGRADE_BULK = 0.5,
		)
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_ENERGY)
	I.prefix = "focused"

/*
/obj/item/gun_upgrade/barrel/excruciator_plus
	name = "Factorial \"EXCRUCIATOR\" hyper lens"
	desc = "It's time for us to shine. This device has been modified by members of the factorial path, doubling its strength and drawbacks, for better or worse."
	icon_state = "Excruciator_plus"
	matter = list(MATERIAL_BIOMATTER = 3, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1, MATERIAL_GLASS = 1)
	price_tag = 160

/obj/item/gun_upgrade/barrel/excruciator_plus/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_MULT = 1.45,
		GUN_UPGRADE_CHARGECOST = 1.25,
		UPGRADE_BULK = 0.75,
		)
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_ENERGY)
	I.prefix = "hyper focused"

/obj/item/gun_upgrade/trigger
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1)
*/
//Disables the ability to toggle the safety, toggles the safety permanently off, decreases fire delay. Acquired through loot spawns
/obj/item/gun_upgrade/trigger/dangerzone
	name = "\"Danger Zone\" Trigger"
	desc = "A popular design by the Artificer's Guild used on the frontier by mercenary groups who don't care about collateral, overclocking the firing mechanism by disabling the safety function. A void wolf staple."
	icon_state = "Danger_Zone"
	price_tag = 115

/obj/item/gun_upgrade/trigger/dangerzone/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.8,
		GUN_UPGRADE_FORCESAFETY = FALSE,
		)
	I.gun_loc_tag = GUN_TRIGGER
	I.prefix = "trigger feathered"

//Disables the ability to toggle the safety, toggles the safety permanently on, takes 2 minutes to remove (yikes). Acquired through loot spawns
/obj/item/gun_upgrade/trigger/cop_block
	name = "H&S \"Cop Block\" Trigger"
	desc = "A trigger guard to force the safety on a gun, used to pacify weapons from targets or trigger happy marshals. A simpler way of making a weapon display-only"
	icon_state = "Cop_Block"
	price_tag = 25

/obj/item/gun_upgrade/trigger/cop_block/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.install_time = WORKTIME_INSTANT
	I.weapon_upgrades = list(
		GUN_UPGRADE_FORCESAFETY = TRUE,
		)
	I.removal_time *= 10
	I.gun_loc_tag = GUN_TRIGGER
	I.breakable = FALSE
	I.prefix = "Locked"

/obj/item/gun_upgrade/trigger/dnalock
	name = "Soteria \"DNA lock\" Finger Imprinter Trigger"
	desc = "There are many guns, but that one will be yours. Prevents others from using weapon with this trigger."
	icon_state = "DNA_lock"
	matter = list(MATERIAL_SILVER = 1, MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3) //DNA stuff needs silver i guess
	price_tag = 100

/obj/item/gun_upgrade/trigger/dnalock/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.install_time = WORKTIME_INSTANT //For SWAT tatics+
	I.weapon_upgrades = list(
		GUN_UPGRADE_DNALOCK = TRUE
		)
	I.removal_time *= 10
	I.gun_loc_tag = GUN_TRIGGER
	I.breakable = FALSE
	I.removal_difficulty = FAILCHANCE_VERY_HARD
	I.prefix = "biolocked"

/obj/item/gun_upgrade/mechanism


//Adds +3 to the internal magazine of a weapon. Acquired through loot spawns.
/obj/item/gun_upgrade/mechanism/overshooter
	name = "\"Overshooter\" internal magazine kit"
	desc = "A method of overloading a weapon's internal magazine, fitting more ammunition within the weapon. An Artificer's Guild favorite for revolvers and shotguns."
	icon_state = "Overshooter"
	price_tag = 230

/obj/item/gun_upgrade/mechanism/overshooter/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_MAGUP = 3,
		UPGRADE_BULK = 1
		)
	I.req_gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "overloaded"

/* //This mod works fine but if a bullet hits an object it run times, my theory is its trying to make an effect work via rads that isn't coded properly either by ERIS or my bad porting.
//For now this has been modified to not use rad damage since that has issues.
*/
//Adds extra burns and toxin damage to .35 rounds. Acquired through raiding greyson machines or heavy SI investment.
/obj/item/gun_upgrade/mechanism/glass_widow
	name = "Greyson \"Glass Widow\" infuser"
	desc = "An old technology from the Greyson's glory days, used to make formerly useless civilian-grade weaponry into something much more lethal. This mechanism fits .35 weapons only and coats the bullets in dangerous caustic toxins."
	icon_state = "Glass_Widow"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTEEL = 4, MATERIAL_PLATINUM = 4)
	price_tag = 800

/obj/item/gun_upgrade/mechanism/glass_widow/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_BURN = 10,
		GUN_UPGRADE_DAMAGE_TOX = 10,
		UPGRADE_BULK = 1
		)
	I.req_gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "infused"

// Guild made upgrade kit that makes .50 Kurz guns a bit more viable
/obj/item/gun_upgrade/mechanism/upgrade_kit
	name = "Kurz's refinement kit"
	desc = "A kit made of plasteel designed to refit and refine any kurz loaded .50 Kurz weapon. This kit is produced by the Artificer's Guild so even \
	the heaviest caliber pistols might stand a chance of competing with their legendary myrmidon design."
	icon_state = "kit_heavy_alt"
	can_remove = FALSE
	price_tag = 350

/obj/item/gun_upgrade/mechanism/upgrade_kit/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_MULT = 1.1,
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.9, //10% delay removed
		GUN_UPGRADE_PEN_MULT = 1.1, //we shoot harder, but not by much
		GUN_UPGRADE_MOVE_DELAY_MULT = 0.9, //We shoot somehwat faster (not hit scan)
		GUN_UPGRADE_RECOIL = 0.85, //15% less recoil (doesn't help as much without stacking it with other mods)
		UPGRADE_BULK = -1
		)
	I.req_gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_50)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "kitted"

// Rare Bluecross spawn clock cult brass kit that will make any .50 Kurz cal gun into something worth ya know... using...
// Todo make Cult spawn with this and the clockwork block
/obj/item/gun_upgrade/mechanism/brass_kit
	name = "\"Brass Fighter\" refinement kit"
	desc = "A kit made from brass and designed to improve .50 Kurz caliber kurz weaponry. It's strange to look at in this day and age. It ticks, tocks, chimes, \
	and plays a faint melodic tone through brass gears and perptually grinding cogs. Was this an invention of the blue cross or a toy some other entity made?"
	icon_state = "Clockblock"
	can_remove = FALSE
	price_tag = 1750

/obj/item/gun_upgrade/mechanism/brass_kit/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_MULT = 1.15, //15% more damage
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.8, //20% delay removed
		GUN_UPGRADE_PEN_MULT = 1.5, //we shoot harder
		GUN_UPGRADE_MOVE_DELAY_MULT = 0.6, //We shoot way faster (not hit scan)
		GUN_UPGRADE_MUZZLEFLASH = 2, //Bigger flash
		GUN_UPGRADE_RECOIL = 0.75, //25% less recoil (dosnt help as much without stacking it with other mods)
		UPGRADE_BULK = -2
		)
	I.req_gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_50)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "brass kitted"

//Lets any revolver be made into a fully automatic weapon, but increases recoil. Acquirable through guild crafters.
/obj/item/gun_upgrade/mechanism/weintraub
	name = "\"Hurricane\" full auto kit"
	desc = "A specially made custom tooled fully automatic cylinder fit for a revolver, for when you want stopping power AND a bullet storm. Good luck controlling the recoil."
	icon_state = "Weintraub"
	price_tag = 150

/obj/item/gun_upgrade/mechanism/weintraub/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FULLAUTO = TRUE
	)
	I.req_gun_tags = list(GUN_REVOLVER)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "automatic"

//Causes your weapon to shoot you in the face, then explode. Acquired through uplink
/obj/item/gun_upgrade/mechanism/reverse_loader
	name = "Void Wolf reverse loader"
	desc = "Makes bullets loaded into the weapon fire backwards, into its user."
	icon_state = "Reverse_loader"
	price_tag = 50

/obj/item/gun_upgrade/mechanism/reverse_loader/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RIGGED = TRUE
	)
	I.removal_time *= 5
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.gun_loc_tag = GUN_MECHANISM
	I.breakable = FALSE
	I.prefix = "" // We do a little trolling. Don't fire guns the enemy drops without examining them!

/obj/item/gun_upgrade/mechanism/tensioner
	name = "weighted pulley kit"
	desc = "A set of compound pulleys, cables and mounting screws for installing onto a bow. Makes it harder to draw back, but more powerful."
	icon_state = "winder_kit"
	price_tag = 500

/obj/item/gun_upgrade/mechanism/tensioner/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_BRUTE = 0.5, //7.5mm extra damage at new max charge
		GUN_UPGRADE_OVERCHARGE_MAX = 1.5,
		GUN_UPGRADE_OVERCHARGE_RATE = 0.35
		)
	I.req_gun_tags = list(ARROW_FIRING)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "heavy"

/obj/item/gun_upgrade/mechanism/froggeytensioner
	name = "high tension bowstring"
	desc = "A collection of pulleys, mounting screws and an impressively powerful bowstring of animal sinew for installing onto a bow. Makes it harder to draw back, but more powerful."
	icon_state = "winder_kit"
	price_tag = 500

/obj/item/gun_upgrade/mechanism/froggeytensioner/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_BRUTE = 0.25,
		GUN_UPGRADE_OVERCHARGE_MAX = 1.25,
		GUN_UPGRADE_OVERCHARGE_RATE = 0.7
		)
	I.req_gun_tags = list(ARROW_FIRING)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "overstrung"

/obj/item/gun_upgrade/mechanism/detensioner
	name = "compound pulley kit"
	desc = "A set of compound pulleys, cables and mounting screws for installing onto a bow. Makes it significantly easier to draw back, but less powerful."
	icon_state = "winder_kit"
	price_tag = 250

/obj/item/gun_upgrade/mechanism/detensioner/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_OVERCHARGE_MAX = 0.75,
		GUN_UPGRADE_OVERCHARGE_RATE = 2
		)
	I.req_gun_tags = list(ARROW_FIRING)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "light" // To differentiate = less damage


//obj/item/gun_upgrade/underbarrel

/obj/item/storage/box/gun_upgrades
	name = "Big box of gun fun"
	desc = "If seen, please report to your nearest \[REDACTED\]"

/obj/item/storage/box/gun_upgrades/populate_contents()
	for(var/i in subtypesof(/obj/item/gun_upgrade))
		var/obj/test = i
		if(initial(test.icon_state))
			new i(src)
	new /obj/item/tool_upgrade/productivity/ergonomic_grip(src)
	new /obj/item/tool_upgrade/refinement/laserguide(src)

// 	 EXPERIMENTAL WEAPON MODS
//------------------------------------------------

// Double damage at the cost of more recoil and a tripled energy consumption
/obj/item/gun_upgrade/mechanism/battery_shunt
	name = "Soteria \"Thunder\" battery shunt"
	desc = "This experimental battery shunt is a cutting edge tool attachment which bypasses battery protection circuits to deliver the maximum amount of power in the shortest amount of time. For those who care more about stopping power than number of shots."
	icon_state = "battery_shunt"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1, MATERIAL_URANIUM = 1)
	price_tag = 160

/obj/item/gun_upgrade/mechanism/battery_shunt/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 2,
	GUN_UPGRADE_FIRE_DELAY_MULT = 1.5,
	GUN_UPGRADE_DAMAGE_BASE = 1,
	GUN_UPGRADE_CHARGECOST = 2)
	I.req_fuel_cell = REQ_CELL
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "shunted"

// Greatly increase firerate at the cost of lower damage
/obj/item/gun_upgrade/mechanism/overdrive
	name = "Soteria \"Tesla\" overdrive chip"
	desc = "This experimental chip is a cutting edge tool attachment which bypasses power management protocols to dramatically increase the rate of fire at the cost of reduced stopping power."
	icon_state = "overdrive"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1, MATERIAL_URANIUM = 1)
	price_tag = 160

/obj/item/gun_upgrade/mechanism/overdrive/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_DAMAGE_MULT = 0.9,
	GUN_UPGRADE_FIRE_DELAY_MULT = 0.25)
	I.req_fuel_cell = REQ_CELL
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "overclocked"

//Just massively reduces recoil like a grip but in the mechanism. Meh tear at best
/obj/item/gun_upgrade/mechanism/clock_block //Real deal, but admin only atm
	name = "Unknown Clockwork Mechanism"
	desc = "It's really not clear what this modification actually does. It appears to effect the attached weapon's recoil, but if it actually helps or hinders the weapon is unclear."
	icon_state = "Clockblock"
	price_tag = 0

/obj/item/gun_upgrade/mechanism/clock_block/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RECOIL = rand(5, 9)/10, //0.5 -> 0.9 aka 50% reduction to 10% reduction
	)
	I.destroy_on_removal = TRUE
	I.removal_time *= rand(100, 140)/10
	I.removal_difficulty *= rand(50, 150)/10
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "ticking"

// HONK
/obj/item/gun_upgrade/trigger/honker
	name = "\"Banana Split\" emitter"
	desc = "This experimental trigger mechanism taps directly into the bluespace dimension and refines its energy to produce the purest sounds possible, for the classic prankster at least."
	icon_state = "honker"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1)
	price_tag = 73

/obj/item/gun_upgrade/trigger/honker/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_HONK = TRUE)
	I.prefix = "honking"
	I.gun_loc_tag = GUN_TRIGGER

// Add toxin damage to your weapon
/obj/item/gun_upgrade/barrel/toxin_coater
	name = "Soteria \"Black Viper\" toxin coater"
	desc = "This experimental barrel coats bullets with a thin layer of toxins just before they leave the weapon. Do not lick it."
	icon_state = "toxin_coater"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 2)
	price_tag = 110

/obj/item/gun_upgrade/barrel/toxin_coater/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_DAMAGE_TOX = 5)
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.gun_loc_tag = GUN_BARREL
	I.prefix = "toxic"

/* //Rad weapons runtime when they hit an object, so this is commented out.
// Add radiation damage to your weapon
/obj/item/gun_upgrade/barrel/isotope_diffuser
	name = "Soteria \"Atomik\" isotope diffuser"
	desc = "This experimental barrel constantly sprays a thin mist of radioactive isotopes to make projectiles leaving the weapons deadlier, whether bullets, lasers or energy bolts. Do not put it in your mouth."
	icon_state = "isotope_diffuser"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1, MATERIAL_URANIUM = 2)

/obj/item/gun_upgrade/barrel/isotope_diffuser/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_DAMAGE_RADIATION = 5)
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.gun_loc_tag = GUN_BARREL

*/
/* //The handholder rail and its consequences have been a disaster for Sojournkind.
/obj/item/gun_upgrade/mechanism/gun_rail
	name = "H&S \"HandHolder\" Barrel Rail"
	desc = "A simple magnetic barrel rail, designed to fit onto a variety of weapons. Easy to attach, impossible to remove."
	icon_state = "auto_spingbox"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 3, MATERIAL_GLASS = 2)
	can_remove = FALSE
	price_tag = 60

/obj/item/gun_upgrade/mechanism/gun_rail/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RAIL = TRUE,
		UPGRADE_BULK = 1
		)
	I.removal_time *= 10
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "tactical" //My man with 20 rails and 40 scopes on his guns
	I.breakable = FALSE
	I.unique_removal = TRUE
	I.unique_removal_type = GUN_SCOPE
*/
//We don't use sanity damage and sanity damaging effects, but I'm keeping this commented out in case we some day do.
// Add psy damage to your weapon

/obj/item/gun_upgrade/mechanism/psionic_catalyst
	name = "Moebius \"Mastermind\" psionic catalyst"
	desc = "This controversial device greatly amplifies the natural psionic ability of the user and allows them to project their will into the world. Before the development of the Psi Amp, psionic disciplines were mostly detectable only in a lab environment."
	icon_state = "psionic_catalyst"
	matter = list(MATERIAL_SILVER = 3, MATERIAL_PLASTEEL = 3, MATERIAL_URANIUM = 3)

/obj/item/gun_upgrade/mechanism/psionic_catalyst/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_DAMAGE_PSY = 0.4)
	I.prefix = "psionic"
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.gun_loc_tag = GUN_MECHANISM

/obj/item/gun_upgrade/mechanism/greyson_master_catalyst
	name = "Greyson \"Master Unmaker\" infuser"
	desc = "One of the rarest and most powerful weapon modifications ever made by Greyson Positronics and one of the numerous reasons they remain a threat even after the company collapsed into malfunctioning artificial intelligences. It can infuse any weapon with immense power that causes utter ruin to machine and organic matter alike."
	icon_state = "psionic_catalyst"
	matter = list(MATERIAL_PLATINUM = 5, MATERIAL_PLASTEEL = 3, MATERIAL_DIAMOND = 10)
	price_tag = 4500

/obj/item/gun_upgrade/mechanism/greyson_master_catalyst/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		UPGRADE_BULK = 1,
		GUN_UPGRADE_DAMAGE_BRUTE = 10,
		GUN_UPGRADE_DAMAGE_BURN = 10,
		GUN_UPGRADE_DAMAGE_TOX = 5,
		GUN_UPGRADE_DAMAGE_OXY = 5,
		GUN_UPGRADE_DAMAGE_CLONE = 5,
		GUN_UPGRADE_DAMAGE_HALLOSS = 5,
		GUN_UPGRADE_FIRE_DELAY_MULT = 1.2,
		GUN_UPGRADE_CHARGECOST = 1.5
	)
	I.removal_time *= 10
	I.gun_loc_tag = GUN_MECHANISM
	I.req_fuel_cell = REQ_CELL
	I.prefix = "catalytic"
	I.greyson_moding = TRUE

/obj/item/gun_upgrade/barrel/gauss
	name = "Void Wolf \"Gauss Coil\" barrel"
	desc = "Makes bullets pierce through walls and penetrate armor easily, but loses rate of fire and increases recoil."
	icon_state = "Gauss"
	price_tag = 110

/obj/item/gun_upgrade/barrel/gauss/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_BRUTE = 5,
		GUN_UPGRADE_PEN_BASE = 0.2,
		GUN_UPGRADE_PEN_MULT = 1.1,
		GUN_UPGRADE_PIERC_MULT = 1,
		GUN_UPGRADE_FIRE_DELAY_MULT = 1.2,
		GUN_UPGRADE_RECOIL = 1.2,
		)
	I.removal_time *= 10
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.prefix = "gauss coiled"

/obj/item/gun_upgrade/trigger/boom
	name = "Void Wolf \"Self Destruct\" trigger"
	desc = "A trigger built for energy weapons that cause it to explode when fired, the perfect bait and switch for the dishonest pirate."
	icon_state = "Boom"
	price_tag = 66

/obj/item/gun_upgrade/trigger/boom/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_EXPLODE = TRUE,
		)
	I.removal_time *= 10
	I.gun_loc_tag = GUN_TRIGGER
	I.req_gun_tags = list(GUN_ENERGY)
	I.breakable = FALSE
	I.prefix = "" // We do a little trolling. Don't fire guns the enemy drops without examining them!

/obj/item/gun_upgrade/scope
//	bad_type = /obj/item/gun_upgrade/scope

/obj/item/gun_upgrade/scope/watchman
	name = "Artificer's Guild \"Watchman\" scope"
	desc = "In the age of 3D printing, the design of a scope one can rely on is common, but a scope that is special is a rarity. Hand-made scopes forged by the Artificer's Guild are known across the entire Solarian Federation for the quality they have and this one is no different."
	icon_state = "Watchman"
	matter = list(MATERIAL_GLASS = 2, MATERIAL_PLASTEEL = 1)
	price_tag = 40

/obj/item/gun_upgrade/scope/watchman/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_OFFSET = 0.9,
		GUN_UPGRADE_ZOOM = 1.2 // 9 extra tiles
		)
	I.gun_loc_tag = GUN_SCOPE
	I.req_gun_tags = list(GUN_SCOPE)
	I.prefix = "scoped"

/obj/item/gun_upgrade/scope/acog
	name = "H&S \"AGOG\" scope"
	desc = "In the age of 3D printing, the design of a scope one can rely on is common, but a scope that is special is a rarity. This is not one such scope. Mass produced, lathe machined and incredibly cheap. These often misaligned optics are truly ubiquitous."
	icon_state = "agog"
	matter = list(MATERIAL_GLASS = 2, MATERIAL_STEEL = 1)
	price_tag = 20

/obj/item/gun_upgrade/scope/acog/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_OFFSET = 0.5,
		GUN_UPGRADE_ZOOM = 0.5 // 3 extra tiles of vision
		)
	I.gun_loc_tag = GUN_SCOPE
	I.req_gun_tags = list(GUN_SCOPE)
	I.prefix = "scoped"

/obj/item/gun_upgrade/scope/killer
	name = "Void Wolf \"Contract Killer\" scope"
	desc = "A digital scope machine printed by void wolf reavers, often combined with gauss weaponry and thermal scanners to cause breaches to ships and dead pilots in void-based dog fights."
	icon_state = "Killer"
	price_tag = 60

/obj/item/gun_upgrade/scope/killer/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_OFFSET = 0.7,
		GUN_UPGRADE_FIRE_DELAY_MULT = 1.4,
		UPGRADE_BULK = 1,
		GUN_UPGRADE_ZOOM = 2
		)
	I.gun_loc_tag = GUN_SCOPE
	I.req_gun_tags = list(GUN_SCOPE)
	I.prefix = "scoped"

//Magwell

/obj/item/gun_upgrade/magwell
//	bad_type = /obj/item/gun_upgrade/magwell

// Greatly reduces firerate but will turn on or off auto-eject
/obj/item/gun_upgrade/magwell/auto_eject
	name = "H&S \"Dropper\" Magwell Autodrop Mechanism"
	desc = "A rather smartly-designed magwell breaker box that, when added to guns that do not already possess an auto-eject feature, will automatically drop the gun's magazine into the floor once it empties! When force-ejecting a mag, it will play a beeping sound."
	icon_state = "auto_spingbox"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 3, MATERIAL_GLASS = 2)
	price_tag = 70

/obj/item/gun_upgrade/magwell/auto_eject/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_FIRE_DELAY_MULT = 1.2,
	UPGRADE_BULK = -1,
	GUN_UPGRADE_AUTOEJECT = TRUE)
	I.req_gun_tags = list(GUN_MAGWELL)
	I.gun_loc_tag = GUN_MAGWELL
	I.prefix = "auto dropping"

//Fancy verson
/obj/item/gun_upgrade/magwell/auto_eject/no_removal
	name = "SI \"Braker\" Magwell Autodrop System"
	desc = "A rather oddly-designed magwell breaker box that, when added to guns that do not already possess an auto-eject feature, will automatically drop the gun's magazine into the floor once it empties! When force-ejecting a mag, it will play a beeping sound.\
	Unlike the other versions on the market this, once added, will not be removable as it replaces key components of the receiver to be as seamless as possible."
	can_remove = FALSE
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1, MATERIAL_GLASS = 2, MATERIAL_SILVER = 1, MATERIAL_GOLD = 1)

/obj/item/gun_upgrade/magwell/auto_eject/no_removal/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
	GUN_UPGRADE_AUTOEJECT = TRUE)
	I.req_gun_tags = list(GUN_MAGWELL)
	I.gun_loc_tag = GUN_MAGWELL
	I.prefix = "integrated dropping"


//Underbarrel aka bipods

/obj/item/gun_upgrade/underbarrel

/obj/item/gun_upgrade/underbarrel/bipod
	name = "H&S \"Stand\" bipod"
	desc = "A simple set of telescopic poles to keep a weapon stabilized during firing. It greatly reduces recoil when deployed, but also increases the gun's weight, making it unwieldy unless braced."
	icon_state = "bipod"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 3)
	price_tag = 130

/obj/item/gun_upgrade/underbarrel/bipod/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.weapon_upgrades = list(
		GUN_UPGRADE_BIPOD = TRUE,
		GUN_UPGRADE_RECOIL = 0.9,
		UPGRADE_BULK = 1
		)
	I.gun_loc_tag = GUN_UNDERBARREL
	I.prefix = "bipodal"
