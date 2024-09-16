/mob/living/carbon/superior_animal/robot/greyson/custodian
	name = "Greyson Positronic Custodial Drone"
	desc = "Old and weathered Greyson Positronic drone. It seems to be malfunctioning and hostile."
	icon = 'icons/mob/build_a_drone.dmi'
	icon_state = "drone_os"
	attacktext = "zapped"

	health = 40 * GREYSONWEAK_HEALTH_MOD
	maxHealth = 40 * GREYSONWEAK_HEALTH_MOD
	melee_damage_lower = 5
	melee_damage_upper = 13
	ranged_cooldown = 5

	cleaning = TRUE //we do clean prase us!

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 20,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young/robotic = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old/robotic = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish/robotic = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/deadeye = 3,
		/datum/stat_modifier/mob/living/carbon/superior_animal/triggerfinger/robotic = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 2,
		/datum/stat_modifier/mob/living/carbon/superior_animal/lambertian = 10,
	)

	light_range = 3
	light_color = COLOR_LIGHTING_BLUE_BRIGHT
	mob_classification = CLASSIFICATION_SYNTHETIC
	move_to_delay = 9
	leather_amount = 0
	bones_amount = 0
	var/shell_type = "os"
	var/marks_type = "os"
	var/screen_type = "os" //if someone decides to make the drones for something aside from OS and have different desgins
	var/tool = "laser"
	var/tooltype = "os"

/mob/living/carbon/superior_animal/robot/greyson/custodian/New()
	. = ..()
	marks_type = pick("green", "blue", "pink", "orange", "cyan", "red", "os")
	screen_type = pick("green", "os_red", "yellow", "cyan", "red", "os")
	update_icon()
	if(prob(5))
		drop2 = /obj/item/soap
	if(prob(10)) //Can override soap
		drop2 = /obj/item/reagent_containers/spray/cleaner
	if(prob(20)) //Can override soap or spacecleaner
		drop2 = /obj/item/reagent_containers/glass/bucket
	if(prob(10))
		cell_drop = /obj/item/cell/medium

/mob/living/carbon/superior_animal/robot/greyson/custodian/update_icon()
	. = ..()
	cut_overlays()
	var/image/shell_I = image(icon, src, "shell_[shell_type]")
	var/image/marks_I = image(icon, src, "marks_[marks_type]")
	var/image/screen_I = image(icon, src, "screen_[screen_type]")
	var/image/tool_I = image(icon, src, "tool_[tool]_[tooltype]")
	var/image/radio_I = image(icon, src, "radio_os")
	add_overlay(shell_I)
	add_overlay(marks_I)
	add_overlay(screen_I)
	add_overlay(tool_I)
	add_overlay(radio_I)

/mob/living/carbon/superior_animal/robot/greyson/custodian/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	if(drop1)
		new drop1 (src.loc)
		drop1 = null
	if(drop2)
		new drop2 (src.loc)
		drop2 = null
	if(cell_drop)
		new cell_drop (src.loc)
		cell_drop = null
	qdel(src)
	return

/mob/living/carbon/superior_animal/robot/greyson/custodian/chef
	name = "Greyson Positronic Service Drone"
	desc = "Old and weathered Greyson Positronic drone. This one looks like it used to cook. It seems to be malfunctioning and hostile."
	tool = "flamer"
	fire_verb = "lobs flame"
	screen_type = "os_red"
	projectiletype = /obj/item/projectile/flamer_lob
	comfy_range = 3 //We fire a projectile thats only 3 tiles far
	ranged = TRUE
	cleaning = FALSE
	range_telegraph = "lurks back, getting ready to splash flaming oil at"

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior_animal/durable = 20,
		/datum/stat_modifier/mob/living/carbon/superior_animal/young/robotic = 15,
		/datum/stat_modifier/health/mult/positive/low = 10,
		/datum/stat_modifier/health/mult/negative/low = 10,
		/datum/stat_modifier/health/mult/positive/medium = 5,
		/datum/stat_modifier/health/mult/negative/medium = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/old/robotic = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/brutish/robotic = 5,
		/datum/stat_modifier/mob/living/carbon/superior_animal/quickdraw = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/slowdraw = 10,
		/datum/stat_modifier/mob/living/carbon/superior_animal/lambertian = 10,
	)

/mob/living/carbon/superior_animal/robot/greyson/custodian/chef/New()
	. = ..()
	if(prob(5))
		drop2 = /obj/item/oddity/common/old_radio
	if(prob(10)) //Can override radio
		drop2 = /obj/random/rations
	if(prob(20)) //Can override radio or snack
		drop2 = /obj/random/booze
	if(prob(10))
		cell_drop = /obj/item/cell/medium

/* - This made them have natural armor against lasers that stacked, not that good also they get full fire proof as they are a robot
/mob/living/carbon/superior_animal/robot/greyson/custodian/chef/adjustFireLoss(var/amount)
	if(status_flags & GODMODE)
		return FALSE	//godmode
	fireloss = min(max(fireloss + amount/2, 0),(maxHealth*2)) //Slightly resistant to fire, because it would blow apart otherwise
*/

/mob/living/carbon/superior_animal/robot/greyson/custodian/engineer
	name = "Greyson Positronic Engineering Drone"
	desc = "Old and weathered Greyson Positronic drone. This one has a laser welder. It seems to be malfunctioning and hostile."
	tool = "laser"
	tooltype = "os_red"
	screen_type = "yellow"
	drop2 = /obj/random/tool/advanced/onestar/low_chance
	projectiletype = /obj/item/projectile/beam/drone
	ranged = TRUE
	melee_damage_lower = 7
	melee_damage_upper = 15
	cleaning = FALSE
	range_telegraph = "turns it's laser welder to"

/mob/living/carbon/superior_animal/robot/greyson/custodian/engineer/emp_act(severity)
	..()
	if(rapid)
		rapid = FALSE
	if(prob(95) && ranged)
		ranged = FALSE

/mob/living/carbon/superior_animal/robot/greyson/custodian/engineer/New()
	. = ..()
	if(prob(5))
		drop2 = /obj/random/tool_upgrade/rare
	if(prob(10)) //Can override tool mod
		drop2 = /obj/random/material_rare
	if(prob(20)) //Can override rool mod or materials
		drop2 = /obj/random/pack/tech_loot/onestar
	if(prob(10))
		cell_drop = /obj/item/cell/medium/high
