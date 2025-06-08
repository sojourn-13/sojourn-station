
#define STALWART_THRESHOLD 30 // How damaged should owner be for Stalwart to be able to trigger

/datum/breakdown/positive/stalwart
	name = "Stalwart"
	duration = 0
	restore_sanity_post = 100

	start_messages = list(
		"You endure your pain well, and emerge in bliss.",
		"You feel like you could take on the world!",
		"Your pain no longer bothers you.",
		"You feel like the pain has cleared your head.",
		"You feel the pain, and you feel the gain!"
	)

/datum/breakdown/positive/stalwart/can_occur()
	return holder.owner.maxHealth - holder.owner.health > STALWART_THRESHOLD

/datum/breakdown/positive/stalwart/conclude()
	holder.owner.adjustBruteLoss(-25)
	holder.owner.adjustCloneLoss(-10)
	holder.owner.adjustFireLoss(-25)
	holder.owner.adjustOxyLoss(-45)
	holder.owner.reagents.add_reagent("tramadol", 5) // the way this works is silly as all fuck and should probably be fixed at some point
	..()

/datum/breakdown/positive/adaptation
	name = "Adaptation"
	duration = 0
	restore_sanity_post = 100

	start_messages = list(
		"You feel like your mind has been sharpened by your experiences.",
		"You feel like you're starting to get used to this.",
		"You feel mentally prepared.",
		"You feel like you're one step ahead.",
		"You feel like you have the upper hand."
	)

/datum/breakdown/positive/adaptation/conclude()
	holder.positive_prob = min(holder.positive_prob + 10, 100)
	holder.negative_prob = max(holder.negative_prob - 5, 0)
	holder.max_level = max(holder.max_level + 20, 0)
	..()

/datum/breakdown/positive/concentration
	name = "Absolute Concentration"
	duration = 20 MINUTES

	start_messages = list(
		"You focus and feel your mind turning inward.",
		"You have taken the first step toward enlightenment.",
		"You are disconnected from the world around you.",
		"You have become iron willed.",
		"Nothing phases you anymore."
	)

/datum/breakdown/positive/concentration/New()
	..()
	restore_sanity_pre = holder.max_level

/datum/breakdown/positive/concentration/occur()
	++holder.sanity_invulnerability
	return ..()

/datum/breakdown/positive/concentration/conclude()
	--holder.sanity_invulnerability
	..()

/datum/breakdown/positive/determination
	name = "Determination"
	duration = 10 MINUTES
	restore_sanity_pre = 100

	start_messages = list(
		"You feel invincible!",
		"You are unstoppable, you are unbreakable!",
		"You feel a rush of adrenaline in your veins. Nothing can hurt you now!",
		"You've learned to brush off wounds that would kill lesser beings!",
	)
	end_messages = list(
		"The last drop of adrenaline leaves your veins. You feel like a normal human now.",
	)

/datum/breakdown/positive/determination/occur()
	++holder.owner.shock_resist
	return ..()

/datum/breakdown/positive/determination/conclude()
	--holder.owner.shock_resist
	..()

/datum/breakdown/positive/lesson
	name = "A Lesson Learned"
	duration = 0
	restore_sanity_post = 100

	start_messages = list(
		"You feel like you've learned from your experience.",
		"Something in your mind clicks. You feel more competent!",
		"You manage to learn from past mistakes.",
		"You take in the knowledge of your past experiences.",
		"Everything makes more sense now!"
	)

/datum/breakdown/positive/lesson/conclude()
	for(var/stat in ALL_STATS_FOR_LEVEL_UP)
		holder.owner.stats.changeStat(stat, rand(1,3))
	..()
