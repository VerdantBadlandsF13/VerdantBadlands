/*
The button you get.
*/
/*
/datum/action/innate/teaching
	name = "Teach Concept"
	desc = "Attempt to teach someone a basic concept."
	button_icon = 'icons/mob/actions/backgrounds.dmi'
	background_icon_state = "bg_ecult"
	icon_icon = 'icons/mob/actions/actions_clockcult.dmi'
	button_icon_state = "linked_minds"

	check_flags = AB_CHECK_CONSCIOUS

/datum/action/innate/teaching/Remove(mob/living/remove_from)
	if(HAS_TRAIT(remove_from, TRAIT_TEACHING))
		REMOVE_TRAIT(remove_from, TRAIT_TEACHING, name)
	return ..()

/datum/action/innate/teaching/Activate(mob/living/M)
	if(HAS_TRAIT(owner, TRAIT_TEACHING))

		to_chat(owner, span_noticealien("You begin to speak."))
	else
		Remove(src)
	return TRUE
*/
/*
For teaching other characters a set of skills from granters.
*/

/mob/living/proc/teach_skill()
	set name = "Teach"
	set desc = "Share the knowledge. Enlight the not enlightened!"
	set category = "IC"

	var/list/traits = list()
	var/list/options = list()
	for(var/path in subtypesof(/datum/granter_trait))
		var/datum/granter_trait/T = new path()
		if(is_string_in_list(T.grant, status_traits))
			traits[T.name] = path
			options += T.name

	if(!length(options))
		to_chat(src, "You don't know anything valuable to share.")
		return
	var/select = input(src, "Select a skill to teach", "Select skill") in options
	if(!select)
		return
	var/p = traits[select]
	var/datum/granter_trait/selected = new p()

	var/list/possible_targets = list()
	for(var/mob/living/carbon/target in oview())
		// if(target.stat || !target.mind || !target.client)
		if(target.stat)
			continue
		if(HAS_TRAIT(target, selected.grant))
			continue
		possible_targets += target

	if(!possible_targets.len)
		to_chat(src, "Nobody here is capable of understanding the [selected.name]")
		return

	var/mob/living/carbon/C
	C = input("Who will you train?", "Skill Training") as null|mob in possible_targets
	if(!C)
		return

	to_chat(src, "You begin teaching [C] \the [selected.name]. Take a seat, this will take some time...")
	to_chat(C, "[src] begins teaching you \the [selected.name]. Take a seat, this will take some time...")

	if(do_after(src, 200, FALSE, C))
		to_chat(src, "<span class='notice'>You finish enlightening [C] about the ways of \the [selected.name]!</span>")

		to_chat(C, "<span class='notice'>You feel like you've got a good handle on \the [selected.name]!</span>")
		ADD_TRAIT(C, selected.grant, TAUGHT_TRAIT)

//////////////
// Defines //
/////////////
/datum/granter_trait
	var/name = ""
	var/grant = ""

//Basic stuff.
/datum/granter_trait/cannibal
	name = "Cannibalistic Tendencies"
	grant = TRAIT_LONGPORKLOVER

/datum/granter_trait/salvage
	name = "Knowledge of Salvaging"
	grant = TRAIT_TECHNOPHREAK

/datum/granter_trait/butchering
	name = "Knowledge of Butchering"
	grant = TRAIT_TRAPPER

//Advanced stuff.
/datum/granter_trait/trekking
	name = "Survival Trekking"
	grant = TRAIT_HARD_YARDS

/datum/granter_trait/spirit_teachings
	name = "Basic Alchemist Knowledge"
	grant = TRAIT_MACHINE_SPIRITS

/datum/granter_trait/chemistry
	name = "Basic Chemistry Knowledge"
	grant = TRAIT_CHEMWHIZ

/datum/granter_trait/research
	name = "Basic Research Knowledge"
	grant = TRAIT_RESEARCHER
