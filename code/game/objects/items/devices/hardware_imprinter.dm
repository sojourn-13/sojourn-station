/obj/item/device/hardware_imprinter
	name = "hardware imprinter"
	desc = "A device of dubious origins and quality used to help install modules for cerebral interface."
	icon_state = "hardware_imprinter"
	origin_tech = list(TECH_BIO = 5, TECH_ILLEGAL = 2)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 2)
	matter_reagents = list("uncap nanites" = 10)
	var/perk_imprinting = PERK_SOMELLIER //Perk we are giving away with this
	var/perk_imprinting_forbidden = PERK_SOMELLIER //Perk we don't want to stack with this (IE: Smartlink incompatible with Instinctual Skill)
	var/spent = FALSE
	price_tag = 1200
	var/has_health_downside = TRUE
	var/has_blood_downside = TRUE
	var/has_nsa_downside = TRUE

/obj/item/device/hardware_imprinter/proc/imprint(mob/living/carbon/human/user)//Janked up mental imprinter code
	if(spent)//Is it already used up or not
		return

	if(user.stats.getPerk(perk_imprinting) || user.stats.getPerk(perk_imprinting_forbidden) || user.species.reagent_tag == IS_SYNTHETIC || user.random_organ_by_process(BP_PSION))//What perks stop this from being usable to prevent things like kriosans getting double recoil reduction
		return//Also no synths to prevent memes

	if(!istype(user) || user.incapacitated() || user.get_active_hand() != src)//Checks for sanity
		return

	if(length(user.get_covering_equipped_items(EYES))) //If we have covered eyes or not
		return

	user.stats.addPerk(perk_imprinting) //What perk we are imprinting
	to_chat(user, SPAN_DANGER("[src] plunges into your eye, installing new hardware!"))
	playsound(usr, 'sound/effects/refill.ogg', 50, -5)
	user.emote("painscream")//It is drilling into you so yeah bit painful

	spent = TRUE
	price_tag = 30

	if(has_health_downside)
		user.maxHealth -= 5
		user.health -= 5

	if(has_blood_downside)
		if(user.species && user.species.flags & NO_BLOOD) //We want the var for safety but we can do without the actual blood.
			return
		user.vessel.maximum_volume  -= 20
		user.drip_blood(20)

	if(has_nsa_downside)
		user.metabolism_effects.nsa_bonus -= 15
		user.metabolism_effects.calculate_nsa()


/obj/item/device/hardware_imprinter/attack(mob/M, mob/living/carbon/human/user, target_zone)//These are actually what affect if we can use it or not at all
	if(spent)//If it's spent we can't use it
		to_chat(user, SPAN_WARNING("[src] beeps, notifying you that it's spent!"))
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5)
		return ..()
	if(user.stats.getPerk(perk_imprinting) || user.stats.getPerk(perk_imprinting_forbidden) || user.species.reagent_tag == IS_SYNTHETIC || user.random_organ_by_process(BP_PSION)) //Reason we check for the perk we are printing too is that you don't waste one for nothing
		to_chat(user, SPAN_WARNING("[src] beeps, refusing you as host!"))//No synths or psions
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5) //Why did I make this get checked twice who will honestly ever know not like it matters this runs once and never again.
		return ..()
	if(!istype(user) || M != user || target_zone != BP_EYES || user.incapacitated())
		to_chat(user, SPAN_WARNING("[src] beeps, being unable to operate on you under current conditions!"))
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5)
		return ..()
	if(length(user.get_covering_equipped_items(EYES)))
		to_chat(user, SPAN_WARNING("You need to remove the eye covering first."))
		playsound(usr, 'sound/machines/buzz-two.ogg', 20, -5)
		return ..()//Beeps and messages to actually let player know that they need to do something to continue

	INVOKE_ASYNC(src, PROC_REF(imprint), user)

/obj/item/device/hardware_imprinter/examine(mob/user)
	. = ..()
	if(spent)
		to_chat(user, SPAN_WARNING("It is spent."))//What message should show when we are examining it

/obj/item/device/hardware_imprinter/smartlink
	name = "smartlink imprinter"
	desc = "An installer for augment favored by professional mercenaries linking your brain throught your arms directly into your weapons allowing for god-like precision even from beginners."
	perk_imprinting = PERK_SMARTLINK
	perk_imprinting_forbidden = PERK_PERFECT_SHOT

/obj/item/device/hardware_imprinter/cogenhance
	name = "cognitive enhancer imprinter"
	desc = "An installer for augment used by both militaries and scientific groups. It boosts processing capacity of it's users brain allowing them to think way faster on their feet than most mortals can."
	perk_imprinting = PERK_COGENHANCE
	perk_imprinting_forbidden = PERK_INSPIRED

/obj/item/device/hardware_imprinter/chemneutral
	name = "chemical neutralizer imprinter"
	desc = "An installer for augment used by corporates to avoid headaches from partying too hard, due to it's price it's not affordable by most people that actually need it and as such is often demonized as enabler for hedonism."
	perk_imprinting = PERK_CHEMNEUTRAL
	perk_imprinting_forbidden = PERK_ADDICT//Not a way to cure your addiction sorry bud
	has_nsa_downside = FALSE //dosnt have the nsa limits as it affects nsa directly

//ERT + Agent stuff.

/obj/item/device/hardware_imprinter/spaceasshole
	name = "Brawnee nano-augment implanter"
	desc = "An installer for an augment used by a wide variety of military and paramilitary forces. Strands of nanite-augmented pseudo-ligament are weaved between the users muscles, paired with a neuro-reactive interface that allows nearly instant response to losses in balance make the users astoundingly difficult to push around or over."
	perk_imprinting = PERK_ASS_OF_CONCRETE
	perk_imprinting_forbidden = PERK_ASS_OF_CONCRETE
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE


/obj/item/device/hardware_imprinter/codlang
	name = "EZ-Codlang imprinter"
	desc = "An installer for an augment used by a wide variety of police forces. Often shunned by instruction officers, this implant provides the user a suite of learning and assistance tools that allow for on-the-fly use of a pre-programmed code system with real time user feedback. Claims to cut time-to-learn from months to days."
	perk_imprinting = PERK_CODESPEAK
	perk_imprinting_forbidden = PERK_CODESPEAK
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/contraband
	name = "EZ-Chemtraband imprinter"
	desc = "An installer for an augment used by a wide variety of police forces. Often shunned by instruction officers, this implant provides the user a suite of learning and assistance tools that allow for on-the-fly use of a chemical database tailored to narco task forces via on-the-fly instruction and real time user feedback."
	perk_imprinting = PERK_CHEM_CONTRABAND
	perk_imprinting_forbidden = PERK_CHEM_CONTRABAND
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/boltraining
	name = "EZ-Rifleman imprinter"
	desc = "An installer for an augment used by a wide variety of paramilitary forces. Well beloved by colonies in the eras prior to the harrowing for the ease with which it could prepare an entire rag tag militia for battle, this sub-conscious assistic implant helps guide the users movement allowing for outstanding handling of bolt and lever style weapons."
	perk_imprinting = PERK_BOLT_REFLECT
	perk_imprinting_forbidden = PERK_BOLT_REFLECT
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/conditioning
	name = "Sub-Dermal plating implanter"
	desc = "An installer for an augment used by mercenaries and military alike. Relatively simple by modern standards, this implant forms a single nanite 'hub' within the lymphatic system from which nanomachines flow in a constant stream, making minor but constant reinforcements to ligament, tendons, and bone"
	perk_imprinting = PERK_BLACKSHIELD_CONDITIONING
	perk_imprinting_forbidden = PERK_BLACKSHIELD_CONDITIONING
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/surestep
	name = "Scav-step imprinter"
	desc = "An installer for an augment by and for pirates, looters and anyone else who might want to spend an extended time picking around blown out ruins. Mental assistics coupled with ligament reinforcements in the ankle aid in keeping ones footing on uncertain terrain. "
	perk_imprinting = PERK_SURE_STEP
	perk_imprinting_forbidden = PERK_SURE_STEP
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/medexpert
	name = "EZ-Surgeon imprinter"
	desc = "An installer for an augment popular amongst wealthy and overworked ER docs. Kinesthetic assistics pair with a sub-ai program designed to provide real time feedback to surgeons in the operating theater, correcting for errors and preventing incidents."
	perk_imprinting = PERK_MEDICAL_EXPERT
	perk_imprinting_forbidden = PERK_MEDICAL_EXPERT
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/medadept
	name = "EZ-Doc imprinter"
	desc = "An installer for an augment used primarily first year med students. A relatively simple sub-ai program designed to assist in providing basic medical guidence and assistance in the operation of more common medical devices."
	perk_imprinting = PERK_ADVANCED_MEDICAL
	perk_imprinting_forbidden = PERK_ADVANCED_MEDICAL
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/chemist
	name = "EZ-Chem imprinter"
	desc = "An installer for an augment well loved by both black-market drug rings and aspiring chemists. A veritable encyclopedia of many of the most common devices found in any self respecting chemists lab. "
	perk_imprinting = PERK_CHEMIST
	perk_imprinting_forbidden = PERK_CHEMIST
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/science
	name = "EZ-Science imprinter"
	desc = "An installer for an augment typically favored by students of the hard-sciences. A sub-ai program with a direct neural link, while it may not endow its user with any particular intelligence it can at the last guide them in using the most common hardware in any modern research facility. "
	perk_imprinting = PERK_SI_SCI
	perk_imprinting_forbidden = PERK_SI_SCI
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/exotic
	name = "CHO-pwr installer"
	desc = "An installer for an augment that frankly, should not be allowed to exist. An artificers guild design, this ethanol powered co-processor assists the user in the broad majority of mechanical tasks facing an engineer on a day to day basis."
	perk_imprinting = PERK_INSPIRATION
	perk_imprinting_forbidden = PERK_INSPIRATION
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE

/obj/item/device/hardware_imprinter/handy
	name = "EZ-Arti imprinter "
	desc = "An installer for an augment guarded jealously by the Artificers guild. Whereas many adepts rely on more traditional means of learning the guilds various craft this imprinter exists to stamp the information almost directly into ones mind, as a nice side effect it also assists in more efficient disassembly of machines. "
	perk_imprinting = PERK_HANDYMAN
	perk_imprinting_forbidden = PERK_HANDYMAN
	has_health_downside = FALSE
	has_blood_downside = FALSE
	has_nsa_downside = FALSE
