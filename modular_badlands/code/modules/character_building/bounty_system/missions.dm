/*
	Quest contain information about items needs to complete them.
	And reward in caps
*/
/datum/bounty_quest
	var/name = "Default Quest Name"
	var/desc = "Default Quest Description"
	var/employer = "Default Employer"

	/* This items needs to complete this quest */
	var/list/target_items = list()

	/* How many caps will spawned after quest complete */
	var/caps_reward = 10

	/* Will show to player, when quest is complete */
	var/end_message = "*beep* Sent. Caps Recieved."

	var/need_message = "Need some items"

	var/employer_icon_folder = "icons/bounty_employers/"

	var/employer_icon = "employer_00.png"

/datum/bounty_quest/proc/ItsATarget(var/target)
	for(var/target_type in target_items)
		if(istype(target, target_type))
			return 1
	return 0

/datum/bounty_quest/proc/GetIconWithPath()
	return text2path("[employer_icon_folder][employer_icon]")

/datum/bounty_quest/faction/wasteland/qst_0
	name = "Ghoul Contract"
	desc = "Temporary message for description."
	employer = "Security Chief - Gustavo"
	employer_icon = "employer_00.png"
	need_message = "Five ghoul corpses."
	end_message = "Chump."
	target_items = list(/mob/living/simple_animal/hostile/ghoul = 5)
	caps_reward = 226

/datum/bounty_quest/faction/wasteland/qst_1
	employer = "Barrel Contract"
	need_message = "Radioactive Barrel."
	target_items = list(/obj/structure/reagent_dispensers/barrel/dangerous = 1)
	caps_reward = 100
