/* 	This is for adding & removing filter effects from mobs. (See : http://www.byond.com/docs/ref/#/{notes}/filters )
	[user] is the mob to add the filter effect to.
	[effect] is the filter effect you want to add.
	[duration] is if you want the effect to disappear after some time, values are in deciseconds (1/10th of a second)
	[fade_delay] is how long the fade out of the effect in decisecond is.

	The defines are pre-made filters effect for ease of copy-paste.
*/

#define FILTER_HOLY_GLOW filter(type="drop_shadow", x=0, y=0, size=5, offset=2, color=rgb(255,255,170))

/proc/add_effect(mob/user, effect, duration)
	if(user && effect)
		user.filters += effect
		if(duration)
			spawn(duration)
				remove_effect(user, effect)
		return TRUE
	return FALSE

/proc/remove_effect(mob/user, effect)
	if(user && effect)
		user.filters -= effect
		return TRUE
	return FALSE
