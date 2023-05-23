/*
USE turf_danger.dm INSTEAD! THIS IS HERE FOR REPLACEMENT PURPOSES!
*/

/turf/open/indestructible/ground/outside/water
	gender = PLURAL
	name = "river water"
	desc = "Shallow river water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	slowdown = 2
	depth = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/open/indestructible/ground/outside/water/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		if(L.check_submerged() <= 0)
			return
		L.apply_effect(2, EFFECT_IRRADIATE, 0)
		if(!istype(oldloc, /turf/open/indestructible/ground/outside/water))
			to_chat(L, "<span class='warning'>You get drenched in water!</span>")
	AM.water_act(5)
	..()

/turf/open/indestructible/ground/outside/water/Exited(atom/movable/AM, atom/newloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		if(L.check_submerged() <= 0)
			return
		L.apply_effect(2, EFFECT_IRRADIATE, 0)
		if(!istype(newloc, /turf/open/indestructible/ground/outside/water))
			to_chat(L, "<span class='warning'>You wade through \the [src].</span>")
	..()

/turf/open/indestructible/ground/outside/water/running
	gender = PLURAL
	name = "moving river water"
	desc = "Shallow river water."
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "riverwateruhh"
	slowdown = 2
	depth = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/open/indestructible/ground/outside/water/running/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		if(L.check_submerged() <= 0)
			return
		L.apply_effect(2, EFFECT_IRRADIATE, 0)
		if(!istype(oldloc, /turf/open/indestructible/ground/outside/water))
			to_chat(L, "<span class='warning'>You get drenched in water!</span>")
	AM.water_act(5)
	..()

/turf/open/indestructible/ground/outside/water/running/Exited(atom/movable/AM, atom/newloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		if(L.check_submerged() <= 0)
			return
		L.apply_effect(2, EFFECT_IRRADIATE, 0)
		if(!istype(newloc, /turf/open/indestructible/ground/outside/water))
			to_chat(L, "<span class='warning'>You wade through \the [src].</span>")
	..()

/*
Below is the old water set.
Again, don't use this, unless it's absolutely necessary.
*/
/turf/open/water
	gender = PLURAL
	name = "spring water"
	desc = "Shallow, almost clear water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/indestructible/ground/inside/mountain
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	slowdown = 2
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

	depth = 1

/turf/open/water/Initialize()
	. = ..()
	update_icon()
	// Moved from /turf/open/indestructible/ground/outside/desert to reduce lag.
	for(var/direction in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, direction)
		if(turf_to_check.type == /turf/open/indestructible/ground/outside/desert) // don't do it for subtypes!
			var/obj/effect/overlay/desert_side/DS = new /obj/effect/overlay/desert_side(turf_to_check)
			switch(direction)
				if(NORTH)
					DS.pixel_y = -32
				if(SOUTH)
					DS.pixel_y = 32
				if(EAST)
					DS.pixel_x = -32
				if(WEST)
					DS.pixel_x = 32
			DS.dir = direction

/turf/open/water/update_icon()
	. = ..()

/turf/open/water/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/open/water))
			to_chat(L, "<span class='warning'>You get drenched in water!</span>")
	AM.water_act(5)
	..()

/turf/open/water/Exited(atom/movable/AM, atom/newloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		if(L.check_submerged() <= 0)
			return
		if(!istype(newloc, /turf/open/water))
			to_chat(L, "<span class='warning'>You wade through \the [src].</span>")
	..()
