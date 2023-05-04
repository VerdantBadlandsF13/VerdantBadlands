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
