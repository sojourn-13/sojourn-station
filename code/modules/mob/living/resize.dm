// All of this code is being done from scratch and WILL need a update.
var/const/RESIZE_HUGE = 2
var/const/RESIZE_GIGANTOR = 1.5
var/const/RESIZE_BIG = 1.15
var/const/RESIZE_NORMAL = 1
var/const/RESIZE_SMALL = 0.85
var/const/RESIZE_POCKET_PRINCE = 0.75
var/const/RESIZE_TINY = 0.25

//I'm not sure if this obsolete or not. Size transofrmations should be handled now in update_icons.dm --Evie
/mob/living/carbon/human/proc/resize(var/new_size)
    if(size_multiplier == new_size)
        return 1

    size_multiplier = new_size //Change size_multiplier so that other items can interact with them
    update_icons() //Lame way
