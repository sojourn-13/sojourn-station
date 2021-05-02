//Those are all weapons that don't had tool modding at some point, but should have it for balance purposes.

/obj/item/weapon/tool/broken_bottle
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

/obj/item/weapon/tool/nailstick
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

/obj/item/weapon/tool/hatchet
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

/obj/item/weapon/tool/fireaxe
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

/obj/item/weapon/tool/fireaxe/afterattack(atom/A as mob|obj|turf|area, mob/user as mob, proximity)
	if(!proximity) return
	..()
	if(A && wielded)
		if(istype(A,/obj/effect/plant))
			var/obj/effect/plant/P = A
			P.die_off()

/obj/item/weapon/tool/fireaxe/woodsman
	name = "woodsman axe"
	desc = "Chop the wood to fuel the fire."
	icon_state = "woodsmanaxe0"
	wielded_icon = "woodsmanaxe1"
	force = WEAPON_FORCE_ROBUST
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 40, QUALITY_SAWING = 30)
	w_class = ITEM_SIZE_BULKY

/obj/item/weapon/tool/fireaxe/militia_tomahawk
	name = "blackshield tactical tomahawk"
	desc = "For cutting, sawing, prying, and throwing at targets mid back-flip."
	icon_state = "sec_tomahawk"
	wielded_icon = "sec_tomahawk"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_BRUTAL
	slot_flags = SLOT_BELT|SLOT_BACK
	tool_qualities = list(QUALITY_CUTTING = 30, QUALITY_SAWING = 25, QUALITY_PRYING = 15)
	w_class = ITEM_SIZE_NORMAL

/obj/item/weapon/tool/minihoe
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

//Knifes

/obj/item/weapon/tool/knife
	name = "kitchen knife"
	desc = "A general purpose Chef's Knife made by the Lonestar Shipping Solutions, LLC. Guaranteed to stay sharp for years to come."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "knife"
	flags = CONDUCT
	sharp = TRUE
	edge = TRUE
	worksound = WORKSOUND_HARD_SLASH
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_WEAK
	armor_penetration = ARMOR_PEN_SHALLOW
	max_upgrades = 2
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	slot_flags = SLOT_BELT
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	var/backstab_damage = 10

/obj/item/weapon/tool/knife/resolve_attackby(atom/target, mob/user)
	. = ..()
	if(!(iscarbon(target) || isanimal(target)))
		return
	if(get_turf(target) != get_step(user, user.dir))
		return
	if(target.stat == DEAD)
		return
	if(user.dir != target.dir)
		return
	var/mob/living/carbon/M = target
	M.apply_damages(backstab_damage,0,0,0,0,0,user.targeted_organ)
	visible_message("<span class='danger'>[user] backstabs [target] with [src]!</span>")
	M.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been backstabbed by [user.name] ([user.ckey])</font>")
	user.attack_log += text("\[[time_stamp()]\] <font color='red'>Backstabbed [M.name] ([M.ckey])</font>")
	//Uses regular call to deal damage
	//Is affected by mob armor*

/obj/item/weapon/tool/knife/boot
	name = "boot knife"
	desc = "A small fixed-blade knife for putting inside a boot."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacknife"
	item_state = "knife"
	matter = list(MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 1)
	force = WEAPON_FORCE_PAINFUL
	backstab_damage = 14
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 15)

/obj/item/weapon/tool/knife/hook
	name = "meat hook"
	desc = "A sharp, metal hook what sticks into things."
	icon_state = "hook_knife"
	item_state = "hook_knife"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_DANGEROUS
	backstab_damage = 8
	armor_penetration = ARMOR_PEN_EXTREME //Should be countered be embedding
	embed_mult = 1.5 //This is designed for embedding

/obj/item/weapon/tool/knife/ritual
	name = "ritual knife"
	desc = "The unearthly energies that once powered this blade are now dormant."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	force = WEAPON_FORCE_PAINFUL
	backstab_damage = 14

/obj/item/weapon/tool/knife/butch
	name = "butcher's cleaver"
	icon_state = "butch"
	desc = "A huge thing used for chopping and chopping up meat. This includes roaches and roach-by-products."
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_NORMAL
	backstab_damage = 8
	armor_penetration = ARMOR_PEN_MODERATE
	attack_verb = list("cleaved", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 1)
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 15)

/obj/item/weapon/tool/knife/neotritual
	name = "absolutism ritual knife"
	desc = "The sweet embrace of mercy, for relieving the soul from a tortured vessel."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "neot-knife"
	item_state = "knife"
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 1)
	force = WEAPON_FORCE_PAINFUL
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
	max_upgrades = 3
	embed_mult = 3

/obj/item/weapon/tool/knife/neotritual/equipped(mob/living/H)
	. = ..()
	if(is_held() && is_neotheology_disciple(H))
		embed_mult = 0.1
	else
		embed_mult = initial(embed_mult)

/obj/item/weapon/tool/knife/tacknife
	name = "tactical knife"
	desc = "You'd be killing loads of people if this was Medal of Valor: Heroes of Space."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacknife_guard"
	item_state = "knife"
	backstab_damage = 14
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_PAINFUL
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5,  QUALITY_SAWING = 5)
	armor_penetration = ARMOR_PEN_MODERATE
	max_upgrades = 3
	embed_mult = 0.3

/obj/item/weapon/tool/knife/dagger
	name = "dagger"
	desc = "A sharp implement; difference between this and a knife: it's sharp on both sides. Good for finding holes in armor and exploiting them."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "dagger"
	item_state = "dagger"
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2)
	force = 13
	backstab_damage = 15
	armor_penetration = ARMOR_PEN_HALF

/obj/item/weapon/tool/knife/dagger/skinning
	name = "skinning knife"
	desc = "A sharp tool that is the pride and joy of the local hunting lodge. While not well suited as a weapon, its blade is as finely edged as any laser scalpel. Considered sacred by \
	the hunters that normally carry them."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "skinning"
	item_state = "skinning"
	armor_penetration = ARMOR_PEN_DEEP
	throwforce = WEAPON_FORCE_WEAK
	tool_qualities = list(QUALITY_CUTTING = 50)

/obj/item/weapon/tool/knife/dagger/ceremonial
	name = "ceremonial dagger"
	desc = "Given to high ranking officers as a signature of office, while it isn't meant to be a weapon it certainly does the job."
	icon_state = "fancydagger"
	item_state = "fancydagger"
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1)
	embed_mult = 0.3
	max_upgrades = 4

/obj/item/weapon/tool/knife/dagger/bluespace
	name = "/improper Soteria \"Displacement Dagger\""
	desc = "A teleportation matrix attached to a dagger, for sending things you stab it into very far away."
	icon_state = "bluespace_dagger"
	item_state = "bluespace_dagger"
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 10, MATERIAL_GOLD = 5, MATERIAL_PLASMA = 20)
	force = WEAPON_FORCE_NORMAL+1
	embed_mult = 25 //You WANT it to embed
	suitable_cell = /obj/item/weapon/cell/small
	toggleable = TRUE
	use_power_cost = 0.4
	passive_power_cost = 0.4
	backstab_damage = 10
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_BLUESPACE = 4)
	var/mob/living/embedded
	var/last_teleport
	var/entropy_value = 3

/obj/item/weapon/tool/knife/dagger/bluespace/New()
	..()
	item_flags |= BLUESPACE

/obj/item/weapon/tool/knife/dagger/bluespace/on_embed(mob/user)
	embedded = user

/obj/item/weapon/tool/knife/dagger/bluespace/on_embed_removal(mob/user)
	embedded = null

/obj/item/weapon/tool/knife/dagger/bluespace/Process()
	..()
	if(switched_on && embedded && cell)
		if(last_teleport + max(3 SECONDS, embedded.mob_size*(cell.charge/cell.maxcharge)) < world.time)
			var/area/A = random_ship_area()
			var/turf/T = A.random_space()
			if(T && cell.checked_use(use_power_cost*embedded.mob_size))
				last_teleport = world.time
				playsound(T, "sparks", 50, 1)
				anim(T,embedded,'icons/mob/mob.dmi',,"phaseout",,embedded.dir)
				go_to_bluespace(get_turf(embedded), entropy_value, TRUE, embedded, T)
				playsound(T, 'sound/effects/phasein.ogg', 25, 1)
				playsound(T, 'sound/effects/sparks2.ogg', 50, 1)
				anim(T,embedded,'icons/mob/mob.dmi',,"phasein",,embedded.dir)

/obj/item/weapon/tool/knife/dagger/assassin
	name = "dagger"
	desc = "A sharp implement, with a twist; The handle acts as a reservoir for reagents, and the blade injects those that it pierces."
	icon_state = "ass_dagger"
	item_state = "ass_dagger"
	reagent_flags = INJECTABLE|TRANSPARENT

/obj/item/weapon/tool/knife/dagger/assassin/New()
	..()
	create_reagents(80)

/obj/item/weapon/tool/knife/dagger/assassin/resolve_attackby(atom/target, mob/user)
	.=..()
	if(!target.reagents || !isliving(target))
		return

	if(!reagents.total_volume)
		return

	if(!target.reagents.get_free_space())
		return
	var/modifier = 1
	var/reagent_modifier = 1
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		modifier += min(30,H.stats.getStat(STAT_ROB))
		reagent_modifier = CLAMP(round(H.stats.getStat(STAT_BIO)/10), 1, 5)
	var/mob/living/L = target
	if(prob(min(100,(100-L.getarmor(user.targeted_organ, ARMOR_MELEE))+modifier)))
		var/trans = reagents.trans_to_mob(target, rand(1,3)*reagent_modifier, CHEM_BLOOD)
		admin_inject_log(user, target, src, reagents.log_list(), trans)
		to_chat(user, SPAN_NOTICE("You inject [trans] units of the solution. [src] now contains [src.reagents.total_volume] units."))

/obj/item/weapon/tool/scythe
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

//Flails
/obj/item/weapon/tool/chainofcommand
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

/obj/item/weapon/tool/disciplinary_action
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

/obj/item/weapon/tool/sword
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

/obj/item/weapon/tool/sword/katana
	name = "katana"
	desc = "Modern Japanese-style blade that has no curve to it. This one looks pretty sharp."
	icon_state = "katana"
	item_state = "katana"
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 5, MATERIAL_DIAMOND = 1) //sharpened using diamond dust or whatever
	slot_flags = SLOT_BELT | SLOT_BACK
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/weapon/tool/sword/katana_makeshift
	name = "makeshift katana"
	desc = "Modern Japanese-style blade that has no curve to it. This one is two knives welded together, proving where there's a will and a weeb there's a way."
	icon_state = "katana_improv"
	item_state = "katana_improv"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTIC = 2) //twice the value of a kitche knife
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/weapon/tool/sword/katana/nano
	name = "\improper Soteria \"Muramasa\" katana"
	desc = "After an extensive binge of ancient animated recordings, a scientist decided to upgrade a recovered katana."
	icon_state = "eutactic_katana"
	item_state = "eutactic_katana"
	toggleable = TRUE

	suitable_cell = /obj/item/weapon/cell/small

	use_power_cost = 0.4
	passive_power_cost = 0.4

	switched_on_qualities = list(QUALITY_CUTTING = 25, QUALITY_SAWING = 15)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 6)
	switched_on_force = WEAPON_FORCE_LETHAL

/obj/item/weapon/tool/sword/katana/nano/turn_on(mob/user)
	.=..()
	if(.)
		embed_mult = 0
		playsound(user, 'sound/weapons/saberon.ogg', 50, 1)

/obj/item/weapon/tool/sword/katana/nano/turn_off(mob/user)
	..()
	embed_mult = initial(embed_mult)
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)

/obj/item/weapon/tool/sword/katana/nano/update_icon()
	..()
	if(cell)
		overlays += "[icon_state]_cell"
	if(switched_on)
		overlays += "[icon_state]_power_on"
	else
		overlays += "[icon_state]_power_off"

/obj/item/weapon/tool/sword/katana/firebrand //Firebrand. Sprited and Implemented by Sieghardt
	name = "Artificer Firebrand"
	desc = "Originally the fever dream of an brave guild master looking for a better way to deal with roaches, the Firebrand ended up as a hellish implement of war. While turned off, this is a blunted hunk of metal. When turned on the Firebrand becomes a bringer of fiery doom to anyone unlucky enough to be its path."
	icon_state = "firebrand"
	item_state = "firebrand"
	toggleable = TRUE

	max_fuel = 100
	use_fuel_cost = 0.5
	passive_fuel_cost = 0.1

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
/obj/item/weapon/tool/sword/katana/firebrand/is_hot()
	if(switched_on)
		return heat

/obj/item/weapon/tool/sword/katana/firebrand/turn_on(mob/user)
	.=..()
	if(.)
		embed_mult = 0
		damtype = BURN
		set_light(2)
		playsound(loc, 'sound/items/welderactivate.ogg', 50, 1)
		//Too hot to get stuck into crud.

/obj/item/weapon/tool/sword/katana/firebrand/apply_hit_effect(atom/target, blocked=FALSE)
	.=..()
	if(iscarbon(target) && switched_on)
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()
		//Sets the target on fire, however only 1 stack at a time rather than 4 like most incendiary ammo.

/obj/item/weapon/tool/sword/katana/firebrand/turn_off(mob/user)
	..()
	embed_mult = initial(embed_mult)
	damtype = initial(damtype)
	set_light(0)
	playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)

/obj/item/weapon/tool/sword/katana/firebrand/update_icon()
	..()
	if(switched_on)
		icon_state = "firebrand_on"
		item_state = "firebrand_on"
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)

/obj/item/weapon/tool/sword/saber
	name = "premier's saber"
	desc = "A finely made formal blade fit for the premier. Despite being primarily for show it cuts deep and painfully."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "saber"
	item_state = "saber"
	armor_penetration = ARMOR_PEN_SHALLOW

/obj/item/weapon/tool/sword/saber/cutlass
	name = "cutlass"
	desc = "A finely made sword for pirates or military men who take themselves too seriously."
	icon_state = "cutlass"
	item_state = "cutlass"

/obj/item/weapon/tool/sword/machete
	name = "machete"
	desc = "An explorer's best friend and trust back up plan. Or primary plan for those who like to get in there personally."
	icon = 'icons/obj/weapons-blades.dmi'
	icon_state = "machete"
	item_state = "machete"
	tool_qualities = list(QUALITY_CUTTING = 10,  QUALITY_SAWING = 20) //So we can cut down trees
	force = WEAPON_FORCE_ROBUST
	w_class = ITEM_SIZE_NORMAL

/obj/item/weapon/tool/gauntlet
	name = "render gauntlet"
	desc = "A crudely made gauntlet consisting of straps, metal reinforcement and render skin - including it's deadly claws."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "gauntlet"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_MODERATE
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5)
	attack_verb = list("clawed", "scratched", "lacerated", "slashed")

//POLEARMS
/obj/item/weapon/tool/spear
	icon = 'icons/obj/weapons.dmi'
	icon_state = "spearglass0"
	wielded_icon = "spearglass1"
	name = "spear"
	desc = "A spiky bit of material tied onto a metal pole with some wire. It's an insult to spears across the galaxy - but it can still do some nasty damage and has some decent armor-piercing capabilities. Spears like these are often seen in the hands of vagrants, muggers, or desperate militias. Due to this weapon - if you could call it that - being so long, you're able to attack enemies from up to a tile away."
	force = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_MODERATE // It's a SPEAR!
	structure_damage_factor = STRUCTURE_DAMAGE_WEAK
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	throw_speed = 3
	edge = TRUE
	sharp = TRUE
	tool_qualities = list(QUALITY_CUTTING = 10)
	origin_tech = list(TECH_COMBAT = 1)
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	embed_mult = 1.5
	//attack_distance = 2

/obj/item/weapon/tool/spear/hunter_halberd
	name = "Halberd"
	desc = "A hand-crafted halberd with a red cloth wrapped around the base of the blade itself; "
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hunter_halberd"
	item_state = "hunter_halberd"
	wielded_icon = "hunter_halberd_wielded"
	force = WEAPON_FORCE_BRUTAL
	armor_penetration = ARMOR_PEN_DEEP
	price_tag = 500
	matter = list(MATERIAL_STEEL = 22, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 4)
