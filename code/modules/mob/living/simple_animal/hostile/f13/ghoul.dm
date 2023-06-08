/* IN THIS FILE
-Ghouls
*/

//Base Ghoul
/mob/living/simple_animal/hostile/ghoul
	name = "feral ghoul"
	desc = "A ghoul that has lost its mind and become aggressive."
	icon = 'icons/fallout/mobs/humans/ghouls.dmi'
	icon_state = "feralghoul"
	icon_living = "feralghoul"
	icon_dead = "feralghoul_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = 1
	stat_attack = UNCONSCIOUS
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
	armour_penetration = 0.1//Making them some manner of threat.
	attack_verb_simple = "claw"
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("hostile", "ghoul")
	decompose = TRUE
	sharpness = SHARP_EDGED //They need to cut their finger nails
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human/ghoul = 2,
							/obj/item/stack/sheet/animalhide/human = 1,
							/obj/item/stack/sheet/bone = 1)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
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

// Ghoul Reaver
/mob/living/simple_animal/hostile/ghoul/reaver
	name = "feral ghoul reaver"
	desc = "A ghoul that has lost its mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon_state = "ghoulreaver"
	icon_living = "ghoulreaver"
	icon_dead = "ghoulreaver_dead"
	speed = 1.8
	maxHealth = 120
	health = 120
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 35
	armour_penetration = 0.2//Making them some manner of threat.
	ranged_message = "throws a chunk of flesh"
	ranged_cooldown_time = 60
	ranged = 1
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	projectiletype = /obj/item/projectile/reaver
	projectilesound = 'sound/f13npc/centaur/lash.ogg'

/obj/item/projectile/reaver
	name = "radioactive glob"
	damage = 15
	armour_penetration = 0.5
	irradiate = 25//Toxic threshold is 250.
	pass_flags = PASSTABLE | PASSGRILLE
	icon_state = "toxin"

/mob/living/simple_animal/hostile/ghoul/reaver/Aggro()
	..()
	summon_backup(10)

//Cold Feral Ghoul
/mob/living/simple_animal/hostile/ghoul/coldferal
	name = "cold ghoul feral"
	desc = "A ghoul that has lost its mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon_state = "cold_feral"
	icon_living = "cold_feral"
	icon_dead = "cold_feral_dead"
	speed = 1.5
	maxHealth = 200
	health = 200
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	unsuitable_atmos_damage = 0//shitty hack
	footstep_type = FOOTSTEP_MOB_BAREFOOT

//Frozen Feral Ghoul
/mob/living/simple_animal/hostile/ghoul/frozenreaver
	name = "frozen ghoul reaver"
	desc = "A ghoul that has lost its mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon_state = "frozen_reaver"
	icon_living = "frozen_reaver"
	icon_dead = "frozen_reaver_dead"
	speed = 1.5
	maxHealth = 200
	health = 200
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	unsuitable_atmos_damage = 0//shitty hack
	footstep_type = FOOTSTEP_MOB_BAREFOOT

//Legendary Ghoul
/mob/living/simple_animal/hostile/ghoul/legendary
	name = "legendary ghoul"
	desc = "A ghoul that has lost its mind and become aggressive. This one has exceptionally large, bulging muscles. It looks quite strong."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_dead"
	color = "#FFFF00"
	maxHealth = 300
	health = 300
	speed = 2.5
	harm_intent_damage = 8
	melee_damage_lower = 30
	melee_damage_upper = 35
	mob_size = 5
	wound_bonus = 0
	bare_wound_bonus = 0
	footstep_type = FOOTSTEP_MOB_BAREFOOT

//Glowing Ghoul
/mob/living/simple_animal/hostile/ghoul/glowing
	name = "glowing feral ghoul"
	desc = "A feral ghoul that has absorbed massive amounts of radiation, causing them to glow in the dark and radiate constantly."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_dead"
	maxHealth = 250
	health = 250
	speed = 2
	retreat_distance = 1
	minimum_distance = 2
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 25
	light_system = MOVABLE_LIGHT
	light_range = 2
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	var/radburst_cooldown = 12//Support mob, revives others every six seconds, provided a player is within six tiles. Previously sixty, because I thought this was deciseconds.

/mob/living/simple_animal/hostile/ghoul/glowing/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/glow_heal, chosen_targets = /mob/living/simple_animal/hostile/ghoul, allow_revival = FALSE, restrict_faction = null, type_healing = BRUTELOSS)

/mob/living/simple_animal/hostile/ghoul/glowing/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/ghoul/glowing/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.apply_effect(20, EFFECT_IRRADIATE, 0)

/mob/living/simple_animal/hostile/ghoul/glowing/handle_automated_action()
	if(!..()) //AIStatus is off
		return
	radburst_cooldown--

	if(target in range(6,src))
//		if((health <= (0.6 * maxHealth)) && radburst_cooldown<=0)
		if(radburst_cooldown<=0)
			radburst_cooldown = initial(radburst_cooldown)
			RadBurst()

/mob/living/simple_animal/hostile/ghoul/glowing/proc/RadBurst()
	visible_message("<span class='warning'>[src] growls and releases a burst of radiation from its body!</span>",
						"<span class='notice'>You release a concentrated burst of radiation from your body!</span>")
	playsound(src, 'sound/f13npc/ghoul_new/ghoul_radburst.ogg', 50, 0, 3)
	radiation_pulse(src, 30)
	for(var/mob/living/simple_animal/hostile/ghoul/glowing/L in range(7, src))
		if(L.stat == 3)
			L.gib()
			visible_message("<span class='danger'>[src] detonates into a brilliant glowing cloud!</span>")
			radiation_pulse(src, 120)
	for(var/mob/living/simple_animal/hostile/ghoul/G in range(7, src))
		if(G.stat == 3)
			G.revive(1)
		else
			G.revive(1, 1)
	set_light_range_power_color(7, 5, "#39FF14")
	spawn(40)
	set_light_range(2)

/mob/living/simple_animal/hostile/ghoul/glowing/strong // FEV mutation
	maxHealth = 200 //reduced. 20hp per healthtick heal
	health = 200 //reduced further. 20hp per healthtick heal
	speed = 1.4 // Nyooom
	melee_damage_lower = 35
	melee_damage_upper = 35
	retreat_distance = 0//These ghouls don't run, unlike standard glowing ones.
	minimum_distance = 0
	armour_penetration = 0.1

/mob/living/simple_animal/hostile/ghoul/rotting
	name = "bloated feral ghoul"
	desc = "A ghoul that has lost its mind and become aggressive. This one appears to be full of some manner of fluid."
	icon_state = "ghoulrotter"
	icon_living = "ghoulrotter"
	icon_dead = "ghoulrotter_dead"
	move_to_delay = 6
	maxHealth = 620
	health = 620
	harm_intent_damage = 8
	melee_damage_lower = 35
	melee_damage_upper = 45
	armour_penetration = 0.4//Making them some manner of threat.
	footstep_type = FOOTSTEP_MOB_BAREFOOT

/mob/living/simple_animal/hostile/ghoul/rotting/Initialize()
	. = ..()
	resize = 1.2
	update_transform()

/mob/living/simple_animal/hostile/ghoul/rotting/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		CRASH("[src] ghoul invoked bullet_act() without a projectile")
	if(prob(5) || Proj.damage > 15) //prob(x) = chance for proj to actually do something, adjust depending on how OP you want it to be.
		return ..()
	else
		visible_message(span_danger("\The [Proj] is absorbed on \the [src]'s fat hide!"))
		return 0

/mob/living/simple_animal/hostile/ghoul/zombie
	name = "ravenous feral ghoul"
	desc = "A ferocious feral ghoul, hungry for human meat."
	faction = list("ghoul")
	stat_attack = UNCONSCIOUS
	maxHealth = 200
	health = 200
	footstep_type = FOOTSTEP_MOB_BAREFOOT

/mob/living/simple_animal/hostile/ghoul/zombie/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		try_to_ghoul_zombie_infect(H)

/mob/living/simple_animal/hostile/ghoul/reaver/zombie
	name = "ravenous feral ghoul reaver"
	desc = "A ferocious feral ghoul, hungry for human meat. This one is strapped with metal armor, and appears far stronger."
	icon_state = "ghoulreaver"
	icon_living = "ghoulreaver"
	icon_dead = "ghoulreaver_dead"
	speed = 2
	maxHealth = 270
	health = 270
	harm_intent_damage = 8
	melee_damage_lower = 30
	melee_damage_upper = 30
	footstep_type = FOOTSTEP_MOB_BAREFOOT

/mob/living/simple_animal/hostile/ghoul/reaver/zombie/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		try_to_ghoul_zombie_infect(H)

/mob/living/simple_animal/hostile/ghoul/glowing/zombie
	name = "ravenous glowing feral ghoul"
	desc = "A ferocious feral ghoul, hungry for human meat. This one has absorbed massive amounts of radiation, causing them to glow in the dark and radiate constantly."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_dead"
	maxHealth = 240
	health = 240
	speed = 2
	harm_intent_damage = 8
	melee_damage_lower = 30
	melee_damage_upper = 30
	light_system = MOVABLE_LIGHT
	light_range = 2
	footstep_type = FOOTSTEP_MOB_BAREFOOT

/mob/living/simple_animal/hostile/ghoul/glowing/zombie/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		try_to_ghoul_zombie_infect(H)

/mob/living/simple_animal/hostile/ghoul/legendary/zombie
	name = "legendary ravenous ghoul"
	desc = "A ferocious feral ghoul, hungry for human meat. This one has exceptionally large, bulging muscles. It looks quite strong."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_dead"
	color = "#FFFF00"
	maxHealth = 650
	health = 650
	speed = 2.5
	harm_intent_damage = 8
	melee_damage_lower = 30
	melee_damage_upper = 35
	mob_size = 5
	wound_bonus = 0
	bare_wound_bonus = 0
	footstep_type = FOOTSTEP_MOB_BAREFOOT

/mob/living/simple_animal/hostile/ghoul/legendary/zombie/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		try_to_ghoul_zombie_infect(H)
