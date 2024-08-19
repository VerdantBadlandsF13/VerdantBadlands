/*
Probably not where this should be, but it works. As with stealth.
*/
/datum/action/innate/tackle
	name = "Tackle"
	desc = "Prepare to charge someone."
	button_icon = 'icons/mob/actions/backgrounds.dmi'
	background_icon_state = "bg_ecult"
	icon_icon = 'icons/mob/actions/bloodsucker.dmi'
	button_icon_state = "power_speed"

	check_flags = AB_CHECK_CONSCIOUS|AB_CHECK_RESTRAINED

	//custom_premium_price = PRICE_EXPENSIVE
	/// For storing our tackler datum so we can remove it after
	var/datum/component/tackler
	/// See: [/datum/component/tackler/var/stamina_cost]
	var/stamina_cost = 50
	/// See: [/datum/component/tackler/var/base_knockdown]
	var/base_knockdown = 2 SECONDS
	/// See: [/datum/component/tackler/var/range]
	var/tackle_range = 2
	/// See: [/datum/component/tackler/var/min_distance]
	var/min_distance = 0
	/// See: [/datum/component/tackler/var/speed]
	var/tackle_speed = 1
	/// See: [/datum/component/tackler/var/skill_mod]
	var/skill_mod = 1


/datum/action/innate/tackle/Remove(mob/living/remove_from)
	if(HAS_TRAIT(remove_from, TRAIT_PREP_TACKLE))
		REMOVE_TRAIT(remove_from, TRAIT_PREP_TACKLE, name)

	return ..()

/datum/action/innate/tackle/Activate(atom/target)
	if(HAS_TRAIT(owner, TRAIT_PREP_TACKLE))
		to_chat(owner, span_noticealien("You calm yourself!"))
		REMOVE_TRAIT(owner, TRAIT_PREP_TACKLE, name)
		qdel(tackler)

	else
		to_chat(owner, span_noticealien("You prepare to strike..."))
		ADD_TRAIT(owner, TRAIT_PREP_TACKLE, name)
		var/mob/living/carbon/human/H = owner
		tackler = H.AddComponent(/datum/component/tackler, stamina_cost -= owner.special_e, base_knockdown = owner.special_s, range = owner.special_a, speed = owner.special_a, skill_mod = owner.special_l, min_distance = min_distance/* = owner.special_a*/)


	return TRUE
