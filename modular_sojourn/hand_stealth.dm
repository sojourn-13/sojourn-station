/obj/item/mini_hand_cloak_field
	name = "cloaking field projector"
	desc = "It looks pretty sciency. When used will make a small field around the user to make them seem invisable. Can only be removed by deploying on self again."
	icon = 'icons/obj/rig_modules.dmi'
	icon_state = "cloak_mini"

/obj/item/mini_hand_cloak_field/attack_self(mob/user as mob)
	if(user.alpha != 32 || invisibility != INVISIBILITY_LEVEL_TWO)
		user.invisibility = INVISIBILITY_LEVEL_TWO
		user.alpha = 32
	else
		user.invisibility = 0
		user.alpha = 255



