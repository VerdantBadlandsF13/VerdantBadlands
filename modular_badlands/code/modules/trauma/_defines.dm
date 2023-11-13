/**
Houses the defines required, to keep this modular.
*/

#define MOVESPEED_ID_PAIN "PAIN"// Not currently used.
#define BASE_CARBON_PAIN_RESIST 80// Amount of arbitrary "pain" that a mob can take before they start going into shock (see: update_pain_level())

/mob/living/carbon/human/Life()
	if(stat != DEAD)
		handle_shock()
		handle_pain()
	. = ..()

/mob/living/proc/feels_pain(mob/living/carbon/human/H)
	if(HAS_TRAIT(H, TRAIT_NOPAIN))
		return FALSE
	return TRUE

/mob/living/silicon/feels_pain()
	return FALSE
