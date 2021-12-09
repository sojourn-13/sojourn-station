//////////////////////////////
//			Psionic Catalysts
//////////////////////////////
// These are usually collected by killing psionic monsters and finding them within the ashes of the left over bodies. See conquest_powers.dm for there power code. -Kaz

/obj/item/device/psionic_catalyst
	name = "psionic catalyst: "
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	"
	icon = 'icons/obj/device.dmi'
	icon_state = "psi_catalyst"
	item_state = "psi_catalyst"
	origin_tech = list(TECH_BIO = 9, TECH_MATERIAL = 9, TECH_PLASMA = 3)
	matter = list(MATERIAL_GLASS = 1, MATERIAL_PLASTEEL = 2, MATERIAL_PLASMA = 1, MATERIAL_DIAMOND = 1)
	price_tag = 0
	var/obj/item/organ/internal/psionic_tumor/proc/stored_power

/obj/item/device/psionic_catalyst/nightmare_mind
	name = "psionic catalyst: Nightmarish Thoughts"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	Within this catalyst is the collected psyche of... other things, a certain restructuring of your thoughts may yet let you find allies elsewhere, in darker places."
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/nightmare_mind

/obj/item/device/psionic_catalyst/bring_darkness
	name = "psionic catalyst: Bring Darkness"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	Some things are better left hidden from the warmth of the light."
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/bring_darkness

/obj/item/device/psionic_catalyst/rust
	name = "psionic catalyst: Rust"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	It is better this way. It will eventually be this way. We all will."
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/rust

/obj/item/device/psionic_catalyst/decay
	name = "psionic catalyst: Decay"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	Progress must sometimes be forced and such advancements can be useful."
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/decay

/obj/item/device/psionic_catalyst/dream_seeker
	name = "psionic catalyst: Dream Seeker"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	A curious person may not like what must be sacrificed pursuing the truth. Perhaps it will find them first?"
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/seek_the_dream

/obj/item/device/psionic_catalyst/kings_decorum
	name = "psionic catalyst: Kings Decorum"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	What a wonderful world..."
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/kings_decorum

/obj/item/device/psionic_catalyst/heretical_ascension
	name = "psionic catalyst: Heretical Ascension"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	To grasp at perfection, to reach farther than one ever could, to be Icarus and soar beneath the sun instead of falling to hubris. Shall that be your fate?"
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/merge_flesh_and_steel

/obj/item/device/psionic_catalyst/psionic_ascension
	name = "psionic catalyst: Psionic Ascension"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	The creation of more of our kind is sacrosanct, to allow more to see beyond the veil of reality is to bring more minds, more eyes, to what we wish to show them."
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/ascend_another

/obj/item/device/psionic_catalyst/cerebral_hemorrhage
	name = "psionic catalyst: Cerebral Hemorrhage"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	A sturdy mind is destroyed by revelation, a weak mind is eviscerated."
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/cerebral_hemorrhage

/obj/item/device/psionic_catalyst/enslavement
	name = "psionic catalyst: Enslavement"
	desc = "Psionic catalysts, other worldly items not quite understood, but valuable for the powers they may grant a psion. To everyone else, they have research value in a deconstructor or may be \
	recycled for the somewhat rare materials that make them. Holding it feels... wrong. Even to an unattuned mind, one can hear the faintly glowing object whispering, the discordant voices say: \
	Kneel."
	stored_power = /obj/item/organ/internal/psionic_tumor/proc/mind_jack

/obj/item/device/psionic_catalyst/Initialize()
	. = ..()
	src.transform *= 0.5

/obj/item/device/psionic_catalyst/verb/invoke_power(var/mob/living/carbon/human/M)
	set name = "Invoke Psionic Catalyst"
	set desc = "Invoke the psionic potential within the catalyst, adding a copy of its power to your own."
	set category = "Object"

	if(!usr.stats.getPerk(PERK_PSION))
		to_chat(usr, "<span class='notice'>You lack the psionic potential to invoke this.</span>")
		return

	playsound(src.loc, 'sound/hallucinations/ghosty_wind.ogg', 25, 1)
	to_chat(usr, "You invoke the power left within this catalyst, copying a fraction of its remembered strength and adding it to your own.")
	var/obj/item/organ/internal/psionic_tumor/tumor = M.random_organ_by_process(BP_PSION)
	tumor.owner_verbs |= stored_power
	tumor.verbs |= stored_power

// Putting this here since its easier to reference. -Kaz
/obj/random/psi_catalyst
	name = "random lesser psi_catalyst"
	icon_state = "ammo-green"

/obj/random/psi_catalyst/item_to_spawn()
	return pickweight(list(
				/obj/item/device/psionic_catalyst/nightmare_mind = 8,
				/obj/item/device/psionic_catalyst/bring_darkness = 10,
				/obj/item/device/psionic_catalyst/rust = 10,
				/obj/item/device/psionic_catalyst/decay = 10,
				/obj/item/device/psionic_catalyst/dream_seeker = 10,
				/obj/item/device/psionic_catalyst/kings_decorum = 10,
				/obj/item/device/psionic_catalyst/psionic_ascension = 10,
				/obj/item/device/psionic_catalyst/heretical_ascension = 1))