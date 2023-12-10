
/obj/item/bluespace_leak
	name = "Leaking bluespace"
	desc = "It looks like some kind of waterfall made out of space, seemingly endlessly flowing in place. Best not to get close to it."
	icon = 'modular_sojourn/spaceleak.dmi'
	icon_state = "coder_sprite"
	anchored = TRUE
	layer = FLY_LAYER
	var/list/clean_items = list(
		/obj/item/holyvacuum,
		/obj/item/soap/church,
		/obj/item/soap/bluespase,
		/obj/item/bluespace_harpoon
	)

/obj/item/bluespace_leak/Crossed(mob/M)
	for(M in living_mobs_in_view(1, src))
		clone_attack(M, rand(4, 8))
	.=..()

/obj/item/bluespace_leak/attack_hand(mob/user as mob)
	Crossed(user)

/obj/item/bluespace_leak/attackby(obj/item/I, mob/user)
	if(user.Adjacent(src))
		if(!(I.flags & NOBLUDGEON))
			user.do_attack_animation(src)
			if(I.type in clean_items)
				user.visible_message(SPAN_NOTICE("[user] cleans the blue mess!"), SPAN_NOTICE("What ever this is, cleaning it up must be a good thing!"))
				qdel(src)
				return
			if(I.hitsound)
				var/calc_damage = I.force * I.structure_damage_factor
				var/volume = calc_damage * 3.5
				playsound(src, I.hitsound, volume, 1, -1)
			user.drop_item()
			clone_attack(user, rand(8, 10)) //Lethal
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 1.75)
			user.visible_message(SPAN_NOTICE("[user] hits [src] with [I] and it disappears!"), SPAN_NOTICE("You hit [src] with [I] and it disappears!"))

//clock attack proc, it's used for attacking people with checking their armor
/proc/clone_attack(mob/living/victim, damage = rand(2, 4))
	if(istype(victim))
		var/hazard_protection = 100 - victim.getarmor(null, ARMOR_BIO) //Uses bio as thats what the stranger wares and is safe
		victim.apply_damage(max(0, damage * hazard_protection / 100 * victim.reagent_permeability()), CLONE)
		if(ishuman(victim))
			var/mob/living/carbon/human/H = victim
			H.sanity.breakdown()
