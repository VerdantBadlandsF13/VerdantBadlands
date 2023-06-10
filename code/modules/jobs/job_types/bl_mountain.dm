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

/datum/outfit/job/gmb
	name = "GMBdatums"
	jobtype = /datum/job/gmb
	id = /obj/item/card/id/gmb_keys
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = null
	uniform	= /obj/item/clothing/under/f13/gmb
	shoes = /obj/item/clothing/shoes/f13/military
	r_pocket = /obj/item/flashlight/flare
	l_pocket = /obj/item/radio

/datum/outfit/job/gmb/commander
	name = "GMB Commander"
	jobtype = /datum/job/gmb/commander
	id = /obj/item/card/id/gmb_commander_keys

/datum/outfit/job/gmb/watchman
	name = "GMB Watchman"
	jobtype = /datum/job/gmb/watchman
	id = /obj/item/card/id/gmb_commander_keys

/datum/outfit/job/gmb/walker
	name = "GMB Walker"
	jobtype = /datum/job/gmb/walker
	id = /obj/item/card/id/gmb_commander_keys

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

// Watchman
/datum/job/gmb/watchman
	title = "Watchman"
	flag = F13GMBWATCHMAN
	total_positions = 1
	spawn_positions = 1
	description = "Like the Militia, but watches over the camp and its general surroundings as well as handling any disputes between both civilians and GMB members."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb/watchman
	req_admin_notify = 1
	exp_requirements = 480
	access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)
	minimal_access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)

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

// Militia
/datum/job/gmb/militia
	title = "Militia"
	flag = F13GMBMILITIA
	total_positions = 4
	spawn_positions = 4
	description = "A more well trained Volunteer. The main working force of the GMB."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb
	exp_requirements = 120

// Volunteer
/datum/job/gmb/volunteer
	title = "Volunteer"
	flag = F13GMBVOLUNTEER
	total_positions = -1
	spawn_positions = -1
	description = "You're essentially just a wastelander with a uniform and a gun."
	supervisors = "Commander."
	outfit = /datum/outfit/job/gmb
	exp_requirements = 60
	exp_type = EXP_TYPE_WASTELAND
