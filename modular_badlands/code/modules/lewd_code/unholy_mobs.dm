/*
I'ma be real, the only reason I was convinced added the ERP verbs back was for the shitpost that was Funclaws.
Alongside a Fisto mob, maybe. We'll see.
*/
// Defines.
#define CUM_TARGET_THROAT_CLAW "throat"
#define CUM_TARGET_VAGINA_CLAW "vagina"
#define CUM_TARGET_ANUS_CLAW "anus"
// Funclaw.
/mob/living/simple_animal/hostile/deathclaw/funclaw
	name = "Funclaw"
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one seems to have a strange look in its eyes.."
	var/change_target_hole_cooldown = 0
	var/chosen_hole
	gold_core_spawnable = NO_SPAWN // Admin only
	var/deathclaw_mode = "rape"
	has_penis = TRUE

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. This one has the bedroom eyes.."
	deathclaw_mode = "gentle"

/mob/living/simple_animal/hostile/deathclaw/funclaw/death
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. <br>\
	It would appear that this one is covered in blood and various other fluids. Probably yours for the former."
	deathclaw_mode = "death"

/mob/living/simple_animal/hostile/deathclaw/funclaw/AttackingTarget()
	var/mob/living/M = target

	var/onLewdCooldown = FALSE

	if(get_refraction_dif() > 0)
		onLewdCooldown = TRUE

	switch(deathclaw_mode)
		if("gentle")
			if(onLewdCooldown)
				return // Do nothing
		if("rape")
			if(onLewdCooldown || M.health > 60)
				..() // Attack target
		if("death")
			if(onLewdCooldown || M.health > 60)
				..() // Attack target
				return

	if(!M.pulledby)
		if(!M.buckled && !M.density)
			M.forceMove(src.loc)

		start_pulling(M, supress_message = TRUE)
		log_combat(src, M, "grabbed")
		M.visible_message(span_warning("[src] violently grabs [M]!"), \
			span_userdanger("[src] violently grabs you!"))
		setGrabState(GRAB_NECK) //Instant neck grab

		return

	if(get_refraction_dif() > 0)
		..()
		return

	if(change_target_hole_cooldown < world.time)
		chosen_hole = null
		while (chosen_hole == null)
			pickNewHole(M)
		change_target_hole_cooldown = world.time + 100

	do_lewd_action(M)
	addtimer(CALLBACK(src, .proc/do_lewd_action, M), rand(8, 12))

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/pickNewHole(mob/living/M)
	switch(rand(2))
		if(0)
			chosen_hole = CUM_TARGET_ANUS_CLAW
		if(1)
			if(M.has_vagina())
				chosen_hole = CUM_TARGET_VAGINA_CLAW
			else
				chosen_hole = CUM_TARGET_ANUS_CLAW
		if(2)
			chosen_hole = CUM_TARGET_THROAT_CLAW

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/do_lewd_action(mob/living/M)
	if(get_refraction_dif() > 0)
		return

	if(rand(1,7) == 7)
		playsound(loc, "modular_badlands/code/modules/lewd_code/interactions/sound/unholy/deathclaw_grunt[rand(1, 5)].ogg", 30, 1, -1)

	var/datum/interaction/I
	switch(chosen_hole)
		if(CUM_TARGET_ANUS_CLAW)
			if(tearSlot(M, ITEM_SLOT_OCLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_ICLOTHING))
				return

			// I'm so, so sorry. You get to suffer the random gauntlet.
			if (deathclaw_mode == "death")
				switch(rand(1, 6))
					if(1)
						I = interactions["/datum/interaction/lewd/throatfuck"]
					if(2)
						I = interactions["/datum/interaction/lewd/thighs"]
					if(3)
						I = interactions["/datum/interaction/lewd/earfuck"]
					if(4)
						I = interactions["/datum/interaction/lewd/earfuck/earsocketfuck"]
					if(5)
						I = interactions["/datum/interaction/lewd/eyefuck"]
					if(6)
						I = interactions["/datum/interaction/lewd/eyefuck/eyesocketfuck"]
					else
						I = interactions["/datum/interaction/lewd/fuck"]
				I.display_interaction(src, M)

			else
				I = interactions["/datum/interaction/lewd/fuck/anal"]
			I.display_interaction(src, M)

		if(CUM_TARGET_VAGINA_CLAW)
			if(tearSlot(M, ITEM_SLOT_OCLOTHING))
				return
			if(tearSlot(M, ITEM_SLOT_ICLOTHING))
				return

			// I'm so, so sorry. You get to suffer the random gauntlet.
			if (deathclaw_mode == "death")
				switch(rand(1, 6))
					if(1)
						I = interactions["/datum/interaction/lewd/throatfuck"]
					if(2)
						I = interactions["/datum/interaction/lewd/thighs"]
					if(3)
						I = interactions["/datum/interaction/lewd/earfuck"]
					if(4)
						I = interactions["/datum/interaction/lewd/earfuck/earsocketfuck"]
					if(5)
						I = interactions["/datum/interaction/lewd/eyefuck"]
					if(6)
						I = interactions["/datum/interaction/lewd/eyefuck/eyesocketfuck"]
					else
						I = interactions["/datum/interaction/lewd/fuck"]
				I.display_interaction(src, M)

			else
				I = interactions["/datum/interaction/lewd/fuck"]
			I.display_interaction(src, M)

		if(CUM_TARGET_THROAT_CLAW)
			if(tearSlot(M, ITEM_SLOT_HEAD))
				return
			if(tearSlot(M, ITEM_SLOT_MASK))
				return

			// I'm so, so sorry. You get to suffer the random gauntlet.
			if (deathclaw_mode == "death")
				switch(rand(1, 6))
					if(1)
						I = interactions["/datum/interaction/lewd/throatfuck"]
					if(2)
						I = interactions["/datum/interaction/lewd/thighs"]
					if(3)
						I = interactions["/datum/interaction/lewd/earfuck"]
					if(4)
						I = interactions["/datum/interaction/lewd/earfuck/earsocketfuck"]
					if(5)
						I = interactions["/datum/interaction/lewd/eyefuck"]
					if(6)
						I = interactions["/datum/interaction/lewd/eyefuck/eyesocketfuck"]
					else
						I = interactions["/datum/interaction/lewd/fuck"]
				I.display_interaction(src, M)

			else
				I = interactions["/datum/interaction/lewd/throatfuck"]
				I.display_interaction(src, M)


/mob/living/simple_animal/hostile/deathclaw/funclaw/cum(mob/living/M)

	if(get_refraction_dif() > 0)
		return

	var/message

	if(!istype(M))
		chosen_hole = null

	switch(chosen_hole)
		if(CUM_TARGET_THROAT_CLAW)
			if(M.has_mouth() && M.mouth_is_free())
				message = "shoves their fat reptillian cock deep down \the [M]'s throat and cums."
			else
				message = "cums on \the [M]'s face."
		if(CUM_TARGET_VAGINA_CLAW)
			if(M.is_bottomless() && M.has_vagina())
				message = "rams its meaty cock into \the [M]'s pussy and fills it with sperm."
			else
				message = "cums on \the [M]'s belly."
		if(CUM_TARGET_ANUS_CLAW)
			if(M.is_bottomless() && M.has_anus())
				message = "hilts its knot into \the [M]'s ass and floods it with Deathclaw jizz."
			else
				message = "cums on \the [M]'s backside."
		else
			message = "cums on the floor!"

	if(istype(M, /mob/living/carbon))
		M.reagents.add_reagent(/datum/reagent/consumable/semen, 30)
	new /obj/effect/decal/cleanable/semen(loc)

	playsound(loc, "modular_badlands/code/modules/lewd_code/interactions/sound/unholy/deathclaw[rand(1, 2)].ogg", 30, 1, -1)
	visible_message("<font color=purple><b>\The [src]</b> [message]</font>")
	shake_camera(M, 6, 1)
	set_is_fucking(null ,null)

	refractory_period = world.time + rand(100, 150) // Sex cooldown
	set_lust(0) // Nuts at 400

	addtimer(CALLBACK(src, .proc/slap, M), 15)


/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/slap(mob/living/M)
	playsound(loc, "modular_badlands/code/modules/lewd_code/interactions/sound/slap.ogg", 30, 1, -1)
	visible_message(span_danger("\The [src]</b> slaps \the [M] right on the ass!"), \
			span_userdanger("\The [src]</b> slaps \the [M] right on the ass!"), null, COMBAT_MESSAGE_RANGE)

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/tearSlot(mob/living/M, slot)
	var/obj/item/W = M.get_item_by_slot(slot)
	if(W)
		M.dropItemToGround(W)
		playsound(loc, "sound/items/poster_ripped.ogg", 30, 1, -1)
		visible_message(span_danger("\The [src]</b> tears off \the [M]'s clothes!"), \
				span_userdanger("\The [src]</b> tears off \the [M]'s clothes!"), null, COMBAT_MESSAGE_RANGE)
		return TRUE
	return FALSE
