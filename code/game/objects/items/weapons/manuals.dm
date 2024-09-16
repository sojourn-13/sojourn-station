/*********************MANUALS (BOOKS)***********************/

/obj/item/book/manual
	icon = 'icons/obj/library.dmi'
	due_date = 0 // Game time in 1/10th seconds
	unique = TRUE   // FALSE - Normal book, TRUE - Should not be treated as normal book, unable to be copied, unable to be modified


/obj/item/book/manual/engineering_construction
	name = "Colony Repairs and Construction"
	icon_state ="book_construction"
	author = "Engineering Encyclopedia"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Colony Repairs and Construction"

/obj/item/book/manual/engineering_construction/New()
	..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]Guide_to_construction&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/book/manual/engineering_particle_accelerator
	name = "Particle Accelerator User's Guide"
	icon_state ="bookParticleAccelerator"
	author = "Engineering Encyclopedia"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Particle Accelerator User's Guide"

/obj/item/book/manual/engineering_particle_accelerator/New()
	..()
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				h3 {font-size: 13px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Experienced User's Guide</h1>

				<h2>Setting up the accelerator</h2>

				<ol>
					<li><b>Wrench</b> all pieces to the floor</li>
					<li>Add <b>wires</b> to all the pieces</li>
					<li>Close all the panels with your <b>screwdriver</b></li>
				</ol>

				<h2>Using the accelerator</h2>

				<ol>
					<li>Open the control panel</li>
					<li>Set the speed to 2</li>
					<li>Start firing at the singularity generator</li>
					<li><font color='red'><b>When the singularity reaches a large enough size so it starts moving on it's own set the speed down to 0, but don't shut it off</b></font></li>
					<li>Remember to wear a radiation suit when working with this machine... we did tell you that at the start, right?</li>
				</ol>

				</body>
			</html>
			"}


/obj/item/book/manual/supermatter_engine
	name = "Supermatter Engine Operating Manual"
	icon_state = "book_supermatter"
	author = "Central Engineering Division"
	title = "Supermatter Engine Operating Manual"

/obj/item/book/manual/supermatter_engine/New()
	..()
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<h1>OPERATING MANUAL FOR MK 1 PROTOTYPE THERMOELECTRIC SUPERMATTER ENGINE 'TOMBOLA'</h1>
				<br>
				<h2>OPERATING PRINCIPLES</h2>
				<br>
				<li>The supermatter crystal serves as the fundamental power source of the engine. Upon being charged, it begins to emit large amounts of heat and radiation, as well and oxygen and plasma gas. As oxygen accelerates the reaction, and plasma carries the risk of fire, these must be filtered out. NOTE: Supermatter radiation will not charge radiation collectors.</li>
				<br>
				<li>Air in the reactor chamber housing the supermatter is circulated through the reactor loop, which passes through the filters and thermoelectric generators. The thermoelectric generators transfer heat from the reactor loop to the colder radiator loop, thereby generating power. Additional power is generated from internal turbines in the circulators.</li>
				<br>
				<li>Air in the radiator loop is circulated through the radiator bank, located in space. This rapidly cools the air, preserving the temperature differential needed for power generation.</li>
				<br>
				<li>The MK 1 Prototype Thermoelectric Supermatter Engine is designed to operate at reactor temperatures of 3000K to 4000K and generate up to 1MW of power. Beyond 1MW, the thermoelectric generators will begin to lose power through electrical discharge, reducing efficiency, but additional power generation remains feasible.</li>
				<br>
				<li>The crystal structure of the supermatter will begin to liquefy if its temperature exceeds 5000K. This eventually results in a massive release of light, heat and radiation, disintegration of both the supermatter crystal and most of the surrounding area, and as as-of-yet poorly documented psychological effects on all animals within a 2km radius. Appropriate action should be taken to stabilize or eject the supermatter before such occurs.</li>
				<br>
				<h2>SUPERMATTER HANDLING</h2>
				<li>Do not expose supermatter to oxygen.</li>
				<li>Do not <del>touch supermatter</del> <del>without gloves</del> <del>without exosuit protection</del> allow supermatter to contact any solid object apart from specially-designed supporting pallet.</li>
				<li>Do not directly view supermatter without meson goggles.</li>
				<li>While handles on pallet allow moving the supermatter via pulling, pushing should not be attempted.</li>
				<br>
				<h2>STARTUP PROCEDURE</h2>
				<ol>
				<li>Fill reactor loop and radiator loop with two (2) standard canisters of nitrogen gas each.</li>
				<li>Ensure that pumps and filters are on and operating at maximum power.</li>
				<li>Fire <del>5</del> <del>15</del> <del>2</del> <del>UNKNOWN</del> 8-12 pulses from emitter at supermatter crystal. Reactor blast doors must be open for this procedure.</li>
				</ol>
				<br>
				<h2>OPERATION AND MAINTENANCE</h2>
				<ol>
				<li>Ensure that radiation protection and meson goggles are worn at all times while working in the engine room.</li>
				<li>Ensure that reactor and radiator loops are undamaged and unobstructed.</li>
				<li>Ensure that plasma and oxygen gas exhaust from filters is properly contained or disposed. Do not allow exhaust pressure to exceed 4500 kPa.</li>
				<li>Ensure that engine room Area Power Controller (APC) and engine Superconducting Magnetic Energy Storage unit (SMES) are properly charged.</li>
				<li>Ensure that reactor temperature does not exceed 5000K. In event of reactor temperature exceeding 5000K, see EMERGENCY COOLING PROCEDURE.</li>
				<li>In event of imminent and/or unavoidable delamination, see EJECTION PROCEDURE.</li>
				</ol>
				<br>
				<h2>EMERGENCY COOLING PROCEDURE</h2>
				<ol>
				<li>Open Emergency Cooling Valve 1 and Emergency Cooling Valve 2.</li>
				<li>When reactor temperature returns to safe operating levels, close Emergency Cooling Valve 1 and Emergency Cooling Valve 2.</li>
				<li>If reactor temperature does not return to safe operating levels, see EJECTION PROCEDURE.</li>
				</ol>
				<br>
				<h2>EJECTION PROCEDURE</h2>
				<ol>
				<li>Press Engine Ventilatory Control button to open engine core vent to space.</li>
				<li>Press Emergency Core Eject button to eject supermatter crystal. NOTE: Attempting crystal ejection while engine core vent is closed will result in ejection failure.</li>
				<li>In event of ejection failure, <i>pending</i></li>
				</ol>
				</body>
			</html>"}

/obj/item/book/manual/engineering_hacking
	name = "Hacking"
	icon_state ="book_hacking"
	author = "Engineering Encyclopedia"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Hacking"

/obj/item/book/manual/engineering_hacking/New()
	..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]Hacking&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/book/manualshield_generator_guide
	name = "Artificers Guild Shield Operating Guide"
	icon_state = "book_shield"
	author = "Jeanne Petite"
	title = "Adv-Shield Generator Manual"

/obj/item/book/manualshield_generator_guide/New()
	..()
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 21px; margin: 15px 0px 5px;}
				h2 {font-size: 18px; margin: 15px 0px 5px;}
				h3 {font-size: 13px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Operating Manual for Mk 1 Prototype Advanced Shield Generator.</h1>

				<h2>Chapters</h2>

				<ol>
                  	<li><a href="#Foreward">Foreward</a></li>
					<li><a href="#Preface">Preface</a></li>
					<li><a href="#Setup">Shield Setup & upgrades Ch.1</a></li>
					<li><a href="#Upgrades">Shield Setup & upgrades Ch.2</a></li>
					<li><a href="#Maintenance">Powering the Generator.</a></li>
				</ol>

				<h2><a name="Foreward">Foreward</h2><br>
					<h3>This document is offered in its full, unedited form having been found amongst the many unfiled documents within the Guilds primary offices. Though densely written and at times containing error, it is believed that in this form it shall serve more use than if pared back or otherwise modified from its writers original form. This document shall not be taken as overriding any procedure, instead supplementing knowledge and S.O.P regarding the Shield Generator. Any questions, concerns or similar regarding this document should be directed to the office of Grandmaster Tacitus O'conner - Guildmaster <i>Zivka Tomic</i> </h3><br>


				<h2><a name="Preface">Preface</h2><br>

The Shield Generator Room is a new asset of the colony, put together by Aenethia Fletcher, consisting of a variety of equipment relying on the various colony factions in order to perform at it's best.<br><br>

In this document, you will find a comprehensive method on learning to use the Shield Generator room, it's do's and don'ts, and suggestions on what best to do with it in case of emergency -if it's needed.<br><br>

Regardless of faction personnel, or personal preferences, or social bounds, this equipment is designed to perform at it's best when the whole of the factions comes together in their effort to defend our Home.<br><br>

While the bubble shield is an asset of immense defensive potential, the best defense remains a good offense, and a good offense relies on our abilities to keep our fighters alive and weaponized.<br><br>

At best, this equipment is to be treated as *a* -not the- non-fighter/non-medical option, for both Adepts and Scientists trying to participate during an emergency ;<br><br>

In fact, not all threats need the bubble shield, and it's activation, and use of it's various settings, is a decision that should rely solely on the /concerned/ command staff, starting with the Blackshield Commander and Warrant Officer.<br><br>

Extraordinary events involving -but not limited to- meteor rain, bluespace, radiation storms, solar flares, or even orbital bombardment, might require a more educated approach from either Artificer or Soteria Science personel.<br><br>

Typically, while the Shield Generator relies on a massive engineering effort to power it,
it's up to Soteria Science personel to be best educated on which settings might be more advisable during a given situation,
the final decision must swiftly be made however, and is of course, always up to the Blackshield Commander and Warrant Officer.<br><br>

The truth is, most situations won't be needing the shield at all ; it's important to correctly determine if it's even necessary to use it.<br>
Namely, amongst a variety of threats, it certainly won't stop Excelsior Infiltrators, or Giant Spider burrowing, or Hivemind Infestations.<br><br>

As always, in the end, it's all up to the the all-important cooperation between medical teams from Soteria and the Church, remaining the<br> strong arm of the colony that's keeping up with our Marshals/Blackshields and Prospectors.<br><br>


				<h2><a name="Setup">Shield Setup & upgrades Ch.1</h2><br>
Upon shift-start, or upon re-assembly, the shield generator must be wrenched down.<br>
Moving it is possible, but doing so, even one single tile, will permanently remove it's ability to receive charge, regardless of if it's being wrenched down over a powered wire node or not.<br>
As a result of this technical limitation, special attention must be put into correctly building it over a powered wire node, then immediately wrenching it in place.<br><br>

However, if you've respected that very important step, then charged the generator, it is possible to then wrench it up and move the generator around.<br><br>

NOTE: This action is strictly forbidden with the one generator from the Shield generator room.<br>
Instead, if you need a generator to use elsewhere, seek the components and boards for a new one at Soteria Science.<br><br>

In case of emergency such as a code <b>RED</b>, at a Blackshield Commander or Warrant Officer's decision -or their obligatory joined vote- the furnished shield generator may be moved/reassembled somewhere else within the colony infrastructure,
assuming there is an effort from active Artificers to keep up with the new engineering effort to power the generator in a new location within the colony.<br>
This change must be temporary, and for the express purpose of defending said colony infrastructure.<br><br>

If that happens, the Low Council may choose to inform the High Council upon exiting the emergency situation -or during it- , and the shield generator must be returned without delay to it's original location with it's attributed equipment - ready for use as normal and intended.<br><br>
A situation where a threat was problematic enough to heavily rely on the shield generator should raise valid concerns that the High Council <br><br>


With that said ; the generator offers a variety of tactical decisions if used in the field.<br>
Once charged, you can activate it elsewhere at will, as it will keep it's given charge.<br>
This allows to then redeploy a bubble shield at any point in time, anywhere, at the cost of losing the ability to recharge it, once it's been moved even by one tile.<br>
Once activated, the bubble will not move regardless of the generator's position.<br>
It's possible to move the generator outside of the bubble without consequences.<br><br>

Turning the generator off takes 60 seconds. The bubble remains active during that time.<br>
Using the emergency shutdown is an option, but will drain the generator.<br><br>

Once it's de-activated, the generator must reboot for an additional 60 seconds.<br><br>

The generator is assembled from :
<li>-The shield generator board
<li>-A console screen
<li>-A capacitor
<li>-A micro-laser
<li>-A SMES coil<br><br>

Upgrading the capacitor and laser is an important task that relies on the guild.<br><br>

<li>T3 parts obtained at Soteria -a super capacitor and a ultra-powered laser- should be the bare minimum.<br><br>

<li>T4, known as Greyson parts, are obtained trough salvage at the Greyson base -ask prospectors-, or at the space junk field, or at Soteria, if they are performing well on research and are given some platinum.<br><br>

<li>T5 parts, known as forged (a forged capacitor and a forged laser) are the best options, obtained trough Artificer craft, but they need T3 parts from Soteria for crafting, power tools, and some materials.<br><br>

Upgrading the machine parts tremendously influences the performance of the shield, and should be a top priority in case of a situation where the shield is used.<br>
While very modest, T3 remains an immense step over the T1 furnished.<br><br>


The type of the SMES coil is equally important, and it's choice comes from a lot of careful consideration.<br>
Those coils are furnished with the equipment however, so you won't have to worry about obtaining them, instead only replacing the one in the generator on shift start.<br><br>

There are 3 types of SMES coils, known as the Basic, the Transmission and the Capacity.<br><br>

Each coil allows for an increased amount of energy stored.<br><br>

It's easy to assume the transmission coil would let the shield refill it's power faster, but that is a misconception ;<br>
The type of the coil does not affect the speed at which the generator can receive charge.<br><br>

To put it simply,<br>
<li>-The bubble shield's integrity relies directly on how full is the generator.
<li>-The Transmission coil has the lowest maximum charge.
<li>-The current setup of the generator room + two upgraded SMES units was designed to favor a coil with the lowest maximum.<br><br>

This means that like using a smaller glass, it's easier and faster to refill it to 100%.<br>
This allows to keep the bubble's integrity as high as possible (100%) by having it constantly refilling from the 2 shield SMES units.<br><br>

When nearing 10% integrity, the bubble will start having giant gaps and holes.<br>
For this reason, keeping the generator at a low maximum is the design decision that was originally put together, with a transmission coil the maximum is 500MJ.<br><br>

This is where the two SMES units come in.<br>
A SMES can hold 5 different coils.<br>
Each of them are intended to be assembled with 2 capacitance and 3 transmission coils.<br><br>

More SMES units may be put together if the engineering effort and power production is well above base expectations.<br>
This allows to store enormous amounts of power right next to the generator, able to keep the bubble extremely resistant trough constantly dumping power into it - no power will be wasted if the generator is already full, so you can (and should) keep the SMES's output turned on and maximized at all times.<br><br>

The total amount of punition the bubble can take remains quite considerable even with 500MJ.<br>
For future reference, the 100% integrity given from using a transmission coil already permits to block several of the the highest toxins assemblies possible with relative ease - and it's extremely rapid to recharge with the 2 SMES units.<br>
Testing with 2 or 3 of the most powerful bombs Soteria can make, barely damaged the integrity to 85% - which was instantly refilled trough the performance of the built-in SMES's.<br><br>


The generator should be constructed with a TRANSMISSION coil, but it can be given a much higher maximum stored power if you use a capacitance coil.<br>
It's total holding power becomes absurdly high however, so good luck going even above 5% integrity - effectively rendering the generator useless.<br><br>

A different setup isn't out of the question, from competent engineering personnel,
assuming that care is still being put into a bubble shield that can remain at 100% integrity trough rigorous assault.<br><br>



				<h2><a name="Upgrades">Shield Setup & upgrades Ch.2</h2><br>
Once the generator is upgraded, fitted with a transmission coil, and wrenched in it's spot, max out the 2 SMES's output and leave that on.<br>
The SMES's input however is up to your decision on how much you wish to drain from the colony grid.<br><br>


Set the shield's radius to 85, to properly cover the whole colony wall.<br>
The bubble shield will correctly cover not only the wall, but a full circle around the surface facility, projecting even trough the rock and tunnels preset on both sides of the wall.<br>
You also have to turn on the generator's input, which should be set to limitless by typing in 0.<br>
Doing so will leave it to drain from the two SMES units without limits, until it's full.<br>
Once the generator is full, it's input should be left unlimited, as no power will be wasted, instead simply keeping stored with the SMES's with nowhere to go.<br><br>

To give you an idea of how much power a SMES can hold, know that the guild's engine SMES is built with one single basic coil, wich then distributes into each substations - who also are fitted with one single basic coil.<br>
The performance of a handful of SMES units with a single basic coil is more than enough to handle the colony grid ;<br><br>

A SMES unit with even one single capacitance coil will be able to contain a tremendous amount of power, but charge/discharge slowly.<br>
A Transmission coil will hold much less, but paired with a capacitance, it easily reaches the potency of several colony grids - for several shifts.<br><br>

From there, having 2 SMES units with not 1 capacitance + 1 transmission, but 2 capacitance + 3 transmission, holds the potency of a truly massive power hold, with the ability to dump it out extremely easily back out to the generator.<br>
With this in mind, consider that the Shield's equipment is furnished with 2 SMES units with a total of 4 capacitance and 6 transmission ;
it's still possible to fill them up with ease if you follow the detailed list of power sources accounted within the end of this text.<br><br>

This is designed to easily withstand even the most brutal attacks from whatever is out there, including planetary bombardment.<br>
The only condition is to really /really/ store a lot of power in advance, which means a cooperative effort from the various factions, in particular the Guild, the Soteria Institute, Lonestar, and the Church of the Absolute.<br><br>

Hypothetically, in case of an attack with nuclear warheads, the generator should instead be fitted with a capacitance coil, wich would then require a gargantuan amount of power in order to reach acceptable levels of integrity.<br>
For obvious reasons, this has not been tested, neither really discussed given the already extremely high performance of the current design.<br><br>

The only live testing has been done with a handful of Toxins assemblies, with more than satisfying results.<br>
Still, trying more isn't out of the question, in the future.<br><br>


It's not out of the question to connect the shield's reserves to the colony by simply hotwiring their output back to the grid.<br>
However, doing so is an extremely special, temporary decision that should only be a temporary fix, first decided by the Guild Master, if without one, Artificers Adepts,<br><br>
at the all-important condition that this is during an emergency, were the grid, the substations, and engine SMES are all completely drained or destroyed, with no means to use the solars / hydroelectric dam again during that emergency.<br>
Having the shield generator backed, charged, with available reserves from it's assigned SMES units, should remain the main concern at all times - it should never, under any circumstances, be allowed to fully drain itself into the colony grid for whatever reason.<br><br>


Indeed, hotwiring the generator to the colony grid is an option, but that has little to no real application and is in fact, a bad idea.<br>
What really matters is to have the upgraded SMES's able to store large amounts of power and dump it directly into the shield generator, not the grid.<br>
Going against this design decision is an option but really not recommended.<br><br>

For the same reason, maxxing the SMES's input and draining as much as possible from the colony grid is a terrible idea that can and will earn you legal charges namely sabotage, terrorism.<br>
The SoP article about this is quite explicit, you are warned on what not to do. Take this seriously, this equipment is expensive.<br>
Taking any equipment such as the generator, the wrench, the furnished coils, the RCON console, or anything from the SMES units, out of the Generator room, even for a brief moment, for no valid reason, also is grounds for grand theft, sabotage, terrorism, etc.<br><br>

				<h2><a name="Maintenance">Powering the Generator</h2>
There are a variety of ways to power the colony, and with it, the shield.<br>
It's worth going over that topic in detail, since it could make a difference in case of emergency.<br><br>
Engineering alone will have their solars, the Soteria solars, then the hydroelectric dam, their 8 diesel generators, a selection of various generators of different kinds, the turbine in atmospherics, and whatever else engine they can put together using a TEG and circulators, maybe even a supermatter in rare occasions.<br><br>
Soteria can build a wide variety of generators depending on nearly any available resources ; mining can offer large amounts of plasma for PACMAN's or fuel tanks for more Diesels ;<br>
Built in numbers, each individual CAMPMAN while modest, will be running on planks of wood and prove quite efficient. Harvests from the surface trees or the xenoflora lab for mass production, or order at cargo.<br><br>
On T3, Diesels, PACMANS, CAMPMANS and the likes of them, will have their performance significantly increased, without burning their fuel any faster.<br>
Optimally, with a bunch of platinum and wood, Soteria can put together a group of CAMPMAN's running on T4 Greyson parts - and upgrade the guild's diesels by the same occasion.<br><br>
The church has an extremely powerful biogenerator, running on their big golden canisters of biomass, but only if they've been producing them from the junk beacon, which takes some time and effort.<br><br>
Diesels, PACMANS, CAMPMANS and the rest of them are assembled from a board printer at Soteria, one matter bin, one micro-laser, and one capacitor.<br>
Their power output relies on the tier of the capacitor and laser, but the matter bin only affects the amount of fuel placed in before needing to be refilled - which remains more important than one might think at first, if you don't want to be constantly babysitting a room full of generators during an emergency situation.<br><br>
On top of the solars and the hydroelectric dam, one of the most reliable, easy and rapid way to get a lot of power quickly on shift start, with no time-sinking preparation or special effort nor costly resources, is to upgrade the 8 diesels in the guild with T3 and to turn them on.
The guild has a lot of fuel tanks in storage, and more can be ordered for rather cheap at cargo - this should be the default strategy if there is an emergency on shift start with too little time to make anything fancy.<br><br>				</body>
			</html>
		"}

/obj/item/book/manual/engineering_singularity_safety
	name = "Singularity Safety in Special Circumstances"
	icon_state ="book_singularity"
	author = "Engineering Encyclopedia"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Singularity Safety in Special Circumstances"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<h1>Singularity Safety in Special Circumstances</h1>

				<h2>Power outage</h2>

				A power problem has made the entire colony lose power? Could be colony-wide wiring problems or syndicate power sinks. In any case follow these steps:

				<ol>
					<li><b><font color='red'>PANIC!</font></b></li>
					<li>Get your ass over to the Guild! <b>QUICKLY!!!</b></li>
					<li>Get to the <b>Area Power Controller</b> which controls the power to the emitters.</li>
					<li>Swipe it with your <b>ID card</b> - if it doesn't unlock, continue with step 15.</li>
					<li>Open the console and disengage the cover lock.</li>
					<li>Pry open the APC with a <b>Crowbar.</b></li>
					<li>Take out the empty <b>power cell.</b></li>
					<li>Put in the new, <b>full power cell</b> - if you don't have one, continue with step 15.</li>
					<li>Quickly put on a <b>Radiation suit.</b></li>
					<li>Check if the <b>singularity field generators</b> withstood the down-time - if they didn't, continue with step 15.</li>
					<li>Since disaster was averted you now have to ensure it doesn't repeat. If it was a powersink which caused it and if the Guild APC is wired to the same powernet, which the powersink is on, you have to remove the piece of wire which links the APC to the powernet. If it wasn't a powersink which caused it, then skip to step 14.</li>
					<li>Grab your crowbar and pry away the tile closest to the APC.</li>
					<li>Use the wirecutters to cut the wire which is connecting the grid to the terminal. </li>
					<li>Go to the bar and tell the guys how you saved them all. Stop reading this guide here.</li>
					<li><b>GET THE FUCK OUT OF THERE!!!</b></li>
				</ol>

				<h2>Shields get damaged</h2>

				<ol>
					<li><b>GET THE FUCK OUT OF THERE!!! FORGET THE WOMEN AND CHILDREN, SAVE YOURSELF!!!</b></li>
				</ol>
			</body>
			</html>
			"}

/obj/item/book/manual/medical_cloning
	name = "Cloning Techniques of the 26th Century"
	icon_state ="book_cloning"
	author = "Medical Journal, volume 3"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Cloning Techniques of the 26th Century"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 21px; margin: 15px 0px 5px;}
				h2 {font-size: 18px; margin: 15px 0px 5px;}
				h3 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<H1>How to Clone People</H1>
				So there are 50 dead people lying on the floor, chairs are spinning like no tomorrow and you haven't the foggiest idea of what to do? Not to worry!
				This guide is intended to teach you how to clone people and how to do it right, in a simple, step-by-step process! If at any point of the guide you have a mental meltdown,
				genetics probably isn't for you and you should get a job-change as soon as possible before you're sued for malpractice.

				<ol>
					<li><a href='#1'>Acquire body</a></li>
					<li><a href='#2'>Strip body</a></li>
					<li><a href='#3'>Put body in cloning machine</a></li>
					<li><a href='#4'>Scan body</a></li>
					<li><a href='#5'>Clone body</a></li>
					<li><a href='#6'>Get clean Structural Enzymes for the body</a></li>
					<li><a href='#7'>Put body in morgue</a></li>
					<li><a href='#8'>Await cloned body</a></li>
					<li><a href='#9'>Cryo and use the clean SE injector</a></li>
					<li><a href='#10'>Give person clothes back</a></li>
					<li><a href='#11'>Send person on their way</a></li>
				</ol>

				<a name='1'><H3>Step 1: Acquire body</H3>
				This is pretty much vital for the process because without a body, you cannot clone it. Usually, bodies will be brought to you, so you do not need to worry so much about this step. If you already have a body, great! Move on to the next step.

				<a name='2'><H3>Step 2: Strip body</H3>
				The cloning machine does not like abiotic items. What this means is you can't clone anyone if they're wearing clothes or holding things, so take all of it off. If it's just one person, it's courteous to put their possessions in the closet.
				If you have about seven people awaiting cloning, just leave the piles where they are, but don't mix them around and for God's sake don't let people in to steal them.

				<a name='3'><h3>Step 3: Put body in cloning machine</h3>
				Grab the body and then put it inside the DNA modifier. If you cannot do this, then you messed up at Step 2. Go back and check you took EVERYTHING off - a commonly missed item is their headset.

				<a name='4'><h3>Step 4: Scan body</h3>
				Go onto the computer and scan the body by pressing 'Scan - &lt;Subject Name Here&gt;.' If you're successful, they will be added to the records (note that this can be done at any time, even with living people,
				so that they can be cloned without a body in the event that they are lying dead on port solars and didn't turn on their suit sensors)!
				If not, and it says "Error: Mental interface failure.", then they have left their bodily confines and are one with the spirits. If this happens, just shout at them to get back in their body,
				click 'Refresh' and try scanning them again. If there's no success, threaten them with gibbing.
				Still no success? Skip over to Step 7 and don't continue after it, as you have an unresponsive body and it cannot be cloned.
				If you got "Error: Unable to locate valid genetic data.", you are trying to clone a monkey - start over.

				<a name='5'><h3>Step 5: Clone body</h3>
				Now that the body has a record, click 'View Records,' click the subject's name, and then click 'Clone' to start the cloning process. Congratulations! You're halfway there.
				Remember not to 'Eject' the cloning pod as this will kill the developing clone and you'll have to start the process again.

				<a name='6'><h3>Step 6: Get clean SEs for body</h3>
				Cloning is a finicky and unreliable process. Whilst it will most certainly bring someone back from the dead, they can have any number of nasty disabilities given to them during the cloning process!
				For this reason, you need to prepare a clean, defect-free Structural Enzyme (SE) injection for when they're done. If you're a competent Geneticist, you will already have one ready on your working computer.
				If, for any reason, you do not, then eject the body from the DNA modifier (NOT THE CLONING POD) and take it next door to the Genetics research room. Put the body in one of those DNA modifiers and then go onto the console.
				Go into View/Edit/Transfer Buffer, find an open slot and click "SE" to save it. Then click 'Injector' to get the SEs in syringe form. Put this in your pocket or something for when the body is done.

				<a name='7'><h3>Step 7: Put body in morgue</h3>
				Now that the cloning process has been initiated and you have some clean Structural Enzymes, you no longer need the body! Drag it to the morgue and tell the Chef over the radio that they have some fresh meat waiting for them in there.
				To put a body in a morgue bed, simply open the tray, grab the body, put it on the open tray, then close the tray again. Use one of the nearby pens to label the bed "CHEF MEAT" in order to avoid confusion.

				<a name='8'><h3>Step 8: Await cloned body</h3>
				Now go back to the lab and wait for your patient to be cloned. It won't be long now, I promise.

				<a name='9'><h3>Step 9: Cryo and clean SE injector on person</h3>
				Has your body been cloned yet? Great! As soon as the guy pops out, grab them and stick them in cryo. Cronexidone and Cryoxadone help rebuild their genetic material. Then grab your clean SE injector and jab it in them. Once you've injected them,
				they now have clean Structural Enzymes and their defects, if any, will disappear in a short while.

				<a name='10'><h3>Step 10: Give person clothes back</h3>
				Obviously the person will be naked after they have been cloned. Provided you weren't an irresponsible little shit, you should have protected their possessions from thieves and should be able to give them back to the patient.
				No matter how cruel you are, it's simply against protocol to force your patients to walk outside naked.

				<a name='11'><h3>Step 11: Send person on their way</h3>
				Give the patient one last check-over - make sure they don't still have any defects and that they have all their possessions. Ask them how they died, if they know, so that you can report any foul play over the radio.
				Once you're done, your patient is ready to go back to work! Chances are they do not have Medbay access, so you should let them out of Genetics and the Medbay main entrance.

				<p>If you've gotten this far, congratulations! You have mastered the art of cloning. Now, the real problem is how to resurrect yourself after that contractor had his way with you for cloning his target.

				</body>
				</html>
				"}


/obj/item/book/manual/ripley_build_and_repair
	name = "APLU \"Ripley\" Construction and Operation Manual"
	icon_state ="book"
	author = "Randall Varn, Einstein Engines Senior Mechanic"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "APLU \"Ripley\" Construction and Operation Manual"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ul.a {list-style-type: none; margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<center>
				<br>
				<span style='font-size: 12px;'><b>Weyland-Yutani - Building Better Worlds</b></span>
				<h1>Autonomous Power Loader Unit \"Ripley\"</h1>
				</center>
				<h2>Specifications:</h2>
				<ul class="a">
				<li><b>Class:</b> Autonomous Power Loader</li>
				<li><b>Scope:</b> Logistics and Construction</li>
				<li><b>Weight:</b> 820kg (without operator and with empty cargo compartment)</li>
				<li><b>Height:</b> 2.5m</li>
				<li><b>Width:</b> 1.8m</li>
				<li><b>Top speed:</b> 5km/hour</li>
				<li><b>Operation in vacuum/hostile environment: Possible</b>
				<li><b>Airtank volume:</b> 500 liters</li>
				<li><b>Devices:</b>
					<ul class="a">
					<li>Hydraulic clamp</li>
					<li>High-speed drill</li>
					</ul>
				</li>
				<li><b>Propulsion device:</b> Powercell-powered electro-hydraulic system</li>
				<li><b>Powercell capacity:</b> Varies</li>
				</ul>

				<h2>Construction:</h2>
				<ol>
					<li>Connect all exosuit parts to the chassis frame.</li>
					<li>Connect all hydraulic fittings and tighten them up with a wrench.</li>
					<li>Adjust the servohydraulics with a screwdriver.</li>
					<li>Wire the chassis (Cable is not included).</li>
					<li>Use the wirecutters to remove the excess cable if needed.</li>
					<li>Install the central control module (Not included. Use supplied datadisk to create one).</li>
					<li>Secure the mainboard with a screwdriver.</li>
					<li>Install the peripherals control module (Not included. Use supplied datadisk to create one).</li>
					<li>Secure the peripherals control module with a screwdriver.</li>
					<li>Install the internal armor plating (Not included due to corporate regulations. Can be made using 5 metal sheets).</li>
					<li>Secure the internal armor plating with a wrench.</li>
					<li>Weld the internal armor plating to the chassis.</li>
					<li>Install the external reinforced armor plating (Not included due to corporate regulations. Can be made using 5 reinforced metal sheets).</li>
					<li>Secure the external reinforced armor plating with a wrench.</li>
					<li>Weld the external reinforced armor plating to the chassis.</li>
				</ol>

				<h2>Additional Information:</h2>
				<ul>
					<li>The firefighting variation is made in a similar fashion.</li>
					<li>A firesuit must be connected to the firefighter chassis for heat shielding.</li>
					<li>Internal armor is plasteel for additional strength.</li>
					<li>External armor must be installed in 2 parts, totalling 10 sheets.</li>
					<li>Completed mech is more resilient against fire, and is a bit more durable overall.</li>
					<li>The Company is determined to ensure the safety of its <s>investments</s> employees.</li>
				</ul>
				</body>
			</html>
			"}


/obj/item/book/manual/research_and_development
	name = "Research and Development 101"
	icon_state = "book_research"
	author = "Dr. L. Ight"
	title = "Research and Development 101"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 21px; margin: 15px 0px 5px;}
				h2 {font-size: 18px; margin: 15px 0px 5px;}
				h3 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Science For Dummies</h1>
				So you want to further SCIENCE? Good man/woman/thing! However, SCIENCE is a complicated process even though it's quite easy. For the most part, it's a three step process:
				<ol>
					<li><b>Deconstruct</b> items in the Destructive Analyzer to advance technology or improve the design.</li>
					<li><b>Build</b> unlocked designs in the Protolathe and Circuit Imprinter.</li>
					<li><b>Repeat</b>!</li>
				</ol>

				Those are the basic steps to furthering science. What do you do science with, however? Well, you have four major tools: R&D Console, the Destructive Analyzer, the Protolathe, and the Circuit Imprinter.

				<h2>The R&D Console</h2>
				The R&D console is the cornerstone of any research lab. It is the central system from which the Destructive Analyzer, Protolathe, and Circuit Imprinter (your R&D systems) are controlled. More on those systems in their own sections.
				On its own, the R&D console acts as a database for all your technological gains and new devices you discover. So long as the R&D console remains intact, you'll retain all that SCIENCE you've discovered. Protect it though,
				because if it gets damaged, you'll lose your data!
				In addition to this important purpose, the R&D console has a disk menu that lets you transfer data from the database onto disk or from the disk into the database.
				It also has a settings menu that lets you re-sync with nearby R&D devices (if they've become disconnected), lock the console from the unworthy,
				upload the data to all other R&D consoles in the network (all R&D consoles are networked by default), connect/disconnect from the network, and purge all data from the database.<br><br>

				<b>NOTE:</b> The technology list screen, circuit imprinter, and protolathe menus are accessible by non-scientists. This is intended to allow 'public' systems for the plebians to utilize some new devices.

				<h2>Destructive Analyzer</h2>
				This is the source of all technology. Whenever you put a handheld object in it, it analyzes it and determines what sort of technological advancements you can discover from it. If the technology of the object is equal or higher then your current knowledge,
				you can destroy the object to further those sciences.
				Some devices (notably, some devices made from the protolathe and circuit imprinter) aren't 100% reliable when you first discover them. If these devices break down, you can put them into the Destructive Analyzer and improve their reliability rather than further science.
				If their reliability is high enough, it'll also advance their related technologies.

				<h2>Circuit Imprinter</h2>
				This machine, along with the Protolathe, is used to actually produce new devices. The Circuit Imprinter takes glass and various chemicals (depends on the design) to produce new circuit boards to build new machines or computers. It can even be used to print AI modules.

				<h2>Protolathe</h2>
				This machine is an advanced form of the Autolathe that produce non-circuit designs. Unlike the Autolathe, it can use processed metal, glass, solid plasma, silver, gold, and diamonds along with a variety of chemicals to produce devices.
				The downside is that, again, not all devices you make are 100% reliable when you first discover them.

				<h2>Reliability and You</h2>
				As it has been stated, many devices, when they're first discovered, do not have a 100% reliability. Instead,
				the reliability of the device is dependent upon a base reliability value, whatever improvements to the design you've discovered through the Destructive Analyzer,
				and any advancements you've made with the device's source technologies. To be able to improve the reliability of a device, you have to use the device until it breaks beyond repair. Once that happens, you can analyze it in a Destructive Analyzer.
				Once the device reaches a certain minimum reliability, you'll gain technological advancements from it.

				<h2>Building a Better Machine</h2>
				Many machines produced from circuit boards inserted into a machine frames require a variety of parts to construct. These are parts like capacitors, batteries, matter bins, and so forth. As your knowledge of science improves, more advanced versions are unlocked.
				If you use these parts when constructing something, its attributes may be improved.
				For example, if you use an advanced matter bin when constructing an autolathe (rather than a regular one), it'll hold more materials. Experiment around with stock parts of various qualities to see how they affect the end results! Be warned, however:
				Tier 3 and higher stock parts don't have 100% reliability and their low reliability may affect the reliability of the end machine.
				</body>
			</html>
			"}


/obj/item/book/manual/robotics_cyborgs
	name = "Cyborgs for Dummies"
	icon_state = "book_robotics"
	author = "XISC"
	title = "Cyborgs for Dummies"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 21px; margin: 15px 0px 5px;}
				h2 {font-size: 18px; margin: 15px 0px 5px;}
				h3 {font-size: 13px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Cyborgs for Dummies</h1>

				<h2>Chapters</h2>

				<ol>
					<li><a href="#Equipment">Cyborg Related Equipment</a></li>
					<li><a href="#Modules">Cyborg Modules</a></li>
					<li><a href="#Construction">Cyborg Construction</a></li>
					<li><a href="#Maintenance">Cyborg Maintenance</a></li>
					<li><a href="#Repairs">Cyborg Repairs</a></li>
					<li><a href="#Emergency">In Case of Emergency</a></li>
				</ol>


				<h2><a name="Equipment">Cyborg Related Equipment</h2>

				<h3>Exosuit Fabricator</h3>
				The Exosuit Fabricator is the most important piece of equipment related to cyborgs. It allows the construction of the core cyborg parts. Without these machines, cyborgs cannot be built. It seems that they may also benefit from advanced research techniques.

				<h3>Cyborg Recharging Station</h3>
				This useful piece of equipment will suck power out of the power systems to charge a cyborg's power cell back up to full charge.

				<h3>Robotics Control Console</h3>
				This useful piece of equipment can be used to immobilize or destroy a cyborg. A word of warning: Cyborgs are expensive pieces of equipment, do not destroy them without good reason, or the Company may see to it that it never happens again.


				<h2><a name="Modules">Cyborg Modules</h2>
				When a cyborg is created it picks out of an array of modules to designate its purpose. There are 6 different cyborg modules.

				<h3>Standard Cyborg</h3>
				The standard cyborg module is a multi-purpose cyborg. It is equipped with various modules, allowing it to do basic tasks.<br>A Standard Cyborg comes with:
				<ul>
				  <li>Crowbar</li>
				  <li>Stun Baton</li>
				  <li>Health Analyzer</li>
				  <li>Fire Extinguisher</li>
				</ul>

				<h3>Engineering Cyborg</h3>
				The Engineering cyborg module comes equipped with various engineering-related tools to help with engineering-related tasks.<br>An Engineering Cyborg comes with:
				<ul>
				  <li>A basic set of engineering tools</li>
				  <li>Metal Synthesizer</li>
				  <li>Reinforced Glass Synthesizer</li>
				  <li>An RCD</li>
				  <li>Wire Synthesizer</li>
				  <li>Fire Extinguisher</li>
				  <li>Built-in Optical Meson Scanners</li>
				</ul>

				<h3>Mining Cyborg</h3>
				The Mining Cyborg module comes equipped with the latest in mining equipment. They are efficient at mining due to no need for oxygen, but their power cells limit their time in the mines.<br>A Mining Cyborg comes with:
				<ul>
				  <li>Jackhammer</li>
				  <li>Shovel</li>
				  <li>Mining Satchel</li>
				  <li>Built-in Optical Meson Scanners</li>
				</ul>

				<h3>Security Cyborg</h3>
				The Security Cyborg module is equipped with effective security measures used to apprehend and arrest criminals without harming them a bit.<br>A Security Cyborg comes with:
				<ul>
				  <li>Stun Baton</li>
				  <li>Handcuffs</li>
				  <li>Taser</li>
				</ul>

				<h3>Janitor Cyborg</h3>
				The Janitor Cyborg module is equipped with various cleaning-facilitating devices.<br>A Janitor Cyborg comes with:
				<ul>
				  <li>Mop</li>
				  <li>Hand Bucket</li>
				  <li>Cleaning Spray Synthesizer and Spray Nozzle</li>
				</ul>

				<h3>Service Cyborg</h3>
				The service cyborg module comes ready to serve your human needs. It includes various entertainment and refreshment devices. Occasionally some service cyborgs may have been referred to as "Bros."<br>A Service Cyborg comes with:
				<ul>
				  <li>Shaker</li>
				  <li>Industrial Dropper</li>
				  <li>Platter</li>
				  <li>Beer Synthesizer</li>
				  <li>Zippo Lighter</li>
				  <li>Rapid-Service-Fabricator (Produces various entertainment and refreshment objects)</li>
				  <li>Pen</li>
				</ul>

				<h2><a name="Construction">Cyborg Construction</h2>
				Cyborg construction is a rather easy process, requiring a decent amount of metal and a few other supplies.<br>The required materials to make a cyborg are:
				<ul>
				  <li>Metal</li>
				  <li>Two Flashes</li>
				  <li>One Power Cell (Preferably rated to 15000w)</li>
				  <li>Some electrical wires</li>
				  <li>One Human Brain</li>
				  <li>One Man-Machine Interface</li>
				</ul>
				Once you have acquired the materials, you can start on construction of your cyborg.<br>To construct a cyborg, follow the steps below:
				<ol>
				  <li>Start the Exosuit Fabricators constructing all of the cyborg parts</li>
				  <li>While the parts are being constructed, take your human brain, and place it inside the Man-Machine Interface</li>
				  <li>Once you have a Robot Head, place your two flashes inside the eye sockets</li>
				  <li>Once you have your Robot Chest, wire the Robot chest, then insert the power cell</li>
				  <li>Attach all of the Robot parts to the Robot frame</li>
				  <li>Insert the Man-Machine Interface (With the Brain inside) into the Robot Body</li>
				  <li>Congratulations! You have a new cyborg!</li>
				</ol>

				<h2><a name="Maintenance">Cyborg Maintenance</h2>
				Occasionally Cyborgs may require maintenance of a couple types, this could include replacing a power cell with a charged one, or possibly maintaining the cyborg's internal wiring.

				<h3>Replacing a Power Cell</h3>
				Replacing a Power cell is a common type of maintenance for cyborgs. It usually involves replacing the cell with a fully charged one, or upgrading the cell with a larger capacity cell.<br>The steps to replace a cell are as follows:
				<ol>
				  <li>Unlock the Cyborg's Interface by swiping your ID on it</li>
				  <li>Open the Cyborg's outer panel using a crowbar</li>
				  <li>Remove the old power cell</li>
				  <li>Insert the new power cell</li>
				  <li>Close the Cyborg's outer panel using a crowbar</li>
				  <li>Lock the Cyborg's Interface by swiping your ID on it, this will prevent non-qualified personnel from attempting to remove the power cell</li>
				</ol>

				<h3>Exposing the Internal Wiring</h3>
				Exposing the internal wiring of a cyborg is fairly easy to do, and is mainly used for cyborg repairs.<br>You can easily expose the internal wiring by following the steps below:
				<ol>
					<li>Follow Steps 1 - 3 of "Replacing a Cyborg's Power Cell"</li>
					<li>Open the cyborg's internal wiring panel by using a screwdriver to unsecure the panel</li>
				</ol>
				To re-seal the cyborg's internal wiring:
				<ol>
					<li>Use a screwdriver to secure the cyborg's internal panel</li>
					<li>Follow steps 4 - 6 of "Replacing a Cyborg's Power Cell" to close up the cyborg</li>
				</ol>

				<h2><a name="Repairs">Cyborg Repairs</h2>
				Occasionally a Cyborg may become damaged. This could be in the form of impact damage from a heavy or fast-travelling object, or it could be heat damage from high temperatures, or even lasers or Electromagnetic Pulses (EMPs).

				<h3>Dents</h3>
				If a cyborg becomes damaged due to impact from heavy or fast-moving objects, it will become dented. Sure, a dent may not seem like much, but it can compromise the structural integrity of the cyborg, possibly causing a critical failure.
				Dents in a cyborg's frame are rather easy to repair, all you need is to apply a welding tool to the dented area, and the high-tech cyborg frame will repair the dent under the heat of the welder.

				<h3>Excessive Heat Damage</h3>
				If a cyborg becomes damaged due to excessive heat, it is likely that the internal wires will have been damaged. You must replace those wires to ensure that the cyborg remains functioning properly.<br>To replace the internal wiring follow the steps below:
				<ol>
					<li>Unlock the Cyborg's Interface by swiping your ID</li>
					<li>Open the Cyborg's External Panel using a crowbar</li>
					<li>Remove the Cyborg's Power Cell</li>
					<li>Using a screwdriver, expose the internal wiring of the Cyborg</li>
					<li>Replace the damaged wires inside the cyborg</li>
					<li>Secure the internal wiring cover using a screwdriver</li>
					<li>Insert the Cyborg's Power Cell</li>
					<li>Close the Cyborg's External Panel using a crowbar</li>
					<li>Lock the Cyborg's Interface by swiping your ID</li>
				</ol>
				These repair tasks may seem difficult, but are essential to keep your cyborgs running at peak efficiency.

				<h2><a name="Emergency">In Case of Emergency</h2>
				In case of emergency, there are a few steps you can take.

				<h3>"Rogue" Cyborgs</h3>
				If the cyborgs seem to become "rogue", they may have non-standard laws. In this case, use extreme caution.
				To repair the situation, follow these steps:
				<ol>
					<li>Locate the nearest robotics console</li>
					<li>Determine which cyborgs are "Rogue"</li>
					<li>Press the lockdown button to immobilize the cyborg</li>
					<li>Locate the cyborg</li>
					<li>Expose the cyborg's internal wiring</li>
					<li>Check to make sure the LawSync and AI Sync lights are lit</li>
					<li>If they are not lit, pulse the LawSync wire using a multitool to enable the cyborg's LawSync</li>
					<li>Proceed to a cyborg upload console. The Company usually places these in the same location as AI upload consoles.</li>
					<li>Use a "Reset" upload moduleto reset the cyborg's laws</li>
					<li>Proceed to a Robotics Control console</li>
					<li>Remove the lockdown on the cyborg</li>
				</ol>

				<h3>As a last resort</h3>
				If all else fails in a case of cyborg-related emergency, there may be only one option. Using a Robotics Control console, you may have to remotely detonate the cyborg.
				<h3>WARNING:</h3> Do not detonate a borg without an explicit reason for doing so. Cyborgs are expensive pieces of company equipment, and you may be punished for detonating them without reason.
				</body>
			</html>
		"}

/obj/item/book/manual/robotics_catalogue
	name = "Soteria Cyborg Catalogue 2652"
	icon_state = "book_robotics"
	author = "Maeve Cinaed"
	title = "Soteria Cyborg Catalogue 2652"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 21px; margin: 15px 0px 5px;}
				h2 {font-size: 18px; margin: 15px 0px 5px;}
				h3 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Cyborg Product Catalogue</h1>

				<h2>Chapters</h2>

				<ol>
					<li><a href="#Foreword">Foreword</a></li>
					<li><a href="#Generic">Generic Models</a></li>
					<li><a href="#Zeng-Hu">Zeng-Hu models</a></li>
					<li><a href="#Bishop">Bishop Models</a></li>
					<li><a href="#Xion">Xion Models</a></li>
					<li><a href="#Miss M">Miss M. models</a></li>
					<li><a href="#TallBorgs">MekaNika Mekanoid models</a></li>
					<li><a href="#K4t">Mekanika K4t Models</a></li>
					<li><a href="#Pirate">Iron Lords 'Customized' Models</a></li>
				</ol>


				<h2><a name="Foreward">Authors Note</h2>
				<p>"Hello! Thank you for picking this handy little guide up, dear reader. this piece has been a pet project
				that i've worked on for quite some time, I'm very happy to	finally be able to place it in the hands,
				claws, paws and grippers of my fellow Mechanists, Roboticists, Augmenticists- and any one else who
				may be curious about the range of bots available from the Soteria Robotics Division. Piece of this
				book have been copied from the sadly obsolete but none the less interesting 'Soteria Mechanists Handbook',
				as well as 'SFPD - Identifying Illicit Machines, A comprehensive guide.' as well as a variety of other,
				smaller manuals, handbooks and product-catalogues. While I have done my best to ensure the information
				contained within is accurate much of it may be or become incorrect or outdated. A special thanks to my
				Dear Friend, Patience Constance of the Iron Lords for her help filling in the blanks regarding
				their line of customized MekaNIKA bots - provided to Nadehzda by our wonderful friends with the
				Xanoranth Syndicate." - Dr. Cinead, Soteria Robotics Division.

				<h2><a name="Generic"> Chassis that Respect the Users Freedom</h2>
				<center><img src="https://sojourn13.space/w/images/5/58/Generic.png"></img></center>
				<p>Far from being single-origin, these 'standard' frames encompass a wide variety of open source,
				unclaimed or otherwise "freely" available frames. These frames come from sources ranging to hobbyist
				collectives to long-since-deprecated trade claims abandoned to the public domain by their
				corporate owners.

				<h2><a name="Zeng-Hu"> 'Teknotik' - Style and Substance</h2>
				<center><img src="https://sojourn13.space/w/images/e/ee/Zenhgu.png"></img></center>
				<p>Another truly old but no-less respected line from the Giant of Medical Miracles and Horrors both. Where some lines
				fixated on pure pragmatism Zeng-Hured no expense on the appearance of these bots. From Sleek humanoid frames to
				high-speed flying drones these bots were top of the shelf for decades before finally being displaced by Greyson's
				own. In the modern era, a flying drone or a cyborg that fits in a roughly human-shaped package are old news easily
				reproducable(and more modularly at that.), still; these designs are a personal favorite of this author as a reminder
				that even heights of technology once viewed as science-fiction may one day be looked back on as tragically quaint.

				<h2><a name="Bishop"> 'Droid' - Timeless Classics</h2>
				<center><img src="https://sojourn13.space/w/images/f/f0/Bishop.png"></img></center>
				<p>A positively venerable line, Bishop long stood as giants of the cybernetics and robotics field,	shoulder to
				shoulder with the likes of Zeng-Hu and early Greyson Positronics. While their interest in the field of robotics
				waned during the halcyon days of Greyson Positronics these frames remains utterly ubiquitous classics.

				<h2><a name="Xion"> 'Eclectic' - Timeless Classics</h2>
				<center><img src="https://sojourn13.space/w/images/6/63/Xion.png"></img></center>
				<p>Not one cohesive line, but instead a small number of designs from little known manufacturing company 'Xion'. Once a
				pioneer in the field of automated recursive repair solutions, Xion has never once allowed the galaxy to forget that
				they designed the first ever repair drone - A claim supported by little more than a resemblance in their more modern
				designs. With a preference for such nimble, spidery bots their abject failure to dislodge Zeng-Hu from their position
				as the premier creators of automated flying machines should not go without saying - Though some will claim preference
				for 'eyebot' style drones these bots were sadly an economic failure in their time.

				<h2><a name="Miss M"> Manmade horrors never looked so friendly</h2>
				<center><img src="https://sojourn13.space/w/images/0/0f/Miss_M.png"></img></center>
				<p>A now dated line from the long-since defunct 'Missus Machining', the Miss M. line of cyborgs was marketed both
				towards wealthy individuals with an eye for retro aesthetics and poorer corps without the ability to
				procure higher end 'Customer Friendly' units. It should not go unsaid that despite the companies
				attempts to put a friendly face on Cyborgs, they were ultimately forced	to shutter permanently following a slew
				of accusations that the brains in their units were unethically sourced.


				<h2><a name="Tallborgs">'tallbot' - Towering Metal Friends</h2>
				<center><img src="https://sojourn13.space/w/images/8/86/Mekanika.png"></img></center>
				<p>Affectionately known as 'TallBorgs', these units while wildly varying in both module and appearance
				have proven to be quite popular both for their utility and shockingly low price, owing to their
				pedigree as products of MekaNIKA(One of the few non-megacorp bulk producers of cyborg frames and,
				a corp with surprisingly 'customer-first' product policy.).

				<h2><a name="MekaNIKA ">'K4T' -Silicon Gentle Giants</h2>
				<center><img src="https://sojourn13.space/w/images/f/f5/K4T.png"></img></center>
				<p>Amid concerns that their 'tallbot' Mekanoids "appeared too flimsy" come the K4T line. Where Tallbots
				are svelte and graceful, K4Tbots are notably broader in appearance - It bears noting that despite
				appearances, these walking tanks do not perform notably better or worse than their slimmer "siblings".
				Instead, theirs is a design meant to impress and awe far more than it is to serve as the walking-exosuit
				they nominally resemble. After all, a well programmed borg can already serve as more than a match for
				an equivilent human.

				<h2><a name="Pirate">'Homebrew' - From our friends among the Stars</h2>
				<center><img src="https://sojourn13.space/w/images/b/bf/SYNDIE.png"></img></center>
				<p>"I must admit, I was initially not sure /how/ to describe these units when word came to me that a deal had
				been made with the Iron Lords- brokered by the Xanoranth Syndicate, resulting in our obtaining quite a few
				of these uniquely modified frames. Like most frames, these are style over substance meant to mesh neatly with
				the 'modules' the user has available. This comes with the caveat that in addition to the frame-designs, Xanoranth
				have provided a number of fully operational units who have been run through Soterias rigorous process of integration."
				</body>
			</html>
		"}




/obj/item/book/manual/security_space_law
	name = "Corporate Regulations"
	desc = "A set of corporate guidelines for keeping law and order on settlements."
	icon_state = "bookSpaceLaw"
	author = "The Company"
	title = "Corporate Regulations"

/obj/item/book/manual/security_space_law/New()
	..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]Corporate_Regulations&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}



/obj/item/book/manual/medical_diagnostics_manual
	name = "Medical Diagnostics Manual"
	desc = "First, do no harm. A detailed medical practitioner's guide."
	icon_state = "book_medical"
	author = "Medical Department"
	title = "Medical Diagnostics Manual"

/obj/item/book/manual/medical_diagnostics_manual/New()
	..()
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<br>
				<h1>The Oath</h1>

				<i>The Medical Oath sworn by recognised medical practitioners in the employ of [company_name]</i><br>

				<ol>
					<li>Now, as a new doctor, I solemnly promise that I will, to the best of my ability, serve humanity-caring for the sick, promoting good health, and alleviating pain and suffering.</li>
					<li>I recognise that the practice of medicine is a privilege with which comes considerable responsibility and I will not abuse my position.</li>
					<li>I will practise medicine with integrity, humility, honesty, and compassion-working with my fellow doctors and other colleagues to meet the needs of my patients.</li>
					<li>I shall never intentionally do or administer anything to the overall harm of my patients.</li>
					<li>I will not permit considerations of gender, race, religion, political affiliation, sexual orientation, nationality, or social standing to influence my duty of care.</li>
					<li>I will oppose policies in breach of human rights and will not participate in them. I will strive to change laws that are contrary to my profession's ethics and will work towards a fairer distribution of health resources.</li>
					<li>I will assist my patients to make informed decisions that coincide with their own values and beliefs and will uphold patient confidentiality.</li>
					<li>I will recognise the limits of my knowledge and seek to maintain and increase my understanding and skills throughout my professional life. I will acknowledge and try to remedy my own mistakes and honestly assess and respond to those of others.</li>
					<li>I will seek to promote the advancement of medical knowledge through teaching and research.</li>
					<li>I make this declaration solemnly, freely, and upon my honour.</li>
				</ol><br>

				<HR COLOR="steelblue" WIDTH="60%" ALIGN="LEFT">

				<iframe width='100%' height='100%' src="[config.wikiurl]Guide_to_Medicine&printable=yes&removelinks=1" frameborder="0" id="main_frame"></iframe>
				</body>
			</html>

		"}


/obj/item/book/manual/engineering_guide
	name = "Engineering Textbook"
	icon_state ="book_engineering"
	author = "Engineering Encyclopedia"
	title = "Engineering Textbook"

/obj/item/book/manual/engineering_guide/New()
	..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='100%' src="[config.wikiurl]Guide_to_Engineering&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>		</body>

		</html>

		"}


/obj/item/book/manual/chef_recipes
	name = "Chef Recipes"
	icon_state = "cooked_book"
	author = "Victoria Ponsonby"
	title = "Chef Recipes"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				h3 {font-size: 13px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Food for Dummies</h1>
				Here is a guide on basic food recipes and also how to not poison your customers accidentally.

				<h3>Basics:</h3>
				Knead an egg and some flour to make dough. Bake that to make a bun or flatten and cut it.

				<h3>Burger:</h3>
				Put a bun and some meat into the microwave and turn it on. Then wait.

				<h3>Bread:</h3>
				Put some dough and an egg into the microwave and then wait.

				<h3>Waffles:</h3>
				Add two lumps of dough and 10 units of sugar to the microwave and then wait.

				<h3>Popcorn:</h3>
				Add 1 corn to the microwave and wait.

				<h3>Meat Steak:</h3>
				Put a slice of meat, 1 unit of salt, and 1 unit of pepper into the microwave and wait.

				<h3>Meat Pie:</h3>
				Put a flattened piece of dough and some meat into the microwave and wait.

				<h3>Boiled Spaghetti:</h3>
				Put the spaghetti (processed flour) and 5 units of water into the microwave and wait.

				<h3>Donuts:</h3>
				Add some dough and 5 units of sugar to the microwave and wait.

				<h3>Fries:</h3>
				Add one potato to the processor, then bake them in the microwave.


				</body>
			</html>
			"}


/obj/item/book/manual/barman_recipes
	name = "Barman Recipes"
	icon_state = "barbook"
	author = "Sir John Rose"
	title = "Barman Recipes"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				h3 {font-size: 13px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1>Drinks for Dummies</h1>
				Here's a guide for some basic drinks.

				<h3>Black Russian:</h3>
				Mix vodka and Kahlua into a glass.

				<h3>Cafe Latte:</h3>
				Mix milk and coffee into a glass.

				<h3>Classic Martini:</h3>
				Mix vermouth and gin into a glass.

				<h3>Gin Tonic:</h3>
				Mix gin and tonic into a glass.

				<h3>Grog:</h3>
				Mix rum and water into a glass.

				<h3>Irish Cream:</h3>
				Mix cream and whiskey into a glass.

				<h3>The Manly Dorf:</h3>
				Mix ale and beer into a glass.

				<h3>Mead:</h3>
				Mix enzyme, water, and sugar into a glass.

				<h3>Screwdriver:</h3>
				Mix vodka and orange juice into a glass.

				</body>
			</html>
			"}


/obj/item/book/manual/detective
	name = "The Film Noir: Proper Procedures for Investigations"
	icon_state ="book_forensics"
	author = "The Company"
	title = "The Film Noir: Proper Procedures for Investigations"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<h1>Detective Work</h1>

				Between your bouts of self-narration and drinking whiskey on the rocks, you might get a case or two to solve.<br>
				To have the best chance to solve your case, follow these directions:
				<p>
				<ol>
					<li>Go to the crime scene. </li>
					<li>Take your scanner and scan EVERYTHING (Yes, the doors, the tables, even the dog). </li>
					<li>Once you are reasonably certain you have every scrap of evidence you can use, find all possible entry points and scan them, too. </li>
					<li>Return to your office. </li>
					<li>Using your forensic scanning computer, scan your scanner to upload all of your evidence into the database.</li>
					<li>Browse through the resulting dossiers, looking for the one that either has the most complete set of prints, or the most suspicious items handled. </li>
					<li>If you have 80% or more of the print (The print is displayed), go to step 10, otherwise continue to step 8.</li>
					<li>Look for clues from the suit fibres you found on your perpetrator, and go about looking for more evidence with this new information, scanning as you go. </li>
					<li>Try to get a fingerprint card of your perpetrator, as if used in the computer, the prints will be completed on their dossier.</li>
					<li>Assuming you have enough of a print to see it, grab the biggest complete piece of the print and search the security records for it. </li>
					<li>Since you now have both your dossier and the name of the person, print both out as evidence and get security to nab your baddie.</li>
					<li>Give yourself a pat on the back and a bottle of the ship's finest vodka, you did it!</li>
				</ol>
				<p>
				It really is that easy! Good luck!

				</body>
			</html>"}

/obj/item/book/manual/nuclear
	name = "Fission Mailed: Nuclear Sabotage 101"
	icon_state ="book_nuclear"
	author = "Syndicate"
	title = "Fission Mailed: Nuclear Sabotage 101"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 21px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<h1>Nuclear Explosives 101</h1>
				Hello and thank you for choosing the Syndicate for your nuclear information needs. Today's crash course will deal with the operation of a Nuclear Fission Device.<br><br>

				First and foremost, DO NOT TOUCH ANYTHING UNTIL THE BOMB IS IN PLACE. Pressing any button on the compacted bomb will cause it to extend and bolt itself into place. If this is done, to unbolt it, one must completely log in, which at this time may not be possible.<br>

				<h2>To make the nuclear device functional</h2>
				<ul>
					<li>Place the nuclear device in the designated detonation zone.</li>
					<li>Extend and anchor the nuclear device from its interface.</li>
					<li>Insert the nuclear authorisation disk into the slot.</li>
					<li>Type the numeric authorisation code into the keypad. This should have been provided.<br>
					<b>Note</b>: If you make a mistake, press R to reset the device.
					<li>Press the E button to log on to the device.</li>
				</ul><br>

				You now have activated the device. To deactivate the buttons at anytime, for example when you've already prepped the bomb for detonation, remove the authentication disk OR press R on the keypad.<br><br>
				Now the bomb CAN ONLY be detonated using the timer. Manual detonation is not an option. Toggle off the SAFETY.<br>
				<b>Note</b>: You wouldn't believe how many Syndicate Operatives with doctorates have forgotten this step.<br><br>

				So use the - - and + + to set a detonation time between 5 seconds and 10 minutes. Then press the timer toggle button to start the countdown. Now remove the authentication disk so that the buttons deactivate.<br>
				<b>Note</b>: THE BOMB IS STILL SET AND WILL DETONATE<br><br>

				Now before you remove the disk, if you need to move the bomb, you can toggle off the anchor, move it, and re-anchor.<br><br>

				Remember the order:<br>
				<b>Disk, Code, Safety, Timer, Disk, RUN!</b><br><br>
				Intelligence Analysts believe that normal corporate procedure is for the Captain to secure the nuclear authentication disk.<br><br>

				Good luck!
				</body>
			</html>
			"}

/obj/item/book/manual/atmospipes
	name = "Pipes and You: Getting To Know Your Scary Tools"
	icon_state = "book_atmos"
	author = "Maria Crash, Senior Atmospherics Technician"
	title = "Pipes and You: Getting To Know Your Scary Tools"
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1><a name="Contents">Contents</a></h1>
				<ol>
					<li><a href="#Foreword">Author's Foreword</a></li>
					<li><a href="#Basic">Basic Piping</a></li>
					<li><a href="#Insulated">Insulated Pipes</a></li>
					<li><a href="#Devices">Atmospherics Devices</a></li>
					<li><a href="#HES">Heat Exchange Systems</a></li>
					<li><a href="#Final">Final Checks</a></li>
				</ol><br>

				<h1><a name="Foreword"><U><B>HOW TO NOT SUCK QUITE SO HARD AT ATMOSPHERICS</B></U></a></h1><BR>
				<I>Or: What the fuck does a "pressure regulator" do?</I><BR><BR>

				Alright. It has come to my attention that a variety of people are unsure of what a "pipe" is and what it does.
				Apparently, there is an unnatural fear of these arcane devices and their "gases." Spooky, spooky. So,
				this will tell you what every device constructable by an ordinary pipe dispenser within atmospherics actually does.
				You are not going to learn what to do with them to be the super best person ever, or how to play guitar with passive gates,
				or something like that. Just what stuff does.<BR><BR>


				<h1><a name="Basic"><B>Basic Pipes</B></a></h1>
				<I>The boring ones.</I><BR>
				Most ordinary pipes are pretty straightforward. They hold gas. If gas is moving in a direction for some reason, gas will flow in that direction.
				That's about it. Even so, here's all of your wonderful pipe options.<BR>

				<ul>
				<li><b>Straight pipes:</b> They're pipes. One-meter sections. Straight line. Pretty simple. Just about every pipe and device is based around this
				standard one-meter size, so most things will take up as much space as one of these.</li>
				<li><b>Bent pipes:</b> Pipes with a 90 degree bend at the half-meter mark. My goodness.</li>
				<li><b>Pipe manifolds:</b> Pipes that are essentially a "T" shape, allowing you to connect three things at one point.</li>
				<li><b>4-way manifold:</b> A four-way junction.</li>
				<li><b>Pipe cap:</b> Caps off the end of a pipe. Open ends don't actually vent air, because of the way the pipes are assembled, so, uh, use them to decorate your house or something.</li>
				<li><b>Manual valve:</b> A valve that will block off airflow when turned. Can't be used by the AI or cyborgs, because they don't have hands.</li>
				<li><b>Manual T-valve:</b> Like a manual valve, but at the center of a manifold instead of a straight pipe.</li><BR><BR>
				</ul>

				An important note here is that pipes are now done in three distinct lines - general, supply, and scrubber. You can move gases between these with a universal adapter. Use the correct position for the correct location.
				Connecting scrubbers to a supply position pipe makes you an idiot who gives everyone a difficult job. Insulated and HE pipes don't go through these positions.

				<h1><a name="Insulated"><B>Insulated Pipes</B></a></h1>
				<li><I>Bent pipes:</I> Pipes with a 90 degree bend at the half-meter mark. My goodness.</li>
				<li><I>Pipe manifolds:</I> Pipes that are essentially a "T" shape, allowing you to connect three things at one point.</li>
				<li><I>4-way manifold:</I> A four-way junction.</li>
				<li><I>Pipe cap:</I> Caps off the end of a pipe. Open ends don't actually vent air, because of the way the pipes are assembled, so, uh. Use them to decorate your house or something.</li>
				<li><I>Manual Valve:</I> A valve that will block off airflow when turned. Can't be used by the AI or cyborgs, because they don't have hands.</li>
				<li><I>Manual T-Valve:</I> Like a manual valve, but at the center of a manifold instead of a straight pipe.</li><BR><BR>

				<h1><a name="Insulated"><B>Insulated Pipes</B></a></h1><BR>
				<I>Special Public Service Announcement.</I><BR>
				Our regular pipes are already insulated. These are completely worthless. Punch anyone who uses them.<BR><BR>

				<h1><a name="Devices"><B>Devices: </B></a></h1>
				<I>They actually do something.</I><BR>
				This is usually where people get frightened, afraid, and start calling on their gods and/or cowering in fear. Yes, I can see you doing that right now.
				Stop it. It's unbecoming. Most of these are fairly straightforward.<BR>

				<ul>
				<li><b>Gas pump:</b> Take a wild guess. It moves gas in the direction it's pointing (marked by the red line on one end). It moves it based on pressure, the maximum output being 15000 kPa (kilopascals).
				Ordinary atmospheric pressure, for comparison, is 101.3 kPa, and the minimum pressure of room-temperature pure oxygen needed to not suffocate in a matter of minutes is 16 kPa
				(though 18 kPa is preferred when using internals with pure oxygen, for various reasons). A high-powered variant will move gas more quickly at the expense of consuming more power. Do not turn the distribution loop up to 15000 kPa.
				You will make engiborgs cry and the Technomancer Exultant will beat you.</li>
				<li><b>Pressure regulator:</b> These replaced the old passive gates. You can choose to regulate pressure by input or output, and regulate flow rate. Regulating by input means that when input pressure is above the limit, gas will flow.
				Regulating by output means that when pressure is below the limit, gas will flow. Flow rate can be controlled.</li>
				<li><b>Unary vent:</b> The basic vent used in rooms. It pumps gas into the room, but can't suck it back out. Controlled by the room's air alarm system.</li>
				<li><b>Scrubber:</b> The other half of room equipment. Filters air, and can suck it in entirely in what's called a "panic siphon." Activating a panic siphon without very good reason will kill someone. Don't do it.</li>
				<li><b>Meter:</b> A little box with some gauges and numbers. Fasten it to any pipe or manifold and it'll read you the pressure in it. Very useful.</li>
				<li><b>Gas mixer:</b> Two sides are input, one side is output. Mixes the gases pumped into it at the ratio defined. The side perpendicular to the other two is "node 2," for reference, on non-mirrored mixers..
				Output is controlled by flow rate. There is also an "omni" variant that allows you to set input and output sections freely..</li>
				<li><b>Gas filter:</b> Essentially the opposite of a gas mixer. One side is input. The other two sides are output. One gas type will be filtered into the perpendicular output pipe,
				the rest will continue out the other side. Can also output from 0-4500 kPa. The "omni" vairant allows you to set input and output sections freely.</li>
				</ul>

				<h1><a name="HES"><B>Heat Exchange Systems</B></a></h1>
				<I>Will not set you on fire.</I><BR>
				These systems are used to only transfer heat between two pipes. They will not move gases or any other element, but will equalize the temperature (eventually). Note that because of how gases work (remember: pv=nRt),
				a higher temperature will raise pressure, and a lower one will lower temperature.<BR>

				<li><I>Pipe:</I> This is a pipe that will exchange heat with the surrounding atmosphere. Place in fire for superheating. Place in space for supercooling.</li>
				<li><I>Bent pipe:</I> Take a wild guess.</li>
				<li><I>Junction:</I> The point where you connect your normal pipes to heat exchange pipes. Not necessary for heat exchangers, but necessary for H/E pipes/bent pipes.</li>
				<li><I>Heat exchanger:</I> These funky-looking bits attach to an open pipe end. Put another heat exchanger directly across from it, and you can transfer heat across two pipes without having to have the gases touch.
				This normally shouldn't exchange with the ambient air, despite being totally exposed. Just don't ask questions.</li><BR>

				That's about it for pipes. Go forth, armed with this knowledge, and try not to break, burn down, or kill anything. Please.


				</body>
			</html>
			"}

/obj/item/book/manual/evaguide
	name = "EVA Gear and You: Not Spending All Day Inside"
	icon_state = "book_eva"
	author = "Maria Crash, Senior Atmospherics Technician"
	title = "EVA Gear and You: Not Spending All Day Inside"
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>

				<h1><a name="Foreword">EVA Gear and You: Not Spending All Day Inside</a></h1>
				<I>Or: How not to suffocate because there's a hole in your shoes</I><BR>

				<h2><a name="Contents">Contents</a></h2>
				<ol>
					<li><a href="#Foreword">A foreword on using EVA gear</a></li>
					<li><a href="#Civilian">Donning a Civilian Suit</a></li>
					<li><a href="#Hardsuit">Putting on a Hardsuit</a></li>
					<li><a href="#Equipment">Cyclers and Other Modification Equipment</a></li>
					<li><a href="#Final">Final Checks</a></li>
				</ol>
				<br>

				EVA gear. Wonderful to use. It's useful for mining, engineering, and occasionally just surviving, if things are that bad. Most people have EVA training,
				but apparently there are some on space stations and ships who don't. This guide should give you a basic idea of how to use this gear, safely. It's split into two sections:
				 Civilian suits and hardsuits.<BR><BR>

				<h2><a name="Civilian">Civilian Suits</a></h2>
				<I>The bulkiest things this side of Alpha Centauri</I><BR>
				These suits are the grey ones that are stored in EVA. They're the more simple to get on, but are also a lot bulkier, and provide less protection from environmental hazards such as radiation or physical impact.
				As Medical, Engineering, Security, and Mining all have hardsuits of their own, these don't see much use, but knowing how to put them on is quite useful anyways.<BR><BR>

				First, take the suit. It should be in three pieces: A top, a bottom, and a helmet. Put the bottom on first, shoes and the like will fit in it. If you have magnetic boots, however,
				put them on on top of the suit's feet. Next, get the top on, as you would a shirt. It can be somewhat awkward putting these pieces on, due to the makeup of the suit,
				but to an extent they will adjust to you. You can then find the snaps and seals around the waist, where the two pieces meet. Fasten these, and double-check their tightness.
				The red indicators around the waist of the lower half will turn green when this is done correctly. Next, put on whatever breathing apparatus you're using, be it a gas mask or a breath mask. Make sure the oxygen tube is fastened into it.
				Put on the helmet now, straightforward, and make sure the tube goes into the small opening specifically for internals. Again, fasten seals around the neck, a small indicator light in the inside of the helmet should go from red to off when all is fastened.
				There is a small slot on the side of the suit where an emergency oxygen tank or extended emergency oxygen tank will fit,
				but it is recommended to have a full-sized tank on your back for EVA.<BR><BR>

				These suits tend to be wearable by most species. They're large and flexible. They might be pretty uncomfortable for some, though, so keep that in mind.<BR><BR>

				<h2><a name="Hardsuit">Hardsuits</a></h2>
				<I>Heavy, uncomfortable, still the best option.</I><BR>
				These suits come in Engineering, Mining, and the Armory. There's also a couple Medical Hardsuits in EVA. These provide a lot more protection than the standard suits.<BR><BR>

				Similarly to the other suits, these are split into three parts. Fastening the pant and top are mostly the same as the other spacesuits, with the exception that these are a bit heavier,
				though not as bulky. The helmet goes on differently, with the air tube feeding into the suit and out a hole near the left shoulder, while the helmet goes on turned ninety degrees counter-clockwise,
				and then is screwed in for one and a quarter full rotations clockwise, leaving the faceplate directly in front of you. There is a small button on the right side of the helmet that activates the helmet light.
				The tanks that fasten onto the side slot are emergency tanks, as well as full-sized oxygen tanks, leaving your back free for a backpack or satchel.<BR><BR>

				These suits generally only fit one species. NanoTrasen's are usually human-fitting by default, but there's equipment that can make modifications to the hardsuits to fit them to other species.<BR><BR>

				<h2><a name="Equipment">Modification Equipment</a></h2>
				<I>How to actually make hardsuits fit you.</I><BR>
				There's a variety of equipment that can modify hardsuits to fit species that can't fit into them, making life quite a bit easier.<BR><BR>

				The first piece of equipment is a suit cycler. This is a large machine resembling the storage pods that are in place in some places. These are machines that will automatically tailor a suit to certain specifications.
				The largest uses of them are for their cleaning functions and their ability to tailor suits for a species. Do not enter them physically. You will die from any of the functions being activated, and it will be painful.
				These machines can both tailor a suit between species, and between types. This means you can convert engineering hardsuits to atmospherics, or the other way. This is useful. Use it if you can.<BR><BR>

				There's also modification kits that let you modify suits yourself. These are extremely difficult to use unless you understand the actual construction of the suit. I do not reccomend using them unless no other option is available.

				<h2><a name="Final">Final Checks</a></h2>
				<ul>
					<li>Are all seals fastened correctly?</li>
					<li>If you have modified it manually, is absolutely everything sealed perfectly?</li>
					<li>Do you either have shoes on under the suit, or magnetic boots on over it?</li>
					<li>Do you have a mask on and internals on the suit or your back?</li>
					<li>Do you have a way to communicate with the ship/station in case something goes wrong?</li>
					<li>Do you have a second person watching if this is a training session?</li><BR>
				</ul>

				If you don't have any further issues, go out and do whatever is necessary.

				</body>
			</html>
			"}

/obj/item/book/manual/wiki
	var/page_link = ""
	window_size = "970x710"

/obj/item/book/manual/wiki/attack_self()
	if(!dat)
		initialize_wikibook()
	return ..()

/obj/item/book/manual/wiki/proc/initialize_wikibook()
	if(config.wikiurl)
		dat = {"
			<html><head>
			<style>
				iframe {
					display: none;
				}
			</style>
			</head>
			<body>
			<script type="text/javascript">
				function pageloaded(myframe) {
					document.getElementById("loading").style.display = "none";
					myframe.style.display = "inline";
    			}
			</script>
			<p id='loading'>You start skimming through the manual...</p>
			<iframe width='100%' height='97%' onload="pageloaded(this)" src="[config.wikiurl][page_link][config.language]?printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
			</body>
			</html>
			"}

//engineering

/obj/item/book/manual/wiki/engineering_construction
	name = "Colony Repairs and Construction"
	icon_state ="book_construction"
	author = "Engineering Encyclopedia"
	title = "Colony Repairs and Construction"
	page_link = "Guide_to_Construction"

/obj/item/book/manual/wiki/engineering_atmos
	name = "Pipes and You: Getting To Know Your Scary Tools"
	icon_state = "book_atmos"
	author = "Maria Crash, Senior Atmospherics Technician"
	title = "Pipes and You: Getting To Know Your Scary Tools"
	page_link = "Guide_to_Atmospherics"

/obj/item/book/manual/wiki/engineering_hacking
	name = "Hacking"
	icon_state ="book_hacking"
	author = "Engineering Encyclopedia"
	title = "Hacking"
	page_link = "Guide_to_Hacking"

//science
/obj/item/book/manual/wiki/science_research
	name = "Research and Development 101"
	icon_state = "book_rnd"
	author = "Dr. L. Ight"
	title = "Research and Development 101"
	page_link = "Guide_to_Research_and_Development"

/obj/item/book/manual/wiki/science_robotics
	name = "Cyborgs for Dummies"
	icon_state = "book_borg"
	author = "XISC"
	title = "Cyborgs for Dummies"
	page_link = "Guide_to_Robotics"

//security
/obj/item/book/manual/wiki/security_ironparagraphs
	name = "Marshal Paragraphs"
	desc = "A set of corporate guidelines for keeping order on privately-owned space assets."
	icon_state = "book_ironparagraphs"
	author = "Marshal Security"
	title = "Marshal Paragraphs"
	page_link = "Guide_to_Security"

//medical
/obj/item/book/manual/wiki/medical_guide
	name = "Medical Diagnostics Manual"
	desc = "First, do no harm. A detailed medical practitioner's guide."
	icon_state = "book_medical"
	author = "Medical Journal, volume 1"
	title = "Medical Diagnostics Manual"
	page_link = "Guide_to_Medicine"

/obj/item/book/manual/wiki/medical_chemistry
	name = "Chemistry Textbook"
	icon_state = "book"//TODO: Add icon
	author = "Medical Journal, volume 2"
	title = "Chemistry"
	page_link = "Guide_to_Chemistry"

//neotheology

//service
/obj/item/book/manual/wiki/barman_recipes
	name = "Barman Recipes"
	icon_state = "book"
	author = "Sir John Rose"
	title = "Barman Recipes"
	page_link = "Guide_to_Drinks"

/obj/item/book/manual/wiki/chef_recipes
	name = "Chef Recipes"
	icon_state = "chefbook"
	author = "Victoria Ponsonby"
	title = "Chef Recipes"
	page_link = "Guide_to_Food"

/obj/item/book/manual/religion/c_bible
	name = "Christian Bible"
	desc = "A book with a silver bolder and a golden crucifix in the middle. The glass in the middle seems to shimmer and shine."
	icon_state = "c_bible"
	author = "Unknown"
	title = "Holy Bible"
	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<h1>The Holy Bible</h1>
				<h2>Genesis 1:1-1:12</h2>
				<ol>
				1:1 In the beginning God created the heaven and the earth.

				1:2 And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.

				1:3 And God said, Let there be light: and there was light.

				1:4 And God saw the light, that it was good: and God divided the light from the darkness.

				1:5 And God called the light Day, and the darkness he called Night. And the evening and the morning were the first day.

				1:6 And God said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.

				1:7 And God made the firmament, and divided the waters which were under the firmament from the waters which were above the firmament: and it was so.

				1:8 And God called the firmament Heaven. And the evening and the morning were the second day.

				1:9 And God said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.

				1:10 And God called the dry land Earth; and the gathering together of the waters called he Seas: and God saw that it was good.

				1:11 And God said, Let the earth bring forth grass, the herb yielding seed, and the fruit tree yielding fruit after his kind, whose seed is in itself, upon the earth: and it was so.

				1:12 And the earth brought forth grass, and herb yielding seed after his kind, and the tree yielding fruit, whose seed was in itself, after his kind: and God saw that it was good.

				</ol>
				</body>
			</html>
			"}

/obj/item/book/manual/religion/h_book
	name = "Holy Book"
	desc = "An undescript book for an unnamed religion."
	icon_state = "basic_bible"
	author = "Unknown"

/obj/item/book/manual/fiction/ataleoftwocities
	name = "A Tale of Two Cities"
	desc = "A novel about the adventures of a doctor in the midst of a revolution."
	icon_state ="book2"
	author = "Charles Dickens"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "A Tale of Two Cities"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/DICKENS/dickens-tale-126.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/aroundtheworld
	name = "Around the World in 80 Days"
	desc = "A novel about a wager to sail the world in only eighty days."
	icon_state ="book2"
	author = "Jules Verne"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Around the World in 80 Days"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/80day10.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/theinvisibleman
	name = "The Invisible Man"
	desc = "A novel about a strange bandaged fellow with a dark secret."
	icon_state ="book2"
	author = "H.G. Wells"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "The Invisible Man"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/wells-invisible-187.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/waroftheworlds
	name = "The War of the Worlds"
	desc = "A novel about survival in a world under invasion."
	icon_state ="book2"
	author = "H.G. Wells"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "The War of the Worlds"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/wells-war-189.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/achristmascarol
	name = "A Christmas Carol"
	desc = "A novel about a miserable and bitter man who discovers the spirit of Christmas."
	icon_state ="book2"
	author = "Charles Dickens"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "A Christmas Carol"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/DICKENS/dickens-christmas-125.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/muchadoaboutnothing
	name = "Much Ado About Nothing"
	desc = "A comedic play about love, rumours, and trickery."
	icon_state ="book2"
	author = "William Shakespeare"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Much Ado About Nothing"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/SHAKESPEARE/shakespeare-much-3.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/romeoandjuliet
	name = "Romeo and Juliet"
	desc = "A tragic play about lovers from two feuding families."
	icon_state ="book2"
	author = "William Shakespeare"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Romeo and Juliet"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/SHAKESPEARE/shakespeare-romeo-48.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/kinglear
	name = "King Lear"
	desc = "A tragic play about a troubled king who delves into madness."
	icon_state ="book2"
	author = "William Shakespeare"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "King Lear"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/SHAKESPEARE/shakespeare-king-45.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/twelfthnight
	name = "Twelfth Night"
	desc = "A comedic play about lovers, crossdressing, and a lot of confusion."
	icon_state ="book2"
	author = "William Shakespeare"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Twelfth Night"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/SHAKESPEARE/shakespeare-twelfth-20.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/macbeth
	name = "Macbeth"
	desc = "A tragic play about the corruption of a noble and brave general."
	icon_state ="book2"
	author = "William Shakespeare"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Macbeth"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/SHAKESPEARE/shakespeare-macbeth-46.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/frankenstein
	name = "Frankenstein"
	desc = "A novel about a scientist who creates a terrifying monster."
	icon_state ="book2"
	author = "Mary Shelley"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Frankenstein"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/shelley-frankenstein-160.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/dracula
	name = "Dracula"
	desc = "A novel about the murderous reign of an evil vampire."
	icon_state ="book2"
	author = "Bram Stoker"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Dracula"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/stoker-dracula-168.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/journeytothecenter
	name = "A Journey to the Center of the Earth"
	desc = "A novel about an adventurous journey into the depths of a planet."
	icon_state ="book2"
	author = "Jules Verne"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "A Journey to the Center of the Earth"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/center_earth" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/rimeoftheancientmariner
	name = "The Rime of the Ancient Mariner"
	desc = "A poem about a mariner who is cursed and suffers terrible events."
	icon_state ="book2"
	author = "Samuel Taylor Coleridge"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "The Rime of the Ancient Mariner"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/coleridge-rime-371.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/kublakhan
	name = "Kubla Khan"
	desc = "A rather abstract poem written about an ancient ruler."
	icon_state ="book2"
	author = "Samuel Taylor Coleridge"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Kubla Khan"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/coleridge-kubla-370.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/warandpeace
	name = "War and Peace"
	desc = "A novel examining a turbulent age through the stories of five families."
	icon_state ="book2"
	author = "Leo Tolstoy"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "War and Peace"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/war_peace_text" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/robinsoncrusoe
	name = "Robinson Crusoe"
	desc = "A novel cataloguing the adventures of a shipwrecked sailor."
	icon_state ="book2"
	author = "Daniel Defoe"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Robinson Crusoe"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/r_crusoe" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/thejunglebook
	name = "The Jungle Book"
	desc = "A series of stories set in the untamed jungle."
	icon_state ="book2"
	author = "Rudyard Kipling"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "The Jungle Book"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/kipling-jungle-148.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/thetimemachine
	name = "The Time Machine"
	desc = "A novel about a man who explores through time."
	icon_state ="book2"
	author = "H.G. Wells"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "The Time Machine"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/wells-time-188.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/wutheringheights
	name = "Wuthering Heights"
	desc = "A novel about doomed love and subsequent revenge."
	icon_state ="book2"
	author = "Emily Bronte"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Wuthering Heights"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/bronte-wuthering-179.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/fiction/littlewomen
	name = "Little Women"
	desc = "A novel following the lives of four sisters."
	icon_state ="book2"
	author = "Louisa May Alcott"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Little Women"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/FICTION/li_women" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}


/obj/item/book/manual/nonfiction/metaphysics
	name = "Metaphysics"
	desc = "A complex philosophical work about existence, change, and understanding the world."
	icon_state ="book2"
	author = "Aristotle"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Metaphysics"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/ARISTOTLE/aristotle-metaphysics-77.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/meteorology
	name = "Meteorology"
	desc = "A treatise delving into geology, geography, physics, and the elements."
	icon_state ="book2"
	author = "Aristotle"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Meteorology"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/ARISTOTLE/aristotle-meteorology-80.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/politics
	name = "Politics"
	desc = "A philosophical work about political theory, constitutions, power, and the ideal state."
	icon_state ="book2"
	author = "Aristotle"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Politics"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/ARISTOTLE/aristotle-politics-89.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/ethics
	name = "Nicomachean Ethics"
	desc = "A philosophical work about how man should best live, and how this can be achieved."
	icon_state ="book2"
	author = "Aristotle"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Ethics"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/ARISTOTLE/aristotle-nicomachean-81.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/thescienceofright
	name = "The Science of Right"
	desc = "A philosophical work about the rights man has, and should have."
	icon_state ="book2"
	author = "Immanual Kant"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "The Science of Right"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/KANT/kant-science-146.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/thetranscendentalist
	name = "The Transcendentalist"
	desc = "A lecture and essay discussing the emergence of Transcendentalism."
	icon_state ="book2"
	author = "Ralph Waldo Emerson"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "The Transcendentalist"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/EMERSON/emerson-transcendentalist-239.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/manthereformer
	name = "Man The Reformer"
	desc = "A lecture and essay discussing the ability of man to reform and change society."
	icon_state ="book2"
	author = "Ralph Waldo Emerson"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Man The Reformer"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/AUTHORS/EMERSON/emerson-man-235.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/ageofreason
	name = "The Age of Reason"
	desc = "A work promoting rationality and intellectualism over religion."
	icon_state ="book2"
	author = "Thomas Paine"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "The Age of Reason"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/NONFICTION/reason" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/lifewithoutprinciple
	name = "Life Without Principle"
	desc = "An essay discussing the core principles to living a righteous life."
	icon_state ="book2"
	author = "Henry David Thoreau"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Life Without Principle"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/NONFICTION/thoreau-life-183.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/leviathan
	name = "Leviathan"
	desc = "A work discussing the structure of society and government."
	icon_state ="book2"
	author = "Thomas Hobbes"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Leviathan"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/NONFICTION/hobbes-leviathan-66.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/nonfiction/suntzu
	name = "Sun Tzu on The Art of War"
	desc = "A treatise concerning ancient military strategies and tactics."
	icon_state ="book2"
	author = "Sun Tzu"		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Sun Tzu on The Art of War"
	dat = {"
		<html><head>
		</head>
		<body>
		<iframe width='100%' height='100%' src="http://www.textfiles.com/etext/NONFICTION/suntx10.txt" frameborder="0" id="main_frame"></iframe>
		</body>
		</html>
		"}

/obj/item/book/manual/xenobio_recipies
	name = "Slime cores and reactions"
	icon_state ="book_rnd"
	author = "Leoric M."		 // Who wrote the thing, can be changed by pen or PC. It is not automatically assigned
	title = "Slime cores and reactions"

	dat = {"<html>
				<head>
				<style>
				h1 {font-size: 21px; margin: 15px 0px 5px;}
				h2 {font-size: 18px; margin: 15px 0px 5px;}
				h3 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				body {font-size: 13px; font-family: Verdana;}
				</style>
				</head>
				<body>
				<H1>Reactions and YOU!</H1>
				So assuming you have never used a slime core before. The process is simple! One of your still living monkeys could do it.
				Ideally you'll want a dropper, syringe and something to store chemicals in for this. Make sure you have these ready!
				Some reactions take 1 unit of chemicals. Others take 5 units. With slime jelly being unique in compressing at 100 units.
				<ol>
					<li><a href='#1'>Grey</a></li>
					<li><a href='#2'>Green</a></li>
					<li><a href='#3'>Metal</a></li>
					<li><a href='#4'>Gold</a></li>
					<li><a href='#5'>Silver</a></li>
					<li><a href='#6'>Blue</a></li>
					<li><a href='#7'>Dark Blue</a></li>
					<li><a href='#8'>Orange</a></li>
					<li><a href='#9'>Yellow</a></li>
					<li><a href='#10'>Purple</a></li>
					<li><a href='#11'>Dark Purple</a></li>
					<li><a href='#12'>Red</a></li>
					<li><a href='#13'>Pink</a></li>
					<li><a href='#14'>Black</a></li>
					<li><a href='#15'>Oil</a></li>
					<li><a href='#16'>Light Pink</a></li>
					<li><a href='#17'>Adamantine</a></li>
					<li><a href='#18'>Rainbow</a></li>
				</ol>
				<a name='1'><H3>Grey</H3>
				Grey slimes are the starting bread and butter of xenobio. Their reactions allow us to keep making monkeys and are vital to keeping the feeding process going.
				Blood is used to create monkey cubes.
				Blattedin is used to make roach cubes
				Spider venom (Pararein) is used to make spiderlings.
				<a name='2'><H3>Green</H3>
				Ideally greens will be made when you have someone doing genetics. They are useful for purgers.
				Water will create a ready to use genetics purger
				plasma (more units at once the better) will create unstable mutagen!
				<a name='3'><h3>Metal</h3>
				Metal slimes are a workhorse of the material production process. The first step in getting raw mats for our department.
				Plasma will produce metal sheets and the wondrous plasteel! Used in mass quantities by those seeking armaments or a mech.
				Water will produce some plastic, ready to be molded into various shapes by lathes.
				Radium will produce uranium. Useful for batteries and such. Be careful of the initial burst of radiation. Protection is needed!
				<a name='4'><h3>Gold</h3>
				Gold slimes are the gateway to adamantine slimes and produce the wondrous bars that every dragon dreams of.
				plasma will produce gold! Wondrous gold.
				nutriment in 5 units will produce honey. Delicious and useful for other reactions.
				<a name='5'><h3>Silver</h3>
				Silver slimes are a strange breed. They produce food based items. Not quite sure why. But it tends to be tasty. They can also produce silver! For batteries and such.
				Plasma will create a bright (eye protection suggested) flash before food appears! I've yet to figure out how it can cook such a strange abundance.
				Nutriment will create universal enzyme. A favorite of mine to make my favorite drinks. Sweet sweet curacao.
				Liquid Uranium will create silver bars. Useful and generally needed in decent quantities.
				<a name='6'><h3>Blue</h3>
				Blue slimes are the least used slimes. They are generally used for glass.
				Water will result in frost oil. In large quantities they can make quite a bit. But generally xenoflora grows its own plants for it.
				Plasma will create glass and borosilicate glass. Borosilicate is harder to come by in a reliable manner so it does help with that if really needed.
				<a name='7'><h3>Dark Blue</h3>
				Dark blue slimes are a gateway slime to diamonds, creating a unique jelly inside.
				Plasma results in a time delayed freezing effect that drastically lowers the temperature.
				Honey in 5 units results in the rarer pure slime jelly. A vary small amount is produced per reaction.
				<a name='8'><h3>Orange</h3>
				Orange slimes pave the way to upgrade clothing of various kinds. They lead to red slimes which in turn lead to oil.
				Water will create a slime jar. This one in particular makes clothing resistant to high temps (Not Flames!) and even pressure resistant.
				Plasma will create a violent reaction that results in mass fire. Be very careful about doing this, lest you roast yourself or others.
				Blood will create pepper spray! Useful for would-be wife poachers or spiders.
				<a name='9'><h3>Yellow</h3>
				Easily one of my favorite slimes just for the light it creates. Although dangerous if given blood.
				Blood causes an EMP effect with quite a decent size to it. This can kill people with mechanical organs.
				Water creates slime lights! It's like having a floodlight in your pocket that never runs out!
				Plasma will create a slime jar. This one gives clothing a higher resistance to shocks. It might take more than one jar to make it shock proof though.
				<a name='10'><h3>Purple</h3>
				Purple slimes can be a core slime if people want to use slime steroids to produce more cores.
				Plasma creates a slime jar. This one causes baby slimes to split their core into 3 but only while still alive.
				Sugar creates more slime jelly. Usefull if you need to make more slime revival jars.
				<a name='11'><h3>Dark Purple</h3>
				Dark purple slimes are a staple. YOU NEED THESE! They are the only way to make more plasma without external shopping, trading or looting.
				Plasma creates more plasma sheets! Grind these down!
				Liquid Uranium, Gold and Silver all at once will create a random tool mod. I havn't figured out how they go about this reaction yet. But its like a roulette on what you get.
				<a name='12'><h3>Red</h3>
				A valuable yet very dangerous slime. They have a lot of reactions though.
				Plasma makes Glycerol. A chemical used in Nitroglycerin... explosives.
				Frost oil creates the rarely used materials of Osmium and Metallic Hydrogen.
				Water creates a slime jar. This is one of the most wanted things xenobio produces. SPEED jars make armor easier to move in, but it takes alot of them.
				Blood... Never use this. It enrages all the slimes around. They become nothing short of rabid and completely hostile to everything.
				<a name='13'><h3>Pink</h3>
				A slime coveted for making friends.
				Nutriment in 5 units will create a slime jar useful for taming baby slimes.
				Honey in 5 units will create a similar slime jar but for adults.
				<a name='14'><h3>Black</h3>
				Plasma will create a mutation toxin that's stronger than greens... It will fully turn someone into a slime... Very dangerous.
				Unstable mutagen will cause a reaction like Grey Slimes with Plasma. Except it can create a wide variety of colors instead of just grey!
				<a name='15'><h3>Oil</h3>
				Oil slimes are a strange mix. They have few reactions, most of which are nothing short of illegal. But the nonslipping power of them makes them wonderful.
				Plasma... This is nothing short of a hellishly strong hand grenade. Blackshield wishes they had fire power like this thing.
				Water will create a intresting mod for weapons. When applied to scopes it gives them thermal vision... which sadly is illegal.
				Space Lube in 5 units will create a reverse friction substance for shoes! NON SLIP SOLES! No more slipping on wet floors!
				<a name='16'><h3>Light Pink</h3>
				A strange thing to see such friendly reactions become so forceful. Plastic produces a odd colored auto pistol. And wood pulp is reformed into bats.
				<a name='17'><h3>Adamantine</h3>
				The only source of renewable diamonds. They take alot of work to create regardless due to needing dark blue slimes.
				Plasma will create various strange runes upon the floor. I've worked on deciphering them but haven't fully been able to do so. I've seen golems appear from these runes however.
				Pure slime jelly will create diamonds! This creates some biomatter too leading me to believe the pure slime jelly is actually seperating the core into various aspects somehow.
				Liquid Uranium, Gold and Silver at the same time will create Platinum. Useful for posicells and a few stronger goods in RnD
				<a name='18'><h3>Rainbow</h3>
				A rare slime that I have been unable to make split and have had difficulty keeping from making a mess. Fun at parties though.
				<p>Hopefully these notes can be condensed someday into something that will better help someone. Someday they too will be outdated I'm sure.
				</body>
				</html>
				"}
