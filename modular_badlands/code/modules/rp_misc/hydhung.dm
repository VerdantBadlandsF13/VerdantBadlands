/*
Hydration & Hunger.
Moved from alerts into being a proper thing.
*/

/obj/screen/food
	name = "Hunger"
	icon_state = null
	screen_loc = ui_alert_food

/obj/screen/water
	name = "Hydration"
	icon_state = null
	screen_loc = ui_alert_water

/////////
// Food/Water
/////////
/obj/screen/water/toxic
	name = "Thirst"
	desc = "You've killed yourself."
	icon_state = "water_toxic"

/obj/screen/water/thirst1
	name = "Thirst"
	desc = "Your mouth is dry."
	icon_state = "water1"

/obj/screen/water/thirst2
	name = "Thirst"
	desc = "You're starting to feel the effects of slight fatigue. Find something to drink."
	icon_state = "water2"

/obj/screen/water/thirst3
	name = "Thirst"
	desc = "You're starting to feel the effects of extreme fatigue. Find something to drink."
	icon_state = "water3"

/obj/screen/water/thirst4
	name = "Thirst"
	desc = "Drink something, or you're soon going to waste away."
	icon_state = "water4"

/obj/screen/food/hunger1
	name = "Hunger"
	desc = "You could do with something to eat."
	icon_state = "starv1"

/obj/screen/food/hunger2
	name = "Hunger"
	desc = "You're more than peckish. Get something to snack on."
	icon_state = "starv2"

/obj/screen/food/hunger3
	name = "Hunger"
	desc = "You feel as if your stomach is in freefall. Find something to eat."
	icon_state = "starv3"

/obj/screen/food/hunger4
	name = "Hunger"
	desc = "Your body is slowly starting to waste away. Find food. Soon."
	icon_state = "starv4"

/obj/screen/food/fat
	name = "Fat"
	desc = "You ate too much food, lardass. Run around the station and lose some weight."
	icon_state = "fat"
