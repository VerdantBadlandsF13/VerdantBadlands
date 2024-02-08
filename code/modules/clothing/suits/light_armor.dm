/////////////////////
// UTILITY & RIGS  //
/////////////////////

/obj/item/clothing/suit/armored/f13/light/rig
	name = "makeshift rig"
	desc = "A makeshift rig for holding all sorts of equipment. Provides absolutely no protection, but the extra storage space may make up for that."
	icon_state = "r_gear_rig"
	item_state = "r_gear_rig"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/huge/rig
	armor = null

// VFE Kevlar - Unique, due to not following our armor restrictions for protection.
/obj/item/clothing/suit/armored/f13/light/vfe_vest
	name = "Vault Security vest"
	desc = "A large bulletproof vest with ballistic plates and micro ceramic inserts. <br>\
	Issued exclusively to Vault Security."
	icon_state = "vest_large"
	item_state = "vest_large"
	body_parts_covered = CHEST
	armor = list("melee" = 35, "bullet" = 45, "laser" = 10, "energy" = 10, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = 5)

/////////////////////
// DUSTERS & COATS //
/////////////////////

/obj/item/clothing/suit/armored/f13/light/duster
	name = "duster"
	desc = "A long brown leather overcoat with discrete protective reinforcements sewn into the lining."
	icon_state = "duster"
	item_state = "duster"
	permeability_coefficient = 0.9
	heat_protection = CHEST | GROIN
	cold_protection = CHEST | GROIN
	body_parts_covered = CHEST|GROIN
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 5, "fire" = 15, "acid" = 5)

/obj/item/clothing/suit/armored/f13/light/duster/autumn
	name = "tan trenchcoat"
	desc = "A heavy-duty tan trenchcoat."
	icon_state = "duster_autumn"
	item_state = "duster_autumn"

/obj/item/clothing/suit/armored/f13/light/duster/battlecoat
	name = "battlecoat"
	desc = "A heavy padded coat that distributes heat efficiently, designed to protect pre-War bomber pilots from anti-aircraft lasers."
	icon_state = "maxson_battlecoat"
	item_state = "maxson_battlecoat"
	armor = list("tier" = 2, "energy" = 15, "bomb" = 5, "bio" = 5, "rad" = 5, "fire" = 15, "acid" = 5)

/obj/item/clothing/suit/armored/f13/light/duster/vet
	name = "merc veteran coat"
	desc = "A blue leather coat with its sleeves cut off, adorned with war medals.<br>This type of outfit is common for professional mercenaries and bounty hunters."
	icon_state = "duster_vet"
	item_state = "duster_vet"

/obj/item/clothing/suit/armored/f13/light/duster/brahmin
	name = "leather duster"
	desc = "A duster made from tanned brahmin hide. It has a thick waxy surface from the processing, making it surprisingly resistant."
	icon_state = "duster_brahmin"
	item_state = "duster_brahmin"

/////////////////
//UNIQUE ARMORS//
/////////////////

/obj/item/clothing/suit/armored/f13/light/outlander
	name = "outlander armor"
	desc = "Stripped composite plates from combat armor, mixed in with a ragged cloak, some pouches and padding."
	icon_state = "western_wayfarer_armor"
	item_state = "western_wayfarer_armor"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	body_parts_covered = CHEST|GROIN|LEG_LEFT|ARM_LEFT

////////////////
// ARMOR KITS //
////////////////

/obj/item/clothing/suit/armored/f13/light/kit
	name = "crude armor kit"
	desc = "A shoulder plate, some padding and not much more. Very well ventilated."
	icon_state = "armorkit"
	item_state = "armorkit"
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	siemens_coefficient = 1.1
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/light/kit/punk
	name = "stripped armor kit"
	desc = "A few pieces of metal strapped to protect choice parts against sudden lead poisoning. Excellent ventilation included."
	icon_state = "armorkit_punk"
	item_state = "armorkit_punk"
	body_parts_covered = LEG_LEFT|ARM_RIGHT

/obj/item/clothing/suit/armored/f13/light/kit/shoulder
	name = "shoulder plate"
	desc = "A single big metal shoulderplate for the right side, keeping it turned towards the enemy is advisable."
	icon_state = "armorkit_shoulder"
	item_state = "armorkit_shoulder"
	body_parts_covered = ARM_RIGHT

/obj/item/clothing/suit/armored/f13/light/kit/plates
	name = "light armor plates"
	desc = "Well-made metal plates covering your vital organs."
	icon_state = "light_plates"
	armor = list("tier" = 2, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

///////////////////
// LEATHER ARMOR //
///////////////////

/obj/item/clothing/suit/armored/f13/light/leather
	name = "leather armor vest"
	desc = "Leather boiled in corn oil to make hard sheets to emulate the light weight and toughness of polymer armor."
	icon_state = "leather_armor"
	item_state = "leather_armor"
	body_parts_covered = CHEST
	armor = list("tier" = 2, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/light/leathermk2
	name = "polymer armor vest"
	desc = "Armor with polymer plates, backed by thick leather and kevlar."
	icon_state = "leather_armor_mk2"
	item_state = "leather_armor_mk2"
	body_parts_covered = CHEST
	armor = list("tier" = 3, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/light/leathersuit
	name = "leather suit"
	desc = "Comfortable suit of tanned leather leaving one arm mostly bare. Keeps you warm and cozy."
	icon_state = "leather_suit"
	item_state = "leather_suit"
	flags_inv = HIDEJUMPSUIT
	cold_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	siemens_coefficient = 0.9
	armor = list("tier" = 2, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/light/leather_jacket
	name = "bouncer jacket"
	desc = "A very stylish pre-War black, heavy leather jacket. Not always a good choice to wear this the scorching sun of the wasteland, and one of the arms has been torn off"
	icon_state = "leather_jacket_fighter"
	item_state = "leather_jacket_fighter"
	body_parts_covered = CHEST|ARM_LEFT
	armor = list("tier" = 2, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/light/leather_jacketmk2
	name = "thick leather jacket"
	desc = "This heavily padded leather jacket is unusual in that it has two sleeves. You'll definitely make a fashion statement whenever, and wherever, you rumble."
	icon_state = "leather_jacket_thick"
	item_state = "leather_jacket_thick"
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/light/leathercoat
	name = "thick leather coat"
	desc = "Reinforced leather jacket with a overcoat. Well insulated, creaks a lot while moving."
	icon_state = "leather_coat_fighter"
	item_state = "leather_coat_fighter"
	siemens_coefficient = 0.8
	cold_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	body_parts_covered = CHEST|LEGS|ARMS
	armor = list("tier" = 2, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/light/tanvest
	name = "tanned vest"
	icon_state = "tanleather"
	item_state = "tanleather"
	desc = "Layers of leather glued together to make a stiff vest, crude but gives some protection against wild beasts and knife stabs to the liver."
	body_parts_covered = CHEST
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

///////////
// MISC. //
///////////

/obj/item/clothing/suit/armored/f13/light/mutantkit
	name = "oversized armor kit"
	desc = "Bits of armor fitted to a giant harness. Clearly not made for use by humans."
	icon_state = "mutie_armorkit"
	item_state = "mutie_armorkit"
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	siemens_coefficient = 1.1

/obj/item/clothing/suit/armored/f13/light/khan_groupie
	name = "biker jacket"
	desc = "Tough leather and a faded logo. What'd this stand for? Clearly not anything still around, that's for sure."
	icon_state = "khan_jacket"
	item_state = "khan_jacket"
	heat_protection = CHEST
	siemens_coefficient = 1.1
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

// GMB

/obj/item/clothing/suit/armored/f13/light/gmb
	name = "militia volunteer coat"
	desc = "A militia coat, intended for volunteers and handouts. Appears to be some manner of leather. Tough, but not rigid. <br>\
	While it has been fitted with the militia's patch, it hasn't been otherwise modified."
	icon = 'icons/fallout/clothing/bl_mountain.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/bl_mountain.dmi'
	icon_state = "gmbrowncoat"
	item_state = "gmbrowncoat"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/suit/armored/f13/light/gmb/militia
	name = "militia overcoat"
	desc = "A handmade coat. It has been fitted with the militia's patch, and has ballistic weave sewn in."
	icon_state = "gmgreencoat"
	item_state = "gmgreencoat"
	armor = list("tier" = 2, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/suit/armored/f13/light/gmb/practitioner
	name = "practitioner coat"
	desc = "A handmade coat, intended for the practitioner. Intended to remain out of the way, while keeping one's cloathing safe from spills. <br>\
	It has been fitted with the militia's patch."
	icon_state = "leathercoat"
	item_state = "gmbrowncoat"
	armor = list("tier" = 2, "energy" = 60, "bomb" = 0, "bio" = 60, "rad" = 60, "fire" = 20, "acid" = 60)

/obj/item/clothing/suit/armored/f13/light/gmb/walker
	name = "walker plated overcoat"
	desc = "A handmade overcoat, fitted with plating and sewn in ballistic weave. It has been fitted with the militia's patch."
	icon_state = "gmbrowncoatplated"
	item_state = "gmbrowncoatplated"
	armor = list("tier" = 5, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/suit/armored/f13/light/gmb/commander
	name = "commander plated overcoat"
	desc = "A handmade overcoat, fitted with plating and sewn in ballistic weave. It has been fitted with the militia's patch."
	icon_state = "gmbrowncoatplated"
	item_state = "gmbrowncoatplated"
	armor = list("tier" = 6, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)
