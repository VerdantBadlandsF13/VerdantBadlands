SUBSYSTEM_DEF(monster_wave)
	name = "Monster Wave"
	wait = 30 MINUTES //change to either 30 MINUTES or 1 HOURS
	var/successful_firing = 0
	var/allowed_firings = 4
	var/chance_of_fire = 50

//So admins, you want to be a tough guy, like it really rough guy?
//just know you can't modify the time in between each fire
//but you can allow it to always fire, by changing chance_of_fire to 0
//and changing allowed_firings to like.... 12?

/datum/controller/subsystem/monster_wave/fire(resumed = 0)
	if(times_fired <= 0)
		message_admins("The Monster Wave has fired the first time. Next fire will spawn a monster pit.")
		log_game("The Monster Wave has fired the first time. Next fire will spawn a monster pit.")
		return
	if(successful_firing >= allowed_firings)
		message_admins("The Monster Wave has been disabled, maximum amount of waves spawned.")
		log_game("The Monster Wave has been disabled, maximum amount of waves spawned.")
		can_fire = FALSE
		return
	if(prob(chance_of_fire))
		for(var/M in GLOB.player_list)
			shake_camera(M, 2, 1)
			to_chat(M, "<span class='notice'>You feel the ground rumble subtly beneath your feet.</font></span>")
		return // 50/50 chance for it to either fire or not fire
	successful_firing++
	addtimer(CALLBACK(src, PROC_REF(spawn_monsterwave)), 10 SECONDS)
	for(var/M in GLOB.player_list)
		shake_camera(M, 3, 2)
		to_chat(M, "<span class='notice'>You feel the ground tremor violently beneath your feet!</font></span>")

/datum/controller/subsystem/monster_wave/proc/spawn_monsterwave()

	//--- TRIGGER WORLD TREMORS ---
	for(var/obj/effect/landmark/tremor_area/TR in GLOB.tremor_landmarks)
		TR = pick(GLOB.tremor_landmarks)
		TR.tremor()

	//--- NOW WE PICK A SPAWN TYPE ---
	var/pick_unfortune = pick("Ghoul", "Molerat", "Wild Dog")
	switch(pick_unfortune)
		if("Ghoul")
			ghoul_wave()
		if("Molerat")
			molerat_wave()
		if("Wild Dog")
			dog_wave()

/datum/controller/subsystem/monster_wave/proc/ghoul_wave()
	var/spawn_amount = CEILING(GLOB.player_list.len / 8, 1)
	var/turf/choose_turf = quick_safe_turf()
	for(var/i in 1 to spawn_amount)
		new /mob/living/simple_animal/hostile/ghoul/glowing(choose_turf)
	new /obj/structure/nest/ghoul(choose_turf)
	message_admins("The Monster Wave has fired. A nest has been spawned at [ADMIN_VERBOSEJMP(choose_turf)]")
	log_game("The Monster Wave has fired. A nest has been spawned at [AREACOORD(choose_turf)]")

/datum/controller/subsystem/monster_wave/proc/molerat_wave()
	var/spawn_amount = CEILING(GLOB.player_list.len / 5, 1)
	var/turf/choose_turf = quick_safe_turf()
	for(var/i in 1 to spawn_amount)
		new /mob/living/simple_animal/hostile/molerat(choose_turf)
	new /obj/structure/nest/molerat(choose_turf)
	message_admins("The Monster Wave has fired. A nest has been spawned at [ADMIN_VERBOSEJMP(choose_turf)]")
	log_game("The Monster Wave has fired. A nest has been spawned at [AREACOORD(choose_turf)]")

/datum/controller/subsystem/monster_wave/proc/dog_wave()
	var/spawn_amount = CEILING(GLOB.player_list.len / 5, 1)
	var/turf/choose_turf = quick_safe_turf()
	for(var/i in 1 to spawn_amount)
		new /mob/living/simple_animal/hostile/wolf/alpha(choose_turf)
	new /obj/structure/nest/wolf(choose_turf)
	message_admins("The Monster Wave has fired. A nest has been spawned at [ADMIN_VERBOSEJMP(choose_turf)]")
	log_game("The Monster Wave has fired. A nest has been spawned at [AREACOORD(choose_turf)]")
