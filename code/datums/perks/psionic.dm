/datum/perk/psion
	name = "Psionic"
	desc = "You have, through some method you may or may not understand, delved into the secrets of psionic ascension and gained powers beyond your understanding. While your mind has become far stronger, \
	your body has weakened slightly. You take increased damage from all sources and require a bit more food to support the specialized organs you've developed. Additionally, you must always maintain \
	purity of body, any implants, cruciforms, or synthetics will be violently rejected as long as your psionic organ is in your head."
	gain_text = "You suddenly get a splitting headache before your vision blurs painfully. By the time its over, you feel like a whole new world of possibilities has opened for you."
	icon_state = "psionic"
	copy_protected = TRUE

/datum/perk/psion/assign(mob/living/L)
	..()
	holder.maxHealth -=20
	holder.health -=20

/datum/perk/psion/remove()
	holder.maxHealth +=20
	holder.health +=20
	..()

/datum/perk/psi_mania
	name = "Psionic Psychosis"
	desc = "You lived a life of unsettled violence. Maybe it was circumstance, maybe it was necessity, or maybe you just liked hurting people. No matter the reason, your mind is attuned to bloody \
	violence and your potential as a psion reflects that. No matter your stats or physical body, you always deal maximum damage when using scaling psionic weaponry you create."
	icon_state = "psionicpsychosis"
	copy_protected = TRUE

/datum/perk/psi_harmony
	name = "Psionic Harmony"
	desc = "You have achieved inner harmony, your balance of emotion giving you peace of mind and thus expanding your potential as a psion. With this frame of mind, you retain a \
	higher maximum psi pool than others, increasing your capacity by two."
	icon_state = "psionicharmony"
	copy_protected = TRUE

/datum/perk/psi_attunement
	name = "Psionic Attunement"
	desc = "You have, through practice or innate talent, mastered your psionic abilities to such a degree that you have greater control of the negative side effects of your powers. Whenever you \
	use a psionic power that has a negative side effects, you take only half the penalties a psion normally would. Equally, some lesser powers like telepathic projection and telekinetic prowess \
	no longer cost essence to use."
	icon_state = "psionicattunement"
	copy_protected = TRUE

/datum/perk/psi_psychology
	name = "Mind Master"
	desc = "Your training as a Soteria psychologist and understanding of psychiatry has given you a deep understanding of how the mind works. As a result, if you became a psion, you have an \
	expanded set of powers that aid you in your work, with additional essence to use your abilities."
	icon_state = "mindmaster"
	copy_protected = TRUE

/datum/perk/psi_grace
	name = "Psionic Grace"
	desc = "The latent effects of a fellow psion with mastery over the mind has enhanced your abilities. The gifted enhancement allows you to recover your psi essence twice as fast."
	gain_text = "You feel completely at peace for a moment, the workings of mind, body, and the space beyond suddenly becomes but a play thing for your mind. The feeling is fleeting, but the effects \
	are lasting."
	copy_protected = TRUE

/datum/perk/psi_peace_of_the_psion
	name = "Mind over Matter"
	desc = "You felt the grace of a psion touching your mind and bringing about a level of peace and perfection you never quite considered. Now, as a result, your body and mind work \
	beyond any potential they once had."
	gain_text = "Everything falls into place, all things become clear. You feel stronger, more alert, quicker. You have not attained perfection but you feel you are closer than ever before \
	and the last mental block you had has been removed, the flood gates of success filling your mind."
	copy_protected = TRUE

/datum/perk/psi_peace_of_the_psion/assign(mob/living/L)
	..()
	holder.stats.changeStat(STAT_ROB, 10)
	holder.stats.changeStat(STAT_TGH, 10)
	holder.stats.changeStat(STAT_VIG, 10)
	holder.stats.changeStat(STAT_COG, 10)
	holder.stats.changeStat(STAT_MEC, 10)
	holder.stats.changeStat(STAT_BIO, 10)

/datum/perk/psion/remove()
	holder.stats.changeStat(STAT_ROB, -10)
	holder.stats.changeStat(STAT_TGH, -10)
	holder.stats.changeStat(STAT_VIG, -10)
	holder.stats.changeStat(STAT_COG, -10)
	holder.stats.changeStat(STAT_MEC, -10)
	holder.stats.changeStat(STAT_BIO, -10)
	..()
