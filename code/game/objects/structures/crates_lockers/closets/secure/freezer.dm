/obj/structure/closet/secure_closet/freezer
	icon_state = "freezer"

/obj/structure/closet/secure_closet/freezer/kitchen
	name = "kitchen cabinet"
	icon_state = "frig"
	req_access = list(access_kitchen)

/obj/structure/closet/secure_closet/freezer/kitchen/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/food/condiment/flour(src)
	new /obj/item/reagent_containers/food/condiment/sugar(src)
	new /obj/item/reagent_containers/food/condiment/cookingoil(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/snacks/meat/monkey(src)

/obj/structure/closet/secure_closet/freezer/kitchen/mining
	icon_state = "frig"
	req_access = null

/obj/structure/closet/secure_closet/freezer/meat
	name = "meat fridge"
	icon_state = "frig"

/obj/structure/closet/secure_closet/freezer/meat/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/snacks/meat/monkey(src)

/obj/structure/closet/secure_closet/freezer/blood
	name = "blood fridge"
	icon_state = "freezer"

/obj/structure/closet/secure_closet/freezer/blood/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/blood/OMinus(src)

/obj/structure/closet/secure_closet/freezer/fridge
	name = "refrigerator"
	icon_state = "frig"

/obj/structure/closet/secure_closet/freezer/fridge/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/food/drinks/milk(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/soymilk(src)
	for(var/i in 1 to 2)
		new /obj/item/storage/fancy/egg_box(src)
		new /obj/item/reagent_containers/food/condiment/cookingoil(src)

/obj/structure/closet/secure_closet/freezer/money
	name = "freezer"
	icon_state = "freezer"
	req_access = list(access_heads_vault)

/obj/structure/closet/secure_closet/freezer/money/populate_contents()
	for(var/i in 1 to 3)
		new /obj/item/spacecash/bundle/c1000(src)
	for(var/i in 1 to 3)
		new /obj/item/spacecash/bundle/c500(src)
	for(var/i in 1 to 6)
		new /obj/item/spacecash/bundle/c200(src)

/obj/structure/closet/secure_closet/freezer/mini
	name = "mini freezer"
	desc = "A smaller than normal freezer."
	icon_state = "advanced_freezer"

/obj/structure/closet/secure_closet/freezer/mini/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/food/drinks/cans/monster(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/monster_no_sugar(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/monster_orange(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/monster_sol(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/monster_blood(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/monster_jungel(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/monster_church(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/monster_red(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/monster_blue(src)

/obj/structure/closet/secure_closet/freezer/icebox
	name = "mini icebox"
	desc = "A smaller than normal icebox, normally used for storing ice and other frozen items, this one made specifically for drinks."
	icon_state = "simpledf"

/obj/structure/closet/secure_closet/freezer/icebox/populate_contents()
	for(var/i in 1 to 6)
		new /obj/item/reagent_containers/food/drinks/cans/baton_rent_a_cop(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/baton_detective(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/baton_commando(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/baton_cola(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/baton_apple(src)
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/food/drinks/cans/baton(src)
