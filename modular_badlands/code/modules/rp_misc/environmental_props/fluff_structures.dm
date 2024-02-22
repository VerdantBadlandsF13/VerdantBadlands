// Wardrobe and Desks
/obj/structure/closet/cabinet/vb_wardrobe
	name = "wardrobe"
	desc = "A creaky wardrobe, covered in dust."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/bl_small_fluff.dmi'
	icon_state = "wardrobe"
	anchored = TRUE
	open_sound = "modular_badlands/code/modules/rp_misc/sound/doors_and_containers/containers/wardrobeopen.ogg"
	close_sound = "modular_badlands/code/modules/rp_misc/sound/doors_and_containers/containers/wardrobeclose.ogg"

/obj/structure/closet/cabinet/vb_desk
	name = "office desk"
	desc = "An old, dusty desk from a more civil time."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/bl_small_fluff.dmi'
	icon_state = "deskdrawer"
	material_drop = /obj/item/stack/sheet/mineral/wood
	material_drop_amount = 6
	dense_when_open = TRUE
	max_mob_size = MOB_SIZE_TINY
	mob_storage_capacity = 1
	anchored = TRUE
	open_sound = "modular_badlands/code/modules/rp_misc/sound/doors_and_containers/containers/crateopen.ogg"
	close_sound = "modular_badlands/code/modules/rp_misc/sound/doors_and_containers/containers/crateclose.ogg"

// Lighting
/obj/item/flashlight/lamp/vb
	name = "ancient desk lamp"
	desc = "A classic desk lamp."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/bl_small_fluff.dmi'
	icon_state = "lamp"
	item_state = "lamp"

// Bookcase

/obj/structure/bookshelf_vb
	name = "bookshelf"
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/bl_small_fluff.dmi'
	icon_state = "bshelf"
	desc = "A great place for storing knowledge."
	opacity = 0
	density = TRUE
	anchored = TRUE
	resistance_flags = FLAMMABLE

/obj/structure/bookshelf_vb/New()
	..()
	icon_state = "bshelf[rand(1,7)]"

// Radio

// Looping Sounds
/datum/looping_sound/rad_static
	start_sound = list('modular_badlands/code/modules/rp_misc/sound/radio/radio_turn_on.ogg')
	start_length = 2 SECONDS
	start_volume = 45
	mid_sounds = list('modular_badlands/code/modules/rp_misc/sound/radio/static/radio_static.ogg')
	mid_length = 5 SECONDS
	chance = 5
	end_sound = list('modular_badlands/code/modules/rp_misc/sound/radio/radio_turn_off.ogg')
	end_volume = 45
	volume = 15

/datum/looping_sound/rad_static_burst
	start_sound = list('modular_badlands/code/modules/rp_misc/sound/radio/radio_signal_found.ogg')
	start_length = 2 SECONDS
	start_volume = 45
	mid_sounds = list('modular_badlands/code/modules/rp_misc/sound/radio/static/radio_static_burst0.ogg', 'modular_badlands/code/modules/rp_misc/sound/radio/static/radio_static_burst1.ogg', 'modular_badlands/code/modules/rp_misc/sound/radio/static/radio_static_burst2.ogg')
	mid_length = 3 SECONDS
	chance = 5
	end_sound = list('modular_badlands/code/modules/rp_misc/sound/radio/radio_signal_lost.ogg')
	end_volume = 45
	volume = 25

// Actual Radio

/obj/item/radio/intercom/vb_st_rad
	name = "stationary radio"
	desc = "An old, static-filled radio set."
	icon = 'modular_badlands/code/modules/rp_misc/environmental_props/icons/bl_small_fluff.dmi'
	icon_state = "hamradio"
	freqlock = TRUE
	frequency = 1363
	plane = GAME_PLANE
	broadcasting = FALSE
	listening = FALSE
	channels = list(RADIO_CHANNEL_GMB = 1)
	use_command = TRUE
	var/datum/looping_sound/rad_static/soundloop_one
	var/datum/looping_sound/rad_static_burst/soundloop_two

/obj/item/radio/intercom/vb_st_rad/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/screwdriver))
		return
	. = ..()

/obj/item/radio/intercom/vb_st_rad/Initialize()
	. = ..()
	soundloop_one = new(src, FALSE)
	soundloop_two = new(src, FALSE)
	START_PROCESSING(SSobj, src)

/obj/item/radio/intercom/vb_st_rad/Destroy()
	. = ..()
	soundloop_one.stop(src)
	soundloop_two.stop(src)
	STOP_PROCESSING(SSobj, src)

//There's probably a better way to have it check state, but this is the most simple.
/obj/item/radio/intercom/vb_st_rad/process()
	if(broadcasting == TRUE)
		soundloop_one.start(src)
	else
		soundloop_one.stop(src)
	if(listening == TRUE)
		soundloop_two.start(src)
	else
		soundloop_two.stop(src)
	..()
