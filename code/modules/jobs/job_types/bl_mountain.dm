/datum/job/gmb
	department_flag = GMB
	selection_color = "#556b2f"
	faction = FACTION_GMB
	exp_type = EXP_TYPE_GMB

	access = list(ACCESS_GMB)
	minimal_access = list(ACCESS_GMB)

	forbids = "The Green Mountain Boys forbid: <br> \
				- Marauding of any kind, unless it is a designated enemy stronghold. <br> \
				- Slavery of any kind. <br> \
				- Extortion. <br> \
				- Kidnapping anyone but persons of interest."

	enforces = "The Green Mountain Boys expect: <br> \
				- Maintain relative peace and order within the outpost's area. <br> \
				- Protect the citizenry to the best of your ability. <br> \
				- Ensure a consistent food supply for your militia company and citizens. <br> \
				- Make contact and build rapport with existing powers in the area."

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/gmb,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/dfs,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/gmb,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/gmb,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/gmb,
			/datum/job/wasteland/f13tavernkeep,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/gmb,
			/datum/job/wasteland/f13tavernkeep,
		),
	)

/datum/outfit/job/gmb
	name = "GMBdatums"
	jobtype = /datum/job/gmb
	id = /obj/item/card/id/gmb_keys
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = /obj/item/radio/headset/headset_gmb
	uniform = /obj/item/clothing/under/f13/gmb
	head = /obj/item/clothing/head/gmb
	suit = /obj/item/clothing/suit/armored/f13/light/gmb
	gloves = /obj/item/clothing/gloves/gmb
	shoes = /obj/item/clothing/shoes/f13/military/gmb
	r_pocket = /obj/item/flashlight/flare

// Commander
/datum/job/gmb/commander
	title = "Commander"
	flag = F13GMBCOMMANDER
	total_positions = 1
	spawn_positions = 1
	description = "The head of the Brattleboro GMB group. All members of the Brattleboro GMB answer directly to them."
	supervisors = "Morals."
	outfit = /datum/outfit/job/gmb/commander
	req_admin_notify = 1
	exp_requirements = 960
	access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)
	minimal_access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)

	loadout_options = list(
	/datum/outfit/loadout/commander/liberty,
	/datum/outfit/loadout/commander/death)

/datum/outfit/job/gmb/commander
	name = "Commander"
	jobtype = /datum/job/gmb/commander
	suit = /obj/item/clothing/suit/armored/f13/light/gmb/commander
	uniform = /obj/item/clothing/under/f13/gmb/officer
	id = /obj/item/card/id/gmb_commander_keys

/datum/outfit/loadout/commander/liberty
	name = "Liberty"
	r_hand = /obj/item/gun/ballistic/rifle/mag/antimateriel/gmb_irons
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet)

/datum/outfit/loadout/commander/death
	name = "Death"
	r_hand = /obj/item/gun/ballistic/bow/crossbow/gmb
	l_hand = /obj/item/storage/belt/bolt_quiver
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet)

/datum/outfit/job/gmb/commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_FAST_PUMP, TRAIT_GENERIC)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/arrow_gmb_bolt)

// Watchman
/datum/job/gmb/practitioner
	title = "Practitioner"
	flag = F13GMBPRACTITIONER
	total_positions = 1
	spawn_positions = 1
	description = "A general purpose surgeon and field doctor of the camp. Rather important."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb/practitioner
	req_admin_notify = 1
	roleplay_exclusive_notify = 1
	exp_requirements = 480
	access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)
	minimal_access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)

/datum/outfit/job/gmb/practitioner
	name = "Practitioner"
	jobtype = /datum/job/gmb/practitioner
	suit = /obj/item/clothing/suit/armored/f13/light/gmb/practitioner
	uniform = /obj/item/clothing/under/f13/gmb/officer
	id = /obj/item/card/id/gmb_commander_keys

/datum/outfit/job/gmb/practitioner/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, TRAIT_GENERIC)

// Walker
/datum/job/gmb/walker
	title = "Walker"
	flag = F13GMBWALKER
	total_positions = 2
	spawn_positions = 2
	description = "A veteran militia member tasked with diplomacy, relations, retrieval and scouting as well as leading patrols. \
	Answers only to the Commander and in the absence of a Commander is the leading authority."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb/walker
	exp_requirements = 240
	access = list(ACCESS_GMB, ACCESS_GMB_MOTORPOOL)
	minimal_access = list(ACCESS_GMB, ACCESS_GMB_MOTORPOOL)

	loadout_options = list(
	/datum/outfit/loadout/walker/marksmen,
	/datum/outfit/loadout/walker/heavy)

/datum/outfit/job/gmb/walker
	name = "Walker"
	jobtype = /datum/job/gmb/walker
	suit = /obj/item/clothing/suit/armored/f13/light/gmb/walker
	uniform = /obj/item/clothing/under/f13/gmb/officer
	id = /obj/item/card/id/gmb_commander_keys

/datum/outfit/loadout/walker/marksmen
	name = "Marksmen"
	r_hand = /obj/item/gun/ballistic/rifle/enfield
	l_hand = /obj/item/gun/ballistic/automatic/pistol/beretta/automatic

/datum/outfit/loadout/walker/heavy
	name = "Heavy"
	r_hand = /obj/item/gun/ballistic/automatic/lsw
	l_hand = /obj/item/ammo_box/magazine/m556/rifle

// Militia
/datum/job/gmb/militia
	title = "Militia"
	flag = F13GMBMILITIA
	total_positions = 4
	spawn_positions = 4
	description = "A more well trained Volunteer. The main working force of the GMB."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb/militia
	exp_requirements = 120

	loadout_options = list(
	/datum/outfit/loadout/militia/hunter,
	/datum/outfit/loadout/militia/musketeer,
	/datum/outfit/loadout/militia/rifleman)

/datum/outfit/job/gmb/militia
	name = "Militia"
	jobtype = /datum/job/gmb/militia
	suit = /obj/item/clothing/suit/armored/f13/light/gmb/militia

/datum/outfit/loadout/militia/rifleman
	name = "Rifleman"
	r_hand = /obj/item/gun/ballistic/automatic/assault_rifle
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet)

/datum/outfit/loadout/militia/hunter
	name = "Hunter"
	r_hand = /obj/item/gun/ballistic/rifle/repeater/cowboy
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet)

/datum/outfit/loadout/militia/musketeer
	name = "Musketeer"
	l_hand = /obj/item/gun/ballistic/rifle/hobo/lasmusket
	r_hand = /obj/item/ammo_box/lasmusket
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet)

// Volunteer
/datum/job/gmb/volunteer
	title = "Volunteer"
	flag = F13GMBVOLUNTEER
	total_positions = -1
	spawn_positions = -1
	description = "You're essentially just a wastelander with a uniform and a gun."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb/volunteer
	exp_requirements = 60
	exp_type = EXP_TYPE_WASTELAND
	loadout_options = list(
	/datum/outfit/loadout/volunteer/conscript,
	/datum/outfit/loadout/volunteer/watchmen)

/datum/outfit/job/gmb/volunteer
	name = "Volunteer"
	uniform = /obj/item/clothing/under/f13/gmb/farmhand
	shoes = /obj/item/clothing/shoes/f13/military/gmb/leather
	head = /obj/item/clothing/head/gmb/brimmed
	jobtype = /datum/job/gmb/volunteer

/datum/outfit/loadout/volunteer/conscript
	name = "Conscript"
	r_hand = /obj/item/gun/ballistic/revolver/piperifle // YOU'RE A CONSCRIPT. BE HAPPY YOU EVEN GET A GUN.
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet)

/datum/outfit/loadout/volunteer/watchmen
	name = "Watchmen"
	r_hand = /obj/item/gun/ballistic/revolver/piperifle // YOU'RE A CONSCRIPT. BE HAPPY YOU EVEN GET A GUN.
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet)
