//Warning lights
/obj/effect/spinning_light
	var/spin_rate = 1 SECOND
	var/_size = 48
	var/_factor = 0.5
	var/_density = 4
	var/_offset = 30
	plane = ABOVE_LIGHTING_PLANE
	layer = ABOVE_LIGHTING_LAYER
	mouse_opacity = 0

/obj/effect/spinning_light/Initialize()
	. = ..()
	filters = filter(type="rays", size = _size, color = COLOR_ORANGE, factor = _factor, density = _density, flags = FILTER_OVERLAY, offset = _offset)

	alpha = 200
	//Rays start rotated which made synchronizing the scaling a bit difficult, so let's move it 45 degrees
	var/matrix/m = new
	var/matrix/test = new
	test.Turn(-45)
	var/matrix/squished = new
	squished.Scale(1, 0.5)
	animate(src, transform = (test * m.Turn(90)), spin_rate / 4, loop = -1,)
	animate(transform =      test * m.Turn(90), spin_rate / 4, loop = -1, )
	animate(transform =      (test * m.Turn(90)), spin_rate / 4, loop = -1, )
	animate(transform =      test * matrix(),   spin_rate / 4, loop = -1, )

/obj/machinery/rotating_alarm
	name = "Industrial alarm"
	desc = "An industrial rotating alarm light."
	icon = 'icons/obj/engine.dmi'
	icon_state = "alarm"
	idle_power_usage = 0
	active_power_usage = 0
	anchored = 1

	var/on = FALSE
	var/construct_type = /obj/machinery/light_construct

	var/static/obj/effect/spinning_light/spin_effect = null

	var/alarm_light_color = COLOR_ORANGE
	/// This is an angle to rotate the colour of alarm and its light. Default is orange, so, a 45 degree angle clockwise will make it green
	var/angle = 0

	/// Reference to the sound datum
	var/datum/repeating_sound/sound_loop
	/// Sound file to loop when turned on.
	var/sound_file

/obj/machinery/rotating_alarm/Initialize()
	. = ..()

	if(!spin_effect)
		spin_effect = new(null)

	//Setup colour
	var/list/color_matrix = color_rotation(angle)

	color = color_matrix

	var/HSV = RGBtoHSV(alarm_light_color)
	var/RGB = HSVtoRGB(RotateHue(HSV, angle))

	alarm_light_color = RGB

	set_dir(dir) //Set dir again so offsets update correctly

/obj/machinery/rotating_alarm/Destroy()
	set_off()
	return ..()

/obj/machinery/rotating_alarm/set_dir(ndir) //Due to effect, offsets cannot be part of sprite, so need to set it for each dir
	. = ..()
	if(dir == NORTH)
		pixel_y = -13
	if(dir == SOUTH)
		pixel_y = 28
	if(dir == WEST)
		pixel_x = 20
	if(dir == EAST)
		pixel_x = -20

/obj/machinery/rotating_alarm/proc/set_on()
	if (on)
		return
	vis_contents += spin_effect
	set_light(1, 0.5, 2, 0.3, alarm_light_color)
	on = TRUE

	if (!sound_file)
		return
	// Play looping sound using repeating_sound datum
	// args: interval, duration, variance, source, soundin, vol, vary, extrarange, falloff, is_global
	// Interval 70 should be roughly 7 seconds assuming ticks, but let's check inputs for repeating_sound
	// repeating_sound/New(var/_interval, var/duration, var/interval_variance = 0, var/atom/_source, var/_soundin, var/_vol, var/_vary, var/_extrarange, var/_falloff, var/_is_global, var/_use_pressure = TRUE)
	// We want it to loop indefinitely until stopped, so we can give it a long duration or just recreate it?
	// The PR used PlayLoopingSound with range 50, 7.
	// We'll use a decently long duration and rely on set_off to kill it.
	if (!sound_loop)
		sound_loop = new(70, 36000, 0, src, sound_file, 50, 0, 7, 0.5, 0) // 1 hour duration, should be enough for any alarm

/obj/machinery/rotating_alarm/proc/set_off()
	if (!on)
		return
	vis_contents -= spin_effect
	set_light(0)
	on = FALSE

	if (sound_loop)
		sound_loop.stop()
		sound_loop = null

/obj/machinery/rotating_alarm/supermatter
	name = "Supermatter alarm"
	desc = "An industrial rotating alarm light. This one is used to monitor supermatter engines."

	frame_type = /obj/item/frame/supermatter_alarm


	sound_file = 'sound/machines/supermatter.ogg'

/obj/machinery/rotating_alarm/supermatter/Initialize()
	. = ..()
	GLOB.supermatter_status.register_global(src, .proc/check_supermatter)

/obj/machinery/rotating_alarm/supermatter/Destroy()
	GLOB.supermatter_status.unregister_global(src, .proc/check_supermatter)
	. = ..()

/obj/machinery/rotating_alarm/supermatter/proc/check_supermatter(obj/machinery/power/supermatter/SM, danger)
	if (SM)
		if (SM.z in GetConnectedZlevels(src.z))
			if (danger && !on)
				set_on()
			else if (!danger && on)
				set_off()
