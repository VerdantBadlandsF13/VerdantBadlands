/*
I'ma be real, the only reason I was convinced added the ERP verbs back was for the shitpost that was Funclaws.
Alongside a Fisto mob, maybe. We'll see.
*/
// Defines.
#define CUM_TARGET_THROAT_CLAW "throat"
#define CUM_TARGET_VAGINA_CLAW "vagina"
#define CUM_TARGET_ANUS_CLAW "anus"

#define CUM_TARGET_MOUTH_CLAW "mouth"
#define THIGH_SMOTHERING_CLAW "thigh_smother"
/*
Funclaw, given three modes.
#1: Rape. Harms players to roughly half health and instagrabs them.
#2: Gentle. Doesn't cause harm, but otherwise functions like rape.
#3: Death. Kills, or puts the player into death crit, before reverting to rape.
These function regardless of prefs, as they're intended to be admin-spawn only.
*/
/mob/living/simple_animal/hostile/deathclaw/funclaw
	desc = "A massive, reptilian creature with powerful muscles, razor-sharp claws, and aggression to match. <br>\
	It would appear that this one is covered in blood and various other fluids. Probably yours for the former."
	var/change_target_hole_cooldown = 0
	var/chosen_hole
	var/deathclaw_mode = "rape"
	gold_core_spawnable = NO_SPAWN // Admin only
	retreat_distance = 0
	minimum_distance = 1
	wander = FALSE
	a_intent = INTENT_HARM
	var/male = TRUE// Handles the obvious.

/mob/living/simple_animal/hostile/deathclaw/funclaw/fem
	male = FALSE

/mob/living/simple_animal/hostile/deathclaw/funclaw/gentle
	deathclaw_mode = "gentle"

/mob/living/simple_animal/hostile/deathclaw/funclaw/fem/gentle
	deathclaw_mode = "gentle"

/mob/living/simple_animal/hostile/deathclaw/funclaw/death
	deathclaw_mode = "death"

/mob/living/simple_animal/hostile/deathclaw/funclaw/fem/death
	deathclaw_mode = "death"

/mob/living/simple_animal/hostile/deathclaw/funclaw/New()
	. = ..()
	if(male)
		has_penis = TRUE
		gender = MALE
	else
		male = FALSE
		has_vagina = TRUE
		gender = FEMALE

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
			if(onLewdCooldown || M.health > 15)
				..() // Near kill target
				return

	if(!M.pulledby)
		if(!M.buckled && !M.density)
			M.forceMove(src.loc)

		start_pulling(M, supress_message = TRUE)
		log_combat(src, M, "grabbed")
		M.visible_message(span_warning("[src] violently grabs [M]!"), \
			span_userdanger("[src] violently grabs you!"))
		setGrabState(GRAB_NECK) //Instant neck grab

		if(!ishuman(M) || M.health <= 0)
			src.drop_all_held_items()
			src.stop_pulling()

		return

	if(get_refraction_dif() > 0)
		..()
		return

	if(male)
		if(change_target_hole_cooldown < world.time)
			chosen_hole = null
			while (chosen_hole == null)
				pickNewHole(M)
			change_target_hole_cooldown = world.time + 100

	if(!male)
		if(change_target_hole_cooldown < world.time)
			chosen_hole = null
			while (chosen_hole == null)
				pickNewHolef(M)
			change_target_hole_cooldown = world.time + 100

	if(male)
		pound(M)
		addtimer(CALLBACK(src, .proc/pound, M), rand(8, 12))

	if(!male)
		poundf(M)
		addtimer(CALLBACK(src, .proc/poundf, M), rand(8, 12))

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

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/pickNewHolef(mob/living/M)
	switch(rand(2))
		if(0)
			chosen_hole = CUM_TARGET_MOUTH_CLAW
		if(1)
			if(M.has_penis())
				chosen_hole = CUM_TARGET_VAGINA_CLAW
			else
				chosen_hole = THIGH_SMOTHERING_CLAW
		if(2)
			chosen_hole = THIGH_SMOTHERING_CLAW

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/pound(mob/living/M)
	if(refractory_period > 0)
		return

	switch(chosen_hole)
		if(CUM_TARGET_ANUS_CLAW)
			if(tearSlot(M, SLOT_WEAR_SUIT))
				return
			if(tearSlot(M, SLOT_W_UNIFORM))
				return
			do_anal(M)

		if(CUM_TARGET_VAGINA_CLAW)
			if(tearSlot(M, SLOT_WEAR_SUIT))
				return
			if(tearSlot(M, SLOT_W_UNIFORM))
				return
			do_vaginal(M)

		if(CUM_TARGET_THROAT_CLAW)
			if(tearSlot(M, SLOT_HEAD))
				return
			if(tearSlot(M, SLOT_WEAR_MASK))
				return
			do_throatfuck(M)

/mob/living/simple_animal/hostile/deathclaw/funclaw/proc/poundf(mob/living/M)
	if(refractory_period > 0)
		return

	switch(chosen_hole)
		if(CUM_TARGET_MOUTH_CLAW)
			if(tearSlot(M, SLOT_HEAD))
				return
			if(tearSlot(M, SLOT_WEAR_MASK))
				return
			do_facefuck(M)

		if(CUM_TARGET_VAGINA_CLAW)
			if(tearSlot(M, SLOT_WEAR_SUIT))
				return
			if(tearSlot(M, SLOT_W_UNIFORM))
				return
			do_mount(M)

		if(THIGH_SMOTHERING_CLAW)
			if(tearSlot(M, SLOT_HEAD))
				return
			if(tearSlot(M, SLOT_WEAR_MASK))
				return
			thigh_smother(M)

/mob/living/simple_animal/hostile/deathclaw/funclaw/cum(mob/living/M)

	if(get_refraction_dif() > 0)
		return

	if(!male)
		shake_camera(M, 6, 1)
		set_is_fucking(null ,null)

		refractory_period = world.time + rand(100, 150) // Sex cooldown
		set_lust(0) // Nuts at 400

		addtimer(CALLBACK(src, .proc/slap, M), 15)
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
		M.reagents.add_reagent(/datum/reagent/consumable/semen, 60)
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
