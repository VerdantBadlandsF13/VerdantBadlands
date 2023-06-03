/obj/item/lockpick_set
	name = "lockpicking set"
	desc = "A set of tools dedicated to lockpicking, intended for the novice to the master."
	icon = 'icons/obj/fallout/lockbox.dmi'
	icon_state = "basic_lockpick"

/obj/item/locked_box
	name = "locked box"
	desc = "An object that contains objects that may be useful."
	icon = 'icons/obj/fallout/lockbox.dmi'
	icon_state = "locked_safe"

	//the lists the locked crate will combine
	//this uses pick, not pickweight, so no weighted lists please
	var/list/global_loot_lists = list()
	//the list that is compiled from the combined global loot lists
	var/list/potential_prizes = list()
	//the amount of items chosen from the potential prizes, minimum of 1 obviously, don't put too much
	var/prize_amount = 1
	//the items chosen from the potential prizes
	var/list/prizes = list()
	//intended 5 lock tiers, luck SPECIAL affects, from 1-5
	var/lock_tier = 1
	//either true or false; you got two chances with a screwdriver
	//when true, will get destroyed if not opened correctly; when false, will be set to true if it was not opened correctly (screwdriver)
	var/fragile = FALSE
	//oh boy, somebody trapped this poor crate and it will give the next 'winner' a real 'prize'
	var/trapped = FALSE
	//whether its locked or not, will allow it to either open or not
	var/locked = TRUE
	//so you can't spam click the locked crate
	var/used = FALSE
	//this will just add whatever is here right before locked crate
	//example: prewar clothing locked crate
	var/easy_naming = ""
	//this makes it to where one can either allow or disallow the addition of the loot tables
	var/enable_loot_initialize = TRUE
	//this is the probability that the lockbox will just open on spawn
	var/prob_open = 40

/obj/item/locked_box/Initialize(mapload)
	. = ..()
	name = "[easy_naming][initial(name)]"
	if(enable_loot_initialize)
		initialize_prizes()
	if(mapload)
		if(!locked || prob(prob_open))
			spawn_prizes()

/obj/item/locked_box/examine(mob/user)
	. = ..()
	if(locked)
		switch(lock_tier)
			if(1)
				. += "The lock looks simple."
			if(2)
				. += "The lock looks somewhat easy."
			if(3)
				. += "The lock looks average."
			if(4)
				. += "The lock looks a little hard."
			if(5)
				. += "The lock looks very difficult."
	if(!locked)
		. += "[src] appears to be unlocked."
	if(fragile)
		. += "There are cracks, [src] may crumble from any sudden movements."
	if(user.client.prefs.special_p >= 8)
		if(trapped)
			. += "The lock looks tampered with."
		. += "There [prize_amount > 1 ? "are" : "is"] [prize_amount] [prize_amount > 1 ? "objects" : "object"]."

/obj/item/locked_box/proc/initialize_prizes()
	potential_prizes = list() //we are setting them to an empty list so you can't double the amount of stuff
	prizes = list()
	for(var/i in global_loot_lists) //go back up to understand why we populate potential_prizes
		for(var/ii in i)
			potential_prizes += ii
	for(var/iii in 1 to prize_amount) //go back up to understand why we populate prizes
		prizes += pick(potential_prizes)

/obj/item/locked_box/proc/spawn_prizes()
	if(trapped) //gnarly
		spawn(3 SECONDS)
			explosion(src, 0,0,1, flame_range = 2)
			qdel(src)
		return
	var/turf/prize_turf = get_turf(src)
	for(var/prize in prizes)
		new prize(prize_turf)
	qdel(src) //NO MORE, YOU MUST DIE AFTER SPAWNING

/obj/item/locked_box/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/screwdriver))
		if(!locked)
			return
		var/success_after_tier = max(100 - (lock_tier * 20), 0) / 2 //the higher the lock tier, the harder it is, down to a max of 0, divided by 2
		if(!prob(success_after_tier))
			if(fragile)
				to_chat(user, "<span class='warning'>You fail to open [src]. It crumbles apart, all the contents being destroyed.</span>")
				qdel(src)
				return
			to_chat(user, "<span class='warning'>You fail to unlock [src]. It looks like it took some damage from the attempt.</span>")
			fragile = TRUE
			return
		to_chat(user, "<span class='green'>You successfully unlock [src].</span>")
		locked = FALSE
		return
	else if(istype(W, /obj/item/lockpick_set))
		if(!locked)
			return
		var/success_after_tier = max(100 - (lock_tier * 20), 0) //the higher the lock tier, the harder it is, down to a max of 0
		var/success_after_skill = min((user.client.prefs.special_l * 5) + success_after_tier, 100) //the higher the persons luck, the better, up to a max of 100, with 50 added
		if(!prob(success_after_skill))
			to_chat(user, "<span class='warning'>You fail to pick [src].</span>")
			return
		to_chat(user, "<span class='green'>You successfully unlock [src].</span>")
		locked = FALSE
		return
	else
		return ..()

/obj/item/locked_box/attack_self(mob/user)
	. = ..()
	if(!locked)
		if(used)
			return
		used = TRUE
		spawn_prizes()
		return
	to_chat(user, "<span class='warning'>[src] is locked up tight, perhaps you can open it?</span>")

/************
*** ARMOR ***
************/

/obj/item/locked_box/armor
	easy_naming = "armor "
	prize_amount = 4

/obj/item/locked_box/armor/prewar_clothes
	easy_naming = "prewar clothing "
	prize_amount = 4

/obj/item/locked_box/armor/prewar_clothes/initialize_prizes()
	global_loot_lists = list(GLOB.loot_prewar_clothing)
	. = ..()

/**************
*** MEDICAL ***
**************/

/obj/item/locked_box/medical/surgical_tool
	easy_naming = "surgical tool "
	prize_amount = 1

/obj/item/locked_box/medical/surgical_tool/initialize_prizes()
	global_loot_lists = list(GLOB.loot_medical_tool)
	. = ..()

/obj/item/locked_box/medical/medicine
	easy_naming = "medicine "
	prize_amount = 2

/obj/item/locked_box/medical/medicine/initialize_prizes()
	global_loot_lists = list(GLOB.loot_medical_medicine)
	. = ..()

/obj/item/locked_box/medical/drugs
	easy_naming = "drug "
	prize_amount = 2

/obj/item/locked_box/medical/drugs/initialize_prizes()
	global_loot_lists = list(GLOB.loot_medical_drug)
	. = ..()

/***********
*** MISC ***
***********/

/obj/item/locked_box/misc
	prize_amount = 3
	locked = FALSE

/obj/item/locked_box/misc/garbage

/obj/item/locked_box/misc/garbage/initialize_prizes()
	global_loot_lists = list(GLOB.loot_garbage)
	. = ..()

/obj/item/locked_box/misc/seed
	easy_naming = "seed "
	prize_amount = 5

/obj/item/locked_box/misc/seed/initialize_prizes()
	global_loot_lists = list(GLOB.loot_seed)
	. = ..()

/obj/item/locked_box/misc/food
	easy_naming = "food "

/obj/item/locked_box/misc/food/initialize_prizes()
	global_loot_lists = list(GLOB.loot_food)
	. = ..()

/obj/item/locked_box/misc/alcohol
	easy_naming = "alcohol "

/obj/item/locked_box/misc/alcohol/initialize_prizes()
	global_loot_lists = list(GLOB.loot_alcohol)
	. = ..()

/obj/item/locked_box/misc/crafting
	easy_naming = "crafting "

/obj/item/locked_box/misc/crafting/initialize_prizes()
	global_loot_lists = list(GLOB.loot_craft_basic)
	. = ..()

/obj/item/locked_box/misc/crafting/advanced
	prize_amount = 2
	locked = TRUE

/obj/item/locked_box/misc/crafting/advanced/initialize_prizes()
	global_loot_lists = list(GLOB.loot_craft_advanced)
	. = ..()

/obj/item/locked_box/misc/resource
	easy_naming = "resource "

/obj/item/locked_box/misc/resource/initialize_prizes()
	global_loot_lists = list(GLOB.loot_material)
	. = ..()

/obj/item/locked_box/misc/attachments
	easy_naming = "attachment "
	prize_amount = 1
	locked = TRUE
	lock_tier = 3

/obj/item/locked_box/misc/attachments/initialize_prizes()
	global_loot_lists = list(GLOB.loot_attachment)
	. = ..()
