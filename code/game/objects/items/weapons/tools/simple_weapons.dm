//Those are all weapons that don't had tool modding at some point, but should have it for balance purposes.

/obj/item/tool/broken_bottle
	name = "broken bottle"
	desc = "A bottle with a sharp broken bottom."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "broken_bottle"
	matter = list(MATERIAL_GLASS = 2)
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_WEAK
	item_state = "beer"
	attack_verb = list("stabbed", "slashed", "attacked")
	sharp = TRUE
	edge = FALSE
	max_upgrades = 1 //it's not even a tool
	tool_qualities = list(QUALITY_CUTTING = 10)
	var/icon/broken_outline = icon('icons/obj/drinks.dmi', "broken")

/obj/item/tool/nailstick
	name = "nailed stick"
	desc = "Stick with some nails in it. Looks sharp enough."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hm_spikeclub"
	item_state = "hm_spikeclub"
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("beaten", "slammed", "smacked", "struck", "battered")
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	max_upgrades = 5
	tool_qualities = list(QUALITY_HAMMERING = 10)
	effective_faction = list("spider") // Spiders are weak to crushing.
	damage_mult = 2

/obj/item/tool/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fiber-metal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hatchet"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 3)
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_SMALL
	sharp = TRUE
	edge = TRUE
	armor_penetration = ARMOR_PEN_SHALLOW
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 1)
	attack_verb = list("chopped", "torn", "cut")
	tool_qualities = list(QUALITY_CUTTING = 20, QUALITY_SAWING = 15)
	worksound = WORKSOUND_HARD_SLASH
	price_tag = 30

/obj/item/tool/fireaxe
	name = "fire axe"
	desc = "Truly, the weapon of a madman. Who would think to fight fire with an axe?"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "fireaxe0"
	wielded_icon = "fireaxe1"
	sharp = TRUE
	edge = TRUE
	armor_penetration = ARMOR_PEN_MODERATE
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_PRYING = 20, QUALITY_SAWING = 15)
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_BRUTAL
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	embed_mult = 1 //Axes cut deep, and their hooked shape catches on things
	worksound = WORKSOUND_HARD_SLASH
	price_tag = 190
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "fireaxe0_back"
		)

/obj/item/tool/fireaxe/afterattack(atom/A as mob|obj|turf|area, mob/user as mob, proximity)
	if(!proximity) return
	..()
	if(A && wielded)
		if(istype(A,/obj/effect/plant))
			var/obj/effect/plant/P = A
			P.die_off()

/obj/item/tool/fireaxe/woodsman
	name = "woodsman axe"
	desc = "Chop the wood to fuel the fire."
	icon_state = "woodsmanaxe0"
	wielded_icon = "woodsmanaxe1"
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 40, QUALITY_SAWING = 30)
	w_class = ITEM_SIZE_BULKY
	price_tag = 30

/obj/item/tool/fireaxe/militia_tomahawk
	name = "blackshield tactical tomahawk"
	desc = "For cutting, sawing, prying, and throwing at targets mid back-flip."
	icon_state = "sec_tomahawk"
	wielded_icon = "sec_tomahawk"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_BRUTAL
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 30, QUALITY_SAWING = 25, QUALITY_PRYING = 15)
	w_class = ITEM_SIZE_NORMAL
	price_tag = 45

/obj/item/tool/minihoe
	name = "mini hoe"
	desc = "It's used for removing weeds or scratching your back."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hoe"
	item_state = "hoe"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	max_upgrades = 2
	tool_qualities = list(QUALITY_SHOVELING = 10)
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("slashed", "sliced", "cut", "clawed")

/obj/item/tool/scythe
	name = "scythe"
	desc = "A sharp and curved blade on a long fiber-metal handle, this tool makes it easy to reap what you sow."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "scythe0"
	matter = list(MATERIAL_PLASTEEL = 7, MATERIAL_PLASTIC = 3)
	sharp = TRUE
	edge = TRUE
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	tool_qualities = list(QUALITY_CUTTING = 15, QUALITY_SAWING = 10)
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "scythe0_back"
		)


//Flails
/obj/item/tool/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	max_upgrades = 2
	tool_qualities = list(QUALITY_HAMMERING = 5)

/obj/item/tool/disciplinary_action
	name = "Disciplinary Action"
	desc = "A long whip of steel chains used by Blackshield for when someone acts out of line."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	max_upgrades = 3
	tool_qualities = list(QUALITY_HAMMERING = 5)


//Swords

/obj/item/tool/sword
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "claymore"
	item_state = "claymore"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5)
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_ROBUST
	armor_penetration = ARMOR_PEN_DEEP

	throwforce = WEAPON_FORCE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_SAWING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	w_class = ITEM_SIZE_BULKY
	price_tag = 100

/obj/item/tool/sword/katana
	name = "katana"
	desc = "Modern Japanese-style blade that has no curve to it. This one looks pretty sharp."
	icon_state = "katana"
	item_state = "katana"
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 5, MATERIAL_DIAMOND = 1) //sharpened using diamond dust or whatever
	slot_flags = SLOT_BELT | SLOT_BACK
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_SHALLOW
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "katana_back"
		)

/obj/item/tool/sword/katana_makeshift
	name = "makeshift katana"
	desc = "Modern Japanese-style blade that has no curve to it. This one is two knives welded together, proving where there's a will and a weeb there's a way."
	icon_state = "katana_improv"
	item_state = "katana_improv"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTIC = 2) //twice the value of a kitche knife
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_SHALLOW
	price_tag = 40

/obj/item/tool/sword/katana/nano
	name = "\improper Soteria \"Muramasa\" katana"
	desc = "After an extensive binge of ancient animated recordings, a scientist decided to upgrade a recovered katana."
	icon_state = "eutactic_katana"
	item_state = "eutactic_katana"
	toggleable = TRUE

	suitable_cell = /obj/item/cell/small

	use_power_cost = 0.4
	passive_power_cost = 0.4

	switched_on_qualities = list(QUALITY_CUTTING = 25, QUALITY_SAWING = 15)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 6)
	switched_on_force = WEAPON_FORCE_LETHAL
	price_tag = 800

/obj/item/tool/sword/katana/nano/turn_on(mob/user)
	.=..()
	if(.)
		embed_mult = 0
		playsound(user, 'sound/weapons/saberon.ogg', 50, 1)

/obj/item/tool/sword/katana/nano/turn_off(mob/user)
	..()
	embed_mult = initial(embed_mult)
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)

/obj/item/tool/sword/katana/nano/update_icon()
	..()
	if(cell)
		overlays += "[icon_state]_cell"
	if(switched_on)
		overlays += "[icon_state]_power_on"
	else
		overlays += "[icon_state]_power_off"

/obj/item/tool/sword/katana/firebrand //Firebrand. Sprited and Implemented by Sieghardt
	name = "Artificer Firebrand"
	desc = "Originally the fever dream of an brave guild master looking for a better way to deal with roaches, the Firebrand ended up as a hellish implement of war. While turned off, this is a blunted hunk of metal. When turned on the Firebrand becomes a bringer of fiery doom to anyone unlucky enough to be its path."
	icon_state = "firebrand"
	item_state = "firebrand"
	toggleable = TRUE

	max_fuel = 100
	use_fuel_cost = 0.5
	passive_fuel_cost = 0.1
	price_tag = 700

	switched_on_qualities = list(QUALITY_CUTTING = 25, QUALITY_SAWING = 15, QUALITY_CAUTERIZING = 10, QUALITY_WELDING = 15)
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 4)
	force = WEAPON_FORCE_NORMAL
	switched_on_force = WEAPON_FORCE_BRUTAL
	//Weaker than the Muramasa and other high end weapons, as it's not LETHAL, but sets the target on fire. 1 stack though.
	structure_damage_factor = STRUCTURE_DAMAGE_BLUNT
	//A heated blade can not be sharp, it's just shaped like a sword while being a blunt object. When turned off it has as much damage as other blunt implements.
	heat = 2250
	glow_color = COLOR_ORANGE
	//Stronger when turned on. Will emit heat, turn its damage type to burn and set targets on fire.

/obj/item/tool/sword/katana/firebrand/is_hot()
	if(switched_on)
		return heat

/obj/item/tool/sword/katana/firebrand/turn_on(mob/user)
	.=..()
	if(.)
		embed_mult = 0
		damtype = BURN
		set_light(2)
		playsound(loc, 'sound/items/welderactivate.ogg', 50, 1)
		//Too hot to get stuck into crud.

/obj/item/tool/sword/katana/firebrand/apply_hit_effect(atom/target, blocked=FALSE)
	.=..()
	if(iscarbon(target) && switched_on)
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()
		//Sets the target on fire, however only 1 stack at a time rather than 4 like most incendiary ammo.

/obj/item/tool/sword/katana/firebrand/turn_off(mob/user)
	..()
	embed_mult = initial(embed_mult)
	damtype = initial(damtype)
	set_light(0)
	playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)

/obj/item/tool/sword/katana/firebrand/update_icon()
	..()
	if(switched_on)
		icon_state = "firebrand_on"
		item_state = "firebrand_on"
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)

/obj/item/tool/sword/saber
	name = "decorative saber"
	desc = "A finely made formal blade as a ornamental show of class or force. Despite being primarily for show it cuts deep and painfully."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "saber"
	item_state = "saber"
	armor_penetration = ARMOR_PEN_SHALLOW
	price_tag = 400

/obj/item/tool/sword/saber/cutlass
	name = "cutlass"
	desc = "A finely made sword for pirates or military men who take themselves too seriously."
	icon_state = "cutlass"
	item_state = "cutlass"
	price_tag = 300

/obj/item/tool/sword/saber/militiacommander
	name = "Officer's Saber"
	desc = "A masterfully forged Saber to be carried by the Blackshield Commander, Despite it fact for Ceremonial use. It can also be used in combat, if they're crazy enough."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "saber"
	item_state = "saber"
	armor_penetration = ARMOR_PEN_SHALLOW
	price_tag = 350

/obj/item/tool/sword/saber/militiasergeant
	name = "Sergeant's Saber"
	desc = "An Saber made for the Senior Enlisted of Blackshield, Usually used for Ceremonial usage but can also be used in combat, Preferably used by a maniac who likes to charge into battle without helmet or armour."
	icon_state = "cutlass"
	item_state = "cutlass"
	armor_penetration = ARMOR_PEN_SHALLOW
	price_tag = 325

/obj/item/tool/sword/machete
	name = "machete"
	desc = "An explorer's best friend and trust back up plan. Or primary plan for those who like to get in there personally."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "machete"
	item_state = "machete"
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_SAWING = 20) //So we can cut down trees
	force = WEAPON_FORCE_ROBUST
	w_class = ITEM_SIZE_NORMAL
	price_tag = 120

/obj/item/tool/sword/cleaver
	name = "sun cleaver"
	desc = "A weapon designed by the Hunting Lodge, this massive sword is especially effective against tengolos, xenomorphs, and tengolo berserkers, dealing double its normal damage with every strike."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "cleaver"
	item_state = "cleaver"
	tool_qualities = list(QUALITY_CUTTING = 30)
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_SHALLOW
	w_class = ITEM_SIZE_BULKY
	effective_faction = list("tengo", "tengolo_berserker", "xenomorph") // Which faction the cleaver is effective against.
	damage_mult = 2 // The damage multiplier the cleaver get when attacking that faction.
	price_tag = 200
	item_icons = list(
		slot_back_str = 'icons/obj/weapons-blades.dmi')
	item_state_slots = list(
		slot_back_str = "cleaver_back"
		)

/obj/item/tool/sword/huntingclaw
	name = "hunting claw"
	desc = "The second best friend a hunter could ask for, this one handed blade is lightweight and razor sharp thanks to its starworks-grade alloy construction.\
	 The hilt is made out of wood with gold looking trimmings. A Black Bear has been beautifully etched on the wood. All craftsmanship is of the highest quality."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "huntingclaw"
	item_state = "huntingclaw"
	matter = list(MATERIAL_STEEL = 5, MATERIAL_WOOD = 2)
	slot_flags = SLOT_BELT | SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_SAWING = 20) //Very sharp blade, serrated back
	force = WEAPON_FORCE_ROBUST
	armor_penetration = ARMOR_PEN_SHALLOW
	w_class = ITEM_SIZE_NORMAL
	price_tag = 500

/obj/item/tool/gauntlet
	name = "render gauntlet"
	desc = "A crudely made gauntlet consisting of straps, metal reinforcement and render skin - including it's deadly claws."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "gauntlet"
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_SAWING = 20) //Cuts people down just like trees.
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5)
	attack_verb = list("clawed", "scratched", "lacerated", "slashed")
	price_tag = 200

/obj/item/tool/power_fist
	name = "power fist"
	desc = "A battery powered hydraulic combat gauntlet designed for extended operations where close combat and muscles matter most."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "powerfist"
	item_state = "powerfist"
	toggleable = TRUE
	worksound = WORKSOUND_HAMMER
	switched_on_force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 7)
	attack_verb = list("punched", "decked", "haymakered", "uppercut")
	degradation = 0.7
	use_power_cost = 1
	suitable_cell = /obj/item/cell/medium
	switched_on_qualities = list(QUALITY_HAMMERING = 30)
	switched_off_qualities = list(QUALITY_HAMMERING = 10)
	hitsound = 'sound/weapons/smash.ogg'
	price_tag = 300

/obj/item/tool/power_fist/turn_on(mob/user)
	if (cell && cell.charge > 0)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		..()
	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src] has no power!"))

/obj/item/tool/power_fist/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	..()

//POLEARMS
/obj/item/tool/spear
	icon = 'icons/obj/weapons.dmi'
	icon_state = "spearglass0"
	wielded_icon = "spearglass1"
	name = "spear"
	desc = "A spiky bit of material tied onto a metal pole with some wire. It's an insult to spears across the galaxy - but it can still do some nasty damage and has some decent armor-piercing capabilities. Spears like these are often seen in the hands of vagrants, muggers, or desperate militias. Due to this weapon - if you could call it that - being so long, you're able to attack enemies from up to a tile away."
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_ROBUST // It's meant to be thrown
	armor_penetration = ARMOR_PEN_MODERATE // It's a SPEAR!
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	throw_speed = 3
	edge = TRUE
	sharp = TRUE
	tool_qualities = list(QUALITY_CUTTING = 10)
	origin_tech = list(TECH_COMBAT = 1)
	hitsound = 'sound/weapons/slice.ogg' // Sounds more like a stab than a cut.
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	embed_mult = 1.5
	price_tag = 50
	//attack_distance = 2
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "spearglass0_back"
		)

/obj/item/tool/spear/hunter_halberd
	name = "halberd"
	desc = "A hand-crafted halberd with a red cloth wrapped around the base of the blade itself; "
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hunter_halberd"
	item_state = "hunter_halberd"
	wielded_icon = "hunter_halberd_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_DEEP
	price_tag = 500
	matter = list(MATERIAL_STEEL = 22, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 4)
