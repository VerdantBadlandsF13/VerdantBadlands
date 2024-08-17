/datum/job/town
	department_flag = TWN
	selection_color = "#6b5f63"
	faction = FACTION_TWN
	exp_type = EXP_TYPE_TWN

	access = list(ACCESS_TOWN)
	minimal_access = list(ACCESS_TOWN)

	forbids = "The town's binding rules: <br> \
				- You're a group of wasters in an organised community.<br> \
				- The Lookout-on-Duty's word is generally law, enforcing the current leadership's wishes. Try to follow it.<br> \
				- Authority is key. They're there to keep you safe, after all."

	enforces = "The town's founding principles: <br> \
				- Tending to your own over others. <br> \
				- Outsiders, while valuable for trade, are likely just as dangerous. <br> \
				- Keeping the little slice of heaven safe."

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/gmb,
			/datum/job/dfs,
			/datum/job/town,
			/datum/job/wasteland/f13wastelander,
		),
	)

/datum/outfit/job/town
	name = "TWNdatums"
	jobtype = /datum/job/dfs
	id = /obj/item/card/id/hilltop_keys
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = /obj/item/radio/headset/headset_town
	r_pocket = /obj/item/flashlight/flare
// Spare radio for general communication.
	backpack_contents = list(
		/obj/item/radio,
		)

/datum/outfit/job/town/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	shoes = pick(
		/obj/item/clothing/shoes/f13/rag, \
		/obj/item/clothing/shoes/f13/military/explorer, \
		/obj/item/clothing/shoes/f13/tan, \
		/obj/item/clothing/shoes/f13/brownie, \
		/obj/item/clothing/shoes/f13/fancy)

/datum/job/town/f13townleader
	title = "Hilltop Leadership"
	flag = F13TWNLEADERSHIP
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	roleplay_exclusive_notify = 1
	description = "Welcome to our little slice of Heaven. \
	So long as you respect our by-laws of course. \
	This is what you, the figurehead of the Hilltop Neighbourhood, say to every newcomer and trader with a charming smile. \
	Our founding fathers established our loving community by following the ancient texts; the Hou-Ah Handing Book, a text so ancient that it's words are untranslatable by most. \
	Thanks to your background however, you can decipher the legalese contained within and use it to secure your only goal: Having a comfortable office and bedroom in the largest house in town."
	supervisors = "fate"

	outfit = /datum/outfit/job/town/f13townleader

	access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)
	minimal_access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)

	loadout_options = list(
	/datum/outfit/loadout/f13townleader/pastor,
	/datum/outfit/loadout/f13townleader/sheriff,
	/datum/outfit/loadout/f13townleader/councilman)

/datum/outfit/job/town/f13townleader
	name = "Hilltop Leader"
	jobtype = /datum/job/town/f13townleader
	id =			/obj/item/card/id/hilltop_leadership_keys
	l_pocket =		/obj/item/storage/bag/money/small/wastelander


/datum/outfit/loadout/f13townleader/pastor
	name = "Pastor"
	desc = "Where there are people, there are souls to save. Hilltop is no exception. \
	As an Evangelist, you came here on a most devout mission: Teach the local hicks about the love of Christ. \
	What ended up happening was your swift ascension to a position of leadership in the town thanks to your moderate level of education and accrued goodwill from the locals. \
	Unlike most other influential men here, you genuinely wish only the best for the settlers."
	uniform = /obj/item/clothing/under/f13/chaplain
	backpack_contents = list(
		/obj/item/book/granter/trait/holy =1,
		/obj/item/storage/book/bible =1,
		)

/datum/outfit/loadout/f13townleader/sheriff
	name = "Sheriff"
	desc = "A very intelligent man from a very far away land in ancient times once said that a state is a human community that successfully claims the monopoly of physical force in a given territory. \
	You took this quote to heart early in your life and decided to become the only legitimate kind of statesman: a Sheriff. \
	Your word is law, the lookouts only ever stop looking out to look up (at you), and your make sure to keep the troublemakers out; be they raiders, mercenaries, or republicans."
	suit = /obj/item/clothing/suit/armored/f13/light/leathermk2
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911/roundstart=1,
		/obj/item/ammo_box/magazine/m45=2,
		/obj/item/restraints/handcuffs/cable/zipties=2,
		)

/datum/outfit/loadout/f13townleader/councilman
	name = "Councilman"
	desc = "You were never actually interested in politics. \
	A string of extremely fortunate events simply fell in your lap while you were working your usual scam artist gig. \
	You found a pre-war book on law. Soon after, you manage to fake your way to be a member on the Hilltop Council. \
	You've got the cleanest suit, the people's respect, a safe home, a big leather chair, and most importantly? A lot of funds to embezzle."
	uniform = /obj/item/clothing/under/suit/turtle/grey
	backpack_contents = list(
		/obj/item/toy/seashell=1,
		)

/datum/job/town/f13lookout
	title = "Hilltop Lookout"
	flag = F13TWNLOOKOUT
	total_positions = 2
	spawn_positions = 2
	description = "Thick walls, friendly neighbours, good drink, and <b>NO WITCHES</b>. This is what makes Hilltop beautiful. And you are what makes it safe. \
	Be it with guns, knives, improvised explosives, or a big lever that says 'gate lock'; you and your colleagues have kept this place safe from the outside. \
	Internal crime is basically unheard of, but you never know... A witch might mind control someone into causing trouble."
	supervisors = "the leadership"

	outfit = /datum/outfit/job/town/f13lookout

	access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)
	minimal_access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)

	loadout_options = list(
	/datum/outfit/loadout/f13lookout/deputy,
	/datum/outfit/loadout/f13lookout/mercenary,
	/datum/outfit/loadout/f13lookout/warrior)

/datum/outfit/job/town/f13lookout
	name = "Lookout"
	jobtype = /datum/job/town/f13lookout
	id =			/obj/item/card/id/hilltop_leadership_keys
	l_pocket =		/obj/item/storage/bag/money/small/wastelander
	backpack_contents = list(
		/obj/item/clothing/accessory/armband=1,
		/obj/item/restraints/handcuffs/cable/zipties=2,
		)

/datum/outfit/loadout/f13lookout/deputy
	name = "Deputy"
	desc = "You love the law. \
	She may be blind, but she is a beautiful mistress and you would sooner lay down your life for her than see her be defiled by some outsider. \
	You keep the gate safe, you walk the beat, and sometimes you beat information out of witches. All in a day's work."
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/hunting=1,
		/obj/item/ammo_box/shotgun/improvised=1,
		)

/datum/outfit/loadout/f13lookout/mercenary
	name = "Mercenary"
	desc = "You love money. \
	Hilltop can't defend itself with just its inbred gang of law enforcers, and so they often resolve that issue by hiring bounty hunters, mercenaries, foreign deserters, or reformed raiders to protect it from the outside. \
	You'd sooner turn tail than die for this place, but this is why you took this job. \
	It pays incredibly well and shooting a 'witch' once in a while isn't really dangerous to you."
	backpack_contents = list(
		/obj/item/gun/ballistic/rifle/hunting=1,
		/obj/item/ammo_box/a762box/improvised=1,
		)

/datum/outfit/loadout/f13lookout/warrior
	name = "Warrior"
	desc = "You love beating up the baddies. A while ago your dimwit self found a gun in the trash. \
	Since then you've started calling yourself a warrior and followed the other Lookouts around and telling them you want to kill the bad guys. \
	In every other situation you'd have been escorted home and forgotten about the gun. \
	But since you never actually asked for a wage, the Lookouts took you in as one of their own."
	backpack_contents = list(
		/obj/item/shield/riot/scrapshield=1,
		/obj/item/melee/onehanded/club=1,
		/obj/item/gun/ballistic/revolver/revolver38=1,
		)

/datum/job/town/f13tavernkeep
	title = "Tavernkeep"
	flag = F13TWNTAVERNKEEP
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	roleplay_exclusive_notify = 1
	description = "You are the proprietor of the local B&B-Tavern-Speakeasy-Pawnshop combo in Hilltop. \
	You love your job, you love your customers, and you love to point your gun at punks who want to start trouble. \
	You sadly can't chase them to far away because of your limp, which you love to tell the story of to your patrons. \
	Said story changes to become even more interesting every hour. <br>\
	Remember that you've a radio to call your contacts, with which you can make under the table purchases."
	supervisors = "fate"

	outfit = /datum/outfit/job/town/f13tavernkeep

	access = list(ACCESS_TOWN, ACCESS_TOWN_BAR)
	minimal_access = list(ACCESS_TOWN, ACCESS_TOWN_BAR)

/datum/outfit/job/town/f13tavernkeep
	name = "Tavernkeep"
	jobtype = /datum/job/town/f13tavernkeep
	suit = /obj/item/clothing/suit/armored/f13/medium/duster_renegade/tavern
	id =			/obj/item/card/id/tavern_keys
	l_pocket =		/obj/item/storage/bag/money/small/wastelander
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/grenadelauncher/pistol=1,
		/obj/item/ammo_casing/a40mmg=3,
		/obj/item/ammo_casing/a40mm=1,
		)

/datum/outfit/job/town/f13tavernkeep/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(!H.gang)
		var/datum/gang/hilltop/HT = GLOB.hilltop
		GLOB.all_gangs |= HT
		H.gang = HT
		HT.add_member(H)
		HT.add_leader(H)
		remove_verb(H,/mob/living/proc/invitegang)
		remove_verb(H,/mob/living/proc/removemember)
		remove_verb(H,/mob/living/proc/transferleader)
		remove_verb(H,/mob/living/proc/setwelcome)
		remove_verb(H,/mob/living/proc/leavegang)

/datum/job/town/f13settler
	title = "Hilltop Inhabitant"
	flag = F13TWNINHABITANT
	total_positions = -1
	spawn_positions = -1
	description = "Brought to Hilltop by fate, you were either born here or came so often that everyone assumed you lived here. \
	The day to day isn't bad, you do whatever job you were taught to do or claimed to be, and finish the day drinking the best moonshine in Vermont at the tavern. \
	Feels good to live in Hilltop."
	supervisors = "the lookouts and leadership"

	outfit = /datum/outfit/job/town/f13settler

	access = list(ACCESS_TOWN)
	minimal_access = list(ACCESS_TOWN)

	loadout_options = list(
	/datum/outfit/loadout/f13settler/moonshiner,
	/datum/outfit/loadout/f13settler/sidewalker,
	/datum/outfit/loadout/f13settler/barber,
	/datum/outfit/loadout/f13settler/handyman,
	/datum/outfit/loadout/f13settler/homeowner)

/datum/outfit/job/town/f13settler
	name = "Hilltop Inhabitant"
	jobtype = /datum/job/town/f13settler
	l_pocket =		/obj/item/storage/bag/money/small/wastelander


/datum/outfit/loadout/f13settler/moonshiner
	name = "Moonshiner"
	desc = "You make the best moonshine in all of Vermont, and those who say otherwise will get to taste your second speciality: the knuckle sandwich. \
	You are without a doubt the main economic drive of the town. \
	All thanks to outsider traders who often take a detour to purchase your brew with the hopes of reselling it all over Battleborough and beyond. \
	No refunds."
	backpack_contents =  list(/obj/item/cultivator/rake=1,
							/obj/item/shovel/spade=1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/storage/bag/plants/portaseeder = 1)

/datum/outfit/job/f13settler/moonshiner/pre_equip(mob/living/carbon/human/H)
	..()
	suit = pick(
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer,
		/obj/item/clothing/suit/f13/slavelabor,
		/obj/item/clothing/suit/f13/vest,
		/obj/item/clothing/suit/f13/cowboygvest,
		/obj/item/clothing/suit/f13/westender,
		/obj/item/clothing/suit/overalls)
	suit_store = pick(
		/obj/item/gun/ballistic/revolver/single_shotgun,
		/obj/item/gun/ballistic/revolver/piperifle)

/datum/outfit/loadout/f13settler/sidewalker
	name = "Sidewalker"
	desc = "While a resident of Hilltop, you don't actually have a house here on accounts of being either too poor or too new for one. \
	This sorry state of events leaves you to take the most disgraceful jobs available around the place or go prospect the many ruins outside of town."
	shoes = /obj/item/clothing/shoes/f13/rag
	backpack_contents =  list(/obj/item/cultivator/rake=1,
							/obj/item/shovel/spade=1)

/datum/outfit/job/f13settler/sidewalker/pre_equip(mob/living/carbon/human/H)
	..()
	suit = pick(
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer,
		/obj/item/clothing/suit/f13/slavelabor,
		/obj/item/clothing/suit/f13/vest,
		/obj/item/clothing/suit/f13/cowboygvest,
		/obj/item/clothing/suit/f13/westender,
		/obj/item/clothing/suit/overalls)
	suit_store = pick(
		/obj/item/gun/ballistic/revolver/single_shotgun,
		/obj/item/gun/ballistic/revolver/piperifle)

/datum/outfit/loadout/f13settler/barber
	name = "Barber"
	desc = "You learned to cut hair and do it with unequalled precision. \
	Sadly due to circumstances only known to you, you had to expand your business practice to surgery and medicine in order to make end's meet. \
	You likely learned to perform surgery by practising on the desperate."
	gloves = /obj/item/clothing/gloves/color/latex
	neck = /obj/item/clothing/neck/stethoscope
	belt = /obj/item/storage/belt/medical
	backpack_contents =  list(/obj/item/smelling_salts=1,
							/obj/item/reagent_containers/glass/bottle/epinephrine=2,
							/obj/item/storage/firstaid/ancient=1,
							/obj/item/razor=1)

/datum/outfit/loadout/f13settler/handyman
	name = "Handyman"
	desc = "Formally you are equal in status to the Homeowners. The only difference is that you are called to fix just about anything and everything in town. \
	Walls, floors, sweeping the streets, squeaky bed, unhinged door. If something is broken, you are ready to get paid to fix it."
	l_hand = /obj/item/storage/toolbox/old
	backpack_contents = list(/obj/item/book/granter/trait/techno=1)

/datum/outfit/loadout/f13settler/homeowner
	name = "Homeowner"
	desc = "You lucked out. You actually own a place to sleep in at night. \
	And this is because you are either really good at what you do, or because you are involved in the local Moonshining business as a farmer."
	backpack_contents = list(
		/obj/item/stack/sheet/metal/fifty = 1,
		/obj/item/stack/sheet/mineral/wood/fifty = 1,
		/obj/item/toy/crayon/spraycan = 1)
