/*
Probably not where this should be, but it works.
TG's system for stealth, repurposed for our special stats.
*/
/datum/action/innate/sneak
	name = "Stealth"
	desc = "Attempt to blend into your surroundings."
	button_icon = 'icons/mob/actions/backgrounds.dmi'
	background_icon_state = "bg_ecult"
	icon_icon = 'icons/mob/actions/actions_changeling.dmi'
	button_icon_state = "ling_camouflage"

	check_flags = AB_CHECK_CONSCIOUS|AB_CHECK_RESTRAINED

/datum/action/innate/sneak/Remove(mob/living/remove_from)
	if(HAS_TRAIT(remove_from, TRAIT_SNEAK))
		remove_from.alpha = initial(remove_from.alpha)
		REMOVE_TRAIT(remove_from, TRAIT_SNEAK, name)

	return ..()

/datum/action/innate/sneak/Activate(atom/target)
	if(HAS_TRAIT(owner, TRAIT_SNEAK))
		owner.alpha = initial(owner.alpha)
		to_chat(owner, span_noticealien("You reveal yourself!"))
		REMOVE_TRAIT(owner, TRAIT_SNEAK, name)

	else
		owner.alpha = 100 - owner.special_a * 5
		to_chat(owner, span_noticealien("You blend into the enviorment..."))
		ADD_TRAIT(owner, TRAIT_SNEAK, name)

	return TRUE
