/////////////////////
// UTILITY & RIGS  //
/////////////////////

/obj/item/clothing/suit/armored/f13/light/rig
	name = "makeshift rig"
	desc = "A makeshift rig for holding all sorts of equipment. Provides absolutely no protection, but the extra storage space may make up for that."
	icon_state = "r_gear_rig"
	item_state = "r_gear_rig"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets

// VFE Kevlar
/obj/item/clothing/suit/armored/f13/light/vfe_vest
	name = "Vault Security vest"
	desc = "A large bulletproof vest with ballistic plates and micro ceramic inserts. <br>\
	Issued exclusively to Vault Security."
	icon_state = "vest_large"
	item_state = "vest_large"
	armor = list("melee" = 35, "bullet" = 45, "laser" = 10, "energy" = 10, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = -5)

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
	armor = list("melee" = 5, "bullet" = 5, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

/obj/item/clothing/suit/armored/f13/light/duster/autumn
	name = "tan trenchcoat"
	desc = "A heavy-duty tan trenchcoat typically worn by pre-War generals."
	icon_state = "duster_autumn"
	item_state = "duster_autumn"

/obj/item/clothing/suit/armored/f13/light/duster/battlecoat
	name = "battlecoat"
	desc = "A heavy padded coat that distributes heat efficiently, designed to protect pre-War bomber pilots from anti-aircraft lasers."
	icon_state = "maxson_battlecoat"
	item_state = "maxson_battlecoat"

/obj/item/clothing/suit/armored/f13/light/duster/vet
	name = "merc veteran coat"
	desc = "A blue leather coat with its sleeves cut off, adorned with war medals.<br>This type of outfit is common for professional mercenaries and bounty hunters."
	icon_state = "duster_vet"
	item_state = "duster_vet"

/obj/item/clothing/suit/armored/f13/light/duster/brahmin
	name = "brahmin leather duster"
	desc = "A duster made from tanned brahmin hide. It has a thick waxy surface from the processing, making it surprisingly laser resistant."
	icon_state = "duster_brahmin"
	item_state = "duster_brahmin"

/////////////////
// MIXED ARMOR //
/////////////////

/obj/item/clothing/suit/armored/f13/light/chitinarmor
	name = "insect chitin armor"
	desc = "A suit made from gleaming insect chitin. The glittering black scales are remarkably resistant to hostile environments, except cold."
	icon_state = "insect"
	item_state = "insect"
	flags_inv = HIDEJUMPSUIT
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	resistance_flags = FIRE_PROOF | ACID_PROOF
	siemens_coefficient = 0.5
	permeability_coefficient = 0.5
	armor = list("melee" = 15, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

/obj/item/clothing/suit/armored/f13/light/badlands
	name = "badlands raider armor"
	desc = "A leather top with a bandolier over it and a straps that cover the arms. Suited for warm climates, comes with storage space."
	icon_state = "badlands"
	item_state = "badlands"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	armor = list("melee" = 15, "bullet" = 5, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

////////////////
// ARMOR KITS //
////////////////

/obj/item/clothing/suit/armored/f13/light/kit
	name = "armor kit"
	desc = "Separate armor parts you can wear over your clothing, giving basic protection against bullets entering some of your organs. Very well ventilated."
	icon_state = "armorkit"
	item_state = "armorkit"
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	siemens_coefficient = 1.1
	armor = list("melee" = 5, "bullet" = 5, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

/obj/item/clothing/suit/armored/f13/light/kit/punk
	name = "armor kit"
	desc = "A few pieces of metal strapped to protect choice parts against sudden lead poisoning. Excellent ventilation included."
	icon_state = "armorkit_punk"
	item_state = "armorkit_punk"

/obj/item/clothing/suit/armored/f13/light/kit/shoulder
	name = "armor kit"
	desc = "A single big metal shoulderplate for the right side, keeping it turned towards the enemy is advisable."
	icon_state = "armorkit_shoulder"
	item_state = "armorkit_shoulder"

/obj/item/clothing/suit/armored/f13/light/kit/plates
	name = "light armor plates"
	desc = "Well-made metal plates covering your vital organs."
	icon_state = "light_plates"
	armor = list("melee" = 5, "bullet" = 5, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

///////////////////
// LEATHER ARMOR //
///////////////////

/obj/item/clothing/suit/armored/f13/light/leather
	name = "leather armor"
	desc = "Before the war motorcycle-football was one of the largest specator sports in America. This armor copies the style of armor used by the players,	using leather boiled in corn oil to make hard sheets to emulate the light weight and toughness of the original polymer armor."
	icon_state = "leather_armor"
	item_state = "leather_armor"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

// Recipe the above + 2 gecko hides
/obj/item/clothing/suit/armored/f13/light/leathermk2
	name = "leather armor mk II"
	desc = "Armor in the motorcycle-football style, either with intact original polymer plating, or reinforced with gecko hide."
	icon_state = "leather_armor_mk2"
	item_state = "leather_armor_mk2"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

/obj/item/clothing/suit/armored/f13/light/leathersuit
	name = "leather suit"
	desc = "Comfortable suit of tanned leather leaving one arm mostly bare. Keeps you warm and cozy."
	icon_state = "leather_suit"
	item_state = "leather_suit"
	flags_inv = HIDEJUMPSUIT
	cold_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	siemens_coefficient = 0.9
	armor = list("melee" = 15, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

/obj/item/clothing/suit/armored/f13/light/leather_jacket
	name = "bouncer jacket"
	desc = "A very stylish pre-War black, heavy leather jacket. Not always a good choice to wear this the scorching sun of the wasteland, and one of the arms has been torn off"
	icon_state = "leather_jacket_fighter"
	item_state = "leather_jacket_fighter"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

/obj/item/clothing/suit/armored/f13/light/leather_jacketmk2
	name = "thick leather jacket"
	desc = "This heavily padded leather jacket is unusual in that it has two sleeves. You'll definitely make a fashion statement whenever, and wherever, you rumble."
	icon_state = "leather_jacket_thick"
	item_state = "leather_jacket_thick"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

// Recipe : one of the above + a suit_fashion leather coat
/obj/item/clothing/suit/armored/f13/light/leathercoat
	name = "thick leather coat"
	desc = "Reinforced leather jacket with a overcoat. Well insulated, creaks a lot while moving."
	icon_state = "leather_coat_fighter"
	item_state = "leather_coat_fighter"
	siemens_coefficient = 0.8
	cold_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	armor = list("melee" = 15, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

/obj/item/clothing/suit/armored/f13/light/tanvest
	name = "tanned vest"
	icon_state = "tanleather"
	item_state = "tanleather"
	desc = "Layers of leather glued together to make a stiff vest, crude but gives some protection against wild beasts and knife stabs to the liver."
	armor = list("melee" = 5, "bullet" = 5, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)

///////////////
//	CLOAKS	 //
///////////////

/obj/item/clothing/suit/hooded/cloak/birdclaw
	name = "quickclaw armour"
	icon_state = "birdarmor"
	desc = "A suit of armour fashioned out of the remains of a legendary deathclaw. \
	This one has been crafted to remove a good portion of its protection to improve on speed and trekking."
	slowdown = 0.025
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/birdclaw
	heat_protection = CHEST|GROIN|LEGS|ARMS|HANDS
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/hooded/cloakhood/birdclaw
	name = "quickclaw hood"
	icon_state = "hood_bird"
	desc = "A hood made of deathclaw hides, light while also being comfortable to wear, designed for speed."
	heat_protection = HEAD
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/suit/hooded/cloak/deathclaw
	name = "deathclaw cloak"
	icon_state = "deathclaw"
	desc = "Made from the sinew and skin of the fearsome deathclaw, this cloak will shield its wearer from harm."
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/deathclaw
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/head/hooded/cloakhood/deathclaw
	name = "deathclaw cloak hood"
	icon_state = "hood_deathclaw"
	desc = "A protective and concealing hood."
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/hooded/cloak/razorclaw
	name = "razorclaw cloak"
	icon_state = "razorclaw"
	desc = "A suit of armour fashioned out of the remains of a legendary deathclaw."
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/razorclaw
	heat_protection = CHEST|GROIN|LEGS|ARMS|HANDS
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/hooded/cloakhood/razorclaw
	name = "razorclaw helm"
	icon_state = "helmet_razorclaw"
	desc = "The skull of a legendary deathclaw."
	heat_protection = HEAD
	resistance_flags = FIRE_PROOF | ACID_PROOF

///////////
// MISC. //
///////////

// Recipe winter coat + armor kit
/obj/item/clothing/suit/toggle/armored/winterkit
	name = "armored winter coat"
	desc = "Fur lined coat with armor kit bits added to it."
	icon_state = "winter_kit"
	item_state = "winter_kit"
	resistance_flags = FLAMMABLE
	cold_protection = CHEST | GROIN | LEGS | ARMS

/obj/item/clothing/suit/armored/f13/light/mutantkit
	name = "oversized armor kit"
	desc = "Bits of armor fitted to a giant harness. Clearly not made for use by humans."
	icon_state = "mutie_armorkit"
	item_state = "mutie_armorkit"
	heat_protection = CHEST | GROIN | LEGS| ARMS | HEAD
	siemens_coefficient = 1.1

// GMB

/obj/item/clothing/suit/armored/f13/light/gmb
	name = "militia volunteer coat"
	desc = "A militia coat, intended for volunteers and handouts. Appears to be some manner of leather. Tough, but not rigid. <br>\
	While it has been fitted with the militia's patch, it hasn't been otherwise modified."
	icon = 'icons/fallout/clothing/bl_mountain.dmi'
	icon_state = "gmbrowncoat"
	item_state = "gmbrowncoath"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 5, "bullet" = 5, "laser" = 5, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/suit/armored/f13/light/gmb/militia
	name = "militia overcoat"
	desc = "A handmade coat. It has been fitted with the militia's patch, and has ballistic weave sewn in."
	icon_state = "gmgreencoat"
	item_state = "gmgreencoath"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 5, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/suit/armored/f13/light/gmb/practitioner
	name = "practitioner coat"
	desc = "A handmade coat, intended for the practitioner. Intended to remain out of the way, while keeping one's cloathing safe from spills. <br>\
	It has been fitted with the militia's patch."
	icon_state = "leathercoat"
	item_state = "gmbrowncoath"
	armor = list("melee" = 5, "bullet" = 5, "laser" = 5, "energy" = 0, "bomb" = 0, "bio" = 15, "rad" = 60, "fire" = 60, "acid" = 80)

/obj/item/clothing/suit/armored/f13/light/gmb/walker
	name = "walker plated overcoat"
	desc = "A handmade overcoat, fitted with plating and sewn in ballistic weave. It has been fitted with the militia's patch."
	icon_state = "gmbrowncoatplated"
	item_state = "gmbrowncoatplatedh"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 15, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/suit/armored/f13/light/gmb/commander
	name = "commander plated overcoat"
	desc = "A handmade overcoat, fitted with plating and sewn in ballistic weave. It has been fitted with the militia's patch."
	icon_state = "gmbrowncoatplated"
	item_state = "gmbrowncoatplatedh"
	armor = list("melee" = 45, "bullet" = 45, "laser" = 15, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)
