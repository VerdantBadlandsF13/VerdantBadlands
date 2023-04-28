/datum/job/gmb
	department_flag = GMB
	selection_color = "#556b2f"
	faction = FACTION_GMB
	exp_type = EXP_TYPE_GMB

	access = list(ACCESS_GMB)
	minimal_access = list(ACCESS_GMB)
	forbids = "The NCR forbids: Chem and drug use such as jet or alcohol while on duty. Execution of unarmed or otherwise subdued targets without authorisation."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republic's laws. Wearing the uniform."
	objectivesList = list("Leadership recommends the following goal for this week: Establish an outpost at the radio tower","Leadership recommends the following goal for this week: Neutralize and capture dangerous criminals", "Leadership recommends the following goal for this week: Free slaves and establish good relations with unaligned individuals.")

/datum/outfit/job/gmb
	name = "GMBdatums"
	jobtype = /datum/job/gmb
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = null
	uniform	= /obj/item/clothing/under/f13/ncr
	belt = /obj/item/storage/belt/military/assault/ncr
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	l_pocket = /obj/item/book/manual/ncr/jobguide
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid = 1,
		)
