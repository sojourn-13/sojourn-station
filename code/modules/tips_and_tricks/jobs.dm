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
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "As Lonestar, you should be buying up valuable things from scavengers and reselling them for a profit. Buy anything of value that's brought to you."

/tipsAndTricks/jobs/guild_price_scanner
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "There is a price scanner that can help you evaluate items. Your PDA also has this scanner installed ."

/tipsAndTricks/jobs/mines_are_danger
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "The mines can hold a lot of ore, but also danger. Nightmare Stalkers, Spiders, Roaches and other monsters are common place down their."

/tipsAndTricks/jobs/custom_venders
    jobs_list = list(/datum/job/merchant, /datum/job/cargo_tech, /datum/job/mining)
    tipText = "Always try to make use of your Custom Vending Machines when you can, they can sell products when you are busy making more deals. Other departments will love you for setting one up for them as well."

/tipsAndTricks/jobs/drillllls
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "The massive drills mine into the deep ground on the tile its drilling, upgrading it will increase its AOE to more tiles."

/tipsAndTricks/jobs/diggyhole
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "The ground itself can be digged to get more ore with a shovel, this will likely give you rocks that can be hammered on for more ore fragments."

/tipsAndTricks/jobs/the_wall_of_ore
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "You can mine out with some types of picks the walls of the mines that are impassable, this will make more ore fragments."

/tipsAndTricks/jobs/surface_mining
    jobs_list = list(/datum/job/cargo_tech, /datum/job/mining)
    tipText = "For those that want to avoid the dark, lonely, scary mines, you can go to the surface and in fine a cave by the lakeside to mine out. Sadly this will not get much ore but could be fun."

/tipsAndTricks/jobs/survive
    jobs_list = list(/datum/job/foreman, /datum/job/mining, /datum/job/salvager, /datum/job/pro)
    tipText = "Dont die."

/tipsAndTricks/jobs/scrap_stuff
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Broken Devices, Scrap Metal, and Burnt Boards are all worth grabbing, as it can have random materails and good for steel glass and plastic."

/tipsAndTricks/jobs/scrap_ammo_uses
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Scap ammo well dealing less damage, has great uses at shooting down lockers when ever a hacker is not available."

/tipsAndTricks/jobs/pointy_thing
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Daggers and knifes when stabbed in the back of monsters and man alike will deal more damage then normal."

/tipsAndTricks/jobs/sell_things_you_hoarding_goblins
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "Selling things to other departments is apart of your job, Blackshield and Marshals like weapon and ammo, Soteria would love materals as would the Guild."

/tipsAndTricks/jobs/your_perks_are_op
    jobs_list = list(/datum/job/foreman, /datum/job/salvager, /datum/job/pro)
    tipText = "You have a perk that lets you tell at a glance what an anomaly on an oddity does, you can market this for a proffit!"

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

/tipsAndTricks/jobs/theBlackBox
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "The NanoForge can be powered with any oddity that both has mechanical and an anomaly. The NanoForge Black Box will always have an anomaly."

/tipsAndTricks/jobs/bullet_fab
    jobs_list = list(/datum/job/chief_engineer, /datum/job/technomancer)
    tipText = "The Bullet Fabricator gets its points based on the worth of the material not what they are made of."

/tipsAndTricks/jobs/tric
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/orderly, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Inaprovaline and dylovene can be mixed together in a container to produce tricordazine - a mild regenerative compound that can treat brute/burns/toxin damage and even suffocation. Be careful though, more than thirty units will cause a deadly overdose!"

/tipsAndTricks/jobs/reagent_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/orderly, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "There is a reagent scanner integrated in your PDA."

/tipsAndTricks/jobs/medical_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Your PDA has an integrated medical scanner."

/tipsAndTricks/jobs/cryo_bag_scanning
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Medical scanners work through cryo bags, allowing you to scan people currently inside them, including stasis bags."

/tipsAndTricks/jobs/detox_chem_clering
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Dylovene, when injected, will clear toxic chemicals like pararein, blattedin, and general toxins. Dylovene when eaten does not have this affect."

/tipsAndTricks/jobs/gas_scanner_pda
    jobs_list = list(/datum/job/cmo, /datum/job/technomancer)
    tipText = "Inside of your PDA is an installed gas scanner."

/tipsAndTricks/jobs/carbonPills
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/orderly, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Pills containing pure carbon can be ingested to treat cases of poisoning and accidental overdoes. 1u of carbon will remove 1u of anything in the stomach. This will not, however, purge chemicals in the bloodstream, nor will injecting carbon have the same effect."

/tipsAndTricks/jobs/inaprov
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/orderly, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "Inaprovaline stabilize a patient in many ways and a go to chemical for critical patients."

/tipsAndTricks/jobs/lid_draw
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/orderly, /datum/job/psychiatrist, /datum/job/paramedic)
    tipText = "You can draw a reagent from bottles with syringe through the lid."

/tipsAndTricks/jobs/crewMonitorHelp
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/paramedic)
    tipText = "You can use the crew monitoring program on computers to locate injured crew members. It can be downloaded on tablets or laptops for a portable solution. Medical storage always has one tablet for this purpose on roundstart."

/tipsAndTricks/jobs/odysseus_boons
    jobs_list = list(/datum/job/cmo, /datum/job/doctor, /datum/job/paramedic)
    tipText = "The Odysseus medical mecha is a reliable and fast transport vehicle used best by paramedics or doctors acting as paramedics. The syringe gun module can scan and produce chemicals to deliver on the fly, provided you load it with syringes and the sleeper modules will put patients in stasis while treating their injuries."

/tipsAndTricks/jobs/thermite
    jobs_list = list(/datum/job/doctor)
    tipText = "Thermite is a great way to take down walls."

/tipsAndTricks/jobs/grenades
    jobs_list = list(/datum/job/doctor)
    tipText = "You can make grenades for various purposes, from harmful (like explosion or EMPs) to helpful (like cleaning and weed killing)."

/tipsAndTricks/jobs/cyborgsDontBreathe
    jobs_list = list(/datum/job/cyborg)
    tipText = "As a cyborg, you don't need oxygen/pressure to survive. You're also quite resistant to heat. Use it to your advantage."

/tipsAndTricks/jobs/cyborgsChargersAreAmazing
    jobs_list = list(/datum/job/cyborg)
    tipText = "Having a cyborg recharger with better manipulators will allow it to heal brute and burn based damage."

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
    tipText = "As an AI you can controle drone shells inside drone fabricators."

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

/tipsAndTricks/jobs/upgrade_dispender
    jobs_list = list(/datum/job/clubworker, /datum/job/clubmanager)
    tipText = "Your booze and soda dispenser can be hacked with a multitool to give more drink options. It also can be upgraded with advanced parts to charge faster, hold more power, and even make new drinks or chems."

/tipsAndTricks/jobs/upgrades
    jobs_list = list(/datum/job/rd, /datum/job/scientist)
    tipText = "There are many machines that can be upgraded, use an RPED on things to learn its parts and if it can be upgraded."

/tipsAndTricks/jobs/upgrade_chemdispenders_sleeper
    jobs_list = list(/datum/job/rd, /datum/job/scientist)
    tipText = "A sleeper machine must be deconstructed and put back together to upgrade itself properly, similar to replacing a chemical dispencers power cell."

/tipsAndTricks/jobs/bots
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "Bots are tireless servants that you can create. No janitor? CleanBot to the rescue! Not enough medical staff? MedBot will solve that."

/tipsAndTricks/jobs/ripley
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Ripley mech is an universal tool for a variety of tasks, be it mining, building, or deconstructing. It also has a rather strong melee attack."

/tipsAndTricks/jobs/firefighter
    jobs_list = list(/datum/job/rd, /datum/job/scientist, /datum/job/roboticist)
    tipText = "The Ripley Firefighter is an enhanced version of the Ripley sporting more armor and being almost fire proof."

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

/tipsAndTricks/jobs/hunter_meds
    jobs_list = list(/datum/job/off_colony_hunt_master, /datum/job/off_colony_hunter)
    tipText = "Tatonka's located in the barn can be bred using wheat and then butchered for bones, leather, and animal parts you can turn into medicine in the crafting menu."

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