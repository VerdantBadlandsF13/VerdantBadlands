#define SNAKE_SPAM_TICKS 600 //how long between cardboard box openings that trigger the '!'
/obj/structure/closet/cardboard
	name = "large cardboard box"
	desc = "Just a box..."
	icon_state = "cardboard"
	mob_storage_capacity = 1
	resistance_flags = FLAMMABLE
	max_integrity = 70
	integrity_failure = 0
	can_weld_shut = 0
	cutting_tool = /obj/item/wirecutters
	open_sound = "rustle"
	material_drop = /obj/item/stack/sheet/cardboard
	delivery_icon = "deliverybox"
	anchorable = FALSE
	var/egged = 0
	var/use_mob_movespeed = FALSE //Citadel adds snowflake box handling
	var/move_delay = FALSE
	var/move_speed_multiplier = 0

/mob/living/proc/do_alert_animation(atom/A)
	var/image/I = image('icons/obj/closet.dmi', A, "cardboard_special", A.layer+1)
	flick_overlay_view(I, A, 8)
	I.alpha = 0
	animate(I, pixel_z = 32, alpha = 255, time = 5, easing = ELASTIC_EASING)


/obj/structure/closet/cardboard/handle_lock_addition() //Whoever heard of a lockable cardboard box anyway
	return

/obj/structure/closet/cardboard/handle_lock_removal()
	return

/obj/structure/closet/cardboard/metal
	name = "large metal box"
	desc = "THE COWARDS! THE FOOLS!"
	icon_state = "metalbox"
	max_integrity = 500
	resistance_flags = NONE
	cutting_tool = /obj/item/weldingtool
	open_sound = 'sound/machines/click.ogg'
	material_drop = /obj/item/stack/sheet/plasteel
#undef SNAKE_SPAM_TICKS
