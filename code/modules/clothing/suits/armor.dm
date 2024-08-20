/obj/item/clothing/suit/armored
	name = "armor template"
	lefthand_file = 'icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing_righthand.dmi'
	allowed = list(/obj/item/gun, /obj/item/melee/onehanded, /obj/item/melee/smith, /obj/item/shield)
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 30
	equip_delay_other = 40
	max_integrity = 250
	resistance_flags = NONE
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = null
	blood_overlay_type = "armor"

	var/armor_block_chance = null// Chance for the armor to ignore a low AP projectile.
	var/deflection_chance = null// Chance for the armor to redirect a low AP projectile.
	var/melee_block_threshold = null// If an object's force is lower than this, the armor ignores it.
	var/dmg_block_threshold = null// Damage from ANYTHING at or above this value bypasses armor protection.
	var/armor_block_threshold = null //projectiles with AP below this will be ignored. Only used on the special classes.

	var/durability_threshold = 0
	repair_kit = /obj/item/repair_kit/arm_repair_kit

/obj/item/clothing/suit/armored/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	var/AP_mod = armour_penetration * (damage * 1.5) // So, 100% AP bullet with 20 damage will be considered as 50 damage.
	if((damage + AP_mod) < durability_threshold)
		return ..()
	if(zone2body_parts_covered(def_zone) & body_parts_covered)
		damage_armor()
	. = ..()

/obj/item/clothing/suit/armored/examine(mob/user)
	. = ..()
	if(armor.tier >= 1)
		. += "The armor is at [armor_durability] durability and is providing an additional [armor.linebullet] bullet, [armor.linelaser] energy and [armor.linemelee] melee resistance."
	else
		. += "The armor is at [armor_durability] durability."
	if(durability_threshold > 0)
		. += "Additionally, any attack below [durability_threshold] force will not damage its durability."

/obj/item/clothing/suit/armored/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, src.repair_kit))
		use_kit(I, user)

/obj/item/clothing/suit/armored/proc/use_kit(obj/item/I, mob/user)
	var/obj/item/repair_kit/kit = I
	while(armor_durability < 100)
		if(do_after(user, 10))
			to_chat(user,"You fix some of the damage on the armor, it is now at [armor_durability] durability.")
			playsound(src.loc, "modular_badlands/code/modules/rp_misc/sound/interface/repair[rand(1,7)].ogg", 40, 0, 0)
			if(kit.uses_left > 1)
				kit.uses_left -= 1
				fix_armor()
			else
				fix_armor()
				to_chat(user,"You've used up the last of your repair kit.")
				qdel(kit)
				break

/obj/item/clothing/suit/armored/proc/damage_armor()
	if(armor.linebullet > 0 && armor.linelaser > 0 && armor.linemelee > 0 && armor_durability > 0)
		armor_durability -= 1
		armor = armor.modifyRating(linemelee = -1, linebullet = -1, linelaser = -1)
	return

/obj/item/clothing/suit/armored/proc/fix_armor()
	if(armor_durability < 100)
		armor = armor.modifyRating(initial(armor.linemelee), initial(armor.linebullet), initial(armor.linelaser))
		armor_durability = initial(armor_durability)
	return

/obj/item/clothing/suit/armored/Initialize()
	. = ..()
	var/round_armor = round((armor.linemelee + armor.linebullet + armor.linelaser) / 3)
	if((durability_threshold <= 0) && round_armor >= 30)// Weak armor, meh.
		var/tier_ar = round(round_armor / 10)
		durability_threshold = tier_ar

//F13 begin
/obj/item/clothing/suit/armored/f13
	mutantrace_variation = NONE

//Light armor. Slowdown 0.1
/obj/item/clothing/suit/armored/f13/light
	name = "light armor template"
	icon = 'icons/fallout/clothing/armored_light.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_light.dmi'
	slowdown = 0.1
	allowed = list(/obj/item/gun, /obj/item/melee/onehanded, /obj/item/melee/smith, /obj/item/shield)
	strip_delay = 30

	deflection_chance = 1// Chance for the armor to redirect a low AP projectile.
	armor_block_chance = 5// Chance for the armor to ignore a low AP projectile.
	melee_block_threshold = 6// If an object's force is lower than this, the armor ignores it.
	dmg_block_threshold = 12// Damage from ANYTHING at or above this value bypasses armor protection.
	durability_threshold = 2// Damage lower than this will not damage durability.
	armor_block_threshold = 0.2 //projectiles with AP below this will be ignored.

/obj/item/clothing/suit/armored/f13/light/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	. = ..()

	if(damage >= src.dmg_block_threshold && check_armor_penetration(object) >= 0)
		return

	if(src.armor_durability<40)
		return

	if(check_armor_penetration(object) <= src.armor_block_threshold && (attack_type == ATTACK_TYPE_PROJECTILE) && (zone2body_parts_covered(def_zone) & body_parts_covered))
		if(prob(armor_block_chance))
			var/ratio = rand(0,100)
			if(ratio <= deflection_chance)
				block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
				return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your armor absorbs the projectile's impact!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	if(damage <= src.melee_block_threshold && (attack_type == ATTACK_TYPE_MELEE) && (zone2body_parts_covered(def_zone) & body_parts_covered))
		if(prob(armor_block_chance))
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your armor shrugs off the strike!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	if(damage <= src.melee_block_threshold && (attack_type == ATTACK_TYPE_UNARMED) && (zone2body_parts_covered(def_zone) & body_parts_covered))
		if(prob(armor_block_chance))
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your armor shrugs off the strike!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	return

/obj/item/clothing/suit/armored/f13/light/examine(mob/user)
	. = ..()
	. += "If armor durability falls below 40%, the suit will no longer fully protect you."


// Medium armor. Slowdown 0.2
/obj/item/clothing/suit/armored/f13/medium
	name = "medium armor template"
	icon = 'icons/fallout/clothing/armored_medium.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_medium.dmi'
	slowdown = 0.2
	allowed = list(/obj/item/gun, /obj/item/melee/onehanded, /obj/item/melee/smith, /obj/item/shield)
	strip_delay = 40

	deflection_chance = 2// Chance for the armor to redirect a low AP projectile.
	armor_block_chance = 25// Chance for the armor to ignore a low AP projectile.
	melee_block_threshold = 12// If an object's force is lower than this, the armor ignores it.
	dmg_block_threshold = 24// Damage from ANYTHING at or above this value bypasses armor protection.
	durability_threshold = 5// Damage lower than this will not damage durability.
	armor_block_threshold = 0.4 //projectiles with AP below this will be ignored.

/obj/item/clothing/suit/armored/f13/medium/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	. = ..()

	if(damage >= src.dmg_block_threshold && check_armor_penetration(object) >= 0)
		return

	if(src.armor_durability<60)
		return

// Only AP of a certain caliber should present a threat. Otherwise? Ignore.
	if(check_armor_penetration(object) <= src.armor_block_threshold && (attack_type == ATTACK_TYPE_PROJECTILE) && (zone2body_parts_covered(def_zone) & body_parts_covered))
		if(prob(armor_block_chance))
			var/ratio = rand(0,100)
			if(ratio <= deflection_chance)
				block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
				return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your armor absorbs the projectile's impact!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	if(damage <= src.melee_block_threshold && (attack_type == ATTACK_TYPE_MELEE) && (zone2body_parts_covered(def_zone) & body_parts_covered))
		if(prob(armor_block_chance))
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your armor shrugs off the strike!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	if(damage <= src.melee_block_threshold && (attack_type == ATTACK_TYPE_UNARMED) && (zone2body_parts_covered(def_zone) & body_parts_covered))
		if(prob(armor_block_chance))
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your armor shrugs off the strike!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	return

/obj/item/clothing/suit/armored/f13/medium/examine(mob/user)
	. = ..()
	. += "If armor durability falls below 60%, the suit will no longer fully protect you."


// Heavy armor. Slowdown 0.3
/obj/item/clothing/suit/armored/f13/heavy
	name = "heavy armor template"
	icon = 'icons/fallout/clothing/armored_heavy.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_heavy.dmi'
	slowdown = 0.3
	allowed = list(/obj/item/gun, /obj/item/melee/onehanded, /obj/item/twohanded, /obj/item/melee/smith, /obj/item/melee/smith/twohand, /obj/item/shield)
	strip_delay = 50
	armor_block_threshold = 0.6 //projectiles with AP below this will be ignored.

	deflection_chance = 3// Chance for the armor to redirect a low AP projectile.
	armor_block_chance = 50// Chance for the armor to ignore a low AP projectile.
	melee_block_threshold = 24// If an object's force is lower than this, the armor ignores it.
	dmg_block_threshold = 32// Damage from ANYTHING at or above this value bypasses armor protection.
	durability_threshold = 10// Damage lower than this will not damage durability.

/obj/item/clothing/suit/armored/f13/heavy/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	. = ..()

	if(damage >= src.dmg_block_threshold && check_armor_penetration(object) >= 0)
		return

	if(src.armor_durability<80)
		return

	if(check_armor_penetration(object) <= src.armor_block_threshold && (attack_type == ATTACK_TYPE_PROJECTILE) && (zone2body_parts_covered(def_zone) & body_parts_covered))
		if(prob(armor_block_chance))
			var/ratio = rand(0,100)
			if(ratio <= deflection_chance)
				block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
				return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your armor absorbs the projectile's impact!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	if(damage <= src.melee_block_threshold && (attack_type == ATTACK_TYPE_MELEE) && (zone2body_parts_covered(def_zone) & body_parts_covered))
		if(prob(armor_block_chance))
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>Your armor shrugs off the strike!</span>")
				shake_camera(owner, 3, 1)
			block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
			return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	if(attack_type == ATTACK_TYPE_UNARMED)
		to_chat(loc, "<span class='warning'>Your armor shrugs off the strike!</span>")
		shake_camera(owner, 3, 1)
		block_return[BLOCK_RETURN_SET_DAMAGE_TO] = 0
		return BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL

	return

/obj/item/clothing/suit/armored/f13/heavy/examine(mob/user)
	. = ..()
	. += "If armor durability falls below 80%, the suit will no longer fully protect you."

// Toggle armor
/obj/item/clothing/suit/toggle/armored
	body_parts_covered = CHEST|GROIN
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 60
	equip_delay_other = 40
	max_integrity = 250
	resistance_flags = NONE
	togglename = "collar"
