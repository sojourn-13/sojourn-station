/// Basically a marker perk. If the user has this perk, another will be given in certain conditions.
/datum/perk/inspiration
	name = "Exotic Inspiration"
	desc = "The best ideas come from a mind not entirely sober, any alcohol will give you that much needed boost... somehow."
	//icon_state = "inspiration" // https://game-icons.net/1x1/delapouite/booze.html

/datum/perk/active_inspiration
	name = "Exotic Inspiration (Active)"
	desc = "The alcohol you imbibed is granting you that much needed boost in inspiration for your next project...somehow."
	gain_text = "You feel a sudden rush of alcohol-induced inspiration..."
	lose_text = "Your sudden flash of brilliance fades away..."
	//icon_state = "inspiration_active" // https://game-icons.net/1x1/lorc/enlightenment.html

/datum/perk/active_inspiration/assign(mob/living/carbon/human/H)
	..()
	holder.stats.addTempStat(STAT_COG, 5, INFINITY, "Exotic Inspiration")
	holder.stats.addTempStat(STAT_MEC, 10, INFINITY, "Exotic Inspiration")

/datum/perk/active_inspiration/remove()
	holder.stats.removeTempStat(STAT_COG, "Exotic Inspiration")
	holder.stats.removeTempStat(STAT_MEC, "Exotic Inspiration")
	..()

/datum/perk/job/artist
	name = "Artist"
	desc = "You have a lot of expertise in making works of art. You gain more insight from all sources but can only increase \
			your stats by creating works of art."
	var/old_max_insight = INFINITY
	var/old_max_resting = INFINITY
	var/old_insight_rest_gain_multiplier = 1

/datum/perk/job/artist/assign(mob/living/carbon/human/H)
	..()
	old_max_insight = holder.sanity.max_insight
	old_max_resting = holder.sanity.max_resting
	old_insight_rest_gain_multiplier = holder.sanity.insight_rest_gain_multiplier
	holder.sanity.max_insight = 100
	holder.sanity.insight_gain_multiplier *= 1.5
	holder.sanity.max_resting = 1
	holder.sanity.insight_rest_gain_multiplier = 0

/datum/perk/job/artist/remove()
	holder.sanity.max_insight += old_max_insight - 100
	holder.sanity.insight_gain_multiplier /= 1.5
	holder.sanity.max_resting += old_max_resting - 1
	holder.sanity.insight_rest_gain_multiplier += old_insight_rest_gain_multiplier
	..()

/datum/perk/timeismoney
	name = "Hyperzine Injections"
	desc = "A standard issue injector hidden away that is designed for Chief Executive Officers that contains a small on-demand injection of Hyperzine. The injector itself is unable to be seen by prying scanners and comes in both \
	metal and organic material designs to aid in remaining hidden. While useful, the chemical storage takes time to recharge after use."
	active = FALSE
	passivePerk = FALSE

/datum/perk/timeismoney/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your chemical injector is still refilling, you'll need to wait longer."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] begins twitching and breathing much quicker!", "You feel your heart rate increasing rapidly as everything seems to speed up!", "You hear someone breathing rapidly...")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("hyperzine", 5)
	return ..()

/datum/perk/medicalexpertise
	name = "Medical Expertise"
	desc = "Your medical training and experience in the area of patient triage is unparalleled. 'Waste not, want not' is your motto, and you apply bandages and salves with utmost efficiency, sometimes using just the right ammount of them."

/datum/perk/solborn
	name = "Sol Born"
	desc = "Clean living in the Sol system has prevented you from building up a tolerance to most chemicals, your body can't handle the more hardcore drugs that most can and you find yourself getting \
	addicted slightly easier."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/solborn/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 1.2
	holder.metabolism_effects.nsa_threshold -= 15

/datum/perk/solborn/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_threshold += 15
	..()

/datum/perk/klutz
	name = "Klutz"
	desc = "You find a lot of tasks a little beyond your ability to perform, but being accident prone has at least made you used to getting hurt."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/klutz/assign(mob/living/carbon/human/H)
	..()
	holder.mutations.Add(CLUMSY)

/datum/perk/klutz/remove()
	holder.mutations.Remove(CLUMSY)
	..()

/datum/perk/addict
	name = "Chem Addict"
	desc = "You've been an addict all your life, for whatever piss poor reason you've told yourself. Your body is able to handle a variety of drugs, more than the average person, but you get \
	easily addicted to all of them."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/addict/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 2
	holder.metabolism_effects.nsa_threshold += 20

/datum/perk/addict/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_threshold -= 20
	..()
/*
/datum/perk/merchant
	name = "Greedy at Heart"
	desc = "Money is what matters for you, and it's so powerful it lets you improve your skills the more you have on your person."
	//icon_state = "merchant" // https://game-icons.net/1x1/lorc/cash.html and https://game-icons.net/1x1/delapouite/graduate-cap.html slapped on https://game-icons.net/1x1/lorc/trade.html

/datum/perk/merchant/assign(mob/living/carbon/human/H)
	..()
	//holder.sanity.valid_inspirations += /obj/item/spacecash/bundle

/datum/perk/merchant/remove()
	//holder.sanity.valid_inspirations -= /obj/item/spacecash/bundle
	..()
*/
/datum/perk/sanityboost
	name = "True Faith"
	desc = "When near an obelisk, you feel your mind at ease. Your body is strengthened by its presence, resisting all forms of damage."
	gain_text = "You feel the protection of the nearby obelisk."
	lose_text = "You no longer feel the protection of an obelisk."
	//icon_state = "sanityboost" // https://game-icons.net/1x1/lorc/templar-eye.html

/datum/perk/sanityboost/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk /= 1.2
	holder.burn_mod_perk /= 1.2
	holder.oxy_mod_perk /= 1.2
	holder.toxin_mod_perk /= 1.2

/datum/perk/sanityboost/remove()
	holder.brute_mod_perk *= 1.2
	holder.burn_mod_perk *= 1.2
	holder.oxy_mod_perk *= 1.2
	holder.toxin_mod_perk *= 1.2
	..()

/datum/perk/sure_step
	name = "Sure step"
	desc = "Years spent in hazardous areas have made you sure on your footing, you are more likely to avoid traps and less likely to trip while running on under-plating."
	//icon_state = "mantrap"

/datum/perk/ear_of_quicksilver
	name = "Ear of Quicksilver"
	desc = "Training (and an ear implant) given to you as a Ranger makes it hard for secrets to escape your ears. Beware, loud noises are especially dangerous to you as a side effect."
	//icon_state = "ear" // https://game-icons.net

/datum/perk/unfinished_delivery
	name = "Lazarus Protocol"
	desc = "Your cruciform is more than just a symbol of faith. Should you ever perish, it will attempt an emergency revival that may restore your body after a short time, in which you'll be unconscious."
	//icon_state = "regrowth" // https://game-icons.net/1x1/delapouite/stump-regrowth.html

/datum/perk/lungs_of_iron
	name = "Lungs of Iron"
	desc = "For whatever reason, be it natural evolution or simply spending too much time in space or low oxygen worlds your lungs are adapted to surviving with less oxygen."
	//icon_state = "lungs" // https://game-icons.net/1x1/lorc/one-eyed.html

/datum/perk/blood_of_lead
	name = "Lead Blood"
	desc = "Maybe you grew up on a world with a toxic atmosphere, maybe solar radiation was common, or maybe its just genetics but you're adapted well to dealing with toxins."
	//icon_state = "liver" // https://game-icons.net

/datum/perk/space_asshole
	name = "Rough Life"
	desc = "Your past life has been one of turmoil and extremes and as a result has toughened you up severely. Environmental damage from falling or explosives have less of an effect on your toughened body."
	//icon_state = "bomb" // https://game-icons.net

/datum/perk/space_asshole/assign(mob/living/carbon/human/H)
	..()
	holder.mob_bomb_defense += 25
	holder.falls_mod -= 0.4

/datum/perk/space_asshole/remove()
	holder.mob_bomb_defense -= 25
	holder.falls_mod += 0.4
	..()

/datum/perk/chemist
	name = "Periodic Table"
	desc = "You know what the atoms around you react to and in what way they do. You are used to making organic substitutes and using them. \
			You get quarter more NSA than a normal person. You can also see all reagents in beakers."
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS

/datum/perk/chemist/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.metabolism_effects.nsa_threshold *= 1.25

// Added on top , removed first
/datum/perk/selfmedicated/chemist/remove()
	if(holder)
		holder.metabolism_effects.nsa_threshold /= 1.25
	..()

/datum/perk/bartender
	name = "Bar Menu"
	desc = "You know how to mix a drink, and flip a burger. You can identify the ingredients that went into food and how much was used."
	perk_shared_ability = PERK_SHARED_SEE_COMMON_REAGENTS

/datum/perk/chem_contraband
	name = "Illegal Substance Training"
	desc = "For reasons either fair or foul, you know how to easily identify certain kinds of illegal chemical contraband."
	perk_shared_ability = PERK_SHARED_SEE_ILLEGAL_REAGENTS

/datum/perk/parkour
	name = "Raiders Leap"
	desc = "You can climb some objects faster than normal thanks to a life of raiding ships, settlements, and anywhere plunder was."
	//icon_state = "parkour" //https://game-icons.net/1x1/delapouite/jump-across.html

/datum/perk/parkour/assign(mob/living/carbon/human/H)
	..()
	holder.mod_climb_delay -= 0.95

/datum/perk/parkour/remove()
	holder.mod_climb_delay += 0.95
	..()

/datum/perk/chaingun_smoker
	name = "Unclean Living"
	desc = "The bad conditions of your birth have led you to thrive in toxic environments, so much so that your body is dependent on having an unclean atmosphere. You feel tougher and slowly heal toxin damage when smoking."
	//icon_state = "cigarette" // https://game-icons.net

/datum/perk/nightcrawler
	name = "Nightcrawler"
	desc = "You are faster in the darkness due to being used to it."
	//icon_state = "night" // https://game-icons.net/1x1/lorc/night-sky.html

/datum/perk/fast_fingers
	name = "Fast fingers"
	desc = "Nothing is safe around your hands. You are a true kleptomaniac. Taking items off others makes no sound or prompts, provided its in their pockets, hands, or their ears. \
	It's also quicker and you can slip pills into drinks unnoticed."
	//icon_state = "robber_hand" // https://game-icons.net/1x1/darkzaitzev/robber-hand.html

/datum/perk/quiet_as_mouse
	name = "Quiet as a mouse"
	desc = "Being deadly, easy. Silent? Even easier now. You generate less noise than others."
	//icon_state = "footsteps" // https://game-icons.net

/datum/perk/quiet_as_mouse/assign(mob/living/carbon/human/H)
	..()
	holder.noise_coeff -= 0.75

/datum/perk/quiet_as_mouse/remove()
	holder.noise_coeff += 0.75
	..()

/datum/perk/junkborn
	name = "Expert Scavenger"
	desc = "One man's trash is another man's salary. Removing a trash pile has a chance of revealing a valuable item nobody else would find."
	//icon_state = "treasure" // https://game-icons.net

/datum/perk/ass_of_concrete
	name = "Immovable Object"
	desc = "Your intense training has perfected your footing, and you're an expert at holding the line. Few things can knock you off balance or push you around."
	//icon_state = "muscular" // https://game-icons.net

/datum/perk/ass_of_concrete/assign(mob/living/carbon/human/H)
	..()
	holder.mob_bump_flag = HEAVY

/datum/perk/ass_of_concrete/remove()
	holder.mob_bump_flag = ~HEAVY
	..()

/datum/perk/sommelier
	name = "Sommelier"
	desc = "You know how to handle even the strongest alcohol in the universe and doing so improves your toughness."
	//icon_state = "inspiration"

/datum/perk/rezsickness
	name = "Revival Sickness"
	desc = "You've recently died and have been brought back to life, the experience leaving you weakened and thus unfit for fighting for a while. You better find a bed or chair to rest into until you've fully recuperated."
	gain_text = "Your body aches from the pain of returning from death, you better find a chair or bed to rest in so you can heal properly."
	lose_text = "You finally feel like you recovered from the ravages of your body."
	var/initial_time

/datum/perk/rezsickness/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time
	cooldown_time = world.time + 30 MINUTES
	holder.brute_mod_perk += 0.10
	holder.burn_mod_perk += 0.10
	holder.oxy_mod_perk += 0.10
	holder.toxin_mod_perk += 0.10
	holder.stats.changeStat(STAT_ROB, -10)
	holder.stats.changeStat(STAT_TGH, -10)
	holder.stats.changeStat(STAT_VIG, -10)

/datum/perk/rezsickness/remove()
	holder.brute_mod_perk -= 0.10
	holder.burn_mod_perk -= 0.10
	holder.oxy_mod_perk -= 0.10
	holder.toxin_mod_perk -= 0.10
	holder.stats.changeStat(STAT_ROB, 10)
	holder.stats.changeStat(STAT_TGH, 10)
	holder.stats.changeStat(STAT_VIG, 10)
	..()

/datum/perk/rezsickness/severe
	name = "Severe Revival Sickness"
	desc = "You've recently died and have been brought back to life. Your body cannot handle this traumatic experience very well, to the point where you struggle to complete even basic tasks. You better rest in a bed until it subsides before going back to work."

/datum/perk/rezsickness/severe/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.15
	holder.burn_mod_perk += 0.15
	holder.oxy_mod_perk += 0.15
	holder.toxin_mod_perk += 0.15
	holder.stats.changeStat(STAT_COG, -15)
	holder.stats.changeStat(STAT_MEC, -15)
	holder.stats.changeStat(STAT_BIO, -15)

/datum/perk/rezsickness/severe/remove()
	holder.brute_mod_perk -= 0.15
	holder.burn_mod_perk -= 0.15
	holder.oxy_mod_perk -= 0.15
	holder.toxin_mod_perk -= 0.15
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)
	holder.stats.changeStat(STAT_BIO, 15)
	..()

/datum/perk/rezsickness/severe/fatal
	name = "Fatal Revival Sickness"
	desc = "You've recently died and have been brought back to life. Your frail constitution can barely handle the process, leaving you utterly physically and mentally wrecked. You better stay in bed for now and rest, or you risk dying even easier than before."

/datum/perk/rezsickness/severe/fatal/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.25
	holder.burn_mod_perk += 0.25
	holder.oxy_mod_perk += 0.25
	holder.toxin_mod_perk += 0.25
	holder.stats.changeStat(STAT_ROB, -20)
	holder.stats.changeStat(STAT_TGH, -20)
	holder.stats.changeStat(STAT_VIG, -20)
	holder.stats.changeStat(STAT_COG, -20)
	holder.stats.changeStat(STAT_MEC, -20)
	holder.stats.changeStat(STAT_BIO, -20)

/datum/perk/rezsickness/severe/fatal/remove()
	holder.brute_mod_perk -= 0.25
	holder.burn_mod_perk -= 0.25
	holder.oxy_mod_perk -= 0.25
	holder.toxin_mod_perk -= 0.25
	holder.stats.changeStat(STAT_ROB, 20)
	holder.stats.changeStat(STAT_TGH, 20)
	holder.stats.changeStat(STAT_VIG, 20)
	holder.stats.changeStat(STAT_COG, 20)
	holder.stats.changeStat(STAT_MEC, 20)
	holder.stats.changeStat(STAT_BIO, 20)
	..()

/datum/perk/rezsickness/on_process()
	if(cooldown_time <= world.time)
		holder.stats.removePerk(type)
		to_chat(holder, SPAN_NOTICE("[lose_text]"))
		return
	if(holder.buckled)
		cooldown_time -= 2 SECONDS

/datum/perk/handyman
	name = "Handyman"
	desc = "Training by the Artificer's Guild has granted you the knowledge of how to take apart machines in the most efficient way possible, finding materials and supplies most people would miss. This training is taken further the more mechanically skilled or cognitively capable you are."
	var/known_recipes = list(
			/datum/craft_recipe/guild/melee,
			/datum/craft_recipe/guild/bullet,
			/datum/craft_recipe/guild/energy,
			/datum/craft_recipe/guild/bomb,
			/datum/craft_recipe/guild/robotmelee,
			/datum/craft_recipe/guild/plasma_glass,
			/datum/craft_recipe/guild/arcwelder,
			/datum/craft_recipe/guild/polytool,
			/datum/craft_recipe/guild/combat_shovel,
			/datum/craft_recipe/guild/supermop,
			/datum/craft_recipe/guild/railgunpistol,
			/datum/craft_recipe/guild/railgunrifle,
			/datum/craft_recipe/guild/heavypulserifle,
			/datum/craft_recipe/guild/guild_bull,
			/datum/craft_recipe/guild/abdicatorshotgun,
			/datum/craft_recipe/guild/ten_shot_conversion,
			/datum/craft_recipe/guild/mace,
			/datum/craft_recipe/guild/claymore,
			/datum/craft_recipe/guild/machete,
			/datum/craft_recipe/guild/katana,
			/datum/craft_recipe/guild/firebrand,
			/datum/craft_recipe/guild/bastion,
			/datum/craft_recipe/guild/technosuit,
			/datum/craft_recipe/guild/technohelmet,
			/datum/craft_recipe/guild/webbing,
			/datum/craft_recipe/guild/sheet_stacker,
			/datum/craft_recipe/guild/plasmablock,
			/datum/craft_recipe/guild/rubbermesh,
			/datum/craft_recipe/guild/booster,
			/datum/craft_recipe/guild/injector,
			/datum/craft_recipe/guild/weintraub,
			/datum/craft_recipe/guild/overshooter,
			/datum/craft_recipe/guild/dangerzone,
			/datum/craft_recipe/guild/forged,
			/datum/craft_recipe/guild/heavy_barrel,
			/datum/craft_recipe/guild/silencer,
			/datum/craft_recipe/guild/kit,
			/datum/craft_recipe/guild/turretcircuit,
			/datum/craft_recipe/guild/rocket_engine,
			/datum/craft_recipe/guild/watchman,
			/datum/craft_recipe/guild/matter_nanoforge,
			/datum/craft_recipe/guild/matter_nanoforge_blackbox,
			/datum/craft_recipe/guild/guild_bin,
			/datum/craft_recipe/guild/guild_manip,
			/datum/craft_recipe/guild/guild_laser,
			/datum/craft_recipe/guild/guild_scanner,
			/datum/craft_recipe/guild/guild_capacitor,
			//datum/craft_recipe/guild/guild_bin_alt,
			//datum/craft_recipe/guild/guild_manip_alt,
			//datum/craft_recipe/guild/guild_laser_alt,
			//datum/craft_recipe/guild/guild_scanner_alt,
			//datum/craft_recipe/guild/guild_capacitor_alt,
			//datum/craft_recipe/guild/guild_mine_trap,
			/datum/craft_recipe/guild/guild_bin_box,
			/datum/craft_recipe/guild/guild_manip_box,
			/datum/craft_recipe/guild/guild_laser_box,
			/datum/craft_recipe/guild/guild_scanner_box,
			/datum/craft_recipe/guild/guild_capacitor_box
			)

/datum/perk/handyman/assign(mob/living/carbon/human/H)
	..()
	holder.mind.knownCraftRecipes.Add(known_recipes)

/datum/perk/handyman/remove()
    holder.mind.knownCraftRecipes.Remove(known_recipes)

/datum/perk/stalker
	name = "Anomaly Hunter"
	desc = "Special training from senior Prospectors and your own experience has allowed you to instinctively know the effects of greater oddities. By examining an oddity that has become an anomaly, you can tell what its greater boon or curse may be."

/datum/perk/market_prof
	name = "Market Professional"
	desc = "You've become an excellent appraiser of goods over the years. Just by looking at the item, you can know how much it would sell for in today's market rates."

/datum/perk/surgical_master
	name = "Surgery Training"
	desc = "While you may not know the more advanced medical procedures, your mandatory training on surgery for implantation purposes allows you to perform basic surgical procedures with ease."

/datum/perk/advanced_medical
	name = "Advanced Surgical Techniques"
	desc = "Your surgical training and experience have tempered your special techniques for treating patients, enabling you to make more effective and efficient use of your resources when reconstituting their bodies."

/datum/perk/robotics_expert
	name = "Robotics Expert"
	desc = "Your formal training and experience in advanced mech construction and complex devices has made you more adept at working with them."
	var/known_recipes = list(
			/datum/craft_recipe/robotic/custom_board,
			/datum/craft_recipe/robotic/roomba_frame,
			/datum/craft_recipe/robotic/roomba_treads,
			/datum/craft_recipe/robotic/roomba_knife,
			/datum/craft_recipe/robotic/roomba_armor,
			/datum/craft_recipe/robotic/roomba_armor/heavy,
			/datum/craft_recipe/robotic/sword_frame,
			/datum/craft_recipe/robotic/mantis_frame,
			/datum/craft_recipe/robotic/head_frame,
			/datum/craft_recipe/robotic/left_arm_frame,
			/datum/craft_recipe/robotic/right_arm_frame,
			/datum/craft_recipe/robotic/left_leg_frame,
			/datum/craft_recipe/robotic/right_leg_frame,
			/datum/craft_recipe/robotic/mining_bot
			)

/datum/perk/robotics_expert/assign(mob/living/carbon/human/H)
	..()
	holder.mind.knownCraftRecipes.Add(known_recipes)

/datum/perk/robotics_expert/remove()
	holder.mind.knownCraftRecipes.Remove(known_recipes)

/datum/perk/job/bolt_reflect
	name = "Bolt Action Rifle Training"
	desc = "Through intense and repetitive training with bolt-action and lever-action rifles, you will always chamber a new round instantly after firing."

/datum/perk/job/jingle_jangle
	name = "Key Smith"
	desc = "You have been granted a multitude of specially crafted electronic 'keys' for opening most airlocks around the colony, and the knowledge on how to use them has been solely been passed on to you. Don't get discouraged, you will eventually find the right one..."

/datum/perk/job/blackshield_conditioning
	name = "Blackshield Conditioning"
	desc = "Thanks to special and intensive training received in the course of your employment with Blackshield, your body is a bit more resistant to brute force damage and burns due to trauma conditioning."

/datum/perk/blackshield_conditioning/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk -= 0.15
	holder.burn_mod_perk -= 0.10

/datum/perk/blackshield_conditioning/remove()
	holder.brute_mod_perk += 0.15
	holder.burn_mod_perk += 0.10

/datum/perk/job/prospector_conditioning
	name = "Rough and Tumble"
	desc = "You've been through it all. Spider bites, random cuts on rusted metal, animal claws, getting shot, and even set on fire. As a result, you resist every type of damage just a little bit better than others not of similar toughness."

/datum/perk/prospector_conditioning/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk -= 0.10
	holder.burn_mod_perk -= 0.05
	holder.oxy_mod_perk -= 0.10
	holder.toxin_mod_perk -= 0.15

/datum/perk/prospector_conditioning/remove()
	holder.brute_mod_perk += 0.10
	holder.burn_mod_perk += 0.05
	holder.oxy_mod_perk += 0.10
	holder.toxin_mod_perk += 0.15

/datum/perk/job/butcher
	name = "Master Butcher"
	desc = "Your skill as a butcher is unmatched, be it through your training or accumulated field experience. You can harvest additional valuable parts from animals you cut up, nothing shall be wasted."
	var/known_recipes = list(
			/datum/craft_recipe/lodge/baroqe,
			/datum/craft_recipe/lodge/hunter_crossbow,
			/datum/craft_recipe/lodge/hunting_halberd,
			/datum/craft_recipe/lodge/render_gauntlet,
			/datum/craft_recipe/lodge/skinning_knife,
			/datum/craft_recipe/lodge/woodsmans_axe,
			/datum/craft_recipe/lodge/bone_shield,
			/datum/craft_recipe/lodge/hunter_hood,
			/datum/craft_recipe/lodge/hunter_armor_basic,
			/datum/craft_recipe/lodge/hunter_armor_bonedaddy,
			/datum/craft_recipe/lodge/hunter_armor_metalman,
			/datum/craft_recipe/lodge/hunter_armor_leatherdom,
			/datum/craft_recipe/lodge/blood_tongue,
			/datum/craft_recipe/lodge/powder_pouch,
			/datum/craft_recipe/lodge/tangu_juice,
			/datum/craft_recipe/lodge/clucker_juice,
			/datum/craft_recipe/lodge/tahca_antiviral,
			/datum/craft_recipe/lodge/crossbow_bolts,
			/datum/craft_recipe/lodge/crossbow_bolts/lethal,
			/datum/craft_recipe/lodge/crossbow_bolts/speed,
			/datum/craft_recipe/lodge/duct_tape_weak,
			/datum/craft_recipe/lodge/duct_tape,
			/datum/craft_recipe/lodge/chimera_fang,
			/datum/craft_recipe/lodge/soap,
			/datum/craft_recipe/lodge/hunting_claw,
			/datum/craft_recipe/lodge/sun_cleaver,
			/datum/craft_recipe/lodge/hunter_boots,
			/datum/craft_recipe/lodge/hunter_gloves,
			/datum/craft_recipe/lodge/sheath,
			/datum/craft_recipe/lodge/hunting_belt,
			/datum/craft_recipe/lodge/leather_medium_pouch,
			/datum/craft_recipe/lodge/leather_large_pouch
			)

/datum/perk/job/butcher/assign(mob/living/carbon/human/H)
	..()
	holder.mind.knownCraftRecipes.Add(known_recipes)

/datum/perk/job/butcher/remove()
	holder.mind.knownCraftRecipes.Remove(known_recipes)

/datum/perk/job/master_herbalist
	name = "Naturalist"
	desc = "The secrets of natural remedies have been unlocked by the lodge after special training from folken tribes, given their alliance. This has granted you the ability to make better \
	use of grown plants to harvest more fruit and more properly manage the use of medical supplies like blood tongues or powder pouches. As an added bonus, when harvesting soil \
	or plant trays you always harvest an additional bonus!"
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS

/datum/perk/si_sci
	name = "SI Science Trainning"
	desc = "You know how to use RnD core consoles and Exosuit Fabs."

/datum/perk/greenthumb
	name = "Green Thumb"
	desc = "After growing plants for years (or at least being around those that do) you have become a botanical expert. You can get all information about plants, from stats \
	        to harvest reagents, by examining them."
	//icon_state = "greenthumb" // https://game-icons.net/1x1/delapouite/farmer.html

	var/virtual_scanner = new /obj/item/device/scanner/plant/perk

/datum/perk/greenthumb/assign(mob/living/carbon/human/H)
	..()
	var/obj/item/device/scanner/V = virtual_scanner
	V.is_virtual = TRUE

/datum/perk/neat
	name = "Humble Cleanser"
	desc = "You're used to seeing filth in all its forms. Your motto: a clean colony and workspace is the first step to enlightenment. The simple act of such humble work as cleaning grants you inspiration."
	//icon_state = "neat" // https://game-icons.net/1x1/delapouite/broom.html

/datum/perk/channeling
	name = "Channeling"
	desc = "You know how to channel spiritual energy during rituals. You gain additional skill points \
			during group rituals, and have an increased regeneration of cruciform energy."


/datum/perk/codespeak
	name = "Codespeak"
	desc = "You know Marshal codes."
	//icon_state = "codespeak" // https://game-icons.net/1x1/delapouite/police-officer-head.html
	var/list/codespeak_procs = list(
		/mob/living/carbon/human/proc/codespeak_help,
		/mob/living/carbon/human/proc/codespeak_clear,
		/mob/living/carbon/human/proc/codespeak_regroup,
		/mob/living/carbon/human/proc/codespeak_moving,
		/mob/living/carbon/human/proc/codespeak_moving_away,
		/mob/living/carbon/human/proc/codespeak_spooders,
		/mob/living/carbon/human/proc/codespeak_romch,
		/mob/living/carbon/human/proc/codespeak_bigspooders,
		/mob/living/carbon/human/proc/codespeak_bigromch,
		/mob/living/carbon/human/proc/codespeak_serb,
		/mob/living/carbon/human/proc/codespeak_commie,
		/mob/living/carbon/human/proc/codespeak_carrion,
		/mob/living/carbon/human/proc/codespeak_mutant,
		/mob/living/carbon/human/proc/codespeak_dead,
		/mob/living/carbon/human/proc/codespeak_corpse,
		/mob/living/carbon/human/proc/codespeak_criminal,
		/mob/living/carbon/human/proc/codespeak_unknown,
		/mob/living/carbon/human/proc/codespeak_status,
		/mob/living/carbon/human/proc/codespeak_shutup,
		/mob/living/carbon/human/proc/codespeak_understood,
		/mob/living/carbon/human/proc/codespeak_yes,
		/mob/living/carbon/human/proc/codespeak_no,
		/mob/living/carbon/human/proc/codespeak_understood_local,
		/mob/living/carbon/human/proc/codespeak_yes_local,
		/mob/living/carbon/human/proc/codespeak_no_local,
		/mob/living/carbon/human/proc/codespeak_warcrime_local,
		/mob/living/carbon/human/proc/codespeak_run_local
		)

/datum/perk/codespeak/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.verbs += codespeak_procs


/datum/perk/codespeak/remove()
	if(holder)
		holder.verbs -= codespeak_procs
	..()

//Chef's special perk

/datum/perk/foodappraise
	name = "Spice Food"
	desc = "Your own special spice has anomalous properties that can enhance most food products."
	active = FALSE
	passivePerk = FALSE
/datum/perk/foodappraise/activate()
	var/mob/living/carbon/human/user = usr
	var/obj/item/reagent_containers/food/snacks/F = user.get_active_hand()
	if(!istype(user))
		return ..()
	if(!istype(F, /obj/item/reagent_containers/food/snacks))
		to_chat(usr, SPAN_NOTICE("You can only spice food items!"))
		return FALSE
	if(F.appraised == 1)
		to_chat(usr, SPAN_NOTICE("This food item has already been spiced!"))
		return FALSE
	to_chat(usr, SPAN_NOTICE("You quickly sprinkle some of your anomalous spice onto the food item, revealing its hidden properties."))
	log_and_message_admins("used their [src] perk.")
	F.chef_buff_type = rand(1,9) // We assign a random bufferino.
	F.appraised = 1
	switch(F.chef_buff_type)
		if(1)
			F.name = "mentally engaging [F.name]"
		if(2)
			F.name = "mechanic's [F.name]"
		if(3)
			F.name = "caretaker's [F.name]"
		if(4)
			F.name = "vigorous [F.name]"
		if(5)
			F.name = "hardy [F.name]"
		if(6)
			F.name = "focusing [F.name]"
		if(7)
			var/newprice = rand(100,500)
			F.name = "exquisite [F.name]"
			if(F.price_tag < newprice)
				F.price_tag = newprice
		if(8)
			F.name = "nourishing [F.name]"
			F.reagents.add_reagent("nutriment", 15)
		if(9)
			F.name = "hearty [F.name]"
