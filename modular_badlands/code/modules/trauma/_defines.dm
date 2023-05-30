/**
Houses the defines required, to keep this modular.
*/

#define MOVESPEED_ID_PAIN "PAIN"// Not currently used.
#define BASE_CARBON_PAIN_RESIST 40// Amount of arbitrary "pain" that a mob can take before they start going into shock (see: update_pain_level())

/mob/living/carbon/human/Life()
	if(stat != DEAD)
		handle_shock()
	. = ..()
