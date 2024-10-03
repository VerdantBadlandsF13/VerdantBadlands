/datum/job/wasteland
	department_flag = WASTELAND

/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	faction = FACTION_WASTELAND
	total_positions = -1
	spawn_positions = -1

	description = "Vermont. Specifically, 'Brattleboro', or, as the locals call it, 'Battleboro'. \
	Unless you're from the Republic, in which case it's the 'Battleboro Contested Zone'. A hellscape. <br>\
	<br>\
	Those who inhabit this area are among a special breed: <br>\
	- Republican washouts that don't make the cut for the Guard, even as conscripts. Traitors and deserters alike. <br>\
	- The few trying to tame the struggle of day-to-day life. <br>\
	- All the other dregs of life. Raiders, rapists, thieves, etc. <br>\
	<br>\
	You, of all people, would know this very well. Try to get an 'in' with the locals, or carve your own way forward."

	supervisors = "fate"
	selection_color = "#5a5a5a"

	forbids = "Subverting Danger: <br> \
				- Even minor injuries are often lethal without treatment. Assure your stock of supplies don't dry up. <br>\
				- Environmental dangers are abundant in Vermont. Monitor your geiger counter, keep an eye to the ground and make sure RadX is in reach. <br>\
				- Tend to your own. You never know who'll stab you in the back. <br>\
				- When in doubt, listen to your gut."

	enforces = "General Tips: <br> \
				- The higher you are, the less static your radio will both pick up and send. <br> \
				- Track the double 'H'. Hydration and Hunger. <br>\
				- Inspect your equipment regularly. Keep goods meant for patching close; spares even closer.<br>\
				- Your S.P.E.C.I.A.L. score modifies all manner of things. Here's hoping you filled that form out correctly."

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
	/datum/outfit/loadout/scavenger,
	/datum/outfit/loadout/exile,
	/datum/outfit/loadout/tribal)

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

/datum/outfit/loadout/wanderer
	name = "Wanderer"
	desc = "You've been on the road for quite some time, with your trusty sidearm and old pair of boots. \
	Perhaps now is the time for settling down somewhere? Or you could continue on your trek; it's not like you're hurting for choice."
	uniform = /obj/item/clothing/under/f13/merca
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	suit = /obj/item/clothing/suit/armored/f13/light/duster
	suit_store = /obj/item/gun/ballistic/revolver/piperifle
	backpack_contents = list(/obj/item/gun/ballistic/revolver/revolver38/roundstart=1,
							/obj/item/ammo_box/c38box/improvised=1)

/datum/outfit/loadout/scavenger
	name = "Scavenger"
	desc = "Battleboro is yet another in the list of many places you've been to, tearing apart to find its riches. \
	Even after all this time, surely there's something left for an individual like you to unearth. Right?"
	shoes = /obj/item/clothing/shoes/f13/military/explorer
	r_hand = /obj/item/storage/backpack/duffelbag/scavengers
	l_hand = /obj/item/pickaxe
	belt = /obj/item/storage/belt
	backpack_contents = list(/obj/item/mining_scanner=1,
							/obj/item/metaldetector=1,
							/obj/item/shovel=1,
							/obj/item/gun/ballistic/automatic/pistol/pistol22/roundstart=1)

/datum/outfit/loadout/exile
	name = "Exiled Dweller"
	desc = "Vault Fifty-Eight, an economic hub in the area. Your former home. Unless you're a freak from another vault altogether. \
	You've either managed to find or build a shotgun, and whatever the reason for your exile, you've made a pretty decent living out here in the wastes."
	uniform = /obj/item/clothing/under/f13/exile
	shoes = /obj/item/clothing/shoes/f13/military/leather
	gloves = 	/obj/item/pda/dweller
	id = /obj/item/card/id/fadedvaultid
	suit_store = /obj/item/gun/ballistic/revolver/single_shotgun
	backpack_contents = list(/obj/item/card/id/selfassign=1,
							/obj/item/ammo_box/shotgun/improvised=1)

/datum/outfit/loadout/tribal
	name = "Tribal"
	desc = "Vermont itself isn't home to many known tribes, so while you're likely to have come out of state, you've nonetheless found a place here. \
	You're a unique sight, if nothing else. Now, how do you intend to communicate with the locals?"
	l_hand = /obj/item/gun/ballistic/bow/tribal
	uniform = /obj/item/clothing/under/f13/raiderrags
	mask = /obj/item/clothing/mask/facewrap
	shoes = /obj/item/clothing/shoes/f13/rag
	suit_store = /obj/item/twohanded/spear/bonespear
	belt = /obj/item/storage/belt/tribe_quiver
	backpack_contents = list(/obj/item/clothing/accessory/talisman=1,
							/obj/item/warpaint_bowl=1)
