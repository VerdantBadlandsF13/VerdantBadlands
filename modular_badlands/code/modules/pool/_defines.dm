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
	if(T.has_catwalk)
		return FALSE
	if(buckled)
		return 0
	if(istype(loc, /turf/open/indestructible/ground/outside/water) || istype(loc, /turf/open/water) || istype(loc, /turf/open/indestructible/sound/pool))
		return T.depth
	return 0

// Use this to have things react to having water applied to them.
/atom/movable/proc/water_act(amount)
	return

/mob/living/water_act(amount)
	adjust_fire_stacks(-amount * 5)
	for(var/atom/movable/AM in contents)
		AM.water_act(amount)

// Universal swimming stuff.
/turf/open/CanPass(atom/movable/mover, turf/target)
	var/datum/component/swimming/S = mover.GetComponent(/datum/component/swimming) //If you're swimming around, you don't really want to stop swimming just like that do you?
	if(S)
		return FALSE //If you're swimming, you can't swim into a regular turf, y'dig?
	. = ..()

/turf/open/MouseDrop_T(atom/dropping, mob/user)
	var/turf/open/T = get_turf(src)
	if(!isliving(user) || !isliving(dropping)) //No I don't want ghosts to be able to dunk people into the pool.
		return
	var/atom/movable/AM = dropping
	var/datum/component/swimming/S = dropping.GetComponent(/datum/component/swimming)
	if(S)
		if(do_after(user, 1 SECONDS, src))
			S.RemoveComponent()
			visible_message("<span class='notice'>[dropping] climbs out of \the [T].</span>")
			AM.forceMove(src)
	else
		. = ..()

/datum/mood_event/poolparty
	description = "<span class='nicegreen'>I love swimming!</span>\n"
	mood_change = 2
	timeout = 2 MINUTES

/datum/mood_event/robotpool
	description = "<span class='warning'>I really wasn't built with water resistance in mind...</span>\n"
	mood_change = -3
	timeout = 2 MINUTES

/datum/mood_event/poolwet
	description = "<span class='warning'>Eugh! My clothes are soaking wet from that swim.</span>\n"
	mood_change = -4
	timeout = 4 MINUTES
