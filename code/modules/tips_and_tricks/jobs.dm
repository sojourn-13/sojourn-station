// This file contains all gameplay tips that didnt fit into other categories
/tipsAndTricks/jobs
    var/list/jobs_list       //list of jobs to which tip can be shown
    textColor = "#22458d"

/tipsAndTricks/jobs/captain_boss
    jobs_list = list(/datum/job/premier)
    tipText = "As a premier, you function as an internal affairs agent, lawyer, and mediator."

/tipsAndTricks/jobs/ironhammer_theft
    jobs_list = list(/datum/job/smc, /datum/job/swo, /datum/job/supsec, /datum/job/inspector, /datum/job/medspec, /datum/job/trooper, /datum/job/officer, /datum/job/serg)
    tipText = "As a member of security, you have broad access to chase criminals. This does not mean you can take anything you have access to. Taking things from other departments is theft!"

/tipsAndTricks/jobs/guild_resale_profit
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech)
    tipText = "As the executive officer, you should be buying up valuable things from scavengers and reselling them for a profit. Buy anything of value that's brought to you."

/tipsAndTricks/jobs/guild_price_scanner
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech)
    tipText = "There is a price scanner that can help you evaluate items. Your PDA also has this scanner installed ."

/tipsAndTricks/jobs/captain_leader
    jobs_list = list(/datum/job/premier)
    tipText = "A wise man's advise is always listened to, because a wise man will never give bad advice."

/tipsAndTricks/jobs/captain_free_access
    jobs_list = list(/datum/job/premier)
    tipText = "You didn't pick this role for the ID, did you?"

/tipsAndTricks/jobs/captain_value_your_ship
    jobs_list = list(/datum/job/premier)
    tipText = "When two departments come into conflict, don't hesitate to smooth things over."

/tipsAndTricks/jobs/captain_is_overseer
    jobs_list = list(/datum/job/premier)
    tipText = "You have a vital out-of-character role; you are the quest-giver. If players lacks direction and the crew is getting restless, give them something productive to do."

/tipsAndTricks/jobs/is_captain_right
    jobs_list = list(/datum/job/premier)
    tipText = "Listen to your fellow council members, they're input is invaluable, in particular with situations regarding their area of expertise."

/tipsAndTricks/jobs/engies_tribe
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "In the ancient times, a guild trained the best in the land. That is why you are called master."

/tipsAndTricks/jobs/engies_suppermatter_one
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "The super matter is a fickle mistress and each guild has their own set up method. No method is strictly wrong;those who made such poor choices would be dead by now, surely..."

/tipsAndTricks/jobs/engies_suppermatter_two
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Venting the super matter's overheated coolant may drop temperatures immediately, but without fresh coolant gas the super matter will almost surely delaminate."

/tipsAndTricks/jobs/engies_suppermatter_three
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Woe betide the guild master who allows the crystal to delaminate, the number of such crystals dwindle. Any who cause such disgrace should go up with the engine rather than live with the shame."

/tipsAndTricks/jobs/engies_lifekeeper
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "You are responsible for keeping this colony alive. You need to do whatever you can to succeed."

/tipsAndTricks/jobs/engies_glass_fire
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "In case of fire, break glass."

/tipsAndTricks/jobs/engies_firespacesuit
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "No adept lives long without learning that firesuits are not space suits, and vice versa."

/tipsAndTricks/jobs/tric
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/chemist, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Inaprovaline and dylovene can be mixed together in a container to produce tricordazine - a mild regenerative compound that can treat brute/burns/toxin damage and even suffocation. Best of all, it has no overdose risk."

/tipsAndTricks/jobs/reagent_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/chemist, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "There is a reagent scanner integrated in your PDA."

/tipsAndTricks/jobs/medical_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Your PDA has an integrated medical scanner."

/tipsAndTricks/jobs/gas_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/technomancer)
    tipText = "Inside of your PDA is an installed gas scanner."

/tipsAndTricks/jobs/carbonPills
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/chemist, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Pills containing pure carbon can be ingested to treat cases of poisoning and accidental overdoes. 1u of carbon will remove 1u of anything in the stomach. This will not, however, purge chemicals in the bloodstream, nor will injecting carbon have the same effect."

/tipsAndTricks/jobs/inaprov
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/chemist, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Inaprovaline stabilize a patient in many ways and a go to chemical for critical patients."

/tipsAndTricks/jobs/lid_draw
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/chemist, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "You can draw a reagent from bottles with syringe through the lid."

/tipsAndTricks/jobs/crewMonitorHelp
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/paramedic)
    tipText = "You can use the crew monitoring program on computers to locate injured crew members. It can be downloaded on tablets or laptops for a portable solution. Medical storage always has one tablet for this purpose on roundstart."

/tipsAndTricks/jobs/thermite
    jobs_list = list(/datum/job/chemist)
    tipText = "Thermite is a great way to take down walls."

/tipsAndTricks/jobs/grenades
    jobs_list = list(/datum/job/chemist)
    tipText = "You can make grenades for various purposes, from harmful (like explosion or EMPs) to helpful (like cleaning and weed killing)."

/tipsAndTricks/jobs/cyborgsDontBreathe
    jobs_list = list(/datum/job/cyborg)
    tipText = "As a cyborg, you don't need oxygen/pressure to survive. You're also quite resistant to heat. Use it to your advantage."

/tipsAndTricks/jobs/siliconRemoteControl
    jobs_list = list(/datum/job/cyborg, /datum/job/ai)
    tipText = "Silicons have the ability to remotely control machinery. You can open airlocks without bumping into them."

/tipsAndTricks/jobs/siliconShortcuts
    jobs_list = list(/datum/job/cyborg, /datum/job/ai)
    tipText = "Most machinery has keyboard shortcuts. Try alt/shift/ctrl clicking on some. For example- airlocks, air/fire alarms, APC."

/tipsAndTricks/jobs/siliconRemoteControlTwo
    jobs_list = list(/datum/job/cyborg, /datum/job/ai)
    tipText = "You can access some computer programs without interacting with actual computers using your \"Subsystems\", located in the silicon tab."

/tipsAndTricks/jobs/pda_paper_scanner
    jobs_list = list(/datum/job/premier, /datum/job/cmo, /datum/job/chief_engineer, /datum/job/smc, /datum/job/pg, /datum/job/rd)
    tipText = "Your PDA has an integrated paper scanner and printer."

/tipsAndTricks/jobs/aiCanBeMoved
    jobs_list = list(/datum/job/ai)
    tipText = "The AI core can be unwrenched and moved to a safer location, but is trackable by power consumption."

/tipsAndTricks/jobs/expeditionsAreFUN
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Expeditions are FUN! Try participating in one."

/tipsAndTricks/jobs/prostheticsForTheMeek
    jobs_list = list(/datum/job/roboticist)
    tipText = "You can enhance the human body by installing prosthetics and modifications."

/tipsAndTricks/jobs/chem_app
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist, /datum/job/cmo, /datum/job/doctor, /datum/job/paramedic)
    tipText = "There is a program in your PDA called SIRC (Soteria Internal Reagent Catalogue) that can help you with chemistry."

/tipsAndTricks/jobs/drink_app
    jobs_list = list(/datum/job/clubworker, /datum/job/clubmanager)
    tipText = "There is a program in your PDA called Neon Cocktails that can help you with making drinks."

/tipsAndTricks/jobs/bots
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Bots are tireless servants that you can create. No janitor? CleanBot to the rescue! Not enough medical staff? MedBot will solve that."

/tipsAndTricks/jobs/ripley
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Ripley mech is an universal tool for a variety of tasks, be it mining, building, or deconstructing. It also has a rather strong melee attack."

/tipsAndTricks/jobs/odysseus
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Odysseus is a reliable medical mech that can be used as a paramedic vehicle or mobile medical treatment machine."

/tipsAndTricks/jobs/gygax
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Gygax is a combat mech. It is a lighly armored, but rather mobile, threat to any antagonist."

/tipsAndTricks/jobs/durand
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Durand is a combat mech. It is heavily armored and extra scary in confined spaces due to its punches and defense mode."

/tipsAndTricks/jobs/phazon
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Phazon is a combat mech. It has the highest base movespeed, good armor, and can phase through anything thanks to bluespace technology."
