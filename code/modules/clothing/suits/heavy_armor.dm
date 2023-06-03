///////////////
// WASTELAND //
///////////////

// Recipe Firesuit + metal chestplate + 50 welding fuel + 1 HQ + 1 plasteel
/obj/item/clothing/suit/armored/f13/heavy/sulphite
	name = "sulphite raider suit"
	desc = "There are still some old asbestos fireman suits laying around from before the war. How about adding a ton of metal, plasteel and a combustion engine to one? The resulting armor is surprisingly effective at dissipating energy."
	icon_state = "sulphite"
	item_state = "sulphite"
	armor = list("melee" = 55, "bullet" = 40, "laser" = 50, "energy" = 50, "bomb" = 30, "bio" = 25, "rad" = 30, "fire" = 95, "acid" = 15)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armored/f13/heavy/metal
	name = "metal armor suit"
	desc = "A suit of welded, fused metal plates. Bulky, but with great protection."
	icon_state = "raider_metal"
	item_state = "raider_metal"
	armor = list("melee" = 60, "bullet" = 45, "laser" = 30, "energy" = 20, "bomb" = 30, "bio" = 10, "rad" = 25, "fire" = 20, "acid" = 20, "wound" = 10)

/obj/item/clothing/suit/armored/f13/heavy/recycled_power
	name = "recycled power armor"
	desc = "Taking pieces off from a wrecked power armor will at least give you thick plating, but don't expect too much of this shot up, piecemeal armor.."
	icon_state = "recycled_power"
	armor = list("melee" = 50, "bullet" = 45, "laser" = 30, "energy" = 25, "bomb" = 35, "bio" = 5, "rad" = 15, "fire" = 15, "acid" = 5, "wound" = 10)

/obj/item/clothing/suit/armored/f13/heavy/raidermetal
	name = "iron raider suit"
	desc = "More rust than metal, with gaping holes in it, this armor looks like a pile of junk. Under the rust some quality steel still remains however."
	icon_state = "raider_metal"
	item_state = "raider_metal"
	armor = list("melee" = 55, "bullet" = 40, "laser" = 15, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 15, "fire" = 20, "acid" = 0, "wound" = 10)

/obj/item/clothing/suit/armored/f13/heavy/wardenplate
	name = "warden plates"
	desc = "Thick metal breastplate with a decorative skull on the shoulder."
	icon_state = "wardenplate"
	armor = list("melee" = 55, "bullet" = 50, "laser" = 35, "energy" = 25, "bomb" = 30, "bio" = 0, "rad" = 15, "fire" = 10, "acid" = 10, "wound" = 10)

/obj/item/clothing/suit/armored/f13/heavy/riotpolice
	name = "riot police armor"
	icon_state = "bulletproof_heavy"
	item_state = "bulletproof_heavy"
	desc = "Heavy armor with ballistic inserts, sewn into a padded riot police coat."
	armor = list("melee" = 70, "bullet" = 45, "laser" = 20, "energy" = 20, "bomb" = 45, "bio" = 35, "rad" = 10, "fire" = 50, "acid" = 10, "wound" = 10)

//Recipe bone armor + metal and leather
/obj/item/clothing/suit/armored/f13/heavy/tribal
	name = "tribal heavy carapace"
	desc = "Thick layers of leather and bone, with metal reinforcements, surely this will make the wearer tough and uncaring for claws and blades."
	icon_state = "tribal_heavy"
	item_state = "tribal_heavy"
	armor = list("melee" = 55, "bullet" = 20, "laser" = 25, "energy" = 20, "bomb" = 45, "bio" = 5, "rad" = 10, "fire" = 30, "acid" = 10, "wound" = 10)
	allowed = list(/obj/item/twohanded, /obj/item/melee/onehanded, /obj/item/melee/smith, /obj/item/melee/smith/twohand, /obj/item/shield)

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
	armor = list("melee" = 35, "bullet" = 30, "laser" = 20, "energy" = 15, "energy" = 45, "bomb" = 55, "bio" = 70, "rad" = 100, "fire" = 60, "acid" = 50)
	equip_delay_other = 60
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armored/f13/medium/environmental/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/rad_insulation, RAD_NO_INSULATION, TRUE, FALSE)
