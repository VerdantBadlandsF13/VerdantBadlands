/*
Why the fuck was this an override of the standard aliens?
Jesus Christ, guys. You're better than that.
*/
/mob/living/simple_animal/hostile/wanamingo
	name = "wanamingo"
	desc = "Some manner of creature, perfectly suited for hunting in darkness."
	icon = 'icons/fallout/mobs/monsters/wanamingo.dmi'
	icon_state = "wanamingo"
	icon_living = "wanamingo"
	icon_dead = "wanamingo_dead"

	speed = 0
	maxHealth = 275
	health = 275
	harm_intent_damage = 8
	obj_damage = 60
	melee_damage_lower = 60
	melee_damage_upper = 75

	gender = NEUTER
	response_help_continuous = "pokes"
	response_help_simple = "poke"
	response_disarm_continuous = "shoves"
	response_disarm_simple = "shove"
	response_harm_continuous = "hits"
	response_harm_simple = "hit"
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/xeno = 4)
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	speak_emote = list("hisses")
	bubble_icon = "alien"
	a_intent = INTENT_HARM
	attack_sound = 'sound/weapons/bladeslice.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list(ROLE_ALIEN)
	status_flags = CANPUSH
	minbodytemp = 0
	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	unique_name = 1
	gold_core_spawnable = NO_SPAWN
	death_sound = 'sound/voice/hiss6.ogg'
	deathmessage = "lets out a waning guttural screech, green blood bubbling from its maw..."

	taunt_chance = 30
	emote_taunt_sound = list('sound/f13npc/ghoul_new/ghoul_charge1.ogg','sound/f13npc/ghoul_new/ghoul_charge2.ogg','sound/f13npc/ghoul_new/ghoul_charge3.ogg')
	aggrosound = list('sound/f13npc/ghoul/aggro1.ogg', 'sound/f13npc/ghoul/aggro2.ogg')
	attack_sound = list('sound/f13npc/ghoul_new/ghoul_attack_01.ogg','sound/f13npc/ghoul_new/ghoul_attack_02.ogg','sound/f13npc/ghoul_new/ghoul_attack_03.ogg',\
	'sound/f13npc/ghoul_new/ghoul_attack_04.ogg')
	death_sound = list('sound/f13npc/ghoul_new/ghoul_death_01.ogg','sound/f13npc/ghoul_new/ghoul_death_02.ogg','sound/f13npc/ghoul_new/ghoul_death_03.ogg',\
	'sound/f13npc/ghoul_new/ghoul_death_04.ogg')
	idlesound = list('sound/f13npc/ghoul/idle.ogg','sound/f13npc/ghoul_new/ghoul_seizure_long.ogg','sound/f13npc/ghoul_new/ghoul_seizure_short.ogg')

/mob/living/simple_animal/hostile/wanamingo/Initialize()
	. = ..()
	AddComponent(/datum/component/footstep, FOOTSTEP_MOB_CLAW)
