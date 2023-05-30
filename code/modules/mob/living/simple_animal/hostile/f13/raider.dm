// IN THIS FILE: -All Raider Mobs

///////////////////
// BASIC RAIDERS //
///////////////////

// BASIC MELEE RAIDER
/mob/living/simple_animal/hostile/raider
	name = "Raider"
	desc = "Another murderer churned out by the wastes."
	icon = 'icons/fallout/mobs/humans/raider.dmi'
	icon_state = "raider_melee"
	icon_living = "raider_melee"
	icon_dead = "raider_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	turns_per_move = 5
	maxHealth = 140
	health = 140
	melee_damage_lower = 25
	melee_damage_upper = 50
	attack_verb_simple = "punches"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	faction = list("raider")
	check_friendly_fire = TRUE
	status_flags = CANPUSH
	del_on_death = FALSE
	loot = list(/obj/item/melee/onehanded/knife/survival)
	footstep_type = FOOTSTEP_MOB_SHOE

/obj/effect/mob_spawn/human/corpse/raider
	name = "Raider"
	uniform = /obj/item/clothing/under/pants/f13/rag
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/f13/leather
	head = /obj/item/clothing/head/helmet/f13/firefighter

/mob/living/simple_animal/hostile/raider/Aggro()
	..()
	summon_backup(15)
	say(pick("*insult", "HURRY, HURRY, HURRY!!", "Back off!!" , "Keep moving!!", "Times up, asshole!!", "Call a doctor, we got a bleeder!!", "Just stand still and die!!" ))

// THIEF RAIDER - nabs stuff and runs
/mob/living/simple_animal/hostile/raider/thief
	desc = "Another murderer churned out by the wastes. This one looks like they have sticky fingers..."

/mob/living/simple_animal/hostile/raider/thief/movement_delay()
	return -2

/mob/living/simple_animal/hostile/raider/thief/AttackingTarget()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.stat == SOFT_CRIT)
			var/back_target = H.back
			if(back_target)
				H.dropItemToGround(back_target, TRUE)
				src.transferItemToLoc(back_target, src, TRUE)
			var/belt_target = H.belt
			if(belt_target)
				H.dropItemToGround(belt_target, TRUE)
				src.transferItemToLoc(belt_target, src, TRUE)
			var/shoe_target = H.shoes
			if(shoe_target)
				H.dropItemToGround(shoe_target, TRUE)
				src.transferItemToLoc(shoe_target, src, TRUE)
			retreat_distance = 50
		else
			. = ..()

/mob/living/simple_animal/hostile/raider/thief/death(gibbed)
	for(var/obj/I in contents)
		src.dropItemToGround(I)
	. = ..()

// BASIC RANGED RAIDER
/mob/living/simple_animal/hostile/raider/ranged
	icon_state = "raider_ranged"
	icon_living = "raider_ranged"
	ranged = TRUE
	maxHealth = 115
	health = 115
	retreat_distance = 4
	minimum_distance = 6
	projectiletype = /obj/item/projectile/bullet/c9mm
	projectilesound = 'sound/f13weapons/ninemil.ogg'
	footstep_type = FOOTSTEP_MOB_SHOE

// LEGENDARY MELEE RAIDER
/mob/living/simple_animal/hostile/raider/legendary
	name = "Legendary Raider"
	desc = "Another murderer churned out by the wastes - this one seems a bit faster than the average..."
	color = "#FFFF00"
	maxHealth = 450
	health = 450
	speed = 1.2
	obj_damage = 300
	aggro_vision_range = 15
	loot = list(/obj/item/melee/onehanded/knife/survival, /obj/item/reagent_containers/food/snacks/kebab/human)
	footstep_type = FOOTSTEP_MOB_SHOE

// LEGENDARY RANGED RAIDER
/mob/living/simple_animal/hostile/raider/ranged/legendary
	name = "Legendary Raider"
	desc = "Another murderer churned out by the wastes, wielding a decent pistol and looking very strong"
	color = "#FFFF00"
	maxHealth = 600
	health = 600
	retreat_distance = 1
	minimum_distance = 2
	projectiletype = /obj/item/projectile/bullet/m44
	projectilesound = 'sound/f13weapons/44mag.ogg'
	extra_projectiles = 1
	aggro_vision_range = 15
	obj_damage = 300
	loot = list(/obj/item/gun/ballistic/revolver/m29)
	footstep_type = FOOTSTEP_MOB_SHOE

// RAIDER BOSS
/mob/living/simple_animal/hostile/raider/ranged/boss
	name = "Raider Boss"
	icon_state = "raiderboss"
	icon_living = "raiderboss"
	icon_dead = "raiderboss_dead"
	maxHealth = 170
	health = 170
	extra_projectiles = 3
	projectiletype = /obj/item/projectile/bullet/c45
	loot = list(/obj/item/gun/ballistic/automatic/smg/greasegun, /obj/item/clothing/under/f13/raiderharness)
	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/raider/ranged/boss/Aggro()
	..()
	summon_backup(15)
	say("KILL 'EM, FELLAS!")

// RANGED RAIDER WITH ARMOR
/mob/living/simple_animal/hostile/raider/ranged/sulphiteranged
	icon_state = "metal_raider"
	icon_living = "metal_raider"
	icon_dead = "metal_raider_dead"
	maxHealth = 180
	health = 180
	projectiletype = /obj/item/projectile/bullet/c45
	projectilesound = 'sound/weapons/gunshot.ogg'
	loot = list(/obj/item/gun/ballistic/automatic/pistol/m1911)
	footstep_type = FOOTSTEP_MOB_SHOE

// FIREFIGHTER RAIDER
/mob/living/simple_animal/hostile/raider/firefighter
	icon_state = "firefighter_raider"
	icon_living = "firefighter_raider"
	icon_dead = "firefighter_raider_dead"
	loot = list(/obj/item/twohanded/fireaxe)
	footstep_type = FOOTSTEP_MOB_SHOE

// BIKER RAIDER
/mob/living/simple_animal/hostile/raider/ranged/biker
	icon_state = "biker_raider"
	icon_living = "biker_raider"
	icon_dead = "biker_raider_dead"
	melee_damage_lower = 20
	melee_damage_upper = 20
	maxHealth = 200
	health = 200
	projectiletype = /obj/item/projectile/bullet/c45
	projectilesound = 'sound/f13weapons/magnum_fire.ogg'
	loot = list(/obj/item/gun/ballistic/automatic/pistol/m1911, /obj/item/clothing/head/helmet/f13/raidercombathelmet)
	footstep_type = FOOTSTEP_MOB_SHOE

/obj/effect/mob_spawn/human/corpse/raider/ranged/biker
	uniform = /obj/item/clothing/under/f13/raiderharness
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	head = /obj/item/clothing/head/helmet/f13/raidercombathelmet
	neck = /obj/item/clothing/neck/mantle/brown


// YANKEE RAIDER

/mob/living/simple_animal/hostile/raider/baseball
	icon_state = "baseball_raider"
	icon_living = "baseball_raider"
	icon_dead = "baseball_raider_dead"
	retreat_distance = 1
	minimum_distance = 1
	melee_damage_lower = 40
	melee_damage_upper = 40
	maxHealth = 200
	health = 200
	loot = list(/obj/item/twohanded/baseball)
	footstep_type = FOOTSTEP_MOB_SHOE


/obj/effect/mob_spawn/human/corpse/raider/baseball
	uniform = /obj/item/clothing/under/f13/mechanic
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	head = /obj/item/clothing/head/helmet/f13/raider/yankee


// TRIBAL RAIDER

/mob/living/simple_animal/hostile/raider/tribal
	icon_state = "tribal_raider"
	icon_living = "tribal_raider"
	icon_dead = "tribal_raider_dead"
	melee_damage_lower = 40
	melee_damage_upper = 40
	loot = list(/obj/item/twohanded/spear)
	footstep_type = FOOTSTEP_MOB_SHOE

/obj/effect/mob_spawn/human/corpse/raider/tribal
	uniform = /obj/item/clothing/under/f13/raiderrags
	shoes = /obj/item/clothing/shoes/f13/rag
	mask = /obj/item/clothing/mask/facewrap


//////////////
// SULPHITE //
//////////////

/mob/living/simple_animal/hostile/raider/sulphite
	name = "Sulphite Brawler"
	desc = "A raider with low military grade armor and a shishkebab"
	icon_state = "sulphite"
	icon_living = "sulphite"
	icon_dead= "sulphite_dead"
	maxHealth = 220
	health = 220
	melee_damage_lower = 40
	melee_damage_upper = 55
	footstep_type = FOOTSTEP_MOB_SHOE

/////////////
// JUNKERS //
/////////////

/mob/living/simple_animal/hostile/raider/junker
	name = "Junker"
	desc = "A raider from the Junker gang."
	faction = list("raider", "wastebot")
	icon_state = "junker_hijacker"
	icon_living = "junker_hijacker"
	icon_dead = "junker_dead"
	maxHealth = 220
	health = 220
	melee_damage_lower = 40
	melee_damage_upper = 55
	loot = null
	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/raider/ranged/boss/junker
	name = "Junker Footman"
	desc = "A Junker raider, outfitted in reinforced combat raider armor with extra metal plates."
	icon_state = "junker_scrapper"
	icon_living = "junker_scrapper"
	icon_dead = "junker_dead"
	faction = list("raider", "wastebot")
	maxHealth = 245
	health = 245
	damage_coeff = list(BRUTE = 1, BURN = 0.75, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	melee_damage_lower = 25
	melee_damage_upper = 50
	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/raider/junker/creator
	name = "Junker Field Creator"
	desc = "A Junker raider, specialized in spitting out eyebots on the fly with any scrap they can find."
	icon_state = "junker"
	icon_living = "junker"
	icon_dead = "junker_dead"
	maxHealth = 180
	health = 180
	ranged = TRUE
	retreat_distance = 6
	minimum_distance = 8
	projectiletype = /obj/item/projectile/bullet/c45
	projectilesound = 'sound/weapons/gunshot.ogg'
	footstep_type = FOOTSTEP_MOB_SHOE/*
	var/max_mobs = 2
	var/mob_types = list(/mob/living/simple_animal/hostile/eyebot)
	var/spawn_time = 15 SECONDS
	var/spawn_text = "flies from"


/mob/living/simple_animal/hostile/raider/junker/creator/Initialize()
	. = ..()
	AddComponent(/datum/component/spawner/ranged, mob_types, spawn_time, faction, spawn_text, max_mobs, _range = 7)

/mob/living/simple_animal/hostile/raider/junker/creator/death()
	qdel(GetComponent(/datum/component/spawner/ranged))
	. = ..()

/mob/living/simple_animal/hostile/raider/junker/creator/Destroy()
	qdel(GetComponent(/datum/component/spawner/ranged))
	. = ..()
*/
/mob/living/simple_animal/hostile/raider/junker/creator/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/raider/junker/boss
	name = "Junker Boss"
	desc = "A Junker boss, clad in hotrod power armor, and wielding a deadly rapid-fire shrapnel cannon."
	icon_state = "junker_boss"
	icon_living = "junker_boss"
	icon_dead = "junker_dead"
	maxHealth = 450
	health = 450
	ranged = TRUE
	retreat_distance = 4
	minimum_distance = 6
	extra_projectiles = 9
	ranged_cooldown_time = 15
	projectiletype = /obj/item/projectile/bullet/shrapnel
	projectilesound = 'sound/f13weapons/auto5.ogg'
	footstep_type = FOOTSTEP_MOB_SHOE

//HOOOOOOOOOOOOOOOOOOOOPEEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRSSSSSSSSSSS
/mob/living/simple_animal/hostile/raider/ranged/hooperboss
	name = "Hooper General"
	desc = "Modern Hooper General. Even in death, he still balls."
	icon_state = "hooperboss"
	icon_living = "hooperboss"
	icon_dead = "hooperboss_dead"
	maxHealth = 620
	health = 620
	extra_projectiles = 5
	projectiletype = /obj/item/projectile/bullet/c45/basketball
	projectilesound = 'sound/block_parry/block_wood1.ogg'
	loot = list(/obj/item/gun/ballistic/automatic/smg/greasegun, /obj/item/clothing/under/f13/raiderharness)
	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/raider/ranged/hooperboss/Aggro()
	..()
	summon_backup(15)
	say("SCUFF 'IS GORDONS 'OLMS!")
