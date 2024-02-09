///////////////
// WASTELAND //
///////////////

// Kevlar
/obj/item/clothing/suit/armored/f13/medium/vestarmor
	name = "armored vest"
	desc = "Large bulletproof vest with ballistic plates."
	icon_state = "vest_armor"
	item_state = "vest_armor"
	body_parts_covered = CHEST|GROIN
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/outlander
	name = "outlander's cloak"
	desc = "An incredibly heavy cloak, backed by kevlar weave, pouches and an old combat vest."
	icon_state = "cloak_armored"
	item_state = "cloak_armored"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets
	body_parts_covered = CHEST
	armor = list("tier" = 4, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/vestarmor/finlay
	name = "ancient pattern riot overcoat"
	desc = "A customized and well-worn suit of pre-war riot gear, including overcoat. Reeks of whiskey or some other drinker's favourite. <br>\
	It bears the markings of an unknown group. Odd."
	icon_state = "finlayranger"
	item_state = "finlayranger"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

// Plated medium armor
/obj/item/clothing/suit/armored/f13/medium/scrapchest
	name = "metal chestplate"
	desc = "A well put together chestplate."
	icon_state = "metal_chestplate"
	item_state = "metal_chestplate"
	siemens_coefficient = 1.3
	body_parts_covered = CHEST
	armor = list("tier" = 3, "energy" = 15, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/scrapchest/reinforced
	name = "reinforced metal chestplate"
	desc = "A well put together chestplate, with extra bits of metal top of the first layer. Heavy."
	icon_state = "metal_chestplate2"
	item_state = "metal_chestplate2"
	slowdown = 0.25
	body_parts_covered = CHEST|ARM_LEFT
	armor = list("tier" = 4, "energy" = 25, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/steelbib
	name = "steel breastplate"
	desc = "a steel breastplate inspired by a pre-war design. It provides some protection against impacts, cuts, and medium-velocity bullets. \
	Its pressed steel construction feels heavy."
	icon_state = "steel_bib"
	item_state = "steel_bib"
	slowdown = 0.3
	body_parts_covered = CHEST|GROIN
	armor = list("tier" = 4, "energy" = 5, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

// Combat armor
/obj/item/clothing/suit/armored/f13/medium/combat
	name = "combat armor"
	desc = "Military grade pre-war combat armor."
	icon_state = "combat_armor"
	item_state = "combat_armor"
	slowdown = 0.3
	body_parts_covered = CHEST|GROIN|LEGS
	armor = list("tier" = 5, "energy" = 5, "bomb" = 60, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/combat/mk2
	name = "reinforced combat armor"
	desc = "A reinforced set of bracers, greaves, and torso plating of prewar design. This one is kitted with additional plates."
	icon_state = "combat_armor_mk2"
	item_state = "combat_armor_mk2"
	slowdown = 0.35
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("tier" = 6, "energy" = 5, "bomb" = 60, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/combat/mk2/raider
	name = "painspike combat armor"
	desc = "Take one set of combat armor, add a classic suit of painspike armor, forget hugging your friends ever again."
	icon_state = "combat_painspike"
	item_state = "combat_painspike"
	body_parts_covered = CHEST|GROIN|LEGS|ARM_LEFT

/obj/item/clothing/suit/armored/f13/medium/combat/duster
	name = "combat duster"
	desc = "Refurbished combat armor under a weathered duster. Simple metal plates replace the ceramic plates that has gotten damaged."
	icon_state = "combatduster"
	item_state = "combatduster"
	permeability_coefficient = 0.9
	heat_protection = CHEST | GROIN | LEGS
	cold_protection = CHEST | GROIN | LEGS
	slowdown = 0.25
	body_parts_covered = CHEST|GROIN|LEG_RIGHT|ARMS
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/combat/brokencombat
	name = "broken combat armor chestpiece"
	desc = "It's barely holding together, but the plates might still work, you hope."
	icon_state = "combat_chestpiece"
	item_state = "combat_chestpiece"
	body_parts_covered = CHEST
	armor = list("tier" = 4, "energy" = 5, "bomb" = 45, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/combat/scrapcombat
	name = "scrap combat armor"
	desc = "Scavenged military combat armor, repaired by unskilled hands many times, most of the original plating having cracked or crumbled to dust."
	icon_state = "raider_combat"
	item_state = "raider_combat"
	slowdown = 0.25
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("tier" = 3, "energy" = 5, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/combat/rusted
	name = "rusted combat armor"
	desc = "Weathered set of combat armor, it has clearly seen use for a long time by various previous owners, judging by the patched holes. The composite plates are a little cracked but it should still work. Probably."
	icon_state = "combat_rusted"
	item_state = "combat_rusted"
	slowdown = 0.25
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("tier" = 4, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

////////////
// OUTLAW //
////////////

// All raider suits get a small speed boost, in comparison to the others, given their weaker nature.
/obj/item/clothing/suit/armored/f13/medium/supafly
	name = "supa-fly raider armor"
	desc = "Fabulous mutant powers were revealed to me the day I held aloft my bumper sword and said...<br>BY THE POWER OF NUKA-COLA, I AM RAIDER MAN!"
	icon_state = "supafly"
	item_state = "supafly"
	body_parts_covered = CHEST|GROIN|LEGS|ARM_RIGHT
	slowdown = 0.15
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/rebel
	name = "rebel raider armor"
	desc = "Rebel, rebel. Your face is a mess."
	icon_state = "raider_rebel_icon"
	item_state = "raider_rebel_armor"
	body_parts_covered = CHEST|GROIN|LEGS|ARM_LEFT
	slowdown = 0.15
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/sadist
	name = "sadist raider armor"
	desc = "A bunch of metal chaps adorned with severed hands at the waist with a leather plate worn on the left shoulder. Very intimidating."
	icon_state = "sadist"
	item_state = "sadist"
	body_parts_covered = GROIN|LEGS|ARM_LEFT
	slowdown = 0.15
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/blastmaster
	name = "blastmaster raider armor"
	desc = "A suit composed largely of blast plating, though there's so many holes it's hard to say if it will protect against much."
	icon_state = "blastmaster"
	item_state = "blastmaster"
	flash_protect = 2
	body_parts_covered = GROIN|LEGS|ARM_LEFT|HAND_RIGHT
	slowdown = 0.15
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/yankee
	name = "yankee raider armor"
	desc = "A set of armor made from bulky plastic and rubber. A faded sports team logo is printed in various places. Go Desert Rats!"
	icon_state = "yankee"
	item_state = "yankee"
	body_parts_covered = CHEST|LEGS|ARMS
	slowdown = 0.15
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/painspike
	name = "painspike raider armor"
	desc = "A particularly unhuggable armor, even by raider standards. Extremely spiky."
	icon_state = "painspike"
	item_state = "painspike"
	body_parts_covered = CHEST|GROIN|LEGS|ARM_LEFT
	slowdown = 0.15
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/iconoclast
	name = "iconoclast raider armor"
	desc = "A rigid armor set that appears to be fashioned from a radiation suit, or a mining suit."
	icon_state = "iconoclast"
	item_state = "iconoclast"
	permeability_coefficient = 0.8
	slowdown = 0.15
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/armoredcoat
	name = "armored battlecoat"
	desc = "A heavy padded leather coat with faded colors, worn over a armor vest."
	icon_state = "battlecoat_tan"
	item_state = "battlecoat_tan"
	body_parts_covered = CHEST|LEGS|ARMS
	slowdown = 0.15
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/duster_renegade
	name = "renegade duster"
	desc = "Metal armor worn under a stylish duster. For the bad boy who wants to look good while commiting murder."
	icon_state = "duster_renegade"
	item_state = "duster_renegade"
	body_parts_covered = CHEST|GROIN|LEG_LEFT|ARMS
	slowdown = 0.15
	armor = list("tier" = 3, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/armored/f13/medium/duster_renegade/tavern
	name = "duster"
	desc = "Metal armor worn under a stylish duster. Once found in a far more savage time, it's been repurposed now protecting the frail and ill. Or not."
	armor = list("tier" = 3, "energy" = 15, "bomb" = 45, "bio" = 45, "rad" = 45, "fire" = 45, "acid" = 45)
