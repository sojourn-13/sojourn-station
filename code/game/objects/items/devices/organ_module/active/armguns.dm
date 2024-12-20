/obj/item/organ_module/active/simple/armsmg
	name = "embedded SMG"
	desc = "An SMG designed to be inserted into an arm. Gives you a nice advantage in a firefight."
	verb_name = "Deploy embedded SMG"
	icon_state = "armsmg"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 5, MATERIAL_STEEL = 5)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/gun/projectile/automatic/armsmg
	price_tag = 780 //Quite costly

/obj/item/organ_module/active/simple/armsmg/blackshield
	holding_type = /obj/item/gun/energy/smg/blackshield

/obj/item/organ_module/active/simple/implant_bolt_lance
	name = "'Shooting Star' implanted bolt lance"
	desc = "A bolt lance modified to fit inside a prosthetic, this one is painted purple and appears to have an inscription that reads 'Shooting Star'. An effort by a prominent hunt master to be even more edgy."
	verb_name = "Deploy embedded bolt lance"
	icon = 'icons/obj/guns/projectile/shooting_star.dmi'
	icon_state = "shooting_star"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 5, MATERIAL_STEEL = 5)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/gun/projectile/shotgun/pump/hunter_crossbow_implanted
	price_tag = 800

/obj/item/organ_module/active/simple/lasercannon_lasercannon
	name = "embedded \"Solaris\" laser cannon'"
	desc = "A laser cannon designed to be inserted into an arm. Typically installed into combat-type synthics."
	verb_name = "Deploy laser cannon SMG"
	icon_state = "si_lasercannon"
	holding_type = /obj/item/gun/energy/lasercannon/rnd/pre_loaded