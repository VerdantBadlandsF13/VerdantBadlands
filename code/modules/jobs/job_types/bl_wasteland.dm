/datum/job/wasteland
	department_flag = WASTELAND

/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	faction = FACTION_WASTELAND
	total_positions = -1
	spawn_positions = -1

	description = "You are the icon of what life after The War is; the lone man blazing the trails of what was once the United States of America. <br>\
	All kinds of people end up on the road as you have, simply picking a direction and moving their feet until they drop dead. <br>\
	Couriers bringing packages and mail from town to town, paid just enough to sure up their supplies for the next trip. <br>\
	Prospectors delving into ruins in search of a big payday. <br>\
	Travellig merchants, doctors, musicians even. <br>\
	A diverse group so commonly reduced to that one simple name: Wastelander. <br>\
	<br>\
	As for where you've ended up? Vermont. Specifically, 'Brattleboro', or, as the locals call it, 'Battleboro'. \
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
	/datum/outfit/loadout/tribal,
	/datum/outfit/loadout/hermit,
	/datum/outfit/loadout/trapper,
	/datum/outfit/loadout/slave)

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
	head = pick(
		/obj/item/clothing/head/f13/stormchaser, \
		/obj/item/clothing/head/f13/headscarf)
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
	desc = "You're the kind of guy that likes to roam around. Or gal. At least, it's the air you give off, genuine or not. \
	With worn boots and sun-kissed skin, no one's ever told you that you're not a well-traveled individual. \
	Whether from far away, going somewhere, or just begun your endless walk into the sunset? You're in Vermont now. \
	With all its pretty sights and dangerous wildlife. Hope you packed enough clean water."
	uniform = /obj/item/clothing/under/f13/merca
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	suit = /obj/item/clothing/suit/armored/f13/light/duster
	backpack_contents = list(/obj/item/gun/ballistic/revolver/revolver38/roundstart=1,
							/obj/item/ammo_box/c38box/improvised=1)

/datum/outfit/loadout/scavenger
	name = "Scavenger"
	desc = "There's pre-war technology in Battleboro. \
	At least it's what that merchant said to you before you packed up your things and decided to make it big in Vermont. \
	However, you quickly noticed a pattern from the words you've gathered on the trail here. \
	Political tension, isolationist town, raiders, Republican expansion party... \
	Plenty said that conflict is brewing, but people will buy what you find. Be it from a ruined vault or a fresh battlefield."
	shoes = /obj/item/clothing/shoes/f13/military/explorer
	r_hand = /obj/item/storage/backpack/duffelbag/scavengers
	l_hand = /obj/item/pickaxe
	belt = /obj/item/storage/belt
	suit_store = /obj/item/gun/ballistic/revolver/single_shotgun
	backpack_contents = list(/obj/item/mining_scanner=1,
							/obj/item/metaldetector=1,
							/obj/item/shovel=1,
							/obj/item/ammo_box/shotgun/improvised=1)

/datum/outfit/loadout/exile
	name = "Exiled Dweller"
	desc = "Rock on dude! You came from Vault Fifty-Eight, the resting place of pre-war America's cultural icons. \
	But what remains there after 200 years were just a bunch of stuck-up wanna-be aristocrats. Really, they were cramping your style... Right? \
	No. In truth, you got kicked out like a mangy dog for being too unpopular. Was it a boot to the ass? \
	Or did the Overseer tell you to fetch some mystical 'water chip' to 'save millions'. Doesn't matter anymore, you are your own (wo)man now.\
	Or you came from a Vault outside of Battleboro and walked all the way out here searching for safety. \
	No one here knows what it was like in your Vault, or the crimes you may have commited. \
	One of which could easily have been the murder of an exiled vault dweller and the theft of all his belongings."
	uniform = /obj/item/clothing/under/f13/exile
	shoes = /obj/item/clothing/shoes/f13/military/leather
	gloves = 	/obj/item/pda/dweller
	id = /obj/item/card/id/fadedvaultid
	backpack_contents = list(/obj/item/card/id/selfassign=1,
		/obj/item/gun/ballistic/automatic/pistol/pistol22/roundstart=1,
		/obj/item/ammo_box/magazine/m22=1)

/datum/outfit/loadout/tribal
	name = "Tribal"
	desc = "There are no tribes left in Vermont. The fledgeling Republic has manifested its destiny all over them. \
	The actual tribes of Vermont now long since assimilated into it's ranks. \
	No, you're not from here. You're one of endless tribal refugees coming from far away. \
	Were you fleeing the destruction of your home? Or were you chased off for taboo behaviour? \
	No one knows here. And that is why you came. The chance at a fresh start, a new life in a land ripe for the picking. \
	Let's just hope the past doesn't repeat itself. At least not in your lifetime."
	l_hand = /obj/item/gun/ballistic/bow/tribal
	uniform = /obj/item/clothing/under/f13/raiderrags
	mask = /obj/item/clothing/mask/facewrap
	shoes = /obj/item/clothing/shoes/f13/rag
	suit_store = /obj/item/twohanded/spear/bonespear
	belt = /obj/item/storage/belt/tribe_quiver
	backpack_contents = list(/obj/item/clothing/accessory/talisman=1,
							/obj/item/warpaint_bowl=1)

/datum/outfit/loadout/hermit
	name = "Hermit"
	desc = "You've had enough. Enough of the cities, of the people, of your boring job. \
	Without warning, on an undescript day, you packed up what you had and hit the road. \
	Could have been days, months, years. But now you found it. Home. Well not quite. \
	It's still lacking a roof... And walls... And everything that would qualify... But you're already imagining it. \
	A quiet life out there in the almost pristine forests of the northeast. \
	Here, no one will come pester you with their elections or their troubles and whatnot. \
	And the best part? You're way outside the range of the tax collectors."
	uniform = /obj/item/clothing/under/f13/raiderrags
	shoes = /obj/item/clothing/shoes/f13/rag
	backpack_contents = list(
		/obj/item/stack/sheet/metal/fifty = 2,
		/obj/item/stack/sheet/mineral/wood/fifty = 2,
		/obj/item/toy/crayon/spraycan = 1,
		/obj/item/gun/ballistic/automatic/zipgun=1,
		/obj/item/ammo_box/magazine/zipgun=1)

/datum/outfit/loadout/trapper
	name = "Trapper"
	desc = "With rifle, knife and iron-jaws, you came here following the herds of radstags that populate the forests of Vermont. \
	While far from easy, trapping and hunting in these parts offer you all you've ever asked: the peaceful sounds of nature and a full belly. \
	You sometimes even manage to sell some hides to the local settlements for some booze and a restock of ammunition. \
	Life out in the wilderness ain't all that bad once you know how to handle it. \
	But when the herds get thin, and the money runs too tight, you know that those bear traps won't discriminate against two-legged prey, and neither will your stomach."
	shoes = /obj/item/clothing/shoes/f13/military/leather
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	suit = /obj/item/clothing/suit/armored/f13/light/tanvest
	suit_store = /obj/item/gun/ballistic/revolver/piperifle
	backpack_contents = list(/obj/item/restraints/legcuffs/beartrap=4,
							/obj/item/ammo_box/a556/improvised=1)

/datum/outfit/loadout/slave
	name = "Escaped Slave"
	desc = "Day 68: I can't believe I've actually made it. \
	When I close my eyes it still feels like a dream. \
	Waited for the night that the guards would be too drunk to hear me, slipped under the chainlink fence, picked up a pickaxe and pretended to be on night shift, and when I reached the bridge, jumped into the river. \
	Then I open my eyes and I realise where I am. Away from them. Free. \
	I may not have much of anything except the clothes on my back, and the broken collar from those nightmares, but if I were to die, at least I'd die on my own terms."
	suit = /obj/item/clothing/suit/f13/slavelabor
	shoes = /obj/item/clothing/shoes/f13/rag
	neck = /obj/item/electropack/shockcollar
