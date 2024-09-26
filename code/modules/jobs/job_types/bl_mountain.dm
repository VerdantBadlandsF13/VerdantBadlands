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
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/dfs,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/gmb,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/gmb,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/gmb,
			/datum/job/town/f13tavernkeep,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/gmb,
			/datum/job/town/f13tavernkeep,
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
	neck = /obj/item/storage/belt/sabre/heavy/gmb

// Commander
/datum/job/gmb/commander
	title = "Commander"
	flag = F13GMBCOMMANDER
	total_positions = 1
	spawn_positions = 1
	description = "Whether you were groomed for command or rose through the ranks to achieve it, few can criticise the validity of your position. \
	The ideals of the Republic are more than that of a government for you, they are the fundamental ideals of the soil on which you walk, and this makes you into more than a military commander; you are an icon of morality to your subordinates."
	supervisors = "morals"
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
	box = /obj/item/storage/survivalkit_aid_adv

/datum/outfit/loadout/commander/liberty
	name = "Liberty"
	desc = "Luckily or not, you were groomed for Command from a young age. \
	Your family's political ties ensured you a cushy position and you thought nothing more of it. \
	That was until you started getting involved in the politics of the Republic. \
	Freedom is only really guaranteed for those who's families lived in Vermont before the bombs fell. \
	And even then, the closer your ties are to the National Guard survivors, the more important you are. \
	Getting sent to Battleboro wasn't a choice. It was punishment for questioning the Status Quo."
	r_hand = /obj/item/gun/ballistic/rifle/mag/antimateriel/gmb_irons

/datum/outfit/loadout/commander/death
	name = "Death"
	desc = "To die in service of the Republic is the highest honour a man or woman could ever achieve. \
	The names on the memorials are more than fallen comrades or ancestors; they are secular Saints. \
	Their sacrifice should be emulated by all, and their ideals are yours. Freedom and Unity aren't just words to you; they are the meaning of life."
	r_hand = /obj/item/gun/ballistic/bow/crossbow/gmb

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
	description = "Whether you volunteered, were conscripted, or walked in the steps of your ancestors, you were quickly taken out of the training camp and sent made a Practitioner's assistant. \
	You were deemed to have the potential to become a surgeon, and thus received near-academic training to become a Practitioner. \
	While on paper, you are supposed to be the second in command of the local garrison, everyone will quickly know if your family is prestigious or not."
	supervisors = "the Commander"
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
	chemwhiz = TRUE

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
	description = "You can trace your ancestry to the pre-war Vermont National Guard, and when you say your name to the living relics of that age, the pre-war ghouls that were part of the founders of the Vermont Republic, they'll remember who your ancestor was. \
	To you, joining the Green Mountain Boys was more than signing a piece of paper; it was a near-sacred oath."
	supervisors = "the Commander"
	outfit = /datum/outfit/job/gmb/walker
	exp_requirements = 240
	access = list(ACCESS_GMB, ACCESS_GMB_MOTORPOOL)
	minimal_access = list(ACCESS_GMB, ACCESS_GMB_MOTORPOOL)

	loadout_options = list(
	/datum/outfit/loadout/walker/marksmen,
	/datum/outfit/loadout/walker/motorised)

/datum/outfit/job/gmb/walker
	name = "Walker"
	jobtype = /datum/job/gmb/walker
	suit = /obj/item/clothing/suit/armored/f13/light/gmb/walker
	uniform = /obj/item/clothing/under/f13/gmb/officer
	id = /obj/item/card/id/gmb_commander_keys

/datum/outfit/loadout/walker/marksmen
	name = "Watchdog"
	desc = "Not being a Green Mountain Boy is impossible to imagine for you. \
	Not because of how long you've been with them, but because there is a memorial dedicated solely to your family line. \
	You're the descendant of a surviving Vermont National Guardsman, and from your birth to your death, you will live by the Republic's words; Freedom and Unity."
	r_hand = /obj/item/gun/ballistic/rifle/enfield/roundstart
	l_hand = /obj/item/ammo_box/a308

/datum/outfit/loadout/walker/motorised
	name = "Motorised"
	desc = "A century and a half ago, your ancestor fought on the border of the then states of Vermont and New York. \
	But he wasn't a Green Mountain Boy, he was a member of a  nomadic Biker Tribe who's name was forgotten long ago. \
	The peace treaty was simple; the tribe and all of it's descendants will be considered equal to families who founded the Republic. \
	So long as they all serve as it's biker division."
	r_hand = /obj/item/gun/ballistic/automatic/pistol/beretta/automatic/roundstart
	l_hand = /obj/item/ammo_box/magazine/m9mmds
	backpack_contents = list(
		/obj/item/key/motorcycle = 1,
		)

// Militia
/datum/job/gmb/militia
	title = "Militia"
	flag = F13GMBMILITIA
	total_positions = 4
	spawn_positions = 4
	description = "You weren't just born in the Vermont Wasteland. \
	You were born a citizen of the Vermont Republic and since birth was bathed in it's ideology and culture. \
	If you read the names on your local community's memorial, recognize one or two names that belong to your family. \
	There was no obligation for you to join the ranks of the militia, because it was naturally expected of you."
	supervisors = "the Commander"
	outfit = /datum/outfit/job/gmb/militia
	exp_requirements = 120

	loadout_options = list(
	/datum/outfit/loadout/militia/reserve,
	/datum/outfit/loadout/militia/musketeer)

/datum/outfit/job/gmb/militia
	name = "Militia"
	jobtype = /datum/job/gmb/militia
	suit = /obj/item/clothing/suit/armored/f13/light/gmb/militia

/datum/outfit/loadout/militia/reserve
	name = "Reserve"
	desc = "You knew it would come, the mandatory conscription into the Militia. \
	The officer promised you that you'd be in the  logistic or administrative reserve, but you've drawn the short straw. \
	You were sent to the feral edge of the Republic's borders with an old rifle and one week of combat training. \
	Yesterday you received a letter from your family, your mother almost had a heart attack at the news of your deployment to the Battleboro contested zone."
	l_hand = /obj/item/gun/ballistic/rifle/repeater/cowboy/roundstart
	r_hand = /obj/item/ammo_box/tube/a357

/datum/outfit/loadout/militia/musketeer
	name = "Musketeer"
	desc = "You've been a Green Mountain Boy for around a decade now, and Battleboro isn't your first, or last, deployment. \
	You know you're doing the Republic proud, and keep its borders and citizens safe. \
	Yesterday you received a letter from your family, they hope you'll be home for thanksgiving this year."
	l_hand = /obj/item/gun/ballistic/rifle/lasmusket/roundstart
	r_hand = /obj/item/ammo_box/lasmusket

// Volunteer
/datum/job/gmb/volunteer
	title = "Volunteer"
	flag = F13GMBVOLUNTEER
	total_positions = -1
	spawn_positions = -1
	description = "Even if you can't trace your legacy back to the pre-war Vermont National Guard, you volunteered to join the Green Mountain Boys because you believe in fighting for what is right. \
	The wasteland is a cold and unforgiving mistress, and you truly believe that you can make it better."
	supervisors = "the Commander"
	outfit = /datum/outfit/job/gmb/volunteer
	exp_requirements = 60
	exp_type = EXP_TYPE_WASTELAND
	loadout_options = list(
	/datum/outfit/loadout/volunteer/farmhand,
	/datum/outfit/loadout/volunteer/watchmen)

/datum/outfit/job/gmb/volunteer
	name = "Volunteer"
	uniform = /obj/item/clothing/under/f13/gmb/farmhand
	shoes = /obj/item/clothing/shoes/f13/military/gmb/leather
	head = /obj/item/clothing/head/gmb/brimmed
	neck = null// N O
	jobtype = /datum/job/gmb/volunteer

/datum/outfit/loadout/volunteer/farmhand
	name = "Farmhand"
	desc = "All that bullshit about fighting for a brighter future and wanting to be here? You're not part of that. \
	Your family's farm lives under the protection of the Green Mountain Boys, and the tax they owed was you and some of your siblings. \
	You were conscripted to work the fields of an outpost to feed the militiamen. \
	You'll never be paid for this work, and your retirement will be a truck ride back to your family's farm to start the cycle again."
	r_hand = /obj/item/flashlight/flare/torch
	backpack_contents = list(
		/obj/item/storage/bag/plants = 1,
		/obj/item/cultivator = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/shovel/spade = 1,
		)

/datum/outfit/loadout/volunteer/watchmen
	name = "Volunteer Watchmen"
	desc = "You are the seed of hope, the future of Vermont and it's people rests on your shoulders. \
	You volunteered, not for the pay, or housing, or protection, but because you truly believe what the posters say, and hope that one day you'll be folded into the ranks of the proper Militiamen."
	r_hand = /obj/item/gun/ballistic/revolver/piperifle // BE HAPPY YOU EVEN GET A GUN.
	backpack_contents = list(/obj/item/melee/onehanded/knife/bayonet = 1)
