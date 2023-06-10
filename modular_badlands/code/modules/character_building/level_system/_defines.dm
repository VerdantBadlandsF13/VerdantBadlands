/mob/living
	var/murder = null // Unused. Meant for Karma.
	var/datum/experience/experience
	var/datum/perkController/perks

/datum/job
	var/karma = 0
	var/datum/perkController/perks

/mob/living/Initialize()
	. = ..()

	experience = new /datum/experience(src)
	perks = new /datum/perkController(src)
