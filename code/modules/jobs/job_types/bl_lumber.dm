// This entire faction is handled by the techno_jacks module, in regards to spawning and a lot of gameplay.
// The 'forbids' and 'enforces' section is a set of directives for when they wake up.

/datum/job/lbj
	department_flag = LBJ
	selection_color = "#6b2f37"
	faction = FACTION_LBJ
	exp_type = EXP_TYPE_LBJ

	access = list(ACCESS_LBJ)
	minimal_access = list(ACCESS_LBJ)

	forbids = "Directives, Strictly Forbidden: <br> \
				- Betrayal: Speaking of the lights. <br> \
				- Dishonour: Allowing outsiders access to the sanctuary. <br> \
				- Cowardice: The facility will bring you back, week after week. You have no reason to fear death."

	enforces = "Directives, Required: <br> \
				- Defence: Protect the sanctuary from outside incursion at all costs. <br> \
				- Trading: Provide lumber, food and other material to those that require it in trade. <br> \
				- Secrecy: You are not to speak of your origin, if you even remember such."

/datum/outfit/job/lbj
	name = "LBJdatums"
	jobtype = /datum/job/lbj
	id = /obj/item/card/id/lbj_raider_tags
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = null
	uniform	= /obj/item/clothing/under/f13/lumberjack/lbj
	shoes = /obj/item/clothing/shoes/f13/military
	r_pocket = /obj/item/flashlight/flare
	l_pocket = /obj/item/radio
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid = 1,
		)

// Foreman
/datum/job/lbj/foreman
	title = "Foreman"
	flag = F13LBJFOREMAN
	total_positions = 1
	spawn_positions = 1
	description = "..."
	supervisors = "Attendant."
	outfit = /datum/outfit/job/lbj
	req_admin_notify = 1
	exp_requirements = 1800

// Lumberjack
/datum/job/lbj/lumber
	title = "Lumberjack"
	flag = F13LBJLUMBERJACK
	total_positions = 4
	spawn_positions = 4
	description = "..."
	supervisors = "Foreman."
	outfit = /datum/outfit/job/lbj
	exp_requirements = 240
	exp_type = EXP_TYPE_FALLOUT
