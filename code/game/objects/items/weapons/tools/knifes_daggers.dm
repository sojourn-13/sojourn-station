
//Knifes

/obj/item/tool/knife
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
	throwforce = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_SHALLOW
	clickdelay_offset = FAST_WEAPON_COOLDOWN //small, but quicker to use.
	max_upgrades = 2
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/sharphit.ogg'
	slot_flags = SLOT_BELT
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	var/backstab_damage = 10

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to avoid using the blade of their weapon"
	alt_mode_lossrate = 0.7

/obj/item/tool/knife/resolve_attackby(atom/target, mob/user)
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
	visible_message("<span class='danger'>[user] backstabs [target] with [src]!</span>")
	M.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been backstabbed by [user.name] ([user.ckey])</font>")
	user.attack_log += text("\[[time_stamp()]\] <font color='red'>Backstabbed [M.name] ([M.ckey]): Alt Mode [has_alt_mode] (1 means active, 0 means inactive)</font>")
	//Uses regular call to deal damage
	//Isn't affected by mob armor*

	if(alt_mode_active)
		var/LTL_backstab = backstab_damage * 0.5
		M.apply_damages(0,0,0,0,0,LTL_backstab,user.targeted_organ)
	else
		M.apply_damages(backstab_damage,0,0,0,0,0,user.targeted_organ)

/obj/item/tool/knife/boot
	name = "boot knife"
	desc = "A small fixed-blade knife for putting inside a boot."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacknife"
	item_state = "knife"
	matter = list(MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 1)
	force = WEAPON_FORCE_PAINFUL
	backstab_damage = 14
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 15)

/obj/item/tool/knife/boot/blackshield
	name = "blackshield tactical knife"
	desc = "A small fixed-blade knife for putting inside a boot, this version is painted in Blackshield colours and has sawed teeth."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacknife_blackguard"
	item_state = "knife"
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2)
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5,  QUALITY_SAWING = 1)
	force = WEAPON_FORCE_DANGEROUS // Serrated teeth
	armor_divisor = ARMOR_PEN_MODERATE
	throwforce = WEAPON_FORCE_LETHAL
	price_tag = 35

/obj/item/tool/knife/hook
	name = "meat hook"
	desc = "A sharp plasteel butcher's hook used to hold dressed game in place to butcher. It has quite the sharpened tip to embed more easily in flesh."
	icon_state = "hook_knife"
	item_state = "hook_knife"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_DANGEROUS
	backstab_damage = 8
	armor_divisor = ARMOR_PEN_EXTREME //Should be countered be embedding
	embed_mult = 1.5 //This is designed for embedding

/obj/item/tool/knife/ritual
	name = "ritual knife"
	desc = "The unearthly energies that once powered this blade are now dormant."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	force = WEAPON_FORCE_PAINFUL
	armor_divisor = ARMOR_PEN_MODERATE
	max_upgrades = 3
	backstab_damage = 14
	price_tag = 7

/obj/item/tool/knife/ritual/sickle
	name = "bloodletter"
	desc = "A ritual knife, its latent unearthly energies partly awoken by forces unknown. \
			The curved blade cuts deep into flesh, drawing blood for rituals with ease."
	icon_state = "render_awakened"
	hitsound = 'sound/weapons/renderslash.ogg'
	force = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_DEEP
	max_upgrades = 2
	hitsound = 'sound/weapons/renderslash.ogg'
	backstab_damage = 8 // Not so much for stabbing as it is for cutting.
	tool_qualities = list(QUALITY_CUTTING = 20, QUALITY_WIRE_CUTTING = 10)
	attack_verb = list("slashed", "sliced", "ripped", "diced", "cut")
	embed_mult = 1.5 // Careful not to lose it!

/obj/item/tool/knife/butch
	name = "butcher's cleaver"
	icon_state = "butch"
	desc = "A huge thing used for chopping up vegetables and meat. This includes roaches and roach-byproducts."
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS+2
	backstab_damage = 8
	armor_divisor = ARMOR_PEN_MODERATE
	attack_verb = list("cleaved", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 1)
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 15)
	price_tag = 14

/obj/item/tool/knife/neotritual
	name = "absolutism ritual knife"
	desc = "The sweet embrace of mercy, for relieving the soul from a tortured vessel."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "neot-knife"
	item_state = "knife"
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 1)
	force = WEAPON_FORCE_PAINFUL
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
	max_upgrades = 3
	embed_mult = 6
	price_tag = 24

/obj/item/tool/knife/neotritual/equipped(mob/living/H)
	. = ..()
	if(is_held() && is_neotheology_disciple(H))
		embed_mult = 0.05
	else
		embed_mult = initial(embed_mult)

/obj/item/tool/knife/tacknife
	name = "tactical knife"
	desc = "You'd be killing loads of people if this was Medal of Valor: Heroes of Space."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacknife_guard"
	item_state = "knife"
	backstab_damage = 14
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_DANGEROUS // Serrated combat knife
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5,  QUALITY_SAWING = 5)
	armor_divisor = ARMOR_PEN_MODERATE
	throwforce = WEAPON_FORCE_LETHAL
	max_upgrades = 3
	embed_mult = 0.6
	price_tag = 38

/obj/item/tool/knife/tacknife/robo //used by sec bot
	embed_mult = 0

/obj/item/tool/knife/dagger
	name = "dagger"
	desc = "A sharp implement; difference between this and a knife: it's sharp on both sides. Good for finding holes in armor and exploiting them."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "dagger"
	item_state = "dagger"
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2)
	force = 13
	backstab_damage = 15
	armor_divisor = ARMOR_PEN_HALF
	throwforce = WEAPON_FORCE_ROBUST
	price_tag = 21

/obj/item/tool/knife/dagger/skinning
	name = "skinning knife"
	desc = "A sharp tool that is the pride and joy of the local Hunting Lodge. While not well suited as a weapon, its blade is as finely edged as any laser scalpel. Considered sacred by \
	the hunters that normally carry them."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "skinning"
	item_state = "skinning"
	armor_divisor = ARMOR_PEN_DEEP
	tool_qualities = list(QUALITY_CUTTING = 50)
	matter = list(MATERIAL_PLASTEEL = 8, MATERIAL_WOOD = 2, MATERIAL_DIAMOND = 3) // 5 plasteel + 2 wood, then +3 plasteel +3 diamond from whetstone.
	price_tag = 500 // Takes diamond to make and very rare.

/obj/item/tool/knife/dagger/ceremonial
	name = "ceremonial dagger"
	desc = "Given to high ranking officers as a signature of office, while it isn't meant to be a weapon it certainly does the job."
	icon_state = "fancydagger"
	item_state = "fancydagger"
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_GOLD = 1, MATERIAL_SILVER = 1)
	embed_mult = 0.6
	max_upgrades = 4
	price_tag = 300 // Fancy expensive paper weight.

/obj/item/tool/knife/dagger/heirloom_knife
	name = "heirloom dagger"
	desc = "This dagger was given to generations of family members that once hunted as a faint memory of trust and hope, while it isn't meant to be a weapon it certainly does the job of cutting things. Extremely handy not exactly valuable yet precious."
	icon_state = "general_skinningknife"
	item_state = "fancydagger"
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 1)
	embed_mult = 0.7
	max_upgrades = 0
	price_tag = 50 // Fancy expensive heirloom.... it is not exactly meant to be upgradable nor sold but the value that it holds is somehow more symbolic than material.
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_ROBUST
	armor_divisor = ARMOR_PEN_GRAZING
	tool_qualities = list(QUALITY_CUTTING = 35) //Can't be upgraded. Round start knife. Damage is bad not really good to selling either. Only fair give a good status to cutting things.
	backstab_damage = 9

/obj/item/tool/knife/dagger/bluespace
	name = "\improper Soteria \"Displacement Dagger\""
	desc = "A teleportation matrix attached to a dagger, for sending things you stab it into very far away."
	icon_state = "bluespace_dagger"
	item_state = "bluespace_dagger"
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 10, MATERIAL_GOLD = 5, MATERIAL_PLASMA = 20)
	price_tag = 1200 // It teleports.
	force = WEAPON_FORCE_NORMAL+1
	embed_mult = 50 //You WANT it to embed
	suitable_cell = /obj/item/cell/small
	toggleable = TRUE
	use_power_cost = 0.4
	passive_power_cost = 0.4
	backstab_damage = 10
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_BLUESPACE = 4)
	var/mob/living/embedded
	var/last_teleport
	var/entropy_value = 3

/obj/item/tool/knife/dagger/bluespace/New()
	..()
	item_flags |= BLUESPACE

/obj/item/tool/knife/dagger/bluespace/on_embed(mob/user)
	embedded = user

/obj/item/tool/knife/dagger/bluespace/on_embed_removal(mob/user)
	embedded = null

/obj/item/tool/knife/dagger/bluespace/Process()
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

/obj/item/tool/knife/dagger/assassin
	name = "dagger"
	desc = "A sharp implement, with a twist; The handle acts as a reservoir for reagents, and the blade injects those that it pierces."
	icon_state = "ass_dagger"
	item_state = "ass_dagger"
	reagent_flags = INJECTABLE|TRANSPARENT
	price_tag = 10

/obj/item/tool/knife/dagger/assassin/New()
	..()
	create_reagents(80)

/obj/item/tool/knife/dagger/assassin/resolve_attackby(atom/target, mob/user)
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
