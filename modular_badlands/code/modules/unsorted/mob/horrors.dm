/* IN THIS FILE
Horrors.
Generally stuff we use in dark caverns, that you could imagine come from FEV.
Vermont forest creatures with a temporary sprite from you know where.
Don't use these.
*/

//Base Horror
/mob/living/simple_animal/hostile/horror
	name = "horror"
	desc = "Some manner of creature churned out by the Vermont wilds. Its flesh ripples as if something unseen lurks beneath."
	icon = 'modular_badlands/code/modules/unsorted/icons/horrors_32x32.dmi'
	icon_state = "horror1"
	icon_living = "horror1"
	icon_dead = "horror1"// Never seen. Creature is immediately qdel'd and replaced with the parasite on death.
	mob_biotypes = MOB_UNDEAD|MOB_BEAST// Not undead, but it fits.
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	a_intent = INTENT_HARM
	maxHealth = 60
	health = 60
	speed = 2.4
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 25
	armour_penetration = 0.1
	attack_verb_simple = "claw"
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("hostile", "horror")
	decompose = TRUE
	sharpness = SHARP_EDGED
	guaranteed_butcher_results = list(/mob/living/simple_animal/hostile/horror/parasite = 2,
							/obj/item/stack/sheet/xenochitin = 1)
	footstep_type = FOOTSTEP_MOB_CLAW
	emote_taunt = list(
		"gurgles",
		"stares",
		"foams at the mouth",
		"groans",
		"growls",
		"jibbers",
		"howls madly",
		"screeches",
		"charges")
	taunt_chance = 30

	emote_taunt_sound = list('sound/f13npc/ghoul_new/ghoul_charge1.ogg','sound/f13npc/ghoul_new/ghoul_charge2.ogg','sound/f13npc/ghoul_new/ghoul_charge3.ogg')
	aggrosound = list('sound/f13npc/ghoul/aggro1.ogg', 'sound/f13npc/ghoul/aggro2.ogg')
	attack_sound = list('sound/f13npc/ghoul_new/ghoul_attack_01.ogg','sound/f13npc/ghoul_new/ghoul_attack_02.ogg','sound/f13npc/ghoul_new/ghoul_attack_03.ogg',\
	'sound/f13npc/ghoul_new/ghoul_attack_04.ogg')
	death_sound = list('sound/f13npc/ghoul_new/ghoul_death_01.ogg','sound/f13npc/ghoul_new/ghoul_death_02.ogg','sound/f13npc/ghoul_new/ghoul_death_03.ogg',\
	'sound/f13npc/ghoul_new/ghoul_death_04.ogg')
	idlesound = list('sound/f13npc/ghoul/idle.ogg','sound/f13npc/ghoul_new/ghoul_seizure_long.ogg','sound/f13npc/ghoul_new/ghoul_seizure_short.ogg')

//Parasite from Horror
/mob/living/simple_animal/hostile/horror/parasite
	name = "horror"
	desc = "Some manner of creature churned out by the Vermont wilds."
	icon = 'modular_badlands/code/modules/unsorted/icons/horrors_32x32.dmi'
	icon_state = "horror_spawn2"
	icon_living = "horror_spawn2"
	icon_dead = "horror_spawn2_dead"
	mob_biotypes = MOB_UNDEAD|MOB_BEAST// Not undead, but it fits.
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	a_intent = INTENT_HARM
	maxHealth = 60
	health = 60
	speed = 2.4
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 25
	armour_penetration = 0.1
	attack_verb_simple = "claw"
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("hostile", "horror")
	decompose = TRUE
	sharpness = SHARP_EDGED
	footstep_type = FOOTSTEP_MOB_CLAW
	emote_taunt = list(
		"gurgles",
		"stares",
		"foams at the mouth",
		"groans",
		"growls",
		"jibbers",
		"howls madly",
		"screeches",
		"charges")
	taunt_chance = 30

	emote_taunt_sound = list('sound/f13npc/ghoul_new/ghoul_charge1.ogg','sound/f13npc/ghoul_new/ghoul_charge2.ogg','sound/f13npc/ghoul_new/ghoul_charge3.ogg')
	aggrosound = list('sound/f13npc/ghoul/aggro1.ogg', 'sound/f13npc/ghoul/aggro2.ogg')
	attack_sound = list('sound/f13npc/ghoul_new/ghoul_attack_01.ogg','sound/f13npc/ghoul_new/ghoul_attack_02.ogg','sound/f13npc/ghoul_new/ghoul_attack_03.ogg',\
	'sound/f13npc/ghoul_new/ghoul_attack_04.ogg')
	death_sound = list('sound/f13npc/ghoul_new/ghoul_death_01.ogg','sound/f13npc/ghoul_new/ghoul_death_02.ogg','sound/f13npc/ghoul_new/ghoul_death_03.ogg',\
	'sound/f13npc/ghoul_new/ghoul_death_04.ogg')
	idlesound = list('sound/f13npc/ghoul/idle.ogg','sound/f13npc/ghoul_new/ghoul_seizure_long.ogg','sound/f13npc/ghoul_new/ghoul_seizure_short.ogg')

//Boss Horror Mob
/mob/living/simple_animal/hostile/horror/large
	name = "horror"
	desc = "Some manner of creature churned out by the Vermont wilds. Its flesh ripples as if something unseen lurks beneath."
	icon = 'modular_badlands/code/modules/unsorted/icons/horrors_64x32.dmi'
	icon_state = "horror_large"
	icon_living = "horror_large"
	icon_dead = "horror_large_dead"// Never seen. Creature is immediately qdel'd and replaced with the parasite on death.
	mob_biotypes = MOB_UNDEAD|MOB_BEAST// Not undead, but it fits.
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	maxHealth = 60
	health = 60
	speed = 2.4
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 25
	armour_penetration = 0.1
	attack_verb_simple = "claw"
	faction = list("hostile", "horror")
	decompose = TRUE
	sharpness = SHARP_EDGED
	footstep_type = FOOTSTEP_MOB_CLAW
	emote_taunt = list(
		"gurgles",
		"stares",
		"foams at the mouth",
		"groans",
		"growls",
		"jibbers",
		"howls madly",
		"screeches",
		"charges")
	taunt_chance = 30

	emote_taunt_sound = list('sound/f13npc/ghoul_new/ghoul_charge1.ogg','sound/f13npc/ghoul_new/ghoul_charge2.ogg','sound/f13npc/ghoul_new/ghoul_charge3.ogg')
	aggrosound = list('sound/f13npc/ghoul/aggro1.ogg', 'sound/f13npc/ghoul/aggro2.ogg')
	attack_sound = list('sound/f13npc/ghoul_new/ghoul_attack_01.ogg','sound/f13npc/ghoul_new/ghoul_attack_02.ogg','sound/f13npc/ghoul_new/ghoul_attack_03.ogg',\
	'sound/f13npc/ghoul_new/ghoul_attack_04.ogg')
	death_sound = list('sound/f13npc/ghoul_new/ghoul_death_01.ogg','sound/f13npc/ghoul_new/ghoul_death_02.ogg','sound/f13npc/ghoul_new/ghoul_death_03.ogg',\
	'sound/f13npc/ghoul_new/ghoul_death_04.ogg')
	idlesound = list('sound/f13npc/ghoul/idle.ogg','sound/f13npc/ghoul_new/ghoul_seizure_long.ogg','sound/f13npc/ghoul_new/ghoul_seizure_short.ogg')
