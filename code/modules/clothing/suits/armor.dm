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

	var/list/protected_zones = list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

	var/armor_block_chance = null //Chance for the armor to block a low penetration projectile
	var/deflection_chance = null //Chance for the armor to redirect a blocked projectile
	var/melee_block_threshold = null
	var/dmg_block_threshold = null

	var/durability_threshold = 0
	repair_kit = /obj/item/repair_kit/arm_repair_kit

/obj/item/clothing/suit/armored/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	var/AP_mod = armour_penetration * (damage * 1.5) // So, 100% AP bullet with 20 damage will be considered as 50 damage.
	if((damage + AP_mod) < durability_threshold)
		return ..()
	if(def_zone in protected_zones)
		damage_armor()
	. = ..()

/obj/item/clothing/suit/armored/examine(mob/user)
	. = ..()
	. += "The armor is at [armor_durability] durability and is providing an additional [armor.linebullet] bullet, [armor.linelaser] energy and [armor.linemelee] melee resistance."
	if(durability_threshold > 0)
		. += "Additionally, any attack below [durability_threshold] force will not damage its durability."

/obj/item/clothing/suit/armored/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, src.repair_kit))
		use_kit(I, user)

/obj/item/clothing/suit/armored/proc/use_kit(obj/item/I, mob/user)
	var/obj/item/repair_kit/kit = I
	while(armor_durability<100)
		if(do_after(user, 10))
			to_chat(user,"You fix some of the damage on the armor, it is now at [armor_durability+1] durability.")
			if(kit.uses_left>1)
				kit.uses_left -= 1
				fix_armor()
			else
				fix_armor()
				qdel(kit)
				break

/obj/item/clothing/suit/armored/proc/damage_armor()
	if(armor.linebullet>0 && armor.linelaser>0 && armor.linemelee>0 && armor_durability>0)
		armor_durability -= 1
		armor = armor.modifyRating(linemelee = -1, linebullet = -1, linelaser = -1)

/obj/item/clothing/suit/armored/proc/fix_armor()
	if(armor_durability<100)
		armor = armor.modifyRating(linemelee = 1, linebullet = 1, linelaser = 1)
		armor_durability += 1

/obj/item/clothing/suit/armored/Initialize()
	. = ..()
	var/round_armor = round((armor.linemelee + armor.linebullet + armor.linelaser) / 3)
	if((durability_threshold <= 0) && round_armor > 30)// Weak armor, meh.
		var/tier_ar = round(round_armor / 10)// Tier 7 would be 200/100 = 20, Tier 11 = 40
		durability_threshold = tier_ar

// Metal- Melee, Laser Good, Ballistics Moderate, Energy, Explosion bad
// Leather/soft armor: Melee Good, Laser , Energy, Explosion Moderate, Ballistic Bad
// Coat style armor is good for allround protection but excels at none. (note plated with unarmored duster over is still plated.)
// Kevlar: Ballistic Good, all others Bad.
// Mix can vary wildly but usually has some glaring strongpoints and weakspots.
// Combat armor is allround but not top defense against any single category.
// Thick warm armor gives cold protection, piecemeal gives overheating protection.
// Armor covering much of the body gives more defense vs acid, fire, bio in general and vice versa.

/*
Suits. 0-10 in its primary value, slowdown 0, various utility
/obj/item/clothing/suit
	name = "suit template"
	lefthand_file = 'icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing_righthand.dmi'
	slowdown = 0
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	allowed = null
	strip_delay = 10
*/
/obj/item/clothing/suit/armored/f13
	mutantrace_variation = NONE

//Light armor. , slowdown 0.05
/obj/item/clothing/suit/armored/f13/light
	name = "light armor template"
	icon = 'icons/fallout/clothing/armored_light.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_light.dmi'
	slowdown = 0.05
	durability_threshold = 5
	armor = list("tier" = 0.5)
	allowed = list(/obj/item/gun, /obj/item/melee/onehanded, /obj/item/melee/smith, /obj/item/shield)

// Medium armor. 35-45 in its primary value, slowdown 0.1
/obj/item/clothing/suit/armored/f13/medium
	name = "medium armor template"
	icon = 'icons/fallout/clothing/armored_medium.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_medium.dmi'
	slowdown = 0.1
	durability_threshold = 10
	armor = list("tier" = 1)
	allowed = list(/obj/item/gun, /obj/item/melee/onehanded, /obj/item/melee/smith, /obj/item/shield)
	strip_delay = 40

// Heavy armor. 50-65 in its primary value, slowdown 0.15
/obj/item/clothing/suit/armored/f13/heavy
	name = "heavy armor template"
	icon = 'icons/fallout/clothing/armored_heavy.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_heavy.dmi'
	slowdown = 0.15
	durability_threshold = 15
	armor = list("tier" = 2)
	allowed = list(/obj/item/gun, /obj/item/melee/onehanded, /obj/item/twohanded, /obj/item/melee/smith, /obj/item/melee/smith/twohand, /obj/item/shield)
	strip_delay = 50

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
