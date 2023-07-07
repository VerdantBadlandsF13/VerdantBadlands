//This is the file that handles donator loadout items.

/datum/gear/donator
	name = "IF YOU SEE THIS, PING A CODER RIGHT NOW!"
	slot = SLOT_IN_BACKPACK
	path = /obj/item/storage/belt/holster/ranger45
	category = LOADOUT_CATEGORY_DONATOR
	ckeywhitelist = list("This entry should never appear with this variable set.") //If it does, then that means somebody fucked up the whitelist system pretty hard
	cost = 0

/////////////////////
///Loadout Boxes///// See kits.dm, use this model for loadouts that have more than one item per character.
/////////////////////
/datum/gear/donator/kits
	slot = SLOT_IN_BACKPACK

/datum/gear/donator/kits/tessa
	name ="Scourge custom whip"
	path = /obj/item/storage/box/large/custom_kit/sadismbox
	ckeywhitelist = list ("abelshift")

/obj/item/storage/box/large/custom_kit/sadismbox/PopulateContents()
	new /obj/item/melee/onehanded/scourge(src)

/datum/gear/donator/kits/abel
	name ="modified jacket"
	path = /obj/item/storage/box/large/custom_kit/ncrcfbox
	ckeywhitelist = list ("abelshift")

/obj/item/storage/box/large/custom_kit/ncrcfbox/PopulateContents()
	new /obj/item/clothing/suit/toggle/labcoat/abeljacket(src)

/datum/gear/donator/kits/abeltwo
	name ="campaign coat"
	path = /obj/item/clothing/suit/armored/f13/ncrarmor/bellacoat
	ckeywhitelist = list ("abelshift")

/obj/item/storage/box/large/custom_kit/campcoatabel/PopulateContents()
	new /obj/item/clothing/suit/toggle/labcoat/abeljacket(src)

/datum/gear/donator/kits/aim
	name = "Baghead's Face"
	path = /obj/item/storage/box/large/custom_kit/aim
	ckeywhitelist = list ("anythingisme")

/obj/item/storage/box/large/custom_kit/aim/PopulateContents()
	new /obj/item/clothing/mask/scarecrow/baghead(src)
	new /obj/item/melee/onehanded/knife/ritualdagger/baghead(src)
	new /obj/item/book/granter/trait/chemistry(src)

/datum/gear/donator/kits/transhumanism
	name = "Half-Synth"
	path = /obj/item/storage/box/large/custom_kit/transhumanism
	ckeywhitelist = list ("alffd")

/obj/item/storage/box/large/custom_kit/transhumanism/PopulateContents()
	var/player = get_mob_by_key("alffd")
	if(!ishuman(player)) //This should never be true, but who knows.
		return
	implant(player, new /obj/item/organ/tongue/robot/gen2synth(src)) //Robotic voice.
	implant(player, new /obj/item/organ/ears/cybernetic(src))
	implant(player, new /obj/item/organ/cyberimp/brain/protogen(src))  //For EMP luls
	implant(player, new /obj/item/organ/lungs/cybernetic/tier2(src))
	implant(player, new /obj/item/organ/liver/cybernetic/upgraded(src))
	implant(player, new /obj/item/organ/heart/cybernetic/upgraded(src))
	implant(player, new /obj/item/organ/cyberimp/arm/toolset(src))
	implant(player, new /obj/item/organ/cyberimp/chest/nutriment/plus(src)) //Simulates current synth hunger mechanics.
	implant(player, new /obj/item/organ/eyes/robotic/shield(src))
	qdel(src)

/obj/item/organ/cyberimp/brain/protogen
	name = "cybernetic brain interface"
	desc = "A prototype MMI implanted into the brain, this one is a third generation device ."

/obj/item/organ/cyberimp/brain/protogen/emp_act(severity)
	. = ..()
	to_chat(owner, "<span class='warning'>Failure in cerebrum interface!</span>")
	owner.uwuslurring += 60
	owner.Jitter(60)

/obj/item/storage/box/large/custom_kit/transhumanism/proc/implant(player, obj/item/organ/I)
	I.Insert(player, drop_if_replaced = FALSE)

/datum/gear/donator/kits/appleplastic
	name = "Slugger's Lootbox"
	path = /obj/item/storage/box/large/custom_kit/appleplastic
	ckeywhitelist = list("ApplePlastic")

/obj/item/storage/box/large/custom_kit/appleplastic/PopulateContents()
	new /obj/item/clothing/gloves/f13/baseball(src)
	new /obj/item/twohanded/baseball/louisville(src)
	new /obj/item/toy/tennis/baseball(src)
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/gun/ballistic/automatic/pistol/n99(src)
	new /obj/item/ammo_box/magazine/m10mm_adv/simple(src)
	new /obj/item/ammo_box/magazine/m10mm_adv/simple(src)

/datum/gear/donator/kits/lurzefromgermany
	name = "Robot Token"
	path = /obj/item/storage/box/large/custom_kit/lurzefromgermany
	ckeywhitelist = list("lurzefromgermany")

/obj/item/storage/box/large/custom_kit/lurzefromgermany/PopulateContents()
	var/player = get_mob_by_key("lurzefromgermany")
	if(!ishuman(player))
		return
	playsound(src.loc, "modular_badlands/code/modules/rp_misc/sound/ambience/unsorted/electr[rand(1,3)].ogg", 50, 0)
	robot_token(player)
	qdel(src)

/obj/item/storage/box/large/custom_kit/lurzefromgermany/proc/robot_token(mob/living/carbon/human/H)
	H.Robotize()
