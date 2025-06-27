#define BREAKDOWN_ALERT_COOLDOWN rand(45 SECONDS, 90 SECONDS)

/datum/breakdown/positive
	start_message_span = "bold notice"
	icon_state = "positive"
	breakdown_sound = 'sound/sanity/sane.ogg'

/datum/breakdown/negative
	start_message_span = "danger"
	restore_sanity_pre = 25
	icon_state = "negative"
	breakdown_sound = 'sound/sanity/insane.ogg'
	is_negative = TRUE

/datum/breakdown/common
	start_message_span = "danger"
	restore_sanity_pre = 25
	icon_state = "negative"
	breakdown_sound = 'sound/sanity/insane.ogg'

