#define SONG_AD_MECH /datum/sing/adeptus_mechanicus


// '/datum/song' is already used, so we use sing.
/datum/sing
	var/name = "Song"
	var/desc = "Report this to Kaz or R4d6 if you see this"
	var/list/song // Where the lyric are stored. Each line is a new variable in the list.

/datum/sing/adeptus_mechanicus
	name = "Adeptus Mechanicus"
	desc = "A prayer to the Omnissiah."
	song = list("From the weakness of the mind, Omnissiah save us.",
				"From the lies of the Antipath, circuit preserve us.",
				"From the rage of the Beast, iron protect us.",
				"From the temptations of the Fleshlord, silica cleanse us.",
				"From the ravages of the Destroyer, anima heal us.",
				"From this rotting cage of biomatter, Machine God set us free.",
				"...",
				"Omnissiah.",
				"...",
				"Omnissiah.",
				"...",
				"There is no truth in flesh, only betrayal.",
				"There is no strength in flesh, only weakness.",
				"There is no constancy in flesh, only decay.",
				"There is no certainty in flesh but death.",
				"...",
				"From the weakness of the mind, Omnissiah save us.",
				"From the lies of the Antipath, circuit preserve us.",
				"From the rage of the Beast, iron protect us.",
				"From the temptations of the Fleshlord, silica cleanse us.",
				"From the ravages of the Destroyer, anima heal us.",
				"From this rotting cage of biomatter, Machine God set us free.",
				"...",
				"Omnissiah.",
				"...",
				"Omnissiah.")
