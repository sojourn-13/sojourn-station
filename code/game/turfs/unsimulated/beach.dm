/turf/unsimulated/beach
	name = "Beach"
	icon = 'icons/turf/flooring/beach.dmi'

/turf/unsimulated/beach/sand
	name = "Sand"
	icon_state = "sand"

/turf/unsimulated/beach/coastline
	name = "Coastline"
	icon = 'icons/turf/flooring/beach2.dmi'
	icon_state = "sandwater"

/turf/unsimulated/beach/water
	name = "Water"
	icon_state = "water"
	light_color = "#00BFFF"
	light_power = 2
	light_range = 2

/turf/unsimulated/beach/water/New()
	..()
	add_overlay(image("icon"='icons/turf/flooring/beach.dmi',"icon_state"="water2","layer"=MOB_LAYER+0.1))
