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
		L.update_water()
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
		L.update_water()
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
		L.update_water()
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
		L.update_water()
		L.apply_effect(2, EFFECT_IRRADIATE, 0)
		if(!istype(newloc, /turf/open/indestructible/ground/outside/water))
			to_chat(L, "<span class='warning'>You wade through \the [src].</span>")
	..()
