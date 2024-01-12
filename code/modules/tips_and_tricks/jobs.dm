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

/tipsAndTricks/jobs/plants_are_dieing_gardener
    jobs_list = list(/datum/job/hydro)
    tipText = "As the gardener your exspected to maintain potted plants around the colony."

/tipsAndTricks/jobs/newsprint
    jobs_list = list(/datum/job/janitor)
    tipText = "Your bundle of newsprint will never run out of paper, make sure to keep those news casters all stocked up."

/tipsAndTricks/jobs/guild_resale_profit
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "As Lonestar, you should be buying up valuable things from scavengers and reselling them for a profit. Buy anything of value that's brought to you."

/tipsAndTricks/jobs/guild_price_scanner
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "There is a price scanner that can help you appraise items. Your PDA also has this scanner installed."

/tipsAndTricks/jobs/mines_are_danger
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "The mines might hold a lot of ore, but also a lot of danger. Nightmare Stalkers, Spiders, Roaches and other monsters are commonplace down there."

/tipsAndTricks/jobs/custom_venders
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "Always try to make use of your Custom Vending Machines when you can, they can sell products when you are busy making more deals. Other departments will love you for setting one up for them as well."
/* this one is outta date since forever
/tipsAndTricks/jobs/drillllls
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "The massive drills mine deep into the ground on the tile its drilling, upgrading it will increase its AOE to more tiles."
*/
/tipsAndTricks/jobs/diggyhole
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "The ground itself can be digged to get more ore with a shovel, this will likely give you rocks that can be hammered for more ore fragments."

/tipsAndTricks/jobs/the_wall_of_ore
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "You can use certain types of picks to mine the walls of the mines that are impassable and indestructible, this will yield more ore fragments without destroying the rock."

/tipsAndTricks/jobs/surface_mining
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "For those who want to avoid the dark, lonely, scary mines, you can go to the surface and find a nearby cave by the lakeside to mine out. Sadly, this will not get much ore but could be an interesting prospecting choice..."

/tipsAndTricks/jobs/survive
    jobs_list = list(/datum/job/foreman, /datum/job/mining, /datum/job/salvager, /datum/job/pro)
    tipText = "Don't die."

/tipsAndTricks/jobs/scrap_stuff
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Broken Devices, Scrap Metal, and Burnt Boards are all worth grabbing, as they can have random materials or at least some steel, glass and/or plastic."

/tipsAndTricks/jobs/scrap_ammo_uses
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Scrap ammo, while dealing less damage, has great uses for its availability, like shooting down lockers whenever a hacking tool is not available."

/tipsAndTricks/jobs/pointy_thing
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Daggers and knives when stabbed in the back of monsters and man alike will deal more damage than normal."

/tipsAndTricks/jobs/sell_things_you_hoarding_goblins
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Selling things to other departments is part of your job. Blackshield and Marshals like weapons and ammo, Soteria will always love getting materials and Research disks. The Guild (specially a Guild Master) would appreciate Curios, cable coils and materials."

/tipsAndTricks/jobs/your_perks_are_op
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "You have a perk that lets you tell at a glance what an anomaly on an oddity does, you can market this for a profit!"

/tipsAndTricks/jobs/captain_leader
    jobs_list = list(/datum/job/premier)
    tipText = "A wise man's advice is always listened to, because a wise man will never give bad advice."

/tipsAndTricks/jobs/captain_free_access
    jobs_list = list(/datum/job/premier)
    tipText = "You didn't pick this role for the ID, did you?"

/tipsAndTricks/jobs/captain_value_your_ship
    jobs_list = list(/datum/job/premier)
    tipText = "When two departments come into conflict, don't hesitate to smooth things over."

/tipsAndTricks/jobs/captain_is_overseer
    jobs_list = list(/datum/job/premier)
    tipText = "You have a vital out-of-character role; you are the quest-giver. If players lacks direction and the colony is getting restless or bored, give them something productive to do."

/tipsAndTricks/jobs/is_captain_right
    jobs_list = list(/datum/job/premier)
    tipText = "Listen to your fellow Council members. Their input is invaluable, specially in situations regarding their area of expertise."

/tipsAndTricks/jobs/engies_tribe
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Since ancient times, the Guild had trained the best Engineers in the galaxy. That is why you are called Master."

/tipsAndTricks/jobs/unlimitedpower
	jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
	tipText = "Solars aren't the only way to power up the colony! There is a Dam at the north side of the Guild controlled by a computer which will notify you through the Guild's communication channel when you can open the floodgates to generate power, as well as diesel and PACMAN-type generators that take different kinds of mats for fuel."

/tipsAndTricks/jobs/youaredamright
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "The computer that controls the Dam can detect if the turbines are functioning correctly. If they aren't, manually go check their condition by examining them. If there's debris blocking it, use a crowbar to pull it out. If the turbine is stalling out, pulsing it with a multitool will reset it to its default working state."

/tipsAndTricks/jobs/smithing
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "Entice clients to buy from you by reminding them you can print ANY kind of ammunition from the bullet fabricator, as well as produce interesting gun mods, armor mods, tool mods, and even a flaming sword!"

//	Supermatter tips commented out because we have progressed past the need for a Supermatter.
//	Might want to re-add these if we ever get the opportunity to build our own Supermatter engines.

//	/tipsAndTricks/jobs/engies_suppermatter_one
//	jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
//	tipText = "The super matter is a fickle mistress and each guild has their own set up method. No method is strictly wrong;those who made such poor choices would be dead by now, surely..."

//	/tipsAndTricks/jobs/engies_suppermatter_two
//	jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
//	tipText = "Venting the super matter's overheated coolant may drop temperatures immediately, but without fresh coolant gas the super matter will almost surely delaminate."

//	tipsAndTricks/jobs/engies_suppermatter_three
//	jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
//	tipText = "Woe betide the guild master who allows the crystal to delaminate, the number of such crystals dwindle. Any who cause such disgrace should go up with the engine rather than live with the shame."

/tipsAndTricks/jobs/engies_lifekeeper
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "You are responsible for keeping this colony powered, habitable, and with breathable air. Make sure it stays like that at all times."

/tipsAndTricks/jobs/engies_glass_fire
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "In case of fire, break glass."

/tipsAndTricks/jobs/engies_firespacesuit
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "No Adept lives long without learning that firesuits are not space-proof suits, and not all void suits are fireproof."

/tipsAndTricks/jobs/theBlackBox
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "The NanoForge can be powered with any oddity that boosts Mechanical knowledge and is also an Anomaly. The NanoForge Black Box will always have an Anomaly."

/tipsAndTricks/jobs/matterforgesnstuff
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "The NanoForge and Bullet Fabricator can both utilize refined scrap as a highly efficient source of matter."

/tipsAndTricks/jobs/bullet_fab
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "The Bullet Fabricator generates usable material points based on the worth of the material in cash. The more expensive the material used, the more usable material you'll get."

/tipsAndTricks/jobs/nanoforge
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "NanoForge makes compressed matter, this can fuel RCDs and RCD crossbows, but also is worth quite a lot of credits and makes great fuel in the Bullet Fabricator."

/tipsAndTricks/jobs/tric
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Inaprovaline and Dylovene can be mixed together to produce Tricordazine - a mild regenerative compound that can treat brute/burns/toxin damage and even suffocation. Be careful though, more than thirty units will cause a deadly overdose!"

/tipsAndTricks/jobs/reagent_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "There is a reagent scanner integrated in your PDA."

/tipsAndTricks/jobs/medical_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Your PDA has an integrated medical scanner."

/tipsAndTricks/jobs/cryo_bag_scanning
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Medical scanners work through body bags, allowing you to scan people currently inside them. This includes stasis bags as well."

/tipsAndTricks/jobs/detox_chem_clering
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Dylovene, when injected, will clear toxic chemicals like pararein, blattedin, and general toxins. When consumed orally, it will not purge these poisons but will still treat toxin accumulation damage."

/tipsAndTricks/jobs/gas_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/technomancer)
    tipText = "Inside of your PDA is an installed gas scanner."

/tipsAndTricks/jobs/carbonPills
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Carbon can be ingested to treat cases of poisoning and accidental overdose. 1u of carbon will remove 1u of anything in the stomach. This will not, however, purge chemicals in the bloodstream, nor will injecting carbon have the same effect."

/tipsAndTricks/jobs/inaprov
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Inaprovaline stabilize a patient in many ways and a go to chemical for critical patients."

/tipsAndTricks/jobs/spooder
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "Cht'mant are unaffected by Tricordazine, Kelotane, Dexalin, and Peridaxon, while Bicaridine is half as effective on them. Every other chem that isn't these will heal them normally."

/tipsAndTricks/jobs/spooder2
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "For Cht'mant, chemicals obtained from different roach meats will heal them like normal healing chems do to everyone else. Blattedin acts as Tricordazine, Diplopterum as Dexalin, Starkellin as Bicaridine, Seligitilin as Kelotane, Gewaltine as Dylovene and Fuhrerole as Peridaxon. Remember these overdose at 16 units and can be lethal!"

/tipsAndTricks/jobs/spooder3
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "You can grind roach meat on your industrial grinder for useful chemicals. Blattedin and Diplopterum can be obtained from almost every roach, while you can get Seligitillin from Seuche roaches, Gewaltine from Jagers, Starkellin from Panzers, and Fuhrerole from Fuhrers."

/tipsAndTricks/jobs/birb
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "Opifex breathe Nitrogen and are poisoned by Oxygen. By no means you should ever try and remove their special masks, not even for anesthesics. If you must perform surgery on one, administer either strong enough painkillers via injection or pills, or soporifics to avoid them suffering through the procedure."

/tipsAndTricks/jobs/overdose
	jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
	tipText = "Overdosing will cause adverse (and even lethal) effects to the patient until every single unit of the overdosing chemical is purged from their body. To treat overdose, first purge the overdosing chemical via Dyalisis or Stomach Pump on a Sleeper, or utilize 1u of Haloperidol for blood and Carbon pills for stomach. Only when it's all gone, treat the damage caused by it."

/tipsAndTricks/jobs/lid_draw
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "You can draw reagents from bottles with a syringe, even through a closed lid."

/tipsAndTricks/jobs/crewMonitorHelp
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "You can use the crew monitoring program on computers to locate injured colonists. It can be downloaded on tablets or laptops for a portable solution. Medical storage always has one tablet for this purpose at the start of every shift."

/tipsAndTricks/jobs/odysseus_boons
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "The Odysseus medical mecha is a reliable and fast transport vehicle used best by paramedics or doctors acting as paramedics. The syringe gun module can scan and produce chemicals to deliver on the fly (provided you load it with syringes) and the sleeper module allows you to transport and dose patients inside with basic chems for stabilization on the way to Medbay."

/tipsAndTricks/jobs/thermite
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "Thermite is a great way to take down walls."

/tipsAndTricks/jobs/grenades
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team, /datum/job/psychiatrist)
    tipText = "You can make grenades for various purposes, from harmful (like explosion or EMPs) to helpful (like cleaning and weed killing)."

/tipsAndTricks/jobs/cyborgsDontBreathe
    jobs_list = list(/datum/job/cyborg)
    tipText = "As a cyborg, you don't need oxygen/pressure to survive. You're also quite resistant to heat. Use it to your advantage."

/tipsAndTricks/jobs/cyborgsChargersAreAmazing
    jobs_list = list(/datum/job/cyborg)
    tipText = "Having a cyborg recharger with better manipulators will allow it to heal brute and burn based damage. It will, however, not repair broken plating or radios."

/tipsAndTricks/jobs/siliconRemoteControl
    jobs_list = list(/datum/job/cyborg, /datum/job/ai)
    tipText = "Silicons have the ability to remotely control machinery. You can open airlocks without bumping into them."

/tipsAndTricks/jobs/siliconShortcuts
    jobs_list = list(/datum/job/cyborg, /datum/job/ai)
    tipText = "Most machinery has keyboard shortcuts. Try alt/shift/ctrl clicking on some. For example- airlocks, air/fire alarms, APC."

/tipsAndTricks/jobs/siliconRemoteControlTwo
    jobs_list = list(/datum/job/cyborg, /datum/job/ai)
    tipText = "You can access some computer programs without interacting with actual computers using your \"Subsystems\", located in the silicon tab."

/tipsAndTricks/jobs/ai_can_controle_shells
    jobs_list = list(/datum/job/ai)
    tipText = "As an AI you can remotely control drone shells."

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
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist, /datum/job/cmo, /datum/job/doctor, /datum/job/recovery_team)
    tipText = "There is a program in your PDA called SIRC (Soteria Internal Reagent Catalogue) that can help you with chemistry."

/tipsAndTricks/jobs/drink_app
    jobs_list = list(/datum/job/clubworker, /datum/job/clubmanager)
    tipText = "There is a program in your PDA called Neon Cocktails that can help you with making drinks."

/tipsAndTricks/jobs/upgrade_dispender
    jobs_list = list(/datum/job/clubworker, /datum/job/clubmanager)
    tipText = "Your booze and soda dispenser can be hacked with a multitool to give more drink options. It can also be upgraded with advanced parts to charge faster, hold more power, and even make new drinks or chems."

/tipsAndTricks/jobs/upgrades
    jobs_list = list(/datum/job/rd, /datum/job/scientist)
    tipText = "There are many machines that can be upgraded, use an RPED on them to learn what parts it contains, and upgrade those with better ones to increase their efficiency."

/tipsAndTricks/jobs/upgrade_chemdispenders_sleeper
    jobs_list = list(/datum/job/rd, /datum/job/scientist)
    tipText = "Chem dispensers get more chemical capacity the higher their cell capacity is. Omega (Medium) cells are the best for them, don't waste Atomcells on them!"

/tipsAndTricks/jobs/bots
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Bots are tireless servants that you can create. No janitor? CleanBot to the rescue! Not enough medical staff? MedBot will at least patch them up! Lazy Gardener? Build a Gardenbot for them and charge them extra!"

/tipsAndTricks/jobs/ripley
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Ripley mech is an universal tool for a variety of tasks, be it mining, building, or deconstructing."

/tipsAndTricks/jobs/firefighter
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Ripley Firefighter is an enhanced version of the Ripley sporting more armor and being almost fire proof."

/tipsAndTricks/jobs/odysseus
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Odysseus is a reliable medical mech that can be used as a paramedic vehicle or mobile medical treatment machine."

/tipsAndTricks/jobs/gygax
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Gygax is a combat mech. It is a lighly armored, but rather mobile, nightmare to any threats the colony might face."

/tipsAndTricks/jobs/durand
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Durand is a combat mech. It is heavily armored and extra scary in confined spaces due to its Defense Mode."

/tipsAndTricks/jobs/phazon
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Phazon is a combat mech. It has the highest base movespeed, good armor, and can phase through anything thanks to stable bluespace technology."

/tipsAndTricks/jobs/wall_obelisk
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "Around some parts of the colony their are wall obelisks; they run on biomatter, so it might be wise to check them and refill them from time to time."

/tipsAndTricks/jobs/church_wine_anti_toxin
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "The Absolutism Cahors Wine can be drank to help combat toxin damage or injected to be a mild painkiller."

/tipsAndTricks/jobs/best_dagger_ever
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "The absolutism ritual knife can be thrown, this is useful for embedding the knife into someone's back. If thrown into someone that is also a follower of Absolutism, it is less likely to embed."

/tipsAndTricks/jobs/skyfall_timer
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "Scrap Beacon has a thirty minute delay before it can be used again."

/tipsAndTricks/jobs/plants_n_meat
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "If you're ever in need of biomatter, you can always buy or trade for plants and meat with Hunters or Gardener."

/tipsAndTricks/jobs/cleaning_carbine
    jobs_list = list(/datum/job/chaplain, /datum/job/acolyte)
    tipText = "The cleansing carbine as the name suggests fires cleaning pellets that when hit something will make a small bit of slippery foam that cleans. This can be used both defensively as lasting slip to get away from bigger foes and to normally clean the station if theirs no janitor around."

/tipsAndTricks/jobs/hunter_meds
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "Tatonkas located in the barn can be bred using wheat and then butchered for bones, leather, and animal parts you can turn into medicine in the crafting menu."

/tipsAndTricks/jobs/hunter_knife
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "Your tools are sacred, don't let anyone take or have your skinning knives. But you can still barter your halberds, crossbow, and armor."

/tipsAndTricks/jobs/hunter_stimulants
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "When cluckers are butchered they drop a feather that can be turned into a painkiller in the crafting menu. This can be useful when combined with milk taken from tatonkas to boost your defenses."

/tipsAndTricks/jobs/hunter_mutants
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "Tatonkas and cerberuses have a small chance of mutating everytime one grows up. These mutant variants are much more valuable and much more sought after, but quite rare."

/tipsAndTricks/jobs/hunter_allies
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "The cerberus hounds are far sighted and loyal animals who won't ever attack you, they make great hunting allies by acting as distractions against larger enemies and emitting growls when they spot enemies you haven't."
