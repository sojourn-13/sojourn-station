#define SONG_AD_MECH /datum/sing/adeptus_mechanicus
#define SONG_EDF /datum/sing/edf

// '/datum/song' is already used, so we use sing.
/datum/sing
	var/name = "Song"
	var/desc = "Report this to Kaz or R4d6 if you see this"
	var/list/song // Where the lyric are stored. Each line is a new variable in the list.

/datum/sing/adeptus_mechanicus
	name = "Adeptus Mechanicus"
	desc = "A prayer to the Omnissiah."
	song = list("From the weakness of the mind, Omnissiah, save us.",
				"From the lies of the Antipath, Circuit, preserve us.",
				"From the rage of the Beast, Iron, protect us.",
				"From the temptations of the Fleshlord, Silica, cleanse us.",
				"From the ravages of the Destroyer, Anima, heal us.",
				"From this rotting cage of biomatter, Machine God, set us free.",
				"",
				"Omnissiah.",
				"",
				"Omnissiah.",
				"",
				"There is no truth in flesh, only betrayal.",
				"There is no strength in flesh, only weakness.",
				"There is no constancy in flesh, only decay.",
				"There is no certainty in flesh but death.",
				"",
				"From the weakness of the mind, Omnissia,h save us.",
				"From the lies of the Antipath, Circuit, preserve us.",
				"From the rage of the Beast, Iron, protect us.",
				"From the temptations of the Fleshlord, Silica, cleanse us.",
				"From the ravages of the Destroyer, Anima, heal us.",
				"From this rotting cage of biomatter, Machine God, set us free.",
				"",
				"Omnissiah.",
				"",
				"Omnissiah.")

/datum/sing/edf
	name = "EDF Song"
	desc = "Even in the face of impossible odds, the EDF doesn't stand down."
	song = list("To save our mother Earth from any alien attack.",
				"From vicious giant insects who have once again come back.",
				"We'll unleash all our forces, we won't cut them any slack.",
				"The EDF deploys!",
				"",
				"Our soldiers are prepared for any alien threats.",
				"The navy launches ships, the air force send their jets.",
				"And nothing can withstand our fixed bayonets.",
				"The EDF deploys!",
				"",
				"Our forces have now dwindled and we pull back to regroup.",
				"The enemy has multiplied and formed a massive group.",
				"We better beat these bugs before we're all turned to soup.",
				"The EDF deploys!",
				"",
				"To take down giant insects who came from outer space.",
				"We now head underground, for their path we must retrace.",
				"And find their giant nest and crush the queen's carapace.",
				"The EDF deploys!",
				"",
				"The air force and the navy were destroyed or cast about.",
				"Scouts, rangers, wing divers have almost been wiped out.",
				"Despite all this the infantry will stubbornly hold out.",
				"The EDF deploys!",
				"",
				"Our friends were all killed yesterday, as were our families.",
				"Today we might not make it, facing these atrocities.",
				"We'll never drop our banner despite our casualties.",
				"The EDF deploys!",
				"",
				"Two days ago my brother died, next day my lover fell.",
				"Today most everyone was killed, on that we must not dwell.",
				"But we will never leave the field, we'll never say farewell.",
				"The EDF deploys!",
				"",
				"A legendary hero soon will lead us to glory.",
				"Eight years ago he sunk the mothership says history.",
				"Tomorrow we will follow this brave soul to victory.",
				"The EDF deploys!")
