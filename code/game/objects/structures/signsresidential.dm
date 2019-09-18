/*Neon Signs*/

/obj/structure/sign/neon
	desc = "A glowing sign."
	icon = 'icons/obj/signs.dmi'
	plane = -25
	light_range = 4
	light_power = 2

/obj/structure/sign/neon/Destroy()
	set_light(0)
	return ..()

/obj/structure/sign/neon/item
	name = "item store"
	icon_state = "item"
	light_color = "#B79F41" //copper

/obj/structure/sign/neon/motel
	name = "motel"
	icon_state = "motel"
	light_color = "#59FF9B" //teal

/obj/structure/sign/neon/hotel
	name = "hotel"
	icon_state = "hotel"
	light_color = "#59FF9B" //teal

/obj/structure/sign/neon/flashhotel
	name = "hotel"
	icon_state = "flashhotel"
	light_color = "#FF8FF8" //hot pink

/obj/structure/sign/neon/lovehotel
	name = "hotel"
	icon_state = "lovehotel"
	light_color = "#59FF9B" //teal

/obj/structure/sign/neon/sushi
	name = "sushi"
	icon_state = "sushi"
	light_color = "#7DD3FF"  //sky blue

/obj/structure/sign/neon/bakery
	name = "bakery"
	icon_state = "bakery"
	light_color = "#FF8FEE" //hot pink

/obj/structure/sign/neon/beer
	name = "pub"
	icon_state = "beer"
	light_color = "#CBDC54" //yellow

/obj/structure/sign/neon/inn
	name = "inn"
	icon_state = "inn"
	light_color = "#F070FF"  //deeper hot pink

/obj/structure/sign/neon/cafe
	name = "cafe"
	icon_state = "cafe"
	light_color = "#FF8FEE" //hot pink

/obj/structure/sign/neon/diner
	name = "diner"
	icon_state = "diner"
	light_color = "#59FF9B" //teal

/obj/structure/sign/neon/bar_alt
	name = "bar"
	icon_state = "bar_alt"
	light_color = "#39FFA4" //teal

/obj/structure/sign/neon/casino
	name = "casino"
	icon_state = "casino"
	light_color = "#6CE08A" //teal

/obj/structure/sign/neon/cupcake
	name = "cupcake"
	icon_state = "cupcake"
	light_color = "#F4A9D8" //pink!

/obj/structure/sign/neon/cupcake2
	name = "cupcake"
	icon_state = "cupcake2"
	light_color = "#F4A9D8" //pink!

/obj/structure/sign/neon/peace
	name = "peace"
	icon_state = "peace"
	light_color = "#8559FF" //a cross between the blue and purple

/obj/structure/sign/neon/sale
	name = "sale"
	icon_state = "sale"
	light_color = "#6EB6FF" //sky blue

/obj/structure/sign/neon/exit
	name = "exit"
	icon_state = "exit"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/closed
	name = "close"
	icon_state = "close"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/closed2
	name = "closed"
	icon_state = "closed"
	light_color = "#39FFA4" //teal

/obj/structure/sign/neon/open
	name = "open"
	icon_state = "open"
	light_color = "#FFFFFF" //white

/obj/structure/sign/neon/disco
	name = "disco"
	icon_state = "disco"

/obj/structure/sign/neon/phone
	name = "phone"
	icon_state = "phone"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/armory
	name = "armory"
	icon_state = "armory"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/pizza
	name = "pizza"
	icon_state = "pizza"
	light_color = "#33CC00" //green

/obj/structure/sign/neon/clothes
	name = "clothes"
	icon_state = "clothes"
	light_color = "#FF9326" //orange

/obj/structure/sign/neon/bar
	name = "bar sign"
	desc = "The sign says 'Bar' on it."
	icon_state = "bar"
	light_color = "#63C4D6" //light blue

/obj/structure/sign/neon/hospital
	name = "hospital sign"
	desc = "A neon hospital sign"
	icon_state = "medical_on"
	light_color = "#7FEA6A" //lime green

/obj/structure/sign/neon/hospital/red
	icon_state = "medicalred_on"
	light_color = "#da0205" //red

/*Paintings*/

/obj/structure/sign/painting/monkey
	name = "monkey painting"
	desc = "A small painting of a glaring monkey. Very ominous."
	icon_state = "monkey_painting"

/obj/structure/sign/painting/paintingwaves
	desc = "A large foamy wave crashing into the rocky and sunlit shore."
	name = "painting"
	icon_state = "painting1"

/obj/structure/sign/painting/paintingstreet
	desc = "A serene city street with a few people on a summer day."
	name = "painting"
	icon_state = "painting2"

/obj/structure/sign/painting/paintingsunset
	desc = "A blazing sunset seen from a steep cliff above the sea."
	name = "painting"
	icon_state = "painting3"

/obj/structure/sign/painting/paintingvalley
	desc = "A wooded mountain valley, explored by a group of horsemen."
	name = "painting"
	icon_state = "painting4"

/obj/structure/sign/painting/paintingtable
	desc = "A table with a piece of white cloth, several fruits and a skull."
	name = "painting"
	icon_state = "painting5"

/obj/structure/sign/painting/paintingbird
	desc = "A long-tailed bird perches on a cherry blossom branch."
	name = "painting"
	icon_state = "painting6"

/obj/structure/sign/painting/paintingsnow
	desc = "A lone figure in the setting sun, gazing at the snow-peaked mountains."
	name = "painting"
	icon_state = "painting7"

/obj/structure/sign/painting/paintingtemple
	desc = "A hilly landscape, with a large temple standing on the bank of a river."
	name = "painting"
	icon_state = "painting8"

/obj/structure/sign/painting/paintingdesert
	desc = "A small encampment in the desert, with a flowing river in the distance."
	name = "painting"
	icon_state = "painting9"

/obj/structure/sign/painting/paintingsea
	desc = "A barque at sea, lit by the full moon."
	name = "painting"
	icon_state = "painting10"

/obj/structure/sign/painting/russianstalin
	name = "communist portrait"
	desc = "A portrait of some kind of communist figure."
	icon_state = "stalin"

/obj/structure/sign/painting/russianlenin
	name = "communist portrait"
	desc = "A portrait of some kind of communist figure."
	icon_state = "lenin"

/*Residential - signs for the people.*/

/obj/structure/sign/residential/barber
	name = "barber"
	desc = "A spinning pole signifying a barber shop."
	icon_state = "barber"

/obj/structure/sign/residential/botany
	name = "botany"
	desc = "A botany sign."
	icon_state = "botany"

/obj/structure/sign/residential/bus
	name = "bus sign"
	desc = "A sign signifying a transport hub."
	icon_state = "bus"

/obj/structure/sign/residential/clock
	name = "\improper clock"
	desc = "A small wall-mounted clock."
	icon_state = "clock"

/obj/structure/sign/residential/fine
	name = "'fine sign"
	desc = "A sign issuing a reminder to pay any financial penalties."
	icon_state = "fine"

/obj/structure/sign/residential/gamecenter
	name = "game center"
	desc = "A flashing arcade sign. Glitzy."
	icon_state = "gamecenter-left"

/obj/structure/sign/residential/gamecenter/right
	icon_state = "gamecenter-right"

/obj/structure/sign/residential/coffee
	name = "coffee & sweets"
	desc = "A charming wooden cafe sign."
	icon_state = "coffee-left"

/obj/structure/sign/residential/coffee/right
	icon_state = "coffee-right"

/obj/structure/sign/residential/maltesefalcon
	name = "The Maltese Falcon"
	desc = "The Maltese Falcon, Space Bar and Grill."
	icon_state = "maltesefalcon-left"

/obj/structure/sign/residential/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/residential/loan
	name = "loan"
	desc = "A financial sign."
	icon_state = "loan"

/obj/structure/sign/residential/periodic
	name = "periodic table"
	desc = "A scientific chart illustrating the elements."
	icon_state = "periodic"

/obj/structure/sign/residential/phone
	name = "phone sign"
	desc = "A sign directing to a nearby public radio."
	icon_state = "phoneicon"

/obj/structure/sign/residential/rent
	name = "rent sign"
	desc = "A sign advertising a property for rent."
	icon_state = "rent"

/obj/structure/sign/residential/pool
	name = "pool sign"
	desc = "A sign for the pool area."
	icon_state = "pool"

/obj/structure/sign/residential/arcade
	name = "arcade sign"
	desc = "A sign for the arcade area."
	icon_state = "arcade"

/obj/structure/sign/residential/garden
	name = "garden sign"
	desc = "A sign for the garden area."
	icon_state = "garden"

/obj/structure/sign/residential/owlery
	name = "owlery sign"
	desc = "A sign for the owlery area."
	icon_state = "owlery"

/obj/structure/sign/residential/techshop
	name = "techshop"
	desc = "A decorative green sign advertising a techshop."
	icon_state = "techshop"

/obj/structure/sign/residential/vote
	name = "vote sign"
	desc = "A sign that stresses the importance of democracy."
	icon_state = "vote"

/obj/structure/sign/residential/toiletmale
	name = "male toilets"
	desc = "A male toilet sign."
	icon_state = "toiletmale"

/obj/structure/sign/residential/toiletfemale
	name = "female toilets"
	desc = "A female toilet sign."
	icon_state = "toiletfemale"

/*Plaques - intentionally left non-descriptive, edit on-map for whatever purpose it serves.*/

/obj/structure/sign/plaque/dullplaque
	name = "plaque"
	desc = "A plaque with some text on it."
	icon_state = "writingplaque"

/obj/structure/sign/plaque/cleanplaque
	name = "plaque"
	desc = "A plaque with some text on it."
	icon_state = "roplaque"

/obj/structure/sign/plaque/dullplaqueimage
	name = "plaque"
	desc = "A plaque with some text on it."
	icon_state = "kiddieplaque"

/obj/structure/sign/plaque/goldplaque
	name = "gold plaque"
	desc = "A golden plaque with text and an image of a man."
	icon_state = "goldenplaque"

/obj/structure/sign/plaque/goldplaqueatmos
	name = "gold plaque"
	desc = "A golden plaque with text and an image of a gasmask."
	icon_state = "atmosplaque"

/obj/structure/sign/plaque/roundplaque
	name = "round plaque"
	desc = "A round plaque with some text on it."
	icon_state = "lightplaque"

/obj/structure/sign/plaque/roundplaquegold
	name = "round plaque"
	desc = "A round plaque with some text on it."
	icon_state = "lightplaquealt"

/obj/structure/sign/plaque/roundplaquefaded
	name = "round plaque"
	desc = "A round plaque with some text on it."
	icon_state = "darkplaque"

/obj/structure/sign/plaque/woodplaque
	name = "wood plaque"
	desc = "A wooden plaque with some text on it."
	icon_state = "ecplaque"

/*security*/

/obj/structure/sign/security
	icon = 'icons/obj/signs.dmi'

/obj/structure/sign/security/detective
	name = "DETECTIVE UNIT"
	icon_state = "detect1"

/obj/structure/sign/security/detective/right
	name = "DETECTIVE UNIT"
	icon_state = "detect2"

/obj/structure/sign/security/training
	name = "TRAINING QUARTERS"
	icon_state = "train1"

/obj/structure/sign/security/training/right
	name = "TRAINING QUARTERS"
	icon_state = "train2"

/obj/structure/sign/security/warden
	name = "WARDEN OFFICE"
	icon_state = "warden1"

/obj/structure/sign/security/warden/right
	name = "WARDEN OFFICE"
	icon_state = "warden2"

/obj/structure/sign/security/chief
	name = "CHIEF OFFICE"
	icon_state = "copoffice1"

/obj/structure/sign/security/chief/right
	name = "CHIEF OFFICE"
	icon_state = "copoffice2"

/obj/structure/sign/security/visit
	name = "VISITOR ROOM"
	icon_state = "visit1"

/obj/structure/sign/security/visit/right
	name = "VISITOR ROOM"
	icon_state = "visit2"

/obj/structure/sign/security/courtyard
	name = "PRISON COURTYARD"
	icon_state = "courtyard1"

/obj/structure/sign/security/courtyard/right
	name = "PRISON COURTYARD"
	icon_state = "courtyard2"

/obj/structure/sign/security/teleporter
	name = "TELEPORTER ACCESS"
	icon_state = "teleporter1"

/obj/structure/sign/security/teleporter/right
	name = "TELEPORTER ACCESS"
	icon_state = "teleporter2"

/obj/structure/sign/security/cells
	name = "CELLS"
	icon_state = "cells"

/obj/structure/sign/security/showers
	name = "SHOWERS"
	icon_state = "showers"

/obj/structure/sign/security/preproom
	name = "PREP ROOM"
	icon_state = "preproom"

/obj/structure/sign/security/briefroom
	name = "BRIEF ROOM"
	icon_state = "briefroom"

/obj/structure/sign/security/prosecutor
	name = "PROSECUTION OFFICE"
	icon_state = "prosecution1"

/obj/structure/sign/security/prosecutor/right
	name = "PROSECUTION OFFICE"
	icon_state = "prosecution2"

/obj/structure/sign/security/lawyer
	name = "DEFENSE AND CO."
	icon_state = "defense1"

/obj/structure/sign/security/lawyer/right
	name = "DEFENSE AND CO."
	icon_state = "defense2"

/obj/structure/sign/security/entrance
	name = "POLICE STATION"
	icon_state = "police1"

/obj/structure/sign/security/entrance/right
	name = "POLICE STATION"
	icon_state = "police2"

/obj/structure/sign/security/meetingroom
	name = "POLICE STATION"
	icon_state = "meetingroom1"

/obj/structure/sign/security/meetingroom/right
	name = "POLICE STATION"
	icon_state = "meetingroom2"