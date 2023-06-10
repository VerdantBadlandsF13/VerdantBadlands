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
			if (T.teachable)
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
		if(target.has_trait(selected.grant))
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
		C.add_trait(selected.grant, TRAIT_GENERIC)
