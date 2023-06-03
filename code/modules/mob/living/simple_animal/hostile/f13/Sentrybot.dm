/* IN THIS FILE:
-Sentry Bot
*/
//Sentry Bot
/mob/living/simple_animal/hostile/sentrybot
	name = "sentry bot"
	desc = "A pre-war military robot armed with a deadly gatling laser, missile launcher and covered in thick armor plating."
	icon = 'icons/fallout/mobs/robots/wasterobots.dmi'
	icon_state = "sentrybot"
	icon_living = "sentrybot"
	icon_dead = "sentrybot_dead"
	gender = NEUTER
	health = 640
	maxHealth = 640
	speak_chance = 1
	turns_per_move = 5
	move_to_delay = 5
	retreat_distance = 6
	minimum_distance = 4
	wander = FALSE
	blood_volume = 0
	check_friendly_fire = TRUE
	ranged = TRUE
	del_on_death = FALSE
	robust_searching = TRUE
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES

	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_range = 5
	light_on = TRUE
	light_color = LIGHT_COLOR_BLOOD_MAGIC

	melee_damage_lower = 48
	melee_damage_upper = 72
	projectiletype = /obj/item/projectile/beam/laser/gatling/sentrybot
	projectilesound = 'sound/f13npc/sentry/gl_fire.ogg'
	extra_projectiles = 24// Around 360 damage if all connect.
	ranged_cooldown_time = 120// Should be about 12 seconds.
	stat_attack = UNCONSCIOUS

	response_help_simple = "poke"
	response_disarm_simple = "shove"
	response_harm_simple = "hit"
	attack_verb_simple = "pulverizes"

	mob_biotypes = MOB_ROBOTIC|MOB_INORGANIC
	emote_hear = list("Beeps.")
	speak = list("...")
	var/warned = FALSE

	var/datum/action/innate/sb/missile/M
	var/missile_cooldown = FALSE

	footstep_type = FOOTSTEP_GENERIC_HEAVY// Needs a proper sound, but otherwise handled below.

	attack_sound = 'sound/weapons/punch1.ogg'

	emote_taunt_sound = list('sound/f13npc/sentry/taunt1.ogg', 'sound/f13npc/sentry/taunt2.ogg')
	emote_taunt = list("spins its barrels")

	aggrosound = list('sound/f13npc/sentry/aggro1.ogg', 'sound/f13npc/sentry/aggro2.ogg',
	'sound/f13npc/sentry/aggro3.ogg', 'sound/f13npc/sentry/aggro4.ogg',
	'sound/f13npc/sentry/aggro5.ogg')

	idlesound = list('sound/f13npc/sentry/idle1.ogg', 'sound/f13npc/sentry/idle2.ogg')

	loot = list(/obj/effect/decal/cleanable/robot_debris, /obj/item/stack/crafting/electronicparts/five, /obj/item/stock_parts/cell/ammo/ecp)

	faction = list("wastebot")
	vision_range = 12
	aggro_vision_range = 12
	move_resist = MOVE_FORCE_OVERPOWERING
	mob_size = MOB_SIZE_LARGE
	flags_1 = PREVENT_CONTENTS_EXPLOSION_1 | HEAR_1

// Special SB stuff. - Carl
	var/movement_audio = 'sound/f13npc/sentry/movement.ogg'
	var/attack_windup = 'sound/f13npc/sentry/ready_weapon.ogg'
// The rest is below.

/mob/living/simple_animal/hostile/sentrybot/Initialize()
	. = ..()
	resize = 1.2
	update_transform()
	M = new
	M.Grant(src)

/mob/living/simple_animal/hostile/sentrybot/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		CRASH("[src] sentrybot invoked bullet_act() without a projectile")
	if(prob(5) && health > 1)
		visible_message(span_danger("\The [src] releases a defensive flashbang!"))
		var/flashbang_turf = get_turf(src)
		if(!flashbang_turf)
			return
		var/obj/item/grenade/flashbang/sentry/S = new /obj/item/grenade/flashbang/sentry(flashbang_turf)
		S.preprime(user = null)
	if(prob(15) || Proj.damage > 45) //prob(x) = chance for proj to actually do something, adjust depending on how OP you want sentrybots to be
		return ..()
	else
		visible_message(span_danger("\The [Proj] does nothing to \the [src]'s armor plating!"))
		return FALSE

/mob/living/simple_animal/hostile/sentrybot/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	var/emp_damage = round((maxHealth * 0.1) * (severity * 0.1)) // 10% of max HP * 10% of severity(Usually around 20-40)
	adjustBruteLoss(emp_damage)

/mob/living/simple_animal/hostile/sentrybot/proc/do_death_beep()
	playsound(src, 'sound/machines/triple_beep.ogg', 75, TRUE)
	visible_message(span_warning("You hear an ominous beep coming from [src]!"), span_warning("You hear an ominous beep!"))

/mob/living/simple_animal/hostile/sentrybot/proc/self_destruct()
	explosion(src,1,2,4,4)

/mob/living/simple_animal/hostile/sentrybot/death()
	do_sparks(3, TRUE, src)
	for(var/i in 1 to 3)
		addtimer(CALLBACK(src, .proc/do_death_beep), i * 1 SECONDS)
	addtimer(CALLBACK(src, .proc/self_destruct), 4 SECONDS)
	return ..()

/mob/living/simple_animal/hostile/sentrybot/Aggro()
	. = ..()
	summon_backup(15)

/mob/living/simple_animal/hostile/sentrybot/Life()
	..()
	if (!warned)
		if (health <= 250)
			warned = TRUE
			playsound(src, 'sound/f13npc/sentry/systemfailure.ogg', 75, FALSE)

/mob/living/simple_animal/hostile/sentrybot/Move()
	playsound(src, movement_audio, 5, FALSE)
	. = ..()

// Minigun model.
/mob/living/simple_animal/hostile/sentrybot/minigun
	name = "sentry bot"
	desc = "A pre-war military robot armed with a deadly minigun, missile launcher and covered in thick armor plating."
	icon = 'icons/fallout/mobs/robots/wasterobots.dmi'
	icon_state = "sentrybot"
	icon_living = "sentrybot"
	icon_dead = "sentrybot_dead"
	projectiletype = /obj/item/projectile/bullet/sb5mm
	projectilesound = 'sound/f13npc/sentry/mg_fire.ogg'
	extra_projectiles = 24// Around 384 damage if all connect.
	ranged_cooldown_time = 100// Should be about 10 seconds. Less, given it's not hitscan.

// SUPER FUCKING DANGEROUS MOB UNDER THIS AREA. SERIOUSLY. EMP IS NORMALLY THE ONLY COUNTER.
// DO NOT USE THESE NORMALLY I BEG YOU.
/mob/living/simple_animal/hostile/sentrybot/empproof
	name = "hardened sentry bot"
	desc = "A pre-war military robot, although this one appears to be shielded against outside electromagnetic influence."
	icon = 'icons/fallout/mobs/robots/wasterobots.dmi'
	icon_state = "sentrybot"
	icon_living = "sentrybot"
	icon_dead = "sentrybot_dead"

/mob/living/simple_animal/hostile/sentrybot/empproof/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_SELF)

/*
Below is their missile setup.
Staff can call for it to utilise such.
Otherwise, it's automated.
*/

/mob/living/simple_animal/hostile/sentrybot/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	if(target && AIStatus == AI_ON)
		M.Activate()

/datum/action/innate/sb/missile
	name = "Launch Missile"
	desc = "Fires your missile, if you've a lock for it!"
	icon_icon = 'icons/mob/actions/actions_mecha.dmi'
	button_icon_state = "mech_thrusters_off"

/datum/action/innate/sb/missile/Activate()
	var/mob/living/simple_animal/hostile/sentrybot/F = owner

	if(F.missile_cooldown == TRUE)
		to_chat(F, "<span class='notice'>Your targeting matrix has not yet found another target.</span>")
		return

	F.prep_missile()
	F.missile_cooldown = TRUE
	playsound(src, 'sound/f13npc/sentry/ml_post_launch.ogg', 75, FALSE)
	addtimer(CALLBACK(F, /mob/living/simple_animal/hostile/sentrybot/proc/missile_afterfire_cooldown), 150)

/mob/living/simple_animal/hostile/sentrybot/proc/missile_afterfire_cooldown()
	missile_cooldown = FALSE
	playsound(src, 'sound/f13npc/sentry/missile_prepared.ogg', 75, FALSE)

/mob/living/simple_animal/hostile/sentrybot/proc/fire_missile(turf/marker, set_angle)
	if(missile_cooldown == TRUE)
		return
	playsound(src, attack_windup, 75, TRUE)
	spawn(20)// Allow players to prepare.
		var/turf/startloc = get_turf(src)
		playsound(src, 'sound/f13npc/sentry/ml_launch.ogg', 200, 1, 2)
		var/obj/item/projectile/P = new /obj/item/projectile/bullet/rocket/a84mm_he/sb_missile(startloc)
		P.preparePixelProjectile(marker, startloc)
		P.firer = src
		if(target)
			P.original = target
		P.fire()

/mob/living/simple_animal/hostile/sentrybot/proc/prep_missile()
	var/turf/target_turf = get_turf(target)
	visible_message("<span class='colossus'>\"<b>Target lock acquired.</b>\"</span>")
	playsound(src, 'sound/magic/repulse.ogg', 75, TRUE)
	fire_missile(target_turf)
