/*
Hydration, Hunger & Oxy.
Moved from alerts into being a proper thing.
Shhh.
*/

/////////
// Oxygen Parent
/////////
/obj/screen/oxy
	name = "Oxygen"
	icon = 'icons/fallout/UI/screen_badlands.dmi'
	icon_state = "enough_oxy"
	screen_loc = ui_oxy

/obj/screen/oxy/Click(location,control,params)
	if(isliving(usr))
		var/mob/living/L = usr
		to_chat(L, "<span class='notice'>[src.desc]")
/*
/obj/screen/oxy/MouseEntered(location,control,params)
	if(!QDELETED(src))
		openToolTip(usr,src,params,title = name,content = desc)

/obj/screen/oxy/action_button/MouseExited()
	closeToolTip(usr)
*/
/obj/screen/oxy/update_icon()
	. = ..()

/////////
// Oxygen Update
/////////
/mob/living/carbon/human/proc/update_oxy_hud(datum/gas_mixture/breath)

	if(!client)
		return

	if(failed_last_breath == 1)
		hud_used.oxy.icon_state = "not_enough_oxy"
		hud_used.oxy.desc = "You're not getting enough oxygen. Find some good air before you pass out!"
		return
	else if(o2overloadtime > 0)
		hud_used.oxy.icon_state = "too_much_oxy"
		hud_used.oxy.desc = "There's too much oxygen in the air, and you're breathing it in! Find some good air before you pass out!"
		return
	else
		hud_used.oxy.icon_state = "enough_oxy"
		hud_used.oxy.desc = "You're breathing just fine."
	return

/////////
// Oxygen Objs
/////////
/obj/screen/oxy/enough
	desc = "You're breathing just fine."
	icon_state = "enough_oxy"

/obj/screen/oxy/too_much
	desc = "There's too much oxygen in the air, and you're breathing it in! Find some good air before you pass out!"
	icon_state = "too_much_oxy"

/obj/screen/oxy/lacking
	desc = "You're not getting enough oxygen. Find some good air before you pass out!"
	icon_state = "not_enough_oxy"

/////////
// Hydration Parent
/////////
/obj/screen/water
	name = "Hydration"
	icon = 'icons/fallout/UI/screen_badlands.dmi'
	icon_state = "water0"
	screen_loc = ui_hydration

/obj/screen/water/Click(location,control,params)
	if(isliving(usr))
		var/mob/living/L = usr
		to_chat(L, "<span class='notice'>[src.desc]")
/*
/obj/screen/water/MouseEntered(location,control,params)
	if(!QDELETED(src))
		openToolTip(usr,src,params,title = name,content = desc)

/obj/screen/water/action_button/MouseExited()
	closeToolTip(usr)
*/
/obj/screen/water/update_icon()
	. = ..()

/////////
// Hydration Update
/////////
/mob/living/carbon/human/proc/update_water_hud()

	if(!client)
		return

	if(water > THIRST_LEVEL_FULL)
		hud_used.water.icon_state = "water0"
		hud_used.water.desc = "You're not needing a drink."
		return
	else if(water > THIRST_LEVEL_LIGHT)
		hud_used.water.icon_state = "water1"
		hud_used.water.desc = "Your mouth is dry."
		return
	else if(water > THIRST_LEVEL_MIDDLE)
		hud_used.water.icon_state = "water2"
		hud_used.water.desc = "You're starting to feel the effects of slight fatigue. Find something to drink."
		return
	else if(water > THIRST_LEVEL_HARD)
		hud_used.water.icon_state = "water3"
		hud_used.water.desc = "You're starting to feel the effects of extreme fatigue. Find something to drink."
		return
	else//(water > THIRST_LEVEL_DEADLY)
		hud_used.water.icon_state = "water4"
		hud_used.water.desc = "Drink something, or you're soon going to waste away."
	return

/////////
// Hydration Objs
/////////
/obj/screen/water/toxic
	desc = "You've killed yourself."
	icon_state = "water_toxic"

/obj/screen/water/thirst1
	desc = "Your mouth is dry."
	icon_state = "water1"

/obj/screen/water/thirst2
	desc = "You're starting to feel the effects of slight fatigue. Find something to drink."
	icon_state = "water2"

/obj/screen/water/thirst3
	desc = "You're starting to feel the effects of extreme fatigue. Find something to drink."
	icon_state = "water3"

/obj/screen/water/thirst4
	desc = "Drink something, or you're soon going to waste away."
	icon_state = "water4"

/////////
// Hunger Parent
/////////
/obj/screen/food
	name = "Hunger"
	icon = 'icons/fallout/UI/screen_badlands.dmi'
	icon_state = "starv0"
	screen_loc = ui_hunger

/obj/screen/food/Click(location,control,params)
	if(isliving(usr))
		var/mob/living/L = usr
		to_chat(L, "<span class='notice'>[src.desc]")
/*
/obj/screen/food/MouseEntered(location,control,params)
	if(!QDELETED(src))
		openToolTip(usr,src,params,title = name,content = desc)

/obj/screen/food/action_button/MouseExited()
	closeToolTip(usr)
*/
/obj/screen/food/update_icon()
	. = ..()

/////////
// Hunger Update
/////////
/mob/living/carbon/human/proc/update_food_hud()

	if(!client)
		return

	if(nutrition > NUTRITION_LEVEL_FAT)
		hud_used.food.icon_state = "fat"
		hud_used.food.desc = "You ate too much food, lardass. Take better care of yourself."
		return
	else if(nutrition > NUTRITION_LEVEL_FULL)
		hud_used.food.icon_state = "starv0"
		hud_used.food.desc = "You're full. Any more food and it's likely you'll become ill."
		return
	else if(nutrition > NUTRITION_LEVEL_WELL_FED)
		hud_used.food.icon_state = "starv1"
		hud_used.food.desc = "You're well fed."
		return
	else if(nutrition > NUTRITION_LEVEL_FED)
		hud_used.food.icon_state = "starv2"
		hud_used.food.desc = "You've recently eaten, and have little worries about hunger."
		return
	else if(nutrition > NUTRITION_LEVEL_HUNGRY)
		hud_used.food.icon_state = "starv3"
		hud_used.food.desc = "You feel as if your stomach is in freefall. Find something to eat."
		return
	else//(nutrition > NUTRITION_LEVEL_STARVING)
		hud_used.food.icon_state = "starv4"
		hud_used.food.desc = "Your body is slowly starting to waste away. Find food. Soon."
	return

/////////
// Hunger Objs
/////////
/obj/screen/food/hunger1
	desc = "You could do with something to eat."
	icon_state = "starv1"

/obj/screen/food/hunger2
	desc = "You're more than peckish. Get something to snack on."
	icon_state = "starv2"

/obj/screen/food/hunger3
	desc = "You feel as if your stomach is in freefall. Find something to eat."
	icon_state = "starv3"

/obj/screen/food/hunger4
	desc = "Your body is slowly starting to waste away. Find food. Soon."
	icon_state = "starv4"

/obj/screen/food/fat
	desc = "You ate too much food, lardass. Take better care of yourself."
	icon_state = "fat"
