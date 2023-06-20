/*
Contains turrets used for the compound.
Woe, ballistic wounds be upon ye.
*/
/obj/machinery/porta_turret/lbj
	name = "auto turret"
	installation = null
	always_up = 1
	use_power = NO_POWER_USE
	has_cover = 0
	scan_range = 9
	max_integrity = 650
	obj_integrity = 650
	req_access = list(ACCESS_LBJ)
	mode = TURRET_LETHAL
	stun_projectile = /obj/item/projectile/bullet/a50MG/depleteduranium
	lethal_projectile = /obj/item/projectile/bullet/a50MG/depleteduranium
// Only lethal is used, but the second one is there JUST in case it swaps. Somehow.
	lethal_projectile_sound = 'modular_badlands/code/modules/techno_jacks/sounds/turret_attack01.ogg'
	stun_projectile_sound = 'modular_badlands/code/modules/techno_jacks/sounds/turret_attack02.ogg'
	icon_state = "syndie_off"
	base_icon_state = "syndie"
	faction = list(FACTION_LBJ)
	desc = "A ballistic machine gun auto-turret, keyed to recognise only those of the Sanctuary."

/obj/machinery/porta_turret/lbj/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_SELF | EMP_PROTECT_WIRES)

/obj/machinery/porta_turret/lbj/setup()
	return

/obj/machinery/porta_turret/lbj/assess_perp(mob/living/carbon/human/perp)
	return 10

/obj/machinery/porta_turret/lbj/hologram
	name = "hologram"
	stun_projectile = /obj/item/projectile/beam/laser/pistol/stun
	lethal_projectile = /obj/item/projectile/beam/laser
	lethal_projectile_sound = 'sound/f13weapons/laerfire.ogg'
	stun_projectile_sound = 'sound/f13weapons/laerfire.ogg'
	icon_state = "hologram_off"
	base_icon_state = "hologram"
	density = 0
	resistance_flags = FIRE_PROOF | ACID_PROOF | UNACIDABLE | FREEZE_PROOF | INDESTRUCTIBLE
	scan_range = 10

/obj/structure/fluff/hologram
	name = "hologram projector"
	desc = "An odd device, intended to do... something."
	resistance_flags = FIRE_PROOF | ACID_PROOF | UNACIDABLE | FREEZE_PROOF | INDESTRUCTIBLE
	icon = 'icons/obj/turrets.dmi'
	icon_state = "holopad0"
