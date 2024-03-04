///////////////
// WASTELAND //
///////////////

/obj/item/clothing/suit/armored/f13/heavy/sulphite
	name = "sulphite raider suit"
	desc = "There are still some old asbestos fireman suits laying around from before the war. \
	How about adding a ton of metal, plasteel and a combustion engine to one? The resulting armor is surprisingly effective at dissipating energy."
	icon_state = "sulphite"
	item_state = "sulphite"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("tier" = 4, "energy" = 50, "bomb" = 30, "bio" = 25, "rad" = 30, "fire" = 95, "acid" = 15)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armored/f13/heavy/metal
	name = "metal armor suit"
	desc = "A suit of fused metal plates. Bulky, well kept and with great protection."
	icon_state = "metal_suit"
	item_state = "metal_suit"
	armor = list("tier" = 5, "energy" = 20, "bomb" = 30, "bio" = 10, "rad" = 25, "fire" = 20, "acid" = 20)

/obj/item/clothing/suit/armored/f13/heavy/metal_raider
	name = "crude metal armor suit"
	desc = "More rust than metal. With gaping holes in it, this armor looks like a pile of junk. Under the rust, however, some quality steel still remains."
	icon_state = "raider_metal"
	item_state = "raider_metal"
	armor = list("tier" = 3, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 15, "fire" = 20, "acid" = 0)

/obj/item/clothing/suit/armored/f13/heavy/metal
	name = "metal armor suit"
	desc = "A suit of welded, fused metal plates. Bulky, but with great protection."
	icon_state = "raider_metal"
	item_state = "raider_metal"
	armor = list("tier" = 5, "energy" = 20, "bomb" = 30, "bio" = 10, "rad" = 25, "fire" = 20, "acid" = 20)

/obj/item/clothing/suit/armored/f13/heavy/recycled_power
	name = "recycled power armor"
	desc = "Taking pieces off wrecked power armor will at least give you thick plating, but don't expect too much of this shot up, piecemeal suit."
	icon_state = "recycled_power"
	armor = list("tier" = 6, "energy" = 25, "bomb" = 35, "bio" = 5, "rad" = 15, "fire" = 15, "acid" = 5)
	body_parts_covered = CHEST|GROIN|ARM_RIGHT|LEG_LEFT

/obj/item/clothing/suit/armored/f13/heavy/wardenplate
	name = "warden plates"
	desc = "Thick metal breastplate with a decorative skull on the shoulder."
	icon_state = "wardenplate"
	body_parts_covered = CHEST|ARM_RIGHT
	armor = list("tier" = 4, "energy" = 25, "bomb" = 30, "bio" = 0, "rad" = 15, "fire" = 10, "acid" = 10)

/obj/item/clothing/suit/armored/f13/heavy/tribal
	name = "tribal heavy carapace"
	desc = "Thick layers of leather and bone, with metal reinforcements, surely this will make the wearer tough and uncaring for claws and blades."
	icon_state = "tribal_heavy"
	item_state = "tribal_heavy"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 45, "bio" = 5, "rad" = 10, "fire" = 30, "acid" = 10)
	allowed = list(/obj/item/twohanded, /obj/item/melee/onehanded, /obj/item/melee/smith, /obj/item/melee/smith/twohand, /obj/item/shield)

//////////////
//	DFS		//
//////////////

/obj/item/clothing/suit/armored/f13/heavy/dfs
	name = "modified turnout gear"
	desc = "An old set of turnout gear, modified for use by the DFS group in the area. This is next-to-none in terms of protection against incendiary weaponry."
	icon = 'icons/fallout/clothing/bl_dfs.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/bl_dfs.dmi'
	icon_state = "dfs_firefighter"
	item_state = "dfs_firefighter"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	armor = list("tier" = 4, "energy" = 60, "bomb" = 30, "bio" = 60, "rad" = 60, "fire" = 100, "acid" = 60)
	strip_delay = 120
	resistance_flags = FIRE_PROOF | UNACIDABLE

//////////////
//	OTHER	//
//////////////

/obj/item/clothing/suit/armored/f13/heavy/tesla
	name = "tesla armor"
	desc = "A prewar armor design by Nikola Tesla before being confinscated by the U.S. government. Has a chance to deflect energy projectiles."
	icon_state = "tesla_armor"
	item_state = "tesla_armor"
	blood_overlay_type = "armor"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 60, "energy" = 60, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 90)
	resistance_flags = FIRE_PROOF
	var/hit_reflect_chance = 40
	protected_zones = list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

/obj/item/clothing/suit/armored/f13/heavy/tesla/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(is_energy_reflectable_projectile(object) && (attack_type == ATTACK_TYPE_PROJECTILE) && (def_zone in protected_zones))
		if(prob(hit_reflect_chance))
			block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
			return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
	return ..()

/obj/item/clothing/suit/armored/f13/heavy/environmental
	name = "environmental armor"
	desc = "Developed for use in heavily contaminated environments, this suit is prized in the Wasteland for its ability to protect against biological threats."
	icon_state = "environmental_armor"
	item_state = "environmental_armor"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.5
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("tier" = 2, "energy" = 15, "energy" = 90, "bomb" = 55, "bio" = 90, "rad" = 100, "fire" = 60, "acid" = 50)
	equip_delay_other = 60
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armored/f13/medium/environmental/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/rad_insulation, RAD_NO_INSULATION, TRUE, FALSE)
