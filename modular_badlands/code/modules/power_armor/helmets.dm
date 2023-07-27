/////////////////
// Power Armor //
/////////////////
/datum/action/item_action/toggle/pa_helmet_toggle
	button_icon_state = "pa_helmet"

/obj/item/clothing/head/helmet/f13/power_armor
	cold_protection = HEAD
	heat_protection = HEAD
	ispowerarmor = 1 //TRUE
	strip_delay = 200
	equip_delay_self = 20
	slowdown = 0.05
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEMASK|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	clothing_flags = THICKMATERIAL
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	item_flags = SLOWS_WHILE_IN_HAND
	flash_protect = 2
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	speechspan = SPAN_ROBOT //makes you sound like a robot
	max_heat_protection_temperature = FIRE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	light_system = MOVABLE_LIGHT_DIRECTIONAL
	light_range = 5
	light_on = FALSE
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 10)
	salvage_tool_behavior = TOOL_WELDER
	/// Projectiles below this damage will get deflected
	var/deflect_damage = 42
	/// If TRUE - it requires PA training trait to be worn
	var/requires_training = TRUE
	/// If TRUE - the suit will give its user specific traits when worn
	var/powered = TRUE
	/// Path of item that this helmet gets salvaged into
	var/obj/item/salvaged_type = null
	/// Used to track next tool required to salvage the suit
	var/salvage_step = 0

	actions_types = list(/datum/action/item_action/toggle/pa_helmet_toggle)

	durability_threshold = 15

	armor_durability = 100
	repair_kit = /obj/item/repair_kit/pa_repair_kit

/obj/item/clothing/head/helmet/f13/power_armor/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/clothing/head/helmet/f13/power_armor/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/toggle/pa_helmet_toggle))
		toggle_helmet_light()
		return

/obj/item/clothing/head/helmet/f13/power_armor/attack_self(mob/living/user)
	toggle_helmet_light(user)

/obj/item/clothing/head/helmet/f13/power_armor/proc/toggle_helmet_light(mob/living/user)
	set_light_on(!light_on)
	update_icon()

/obj/item/clothing/head/helmet/f13/power_armor/mob_can_equip(mob/user, mob/equipper, slot, disable_warning = 1)
	var/mob/living/carbon/human/H = user
	if(src == H.head) //Suit is already equipped
		return ..()
	if (!HAS_TRAIT(H, TRAIT_PA_WEAR) && slot == SLOT_HEAD && requires_training)
		to_chat(user, "<span class='warning'>You don't have the proper training to operate the power armor!</span>")
		return 0
	if(slot == SLOT_HEAD)
		return ..()
	return

/obj/item/clothing/head/helmet/f13/power_armor/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if((attack_type == ATTACK_TYPE_PROJECTILE) && (def_zone in protected_zones))
		if(prob(70) && (damage < deflect_damage))
			block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
			return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
	return ..()

/obj/item/clothing/head/helmet/f13/power_armor/attackby(obj/item/I, mob/living/carbon/human/user, params)
	if(ispath(salvaged_type))
		switch(salvage_step)
			if(0)
				// Salvage
				if(istype(I, /obj/item/screwdriver))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the helmet before salvaging it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin unsecuring the cover...</span>")
					if(I.use_tool(src, user, 60, volume=50))
						salvage_step = 1
						to_chat(user, "<span class='notice'>You unsecure the cover.</span>")
					return
			if(1)
				// Salvage
				if(istype(I, /obj/item/wrench))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the helmet before salvaging it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin disconnecting the connection ports...</span>")
					if(I.use_tool(src, user, 80, volume=50))
						salvage_step = 2
						to_chat(user, "<span class='notice'>You disconnect the connection ports.</span>")
					return
				// Fix
				if(istype(I, /obj/item/screwdriver))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the helmet before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin securing the cover...</span>")
					if(I.use_tool(src, user, 60, volume=50))
						salvage_step = 0
						to_chat(user, "<span class='notice'>You secure the cover.</span>")
					return
			if(2)
				// Salvage
				if(istype(I, /obj/item/wirecutters))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the helmet before salvaging it.</span>")
						return
					to_chat(user, "<span class='notice'>You begin disconnecting wires...</span>")
					if(I.use_tool(src, user, 60, volume=70))
						to_chat(user, "<span class='notice'>You finish salvaging the helmet.</span>")
						var/obj/item/ST = new salvaged_type(src)
						user.put_in_hands(ST)
						qdel(src)
					return
				// Fix
				if(istype(I, /obj/item/wrench))
					if(ishuman(user) && user.wear_suit == src)
						to_chat(user, "<span class='warning'>You have to take off the helmet before fixing it.</span>")
						return
					to_chat(user, "<span class='notice'>You try to anchor connection ports to the frame...</span>")
					if(I.use_tool(src, user, 80, volume=60))
						salvage_step = 1
						to_chat(user, "<span class='notice'>You re-connect connection ports.</span>")
					return
	return ..()

/obj/item/clothing/head/helmet/f13/power_armor/examine(mob/user)
	. = ..()
	if(ispath(salvaged_type))
		. += salvage_hint()

/obj/item/clothing/head/helmet/f13/power_armor/proc/salvage_hint()
	switch(salvage_step)
		if(0)
			return "<span class='notice'>The metal cover can be <i>screwed</i> open.</span>"
		if(1)
			return "<span class='notice'>The cover is <i>screwed</i> open with connection ports <i>bolted down</i>.</span>"
		if(2)
			return "<span class='warning'>The connections ports have been <i>unanchored</i> and only <i>wires</i> remain.</span>"

/obj/item/clothing/head/helmet/f13/power_armor/t45d
	name = "T-45d power helmet"
	desc = "An old pre-war power armor helmet. It's pretty hot inside of it."
	icon_state = "t45dhelmet0"
	item_state = "t45dhelmet0"
	armor = list("tier" = 8, "melee" = 72.5, "bullet" = 72.5, "laser" = 72.5, "energy" = 25, "bomb" = 65, "bio" = 75, "rad" = 80, "fire" = 85, "acid" = 30, "wound" = 50)
	actions_types = list(/datum/action/item_action/toggle/pa_helmet_toggle)
	salvaged_type = /obj/item/clothing/head/helmet/f13/salvaged_pa/t45d

/obj/item/clothing/head/helmet/f13/power_armor/t45d/update_icon_state()
	icon_state = "t45dhelmet[light_on]"
	item_state = "t45dhelmet[light_on]"

/obj/item/clothing/head/helmet/f13/power_armor/t51b
	name = "T-51b power helmet"
	desc = "It's a T-51b power helmet."
	icon_state = "t51bhelmet0"
	item_state = "t51bhelmet0"
	armor = list("tier" = 9, "melee" = 72.5, "bullet" = 72.5, "laser" = 72.5, "energy" = 30, "bomb" = 62, "bio" = 100, "rad" = 99, "fire" = 90, "acid" = 40, "wound" = 50)
	durability_threshold = 25
	actions_types = list(/datum/action/item_action/toggle/pa_helmet_toggle)
	salvaged_type = /obj/item/clothing/head/helmet/f13/salvaged_pa/t51b

/obj/item/clothing/head/helmet/f13/power_armor/t51b/update_icon_state()
	icon_state = "t51bhelmet[light_on]"
	item_state = "t51bhelmet[light_on]"

/obj/item/clothing/head/helmet/f13/power_armor/t60
	name = "T-60a power helmet"
	desc = "The T-60 powered helmet, equipped with targetting software suite, Friend-or-Foe identifiers, and a dynamic HuD."
	icon_state = "t60helmet0"
	item_state = "t60helmet0"
	armor = list("tier" = 10, "melee" = 80, "bullet" = 70, "laser" = 80, "energy" = 30, "bomb" = 82, "bio" = 100, "rad" = 100, "fire" = 95, "acid" = 50, "wound" = 50)
	durability_threshold = 35
	actions_types = list(/datum/action/item_action/toggle/pa_helmet_toggle)
	salvaged_type = /obj/item/clothing/head/helmet/f13/salvaged_pa/t60

/obj/item/clothing/head/helmet/f13/power_armor/t60/update_icon_state()
	icon_state = "t60helmet[light_on]"
	item_state = "t60helmet[light_on]"
