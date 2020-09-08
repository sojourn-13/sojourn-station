/obj/item/weapon/gun/energy/decloner
	name = "Prototype: biological demolecularisor"
	desc = "A gun that discharges high amounts of controlled radiation to slowly break a target into component elements. Despite the fancy technology used to produce this weapon, overselling by the Lonestar has made it so common it is now worth less than the metal required to make it."
	icon = 'icons/obj/guns/energy/decloner.dmi'
	icon_state = "decloner"
	item_state = "decloner"
	fire_sound = 'sound/weapons/pulse3.ogg'
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4, TECH_POWER = 3)
	can_dual = 1
	projectile_type = /obj/item/projectile/energy/declone
	charge_cost = 100
	matter = list(MATERIAL_STEEL = 20)
	price_tag = 50