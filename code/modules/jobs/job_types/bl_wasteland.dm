/datum/job/wasteland
	department_flag = WASTELAND

/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	faction = FACTION_WASTELAND
	total_positions = -1
	spawn_positions = -1
	description = "Whether you're a veteran pathfinder, or just someone down on their luck? You've the misfortune to be in this horrid place."
	supervisors = "fate"
	selection_color = "#5a5a5a"

	outfit = /datum/outfit/job/wasteland/f13wastelander

	access = list()
	minimal_access = list()

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/town/f13tavernkeep,
		),
	)

	loadout_options = list(
	/datum/outfit/loadout/wanderer,
	/datum/outfit/loadout/prospector,
	/datum/outfit/loadout/exile)

/datum/outfit/job/wasteland/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/wasteland/f13wastelander
	id = null
	ears = null
	l_pocket = /obj/item/storage/bag/money/small/wastelander
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/melee/onehanded/knife/survival
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/radio,
		)

/datum/outfit/job/wasteland/f13wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	suit = pick(
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer,
		/obj/item/clothing/suit/f13/slavelabor,
		/obj/item/clothing/suit/f13/vest,
		/obj/item/clothing/suit/f13/cowboygvest,
		/obj/item/clothing/suit/f13/westender,
		/obj/item/clothing/suit/overalls)
	suit_store = pick(
		/obj/item/gun/ballistic/revolver/single_shotgun,
		/obj/item/gun/ballistic/revolver/piperifle,
		/obj/item/gun/ballistic/automatic/autopipe)
	backpack_contents += pick(
		/obj/item/gun/ballistic/automatic/pistol/pistol22/roundstart,
		/obj/item/gun/ballistic/revolver/revolver38/roundstart)

// Wanderer - Wanderer don't tend to stay in one spot. They generally move along the Wasteland looking for their next paycheck.
/datum/outfit/loadout/wanderer
	name = "Wanderer"
	uniform = /obj/item/clothing/under/f13/merca
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	suit = /obj/item/clothing/suit/armored/f13/light/duster

// Prospector - Prospectors are scavengers. They dig through the ruins of the old world for supplies. Starts with mining equipment.
/datum/outfit/loadout/prospector
	name = "Prospector"
	shoes = /obj/item/clothing/shoes/f13/military
	r_hand = /obj/item/storage/backpack/duffelbag/scavengers
	l_hand = /obj/item/pickaxe/drill
	belt = /obj/item/storage/belt
	backpack_contents = list(/obj/item/mining_scanner=1,
							/obj/item/metaldetector=1,
							/obj/item/shovel=1,
							/obj/item/book/granter/trait/techno=1,
							/obj/item/storage/box/vendingmachine=1)

// Vault Exile - Probably not a great person. They're given what you'd expect of a proper wastrel, with some fluff to boot.
/datum/outfit/loadout/exile
	name = "Exiled Dweller"
	uniform = /obj/item/clothing/under/f13/exile
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = 	/obj/item/pda/dweller
	id = /obj/item/card/id/fadedvaultid
	backpack_contents = list(/obj/item/card/id/selfassign=1)

