/obj/item/material/butterfly
	name = "butterfly knife"
	desc = "A basic metal blade concealed in a lightweight plasteel grip. Small enough when folded to fit in a pocket."
	icon_state = "butterflyknife"
	item_state = null
	hitsound = null
	clickdelay_offset = FAST_WEAPON_COOLDOWN
	var/active = 0
	var/backstab_damage = 10
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("patted", "tapped")
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 when thrown with weight 20 (steel)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE

/obj/item/material/butterfly/resolve_attackby(atom/target, mob/user)
	. = ..()
	if(!(iscarbon(target) || isanimal(target)))
		return
	if(!active)
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
	user.attack_log += text("\[[time_stamp()]\] <font color='red'>Backstabbed [M.name] ([M.ckey]): Alt Mode [has_alt_mode] (1 means active, 0 means inactive)</font>")
	//Uses regular call to deal damage
	//Isn't affected by mob armor*
	if(alt_mode_active)
		var/LTL_backstab = backstab_damage * 0.5
		M.apply_damages(0,0,0,0,0,LTL_backstab,user.targeted_organ)
	else
		M.apply_damages(backstab_damage,0,0,0,0,0,user.targeted_organ)

/obj/item/material/butterfly/update_force()
	if(active)
		edge = 1
		sharp = 1
		..() //Updates force.
		throwforce = max(3,force-3)
		hitsound = 'sound/weapons/bladeslice.ogg'
		icon_state += "_open"
		w_class = ITEM_SIZE_NORMAL
		tool_qualities = list(QUALITY_CUTTING = 20, QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
		attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	else
		force = WEAPON_FORCE_WEAK
		edge = 0
		sharp = 0
		hitsound = initial(hitsound)
		icon_state = initial(icon_state)
		w_class = initial(w_class)
		tool_qualities = list()
		attack_verb = list("patted", "tapped")

/obj/item/material/butterfly/switchblade
	name = "switchblade"
	desc = "A classic switchblade with gold engraving. Just holding it makes you feel like a gangster."
	icon_state = "switchblade"
	unbreakable = 1

/obj/item/material/butterfly/attack_self(mob/user)
	active = !active
	if(active)
		to_chat(user, SPAN_NOTICE("You flip out \the [src]."))
		playsound(user, 'sound/weapons/flipblade.ogg', 15, 1)
	else
		to_chat(user, SPAN_NOTICE("\The [src] can now be concealed."))
	update_force()
	add_fingerprint(user)


/obj/item/material/butterfly/frenchman //rare contraband spawn
	name = "\"Frenchman\" butterfly blade"
	desc = "A french flag has been embossed on the handle, the deftness of this blade and how supremely lethal its diamond edged blade is would make this perfect for sinking said blade \
			into a monsters back... or another colonist."
	icon_state = "frenchmen"
	matter = list(MATERIAL_SILVER = 2, MATERIAL_PLASTEEL = 10, MATERIAL_DIAMOND = 3)
	backstab_damage = 25
