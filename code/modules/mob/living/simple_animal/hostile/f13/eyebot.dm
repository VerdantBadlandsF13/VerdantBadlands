/////////////
// EYEBOTS //
/////////////

/mob/living/simple_animal/hostile/eyebot
	name = "eyebot"
	desc = "A hovering, propaganda-spewing reconnaissance and surveillance robot with radio antennas pointing out its back and loudspeakers blaring out the front."
	icon = 'icons/fallout/mobs/robots/eyebots.dmi'
	icon_state = "eyebot"
	icon_living = "eyebot"
	icon_dead = "eyebot_d"
	speak_chance = 0
	turns_per_move = 6
	environment_smash = 0
	response_help_simple = "touches"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	move_to_delay = 3
	stat_attack = 1
	robust_searching = 1
	maxHealth = 70
	health = 70
	healable = 0
	mob_biotypes = MOB_ROBOTIC|MOB_INORGANIC
	blood_volume = 0
	faction = list("hostile", "enclave", "wastebot", "ghoul", "cazador", "supermutant", "bighorner")
	harm_intent_damage = 8
	melee_damage_lower = 2
	melee_damage_upper = 3
	minimum_distance = 6
	retreat_distance = 14
	attack_verb_simple = "punches"
	attack_sound = "punch"
	a_intent = "harm"
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	status_flags = CANPUSH
	vision_range = 13
	aggro_vision_range = 2
	ranged = 1
	projectiletype = /obj/item/projectile/beam/laser/pistol/wattz
	projectilesound = 'sound/weapons/resonator_fire.ogg'
	aggrosound = list('sound/f13npc/eyebot/aggro.ogg', )
	idlesound = list('sound/f13npc/eyebot/idle1.ogg', 'sound/f13npc/eyebot/idle2.ogg')
	death_sound = 'sound/f13npc/eyebot/robo_death.ogg'
	speak_emote = list("states")

/mob/living/simple_animal/hostile/eyebot/New()
	..()
	name = "ED-[rand(1000,9999)]"

/mob/living/simple_animal/hostile/eyebot/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	var/emp_damage = round((maxHealth * 0.1) * (severity * 0.1)) // 10% of max HP * 10% of severity(Usually around 20-40)
	adjustBruteLoss(emp_damage)

/mob/living/simple_animal/hostile/eyebot/floatingeye
	name = "floating eyebot"
	desc = "A quick-observation robot commonly found in pre-War military installations.<br>The floating eyebot uses a powerful taser to keep intruders in line."
	icon_state = "floatingeye"
	icon_living = "floatingeye"
	icon_dead = "floatingeye_d"

	retreat_distance = 4
	faction = list("hostile", "bs")

	projectiletype = /obj/item/projectile/energy/electrode
	projectilesound = 'sound/weapons/resonator_blast.ogg'

/mob/living/simple_animal/hostile/eyebot/floatingeye/New()
	..()
	name = "FEB-[rand(1000,9999)]"

/mob/living/simple_animal/pet/dog/eyebot //It's a propaganda eyebot, not a dog, but...
	name = "propaganda eyebot"
	desc = "This eyebot's weapons module has been removed and replaced with a loudspeaker. It appears to be shouting Pre-War propaganda."
	icon = 'icons/fallout/mobs/robots/eyebots.dmi'
	icon_state = "eyebot"
	icon_living = "eyebot"
	icon_dead = "eyebot_d"
	icon_gib = "eyebot_d"
	maxHealth = 60
	health = 60
	speak_chance = 8
	gender = NEUTER
	mob_biotypes = MOB_ROBOTIC
	faction = list("hostile", "enclave", "wastebot", "ghoul", "cazador", "supermutant", "bighorner")
	speak = list()
	speak_emote = list("states")
	emote_hear = list()
	emote_see = list("buzzes.","pings.","floats in place")
	response_help_simple  = "shakes the radio of"
	response_disarm_simple = "pushes"
	response_harm_simple   = "punches"
	attack_sound = 'sound/voice/liveagain.ogg'
	butcher_results = list(/obj/effect/gibspawner/robot = 1)
	blood_volume = 0

/mob/living/simple_animal/pet/dog/eyebot/dense
	name = "\improper Paladin Dense"
	desc = "This eyebot's weapons module has been removed and replaced with a loudspeaker. A pet project of the Librarian."
	icon_state = "floatingeye"
	icon_living = "floatingeye"
	icon_dead = "floatingeye_d"

/mob/living/simple_animal/pet/dog/eyebot/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/wuv, "beeps happily!", EMOTE_AUDIBLE)

/mob/living/simple_animal/pet/dog/eyebot/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	var/emp_damage = round((maxHealth * 0.1) * (severity * 0.1)) // 10% of max HP * 10% of severity(Usually around 20-40)
	adjustBruteLoss(emp_damage)
