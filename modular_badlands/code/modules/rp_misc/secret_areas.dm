// Prevents ghosts and players alike from crossing, though the former can just click-jump through.
// Use the area to kill players. This is just for blocking transport.
/turf/cordon
	name = "cordon"
	icon = 'icons/turf/walls.dmi'
	icon_state = "cordon"
	invisibility = INVISIBILITY_ABSTRACT
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	explosion_block = INFINITY
	rad_insulation = RAD_FULL_INSULATION
	opacity = TRUE
	density = TRUE
	blocks_air = TRUE
	bullet_bounce_sound = null
	baseturfs = /turf/cordon

/turf/cordon/AfterChange()
	. = ..()
	SSair.high_pressure_delta -= src

/turf/cordon/attack_ghost(mob/dead/observer/user)
	return FALSE

/turf/cordon/rust_heretic_act()
	return FALSE

/turf/cordon/acid_act(acidpwr, acid_volume, acid_id)
	return FALSE

/turf/cordon/Melt()
	to_be_destroyed = FALSE
	return src

/turf/cordon/singularity_act()
	return FALSE

/turf/cordon/ScrapeAway(amount, flags)
	return src // :devilcat:

/turf/cordon/bullet_act()
	return BULLET_ACT_HIT

/turf/cordon/Adjacent(atom/neighbor, atom/target, atom/movable/mover)
	return FALSE

/area/cordon
	name = "CORDON"
	icon_state = "cordon"
	noteleport = TRUE
	hidden = TRUE
	safe = FALSE
	requires_power = FALSE

/area/cordon/Entered(atom/movable/arrived, area/old_area)
	. = ..()
	for(var/mob/living/enterer as anything in arrived.GetAllContentsType(/mob/living))
		to_chat(enterer, span_userdanger("This was a bad idea..."))
		enterer.dust(TRUE, FALSE, TRUE)

/area/awaymission/secret
	noteleport = TRUE
	hidden = TRUE
	safe = FALSE
	requires_power = FALSE

/area/awaymission/secret/unpowered
	always_unpowered = TRUE

/area/awaymission/secret/unpowered/outdoors
	outdoors = TRUE

/area/awaymission/secret/unpowered/no_grav
	has_gravity = FALSE
