/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("melee" = 35, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)
	flags_inv = HIDEEARS | HIDEHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
	strip_delay = 60
	resistance_flags = NONE
	flags_cover = HEADCOVERSEYES
	var/list/protected_zones = list(BODY_ZONE_HEAD)

	dog_fashion = /datum/dog_fashion/head/helmet

	var/can_flashlight = FALSE //if a flashlight can be mounted. if it has a flashlight and this is false, it is permanently attached.
	var/obj/item/flashlight/seclite/attached_light
	var/datum/action/item_action/toggle_helmet_flashlight/alight

	var/durability_threshold = 5
	repair_kit = /obj/item/repair_kit/arm_repair_kit

/obj/item/clothing/head/helmet/Initialize()
	. = ..()
	if(attached_light)
		alight = new(src)
	var/round_armor = round((armor.linemelee + armor.linebullet + armor.linelaser) / 3)
	if((durability_threshold <= 0) && round_armor > 30)
		var/tier_ar = round(round_armor / 10)
		durability_threshold = tier_ar


/obj/item/clothing/head/helmet/Destroy()
	var/obj/item/flashlight/seclite/old_light = set_attached_light(null)
	if(old_light)
		qdel(old_light)
	return ..()

/obj/item/clothing/head/helmet/examine(mob/user)
	. = ..()
	if(attached_light)
		. += "It has \a [attached_light] [can_flashlight ? "" : "permanently "]mounted on it."
		if(can_flashlight)
			. += "<span class='info'>[attached_light] looks like it can be <b>unscrewed</b> from [src].</span>"
	else if(can_flashlight)
		. += "It has a mounting point for a <b>seclite</b>."
	. += "The helmet is at [armor_durability] durability and is providing [armor.linebullet] bullet, [armor.linelaser] energy and [armor.linemelee] melee resistance."
	if(durability_threshold > 0)
		. += "Additionally, any attack below [durability_threshold] force will not damage its durability."

/obj/item/clothing/head/helmet/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	var/AP_mod = armour_penetration * (damage * 1.5) // So, 100% AP bullet with 20 damage will be considered as 50 damage.
	if((damage + AP_mod) < durability_threshold)
		return ..()
	if(def_zone in protected_zones)
		damage_armor()
	. = ..()

/obj/item/clothing/head/helmet/proc/use_kit(obj/item/I, mob/user)
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

/obj/item/clothing/head/helmet/proc/damage_armor()
	if(armor.linebullet>0 && armor.linelaser>0 && armor.linemelee>0 && armor_durability>0)
		armor_durability -= 1
		armor = armor.modifyRating(linemelee = -1, linebullet = -1, linelaser = -1)

/obj/item/clothing/head/helmet/proc/fix_armor()
	if(armor_durability<100)
		armor = armor.modifyRating(initial(linemelee), initial(linebullet), initial(linelaser))
		armor_durability = initial(armor_durability)

/obj/item/clothing/head/helmet/handle_atom_del(atom/A)
	if(A == attached_light)
		set_attached_light(null)
		update_helmlight()
		update_icon()
		QDEL_NULL(alight)
		qdel(A)
	return ..()


///Called when attached_light value changes.
/obj/item/clothing/head/helmet/proc/set_attached_light(obj/item/flashlight/seclite/new_attached_light)
	if(attached_light == new_attached_light)
		return
	. = attached_light
	attached_light = new_attached_light
	if(attached_light)
		attached_light.set_light_flags(attached_light.light_flags | LIGHT_ATTACHED)
		if(attached_light.loc != src)
			attached_light.forceMove(src)
	else if(.)
		var/obj/item/flashlight/seclite/old_attached_light = .
		old_attached_light.set_light_flags(old_attached_light.light_flags & ~LIGHT_ATTACHED)
		if(old_attached_light.loc == src)
			old_attached_light.forceMove(get_turf(src))

/obj/item/clothing/head/helmet/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_HEAD))

/obj/item/clothing/head/helmet/sec
	can_flashlight = TRUE

/obj/item/clothing/head/helmet/sec/attackby(obj/item/I, mob/user, params)
	if(istype(I, repair_kit))
		use_kit(I, user)
		return

	if(issignaler(I))
		var/obj/item/assembly/signaler/S = I
		if(attached_light) //Has a flashlight. Player must remove it, else it will be lost forever.
			to_chat(user, "<span class='warning'>The mounted flashlight is in the way, remove it first!</span>")
			return

		if(S.secured)
			qdel(S)
			var/obj/item/bot_assembly/secbot/A = new
			user.put_in_hands(A)
			to_chat(user, "<span class='notice'>You add the signaler to the helmet.</span>")
			qdel(src)
			return
	return ..()

/obj/item/clothing/head/helmet/alt
	name = "bulletproof helmet"
	desc = "A bulletproof combat helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "helmetalt"
	item_state = "helmetalt"
	armor = list("melee" = 35, "bullet" = 60, "laser" = 30, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)
	can_flashlight = 1
	dog_fashion = null

/obj/item/clothing/head/helmet/alt/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/old
	name = "degrading helmet"
	desc = "Standard issue security helmet. Due to degradation the helmet's visor obstructs the users ability to see long distances."
	tint = 2

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	item_state = "helmet"
	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"
	can_toggle = 1
	armor = list("melee" = 70, "bullet" = 20, "laser" = 10, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)
	flags_inv = HIDEEARS|HIDEFACE
	strip_delay = 80
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEFACE
	toggle_cooldown = 0
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	dog_fashion = null
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/head/helmet/attack_self(mob/user)
	if(can_toggle && !user.incapacitated())
		if(world.time > cooldown + toggle_cooldown)
			cooldown = world.time
			up = !up
			flags_1 ^= visor_flags
			flags_inv ^= visor_flags_inv
			flags_cover ^= visor_flags_cover
			icon_state = "[initial(icon_state)][up ? "up" : ""]"
			to_chat(user, "[up ? alt_toggle_message : toggle_message] \the [src].")

			user.update_inv_head()
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.head_update(src, forced = 1)

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "An extremely robust, space-worthy helmet in a nefarious red and black stripe pattern."
	icon_state = "swatsyndie"
	item_state = "swatsyndie"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/swat/nanotrasen
	name = "\improper SWAT helmet"
	desc = "An extremely robust, space-worthy helmet with the Nanotrasen logo emblazoned on the top."
	icon_state = "swat"
	item_state = "swat"

/obj/item/clothing/head/helmet/skull
	name = "skull helmet"
	desc = "An intimidating tribal helmet, it doesn't look very comfortable."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	flags_cover = HEADCOVERSEYES
	armor = list("melee" = 55, "bullet" = 5, "laser" = 0, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)
	icon_state = "skull"
	item_state = "skull"
	strip_delay = 100
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/head/helmet/armyhelmet
	name = "steel helmet"
	desc = "A steel helmet, inspired by several pre-war designs. It provides some protection against impacts, cuts, and medium-velocity bullets."
	icon = 'icons/fallout/clothing/helmets.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/helmet.dmi'
	icon_state = "armyhelmet"
	item_state = "armyhelmet"

/obj/item/clothing/head/helmet/armyhelmet/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/armyhelmet/heavy
	name = "heavy steel helmet"
	desc = "a steel helmet, inspired by several pre-war designs. This one has been modified by Brattleboro citizens to provide more protection to the face and neck."
	icon_state = "armyhelmetheavy"
	item_state = "armyhelmetheavy"
	armor = list("melee" = 30, "bullet" = 50, "laser" = 30, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = 0.025
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR|HIDESNOUT

/obj/item/clothing/head/helmet/armyhelmet/heavy/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/flakhelm	//Actually the M1 Helmet
	name = "flak helmet"
	desc = "A dilapidated helmet, obsolete even by pre-war standards. An ace of spades is tucked into the band around the outer shell."
	icon_state = "m1helm"
	item_state = "helmet"
	armor = list("melee" = 10, "bullet" = 10, "laser" = 0, "bomb" = 5, "bio" = 0, "rad" = 0, "acid" = -15)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/tiny/spacenam	//So you can stuff other things in the elastic band instead of it simply being a fluff thing.

//The "pocket" for the M1 helmet so you can tuck things into the elastic band

/datum/component/storage/concrete/pockets/tiny/spacenam
	attack_hand_interact = TRUE		//So you can actually see what you stuff in there

/obj/item/clothing/head/helmet/f13/combat
	name = "combat helmet"
	desc = "An old military grade pre-war combat helmet."
	icon_state = "combat_helmet"
	item_state = "combat_helmet"
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 20, "bomb" = 50, "bio" = 60, "rad" = 10, "fire" = 60, "acid" = 20, "wound" = 10)
	strip_delay = 50
	flags_inv = HIDEEARS|HIDEHAIR
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 3)

/obj/item/clothing/head/helmet/f13/combat/dark
	color = "#302E2E" // Dark Grey

/obj/item/clothing/head/helmet/f13/combat/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/f13/combat/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/head/helmet/f13/combat/mk2
	name = "reinforced combat helmet"
	desc = "An advanced pre-war titanium plated, ceramic coated, kevlar, padded helmet designed to withstand extreme punishment of all forms."
	icon_state = "combat_helmet_mk2"
	item_state = "combat_helmet_mk2"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 40, "energy" = 22, "bomb" = 55, "bio" = 60, "rad" = 10, "fire" = 60, "acid" = 20, "wound" = 10)
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 5)

/obj/item/clothing/head/helmet/f13/combat/riotbroken
	name = "broken riot helmet"
	icon_state = "ranger_broken"
	desc = "An old riot police helmet, out of use around the time of the war."
	armor = list("melee" = 55, "bullet" = 55, "laser" = 45, "energy" = 30, "bomb" = 45, "bio" = 55, "rad" = 10, "fire" = 60, "acid" = 20, "wound" = 10)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flash_protect = 1

/obj/item/clothing/head/helmet/f13/combat/swat
	name = "SWAT combat helmet"
	desc = "A prewar combat helmet issued to S.W.A.T. personnel."
	icon_state = "swatsyndie"
	item_state = "swatsyndie"
	armor = list("melee" = 35, "bullet" = 50, "laser" = 40, "energy" = 25, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)

/obj/item/clothing/head/helmet/f13/combat/environmental
	name = "environmental armor helmet"
	desc = "A full head helmet and gas mask, developed for use in heavily contaminated environments."
	icon_state = "env_helmet"
	item_state = "env_helmet"
	armor = list("melee" = 35, "bullet" = 40, "laser" = 40,"energy" = 20, "bomb" = 55, "bio" = 70, "rad" = 100, "fire" = 60, "acid" = 50)
	strip_delay = 60
	equip_delay_other = 60
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/f13/combat/environmental/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/rad_insulation, RAD_NO_INSULATION, TRUE, FALSE)

//LightToggle

/obj/item/clothing/head/helmet/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/clothing/head/helmet/update_icon_state()
	var/state = "[initial(icon_state)]"
	if(attached_light)
		if(attached_light.on)
			state += "-flight-on" //"helmet-flight-on" // "helmet-cam-flight-on"
		else
			state += "-flight" //etc.

	icon_state = state
	return ..()

/obj/item/clothing/head/helmet/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_helmet_flashlight))
		toggle_helmlight()
	else
		..()

/obj/item/clothing/head/helmet/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/flashlight/seclite))
		if(can_flashlight && !attached_light)
			var/obj/item/flashlight/seclite/S = I
			if(!user.transferItemToLoc(S, src))
				return
			to_chat(user, "<span class='notice'>You click [S] into place on [src].</span>")
			set_attached_light(S)
			update_helmlight()
			update_icon()
			alight = new(src)
			if(loc == user)
				alight.Grant(user)
		return
	return ..()

/obj/item/clothing/head/helmet/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	if(can_flashlight && attached_light) //if it has a light but can_flashlight is false, the light is permanently attached.
		I.play_tool_sound(src)
		to_chat(user, "<span class='notice'>You unscrew [attached_light] from [src].</span>")
		attached_light.forceMove(drop_location())
		if(Adjacent(user) && !issilicon(user))
			user.put_in_hands(attached_light)

		var/obj/item/flashlight/removed_light = set_attached_light(null)
		update_helmlight()
		removed_light.update_brightness(user)
		update_icon()
		user.update_inv_head()
		QDEL_NULL(alight)
		return TRUE

/obj/item/clothing/head/helmet/proc/toggle_helmlight()
	set name = "Toggle Helmetlight"
	set category = "Object"
	set desc = "Click to toggle your helmet's attached flashlight."

	if(!attached_light)
		return

	var/mob/user = usr
	if(user.incapacitated())
		return
	attached_light.on = !attached_light.on
	attached_light.update_brightness()
	to_chat(user, "<span class='notice'>You toggle the helmet light [attached_light.on ? "on":"off"].</span>")

	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_helmlight()

/obj/item/clothing/head/helmet/proc/update_helmlight()
	if(attached_light)
		update_icon()

	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
