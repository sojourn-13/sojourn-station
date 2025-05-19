//////////////////////////////
//			Psionic Catalysts
//////////////////////////////
// These are usually collected by killing psionic monsters and finding them within the ashes of the left over bodies. See conquest_powers.dm for there power code. -Kaz
// Dropped by mobs to give psionics and RP to players, powers themselfs located in conquest_powers.dm
/obj/item/device/psionic_catalyst
	name = "psionic catalyst"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	"
	icon = 'icons/obj/device.dmi'
	icon_state = "psi_catalyst"
	item_state = "psi_catalyst"
	origin_tech = list(TECH_BIO = 9, TECH_MATERIAL = 9, TECH_PLASMA = 3)
	matter = list(MATERIAL_GLASS = 1, MATERIAL_PLASTEEL = 2, MATERIAL_PLASMA = 1, MATERIAL_DIAMOND = 1)
	price_tag = 0
	var/stored_power
	var/resonances = "Anything"

/obj/item/device/psionic_catalyst/examine(mob/user)
	..()
	if(resonances)
		to_chat(user, "<span class='info'>Has a Resonances Keyword of: [resonances]</span>")

/obj/item/device/psionic_catalyst/dull
	name = "dull psionic catalyst"
	desc = "Psionic catalysts, other worldly items not quite understood. This one for some reason has no echo or glow, unlike most others."
	icon_state = "psi_catalyst_dull"
	item_state = "psi_catalyst"
	origin_tech = list(TECH_BIO = 2, TECH_MATERIAL = 1, TECH_PLASMA = 1)
	matter = list(MATERIAL_GLASS = 1, MATERIAL_PLASTEEL = 2, MATERIAL_PLASMA = 1)
	resonances = "Null"

// Found catalysts
/obj/item/device/psionic_catalyst/nightmare_mind
	name = "psionic catalyst: Nightmarish Thoughts"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	Within this catalyst is the collected psyche of... other things, a certain restructuring of your thoughts may yet let you find allies elsewhere, in darker places."
	stored_power = /mob/living/carbon/human/proc/nightmare_mind
	resonances = "Night"

/obj/item/device/psionic_catalyst/bring_darkness
	name = "psionic catalyst: Bring Darkness"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	Some things are better left hidden from the warmth of the light."
	stored_power = /mob/living/carbon/human/proc/bring_darkness
	resonances = "Dark"

/*
/obj/item/device/psionic_catalyst/rust
	name = "psionic catalyst: Rust"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	It is better this way. It will eventually be this way. We all will."
	stored_power = /mob/living/carbon/human/proc/rust
	resonances = "Rust"

/obj/item/device/psionic_catalyst/restore
	name = "psionic catalyst: Rust"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	It is only natural to fight with all your might to keep things as they are. Fruitless, but natural."
	stored_power = /mob/living/carbon/human/proc/restore
	resonances = "Rust"
*/ // Added to the general power list, keeping this in here for code reference

/obj/item/device/psionic_catalyst/decay
	name = "psionic catalyst: Decay"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	Progress must sometimes be forced and such advancements can be useful."
	stored_power = /mob/living/carbon/human/proc/decay
	resonances = "Age"

/obj/item/device/psionic_catalyst/dream_seeker
	name = "psionic catalyst: Dream Seeker"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	A curious person may not like what must be sacrificed pursuing the truth. Perhaps it will find them first?"
	stored_power = /mob/living/carbon/human/proc/seek_the_dream
	resonances = "Seeking"

/obj/item/device/psionic_catalyst/kings_decorum
	name = "psionic catalyst: Kings Decorum"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	What a wonderful world..."
	stored_power = /mob/living/carbon/human/proc/kings_decorum
	resonances = "Regicide"

/obj/item/device/psionic_catalyst/heretical_ascension
	name = "psionic catalyst: Heretical Ascension"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	To grasp at perfection, to reach farther than one ever could, to be Icarus and soar beneath the sun instead of falling to hubris. Shall that be your fate?"
	stored_power = /mob/living/carbon/human/proc/merge_flesh_and_steel
	resonances = "Steel"

/obj/item/device/psionic_catalyst/psionic_ascension
	name = "psionic catalyst: Psionic Ascension"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	The creation of more of our kind is sacrosanct, to allow more to see beyond the veil of reality is to bring more minds, more eyes, to what we wish to show them."
	stored_power = /mob/living/carbon/human/proc/ascend_another
	resonances = "Carbon"

/obj/item/device/psionic_catalyst/cerebral_hemorrhage
	name = "psionic catalyst: Cerebral Hemorrhage"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	A sturdy mind is destroyed by revelation, a weak mind is eviscerated."
	stored_power = /mob/living/carbon/human/proc/cerebral_hemorrhage
	resonances = "Sinking"

/obj/item/device/psionic_catalyst/enslavement
	name = "psionic catalyst: Enslavement"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	Kneel."
	stored_power = /mob/living/carbon/human/proc/mind_jack
	resonances = "Greater"


// Researched catalysts
/obj/item/device/psionic_catalyst/cryo_kinetic_blaster
	name = "psionic catalyst: Cryo-Kinetic Orb"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	The cold and the winter are what has seperated the living from the doomed."
	stored_power = /mob/living/carbon/human/proc/cryo_kinetic_blaster
	resonances = "Cold"

/obj/item/device/psionic_catalyst/pyro_kinetic_blaster
	name = "psionic catalyst: Pyro-Kinetic Orb"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	Fire often destroys everything it touches, even if we wish it did not."
	stored_power = /mob/living/carbon/human/proc/pyro_kinetic_blaster
	resonances = "Warm"

/obj/item/device/psionic_catalyst/electro_kinetic_blaster
	name = "psionic catalyst: Electro-Kinetic Orb"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	How shocking."
	stored_power = /mob/living/carbon/human/proc/electro_kinetic_blaster
	resonances = "Quick"

/obj/item/device/psionic_catalyst/kinetic_barrier
	name = "psionic catalyst: Kinetic Barrier"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	Protection of body and mind."
	stored_power = /mob/living/carbon/human/proc/kinetic_barrier
	resonances = "Suppression"

/obj/item/device/psionic_catalyst/chosen_control
	name = "psionic catalyst: Chosen Control"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	The universe bends to your will alone and at times, it must be reminded."
	stored_power = /mob/living/carbon/human/proc/chosen_control
	resonances = "Suppression"

/obj/item/device/psionic_catalyst/detect_thoughts
	name = "psionic catalyst: Locate Mind-Essence"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	We all have some spark."
	stored_power = /mob/living/carbon/human/proc/detect_thoughts
	resonances = "Seeking"

/obj/item/device/psionic_catalyst/psychoactive_manipulation
	name = "psionic catalyst: Psychoactive Manipulation"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	Are we truly changing anything?"
	stored_power = /mob/living/carbon/human/proc/psychoactive_manipulation
	resonances = "Greater"

/obj/item/device/psionic_catalyst/Light_psi_armor
	name = "psionic catalyst: Void robe"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	Can we really afford to leave the comfort of our own shell?"
	stored_power = /mob/living/carbon/human/proc/Light_psi_armor
	resonances = "Protection"

/obj/item/device/psionic_catalyst/Hpsi_armor
	name = "psionic catalyst: Durable shell"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	Pain accompanies you, broken bones, torn flesh have become your companions. This catalyst will help to minimize suffering by giving your mind and body a rest."
	stored_power = /mob/living/carbon/human/proc/Hpsi_armor
	resonances = "Protection"

/obj/item/device/psionic_catalyst/layered_psi_shield
	name = "psionic catalyst: Layered Shield"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	If we put our mind to it, we can think of many shapes at the same time."
	stored_power = /mob/living/carbon/human/proc/psionic_shield_layered
	resonances = "Protection"

/obj/item/device/psionic_catalyst/trash_pile_exploid
	name = "psionic catalyst: Discombobulate"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	Any pile of junk can be a good distraction... heheh."
	stored_power = /mob/living/carbon/human/psionic_tumor/proc/trash_pile_exploid
	resonances = "Warm"

/obj/item/device/psionic_catalyst/summan_trash_pile
	name = "psionic catalyst: Scrap Together"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	One man's trash is another man's obsession!"
	stored_power = /mob/living/carbon/human/psionic_tumor/proc/summan_trash_pile
	resonances = "Seeking"

/obj/item/device/psionic_catalyst/relic_intuition
	name = "psionic catalyst: Reclamation"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	It is only natural to fight with all your might to keep things as they are. Fruitless, but natural."
	stored_power = /mob/living/carbon/human/proc/relic_intuition
	resonances = "Suppression"

/obj/item/device/psionic_catalyst/needle_n_thread
	name = "psionic catalyst: Psionic Suture"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	If it bleeds, it can die. Be better than it."
	stored_power = /mob/living/carbon/human/psionic_tumor/proc/needle_n_thread
	resonances = "Healing"

/obj/item/device/psionic_catalyst/psi_burn_cream
	name = "psionic catalyst: Psionic Ointment"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	It is a common urge, to touch the fire, to hear the sizzling of flesh. This is the consequence."
	stored_power = /mob/living/carbon/human/psionic_tumor/proc/psi_burn_cream
	resonances = "Healing"

/obj/item/device/psionic_catalyst/purify
	name = "psionic catalyst: Psionic Purify"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	A healthy body is a healthy mind."
	stored_power = /mob/living/carbon/human/psionic_tumor/proc/purify
	resonances = "Healing"

/obj/item/device/psionic_catalyst/temp_regulate
	name = "psionic catalyst: Psionic Temperature Regulate"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	In knowing nothing, life is most delightful."
	stored_power = /mob/living/carbon/human/psionic_tumor/proc/temp_regulate
	resonances = "Climate"

/obj/item/device/psionic_catalyst/candle_enhancer
	name = "psionic catalyst: Forever Candle"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	A candle has a long breath if never blown on..."
	stored_power = /mob/living/carbon/human/psionic_tumor/proc/candle_enhancer
	resonances = "Warm"

/obj/item/device/psionic_catalyst/psi_injector_enhancer
	name = "psionic catalyst: Psionic Breath"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	The feeling of an inhaler in hand cant leave the mind after ones breath draws none."
	stored_power = /mob/living/carbon/human/psionic_tumor/proc/psi_injector_enhancer
	resonances = "Healing"

/obj/item/device/psionic_catalyst/psion_gas_mask
	name = "psionic catalyst: Psionic Gas Mask"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels quite strange. Even to an unattuned mind, one can hear the faintly glowing object whispering, the eager voices say: \
	The long tube holds so much to breath yet the tank runs dry."
	stored_power = /mob/living/carbon/human/psionic_tumor/proc/psion_gas_mask
	resonances = "Climate"

/obj/item/device/psionic_catalyst/add_initial_transforms()
	. = ..()

	add_new_transformation(/datum/transform_type/modular, list(0.5, 0.5, flag = PSICATALYST_INITIAL_SCALE_TRANSFORM, priority = PSICATALYST_INITIAL_SCALE_TRANSFORM_PRIORITY))

/obj/item/device/psionic_catalyst/verb/invoke_power()
	set name = "Invoke Psionic Catalyst"
	set desc = "Invoke the psionic potential within the catalyst, adding a copy of its power to your own."
	set category = "Object"

	if(!usr.stats.getPerk(PERK_PSION))
		to_chat(usr, "<span class='notice'>You lack the psionic potential to invoke this.</span>")
		return

	if(!stored_power)
		to_chat(usr, "<span class='notice'>The catalyst has no power to invoke, as its a faded memory from another time.</span>")
		return

	playsound(src.loc, 'sound/hallucinations/ghosty_wind.ogg', 25, 1)
	to_chat(usr, "You invoke the power left within this catalyst, copying a fraction of its remembered strength and adding it to your own.")
	var/mob/living/carbon/human/M = usr
	var/obj/item/organ/internal/psionic_tumor/tumor = M.random_organ_by_process(BP_PSION)
	tumor.organ_add_verb(stored_power)
	resonances = "Null"

// Putting this here since its easier to reference. -Kaz
/obj/random/psi_catalyst
	name = "random lesser psi_catalyst"
	icon_state = "ammo-green"

/obj/random/psi_catalyst/item_to_spawn()
	return pickweight(list(
				/obj/item/device/psionic_catalyst/nightmare_mind = 8,
				/obj/item/device/psionic_catalyst/bring_darkness = 10,
				/obj/item/device/psionic_catalyst/decay = 10,
				/obj/item/device/psionic_catalyst/dream_seeker = 10,
				/obj/item/device/psionic_catalyst/kings_decorum = 10,
				/obj/item/device/psionic_catalyst/psionic_ascension = 10,
				/obj/item/device/psionic_catalyst/Hpsi_armor = 4,
				/obj/item/device/psionic_catalyst/Light_psi_armor = 4,
				/obj/item/device/psionic_catalyst/layered_psi_shield = 8,
				/obj/item/device/psionic_catalyst/heretical_ascension = 1))

/obj/random/psi_catalyst/ponderous
	name = "random ponderous psi_catalyst"
	icon_state = "ammo-green"

/obj/random/psi_catalyst/ponderous/item_to_spawn()
	return pickweight(list(
				/obj/random/psi_catalyst = 15,
				/obj/item/device/psionic_catalyst/summan_trash_pile = 15,
				/obj/item/device/psionic_catalyst/relic_intuition = 15,
				/obj/item/device/psionic_catalyst/trash_pile_exploid = 15))

/obj/random/psi_catalyst/flesh_behemoth
	name = "random flesh behemoth psi_catalyst"
	icon_state = "ammo-green"

/obj/random/psi_catalyst/flesh_behemoth/item_to_spawn()
	return pickweight(list(
				/obj/random/psi_catalyst = 15,
				/obj/item/device/psionic_catalyst/needle_n_thread = 15,
				/obj/item/device/psionic_catalyst/purify = 15,
				/obj/item/device/psionic_catalyst/temp_regulate = 15))

/obj/random/psi_catalyst/debuffer
	name = "random debuffer psi_catalyst"
	icon_state = "ammo-green"

/obj/random/psi_catalyst/debuffer/item_to_spawn()
	return pickweight(list(
				/obj/random/psi_catalyst = 15,
				/obj/item/device/psionic_catalyst/needle_n_thread = 15,
				/obj/item/device/psionic_catalyst/purify = 15,
				/obj/item/device/psionic_catalyst/temp_regulate = 15))



// Psi-related lore paperwork. Not really a good place to put this so here it is. -Kaz
/obj/item/paper/psi_log_1
	name = "paper- Incident Report Log: #187"
	info = "<h1>Subject #390MHO - Violent Altercation</h1>\
	<p>The official report will be filed elsewhere with the proper codes and syntax, I am writing this strictly because it is fresh in my memory and I do not wish to leave out any details. \
	Normally these scenarios would be day to day, as subject 390 is in our high threat scenario ward. The unusual quality of his rather violent reaction this time was an exhibited \
	propensity to self harm. According to 390's file, which is under seal by order of the benefactor, he has a long history of violent and unprovoked behavior. Not once in our care, nor \
	in any record prior, has he ever turned his psychosis onto himself. What is more disturbing to me is his reason. Subject 390 was under standard observation after injection of \
	serum #1408. He displayed the usual reactions and behaviors within his padded cell before he suddenly began to gnaw his wrist open. An unfortunate mishap in the airlocks opening \
	mechanism resulted in a delayed response, by the time the airlock could be forced open subject 390 had managed to remove most of the flesh down to the bone. Standard disabling protocol \
	was employed, but proved troublesome given subject 390's exceptional level of bleeding made him difficult for my team to bring down and handcuff.</p><br>\
	<br><p>Later testing revealed that the blood was indeed belonging to subject 390. However, the quantity suggest that the single grevious wound on his wrist expelled nearly half is life blood. \
	The problem with that, obviously, is losing half your blood should result in death or at the very least unconciousness, but subject 390 was still able enough to require three men to bring him \
	down. More so that he was able to very lively scream the entire time, even after being injected with soporific and tasered. He kept going on about his 'king' and how much he needed to prepare \
	for his arrival. All nonsense, but I swear that while he was screaming, the blood pools around him were... Spreading? Deepening? I cannot quite describe it, it was as if the spreading gore was \
	growing on its own. Subject 390 was quickly put under by a chloral hydrate hypo-injector. I later asked one of the guards if they saw anything unusual, but they assured me everything was well \
	within normal operating standards.</p>"

/obj/item/paper/psi_log_2
	name = "paper- Incident Report Log: #213"
	info = "<h1>Anomalous Event Report</h1>\
	<h2>Threat Class: High</h2>\
	<p>Transcribed via recorder.</p>\
	<p>\"Look, I know what I saw. We followed protocol exactly, sedated the subject and gave him the serum when that... thing, just came out of thin air. It looks like it just bled into reality. It \
	killed Bently before we could even react and thank fuck for that because support was two minutes away and I'm lucky to escape without getting pulvarised. You can review the damn footage if \
	you want, that thing looked like something genetics cooked up while taking mindbreaker. Everything in the last few weeks has gotten god damn dangerous and half the staff won't walk anywhere \
	without an auretian and an atom cell, let alone what the tr-\"</p><br><br><p>End of transcript.</p>"

/obj/item/paper/psi_log_3
	name = "paper- Torn Page"
	info = "<h1>Personal Log: Harold Kerevork</h1>\
	<p>Why I got into the habit of logging my thoughts onto paper, I'll never know. Still, qoute of the day is 'Icarus could have soared' an interesting if meaningless sentiment to non-humans. \
	Tests are proceeding well under my direction as project manager, honestly this use of new titles is ever throwing. I keep needing to cross out my writing and correct it. \
	In any case, the work proceeds just fine, we make strides and progress onward and upward, though what exactly is within our serums is yet to be known even to me. The benefactor was very \
	clear not only on the value of our work but to retain incredible safety protocols. I was actually quite taken by it, as in all the years I've known the man I haven't ever seen him so \
	concerned with safety given his usual flaunting of convention. More so when he personally confided things I dare not write onto paper. If the end goal was to increase my resolve for our \
	work, it absolutely succeeded.</p><br>\
	<br><p>As an aside, our secondary labs working on improving cryogenics, genetics, and chemical research have hit several break throughs. The new machines they've cooked up have done wonders \
	to the monkies we've taken to testing on. Trials for higher life forms will begin shortly, though some are worried that such tamperings will end quite poorly if we progress too quickly. \
	Given what our benefactor has stressed about safety, I've exchanged the standard load out of our more brutish workers to include grizzly shotguns, a common and easily procured firearm here \
	on the frontier. Just a shame that our contacts in krios must trade so secretively.</p>"

/obj/item/paper/psi_log_4
	name = "paper- Ripped Page"
	info = "<h1>Personal Log: Harold Kerevork</h1>\
	<p>Why I got into the habit of logging my thoughts onto paper, I'll never know. Still, qoute of the day is 'One mind is all the spark needed to set things ablaze' a qoute that is either a joke or \
	prophetic. The rate of incidents, both violent and anomalous have increased nearly ten fold by the arrival and subsequent injection of subject #389, a wholly unremarkable subject if a bit \
	abnormal in the aspect of his high degree of intelligence, cognitive understanding, and will power when ran through the usual tests. Subject #389 was and is, rather pleasent and upon speaking \
	with the man myself would have concluded, even with my numerous studies and knowledge, that he was a kind and considerate if a bit intense person. Sadly for him, his file revealed his numerous \
	and productive criminal history, up to and including murder, which explains why he ended up here for testing. Under the benefactors directive and instruction however, we were able to pinpoint \
	precisely when the surge in problems began which started when subject #389 was injected with the serum. Within the week we had four escapes from genetics, six suicide attempts on prisoners \
	and nearly fourteen anomalous occurances. One of the most unusual ones occured when scientist noted one of the patients in his cell had a knife, but when the prisoner was subdued and searched \
	nothing was found. Yet not ten minutes after the search was concluded two different researchers saw the patient with a knife. Naturally, the subject was subdued and searched again only for \
	no knife to be found. This happened four more times before the situation was logged as an anomaly. Upon questioning, the patient said it was merely his mind attempting to escape and then \
	went into a bizarre explanation that his next words and 'gospel' as he put it would be very important but by then I was hardly listening. We have enough people who go mad after getting the \
	serum and honestly its starting to bore me.</p><br>\
	<br><p>Another note before I finish this entry for the day. I have often speculated why the benefactor wants us to perform this experiment with such absolute precision and with such careful methods. \
	Often, I find myself pondering more and more why he put such extensive methods in place to ensure not only our success but the safety of the people here. Normally we are left to live and die \
	on our own merits. Our work is either very important or, as the benefactor told me personally, he truly cares for the people here. I have noticed that, among our number, are some of the brightest \
	minds the ... Seems someone is at my door, I will finish this log later.</p>"

/obj/item/paper/psi_log_5
	name = "paper- Bloody Page"
	info = "<h1>Personal Log: Harold Kerevork</h1>\
	<p>The king rules forever, the king cannot die, the king is whoever's head fits the crown. That is what subject #389 said before I ordered him killed. I am afraid things have gone a bit too far \
	for it to matter now. It would seem we have flown too close to the sun and now we are in the midst of falling to our deaths. Of my remaining staff, six remain, a few are discussing making an \
	attempt to escape the facility but from my guess there isn't really an escape. The halls of the labs are now winding, changing, darkened and filled with the remains of our collegues. \
	More than once we've encountered the same lab, the same remains, the same room but heavily changed, as if everything within was an imperfect copy. Everything always folds back into itself in \
	some round about way or simply leads to dead ends. I write this final entry because I know were going to die down here. We made this hell and now we shall remain in it. Yet, nothing could have \
	prepared me for... It is better unwritten. If anyone finds this, know that you are in grave danger. We have laid traps where we can, fortified our positions, but it shall not help us.</p><br>\
	<br>The king rules forever, the king cannot die, the king is whoever's head fits the crown. The madman was right.<p></p>"
