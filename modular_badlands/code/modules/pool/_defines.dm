/**
Houses the defines required, to keep this modular.
*/

#define COMSIG_MOB_ATTACK_HAND_TURF "mob_attack_hand_turf"    // from the base of turf/attack_hand

#define COMSIG_CARBON_SPECIESCHANGE "mob_carbon_specieschange"    // from base of mob/living/carbon/set_species(): (new_race)

#define MOVESPEED_ID_SWIMMING "SWIMMING_SPEED_MOD"

// Not quite a set of defines but whatever aaaaaaaa
// Can't this also be put into the other proc?????
/turf/attack_hand(mob/user)
	. = ..()
	if(SEND_SIGNAL(user, COMSIG_MOB_ATTACK_HAND_TURF, src) & COMPONENT_NO_ATTACK_HAND)
		. = TRUE
	if(.)
		return
	user.Move_Pulled(src)

/datum/species
	// The component to add when swimming
	var/swimming_component = /datum/component/swimming

/mob/living/proc/check_submerged()
	var/turf/open/T = loc
	if(buckled)
		return 0
	if(locate(/obj/structure/lattice/catwalk) in loc)// Both of these are super hacky, but work.
		T.slowdown = 0
		T.footstep = FOOTSTEP_PLATING
		T.barefootstep = FOOTSTEP_PLATING
		T.clawfootstep = FOOTSTEP_PLATING
		T.heavyfootstep = FOOTSTEP_PLATING
		T.depth = 0
		return 0
	if(istype(loc, /turf/open/indestructible/ground/outside/water) || istype(loc, /turf/open/water) || istype(loc, /turf/open/indestructible/sound/pool))
		return T.depth
	if(!locate(/obj/structure/lattice/catwalk) in loc)
		T.slowdown = 2
		T.footstep = FOOTSTEP_WATER
		T.barefootstep = FOOTSTEP_WATER
		T.clawfootstep = FOOTSTEP_WATER
		T.heavyfootstep = FOOTSTEP_WATER
		T.depth = 1
		return 0
	return 0

// Use this to have things react to having water applied to them.
/atom/movable/proc/water_act(amount)
	return

/mob/living/water_act(amount)
	adjust_fire_stacks(-amount * 5)
	for(var/atom/movable/AM in contents)
		AM.water_act(amount)
