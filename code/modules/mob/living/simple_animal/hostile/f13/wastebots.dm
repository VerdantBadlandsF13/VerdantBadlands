/*IN THIS FILE:
-Handy
-Gutsy
-Protectrons
-Robobrains
-Assaultrons
-Liberators
*/

/mob/living/simple_animal/hostile/handy
	name = "mr. handy"
	desc = "A crazed pre-war household assistant robot, armed with a cutting saw."
	icon = 'icons/fallout/mobs/robots/wasterobots.dmi'
	icon_state = "handy"
	icon_living = "handy"
	icon_dead = "robot_dead"
	gender = NEUTER
	mob_biotypes = MOB_ROBOTIC|MOB_INORGANIC
	move_resist = MOVE_FORCE_OVERPOWERING // Can't be pulled
	health = 130 //7 shots of 9mm
	maxHealth = 130
	healable = FALSE
	stat_attack = UNCONSCIOUS
	melee_damage_lower = 28
	melee_damage_upper = 28
	robust_searching = TRUE
	attack_verb_simple = "saws"
	faction = list("wastebot")
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	speak_emote = list("states")
	gold_core_spawnable = HOSTILE_SPAWN
	del_on_death = TRUE
	deathmessage = "blows apart!"
	taunt_chance = 30
	blood_volume = 0

	emote_taunt_sound = list('sound/f13npc/handy/taunt1.ogg', 'sound/f13npc/handy/taunt2.ogg')
	emote_taunt = list("raises a saw")

	aggrosound = list('sound/f13npc/handy/aggro1.ogg', 'sound/f13npc/handy/aggro2.ogg')
	idlesound = list('sound/f13npc/handy/idle1.wav', 'sound/f13npc/handy/idle2.ogg', 'sound/f13npc/handy/idle3.ogg')

	death_sound = 'sound/f13npc/handy/robo_death.ogg'
	attack_sound = 'sound/f13npc/handy/attack.wav'

	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/crafting/electronicparts/three)

/mob/living/simple_animal/hostile/handy/Initialize()
	. = ..()
	add_overlay("eyes-[initial(icon_state)]")

/mob/living/simple_animal/hostile/handy/gutsy
	name = "mr. gutsy"
	desc = "A pre-war combat robot based off the Mr. Handy design, armed with plasma weaponry and a deadly close-range flamer."
	icon_state = "gutsy"
	icon_living = "gutsy"
	icon_dead = "robot_dead"
	health = 200
	maxHealth = 200
	melee_damage_lower = 72
	melee_damage_upper = 72
	attack_sound = 'sound/items/welder.ogg'
	attack_verb_simple = "shoots a burst of flame at"
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/f13plasma/scatter
	extra_projectiles = 2
	ranged = TRUE
	retreat_distance = 2
	minimum_distance = 2
	check_friendly_fire = TRUE
	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/crafting/electronicparts/three, /obj/item/stock_parts/cell/ammo/mfc)

	emote_taunt_sound = list('sound/f13npc/gutsy/taunt1.ogg', 'sound/f13npc/gutsy/taunt2.ogg', 'sound/f13npc/gutsy/taunt3.ogg', 'sound/f13npc/gutsy/taunt4.ogg')
	emote_taunt = list("raises a flamer")

	aggrosound = list('sound/f13npc/gutsy/aggro1.ogg', 'sound/f13npc/gutsy/aggro2.ogg', 'sound/f13npc/gutsy/aggro3.ogg', 'sound/f13npc/gutsy/aggro4.ogg', 'sound/f13npc/gutsy/aggro5.ogg', 'sound/f13npc/gutsy/aggro6.ogg')
	idlesound = list('sound/f13npc/gutsy/idle1.ogg', 'sound/f13npc/gutsy/idle2.ogg', 'sound/f13npc/gutsy/idle3.ogg')

/mob/living/simple_animal/hostile/handy/liberator
	name = "liberator"
	desc = "A small pre-War droned used by the People's Liberation Army."
	icon = 'icons/fallout/mobs/robots/weirdrobots.dmi'
	icon_state = "liberator"
	icon_living = "leberator"
	icon_dead = "liberator_d"
	icon_gib = "liberator_g"
	health = 25
	maxHealth = 25
	melee_damage_lower = 5
	melee_damage_upper = 10
	attack_verb_simple = "slaps"
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/beam/laser/liberator
	extra_projectiles = 1
	ranged = TRUE
	retreat_distance = 2
	minimum_distance = 2
	check_friendly_fire = TRUE
	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/crafting/electronicparts/three, /obj/item/stock_parts/cell/ammo/mfc)
	emote_taunt_sound = null
	emote_taunt = list("levels its laser")
	faction = list("china")
	aggrosound = null
	idlesound = null
	death_sound = null
	attack_sound = null

/obj/item/projectile/beam/laser/liberator
	name = "laser bolt"
	damage = 5
	wound_bonus = 35
	armour_penetration = 1

/mob/living/simple_animal/hostile/handy/liberator/yellow
	name = "liberator"
	desc = "A small pre-War droned used by the People's Liberation Army."
	icon_state = "liberator_y"
	icon_living = "leberator_y"
	icon_dead = "liberator_y_d"

/mob/living/simple_animal/hostile/handy/robobrain
	name = "Robobrain"
	desc = "A pre-war military robot armed with a deadly psionic beam and covered in thick armor plating. That dome even looks armored, somehow. Jesus..."
	icon_state = "robobrain"
	icon_living = "robobrain"
	icon_dead = "robobrain"
	health = 480
	maxHealth = 480
	melee_damage_lower = 24
	melee_damage_upper = 72//why would you even get close?
	extra_projectiles = 0
	ranged_cooldown_time = 12//big ol' 'fuck off' laser
	stat_attack = UNCONSCIOUS
	ranged = TRUE
	retreat_distance = 6
	minimum_distance = 8
	del_on_death = FALSE
	attack_verb_simple = "slaps about"
	attack_sound = 'sound/weapons/punch1.ogg'
	projectilesound = 'sound/weapons/ionrifle.ogg'
	projectiletype = /obj/item/projectile/beam/mindflayer/robobrain
	check_friendly_fire = TRUE
	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/crafting/electronicparts/five, /obj/item/stock_parts/cell/ammo/mfc, /obj/item/integrated_circuit/input/mmi_tank)
	speak_chance = 15
	emote_taunt_sound = list('sound/f13npc/robobrain/taunt1.ogg', 'sound/f13npc/robobrain/taunt2.ogg')
	emote_taunt = list("raises a laser")

	aggrosound = list('sound/f13npc/robobrain/aggro1.ogg', 'sound/f13npc/robobrain/aggro2.ogg', 'sound/f13npc/robobrain/aggro3.ogg', 'sound/f13npc/robobrain/aggro4.ogg', 'sound/f13npc/robobrain/aggro5.ogg')
	idlesound = list('sound/f13npc/robobrain/idle1.ogg', 'sound/f13npc/robobrain/idle2.ogg', 'sound/f13npc/robobrain/idle3.ogg')


/obj/item/projectile/beam/mindflayer/robobrain
	name = "psionic beam"

/obj/item/projectile/beam/mindflayer/robobrain/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
		M.confused = max(M.confused, 8)
		M.hallucination += 15

/mob/living/simple_animal/hostile/handy/robobrain/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		CRASH("[src] robobrain invoked bullet_act() without a projectile")
	if(prob(15) || Proj.damage > 32)
		return ..()
	else
		visible_message("<span class='danger'>\The [Proj] shatters on \the [src]'s armor plating!</span>")
		return FALSE

/mob/living/simple_animal/hostile/handy/robobrain/proc/do_death_beep()
	playsound(src, 'sound/machines/triple_beep.ogg', 75, TRUE)
	visible_message("<span class='warning'>You hear an ominous beep coming from [src]!</span>", "<span class='warning'>You hear an ominous beep!</span>")

/mob/living/simple_animal/hostile/handy/robobrain/proc/self_destruct()
	explosion(src,1,1,1,1)
	qdel(src)

/mob/living/simple_animal/hostile/handy/robobrain/death()
	do_sparks(3, TRUE, src)
	for(var/i in 1 to 3)
		addtimer(CALLBACK(src, .proc/do_death_beep), i * 1 SECONDS)
	addtimer(CALLBACK(src, .proc/self_destruct), 4 SECONDS)
	return ..()

/mob/living/simple_animal/hostile/handy/robobrain/Aggro()
	. = ..()
	summon_backup(15)

/mob/living/simple_animal/hostile/handy/protectron
	name = "protectron"
	desc = "A pre-war security robot armed with deadly lasers."
	icon = 'icons/fallout/mobs/robots/protectrons.dmi'
	icon_state = "protectron"
	icon_living = "protectron"
	icon_dead = "protectron_dead"
	health = 130
	maxHealth = 130
	speed = 4
	melee_damage_lower = 15
	melee_damage_upper = 25
	extra_projectiles = 1
	ranged = TRUE
	retreat_distance = 2
	minimum_distance = 2
	attack_verb_simple = "slaps"
	attack_sound = 'sound/weapons/punch1.ogg'
	projectilesound = 'sound/weapons/laser.ogg'
	projectiletype = /obj/item/projectile/beam/laser/pistol/hitscan
	faction = list("wastebot")
	check_friendly_fire = TRUE
	stat_attack = UNCONSCIOUS
	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/crafting/electronicparts/five)

	emote_taunt_sound = list('sound/f13npc/protectron/taunt1.ogg', 'sound/f13npc/protectron/taunt2.ogg', 'sound/f13npc/protectron/taunt3.ogg')
	emote_taunt = list("raises a laser")

	aggrosound = list('sound/f13npc/protectron/aggro1.ogg', 'sound/f13npc/protectron/aggro2.ogg', 'sound/f13npc/protectron/aggro3.ogg', 'sound/f13npc/protectron/aggro4.ogg')
	idlesound = list('sound/f13npc/protectron/idle1.ogg', 'sound/f13npc/protectron/idle2.ogg', 'sound/f13npc/protectron/idle3.ogg', 'sound/f13npc/protectron/idle4.ogg',)

/mob/living/simple_animal/pet/dog/protectron //Not an actual dog
	name = "Trading Protectron"
	desc = "A standard RobCo RX2 V1.16.4 \"Trade-o-Vend\", loaded with Trade protocols.<br>Looks like it was kept operational for an indefinite period of time. Its body is covered in cracks and dents of various sizes.<br>As it has been repaired countless times, it's amazing the machine is still functioning at all."
	icon = 'icons/fallout/mobs/robots/protectrons.dmi'
	icon_state = "protectron_trade"
	icon_living = "protectron_trade"
	icon_dead = "protectron_trade_dead"
	maxHealth = 200
	health = 200
	speak_chance = 5
	mob_biotypes = MOB_ROBOTIC|MOB_INORGANIC
	faction = list("neutral", "silicon", "dog", "hostile", "pirate", "wastebot", "wolf", "plants", "turret", "enclave", "ghoul", "cazador", "supermutant", "gecko", "slime", "radscorpion", "skeleton", "carp", "bs", "bighorner")
	speak = list("Howdy partner! How about you spend some of them there hard earned caps on some of this fine merchandise.", "Welcome back partner! Hoo-wee it's a good day to buy some personal protection!", "Stop, this is a robbery! At these prices you are robbing me.", "Legion? NCR? Raider? Hell we don't care, as long as you got the caps.", "What a fine day partner. A fine day indeed.", "Reminds me of what my grandpappy used to say, make a snap decision now and never question it. You look like you could use some product there partner.", "Lotta critters out there want to chew you up partner, you could use a little hand with that now couldn't you?")
	speak_emote = list()
	emote_hear = list()
	emote_see = list()
	response_help_simple  = "shakes its manipulator"
	response_disarm_simple = "pushes"
	response_harm_simple   = "punches"
	attack_sound = 'sound/voice/liveagain.ogg'
	butcher_results = list(/obj/effect/gibspawner/robot = 1)
	blood_volume = 0

/mob/living/simple_animal/hostile/handy/assaultron
	name = "assaultron"
	desc = "A deadly close combat robot developed by RobCo in a vaguely feminine, yet ominous chassis."
	icon_state = "assaultron"
	icon_living = "assaultron"
	gender = FEMALE //Pffffffffffffffffffffff
	icon_dead = "gib7"
	health = 200
	mob_biotypes = MOB_ROBOTIC|MOB_INORGANIC
	maxHealth = 200
	speed = 0
	melee_damage_lower = 55
	melee_damage_upper = 60
	environment_smash = 2 //can smash walls
	attack_verb_simple = "grinds their claws on"
	faction = list("wastebot")
	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/crafting/electronicparts/three, /obj/item/stock_parts/cell/ammo/mfc)

	emote_taunt_sound = FALSE
	emote_taunt = FALSE

	aggrosound = FALSE
	idlesound = FALSE
