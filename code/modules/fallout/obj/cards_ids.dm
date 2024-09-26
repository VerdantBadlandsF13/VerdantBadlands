////////Dogtag types/////////
//All one subtype for making item path pretty/easily telling what ID cards are dogtags, for gravemarkers

/*
VAULT STUFF BELOW
*/

/obj/item/card/id/vaultiecard
	name = "Vault Citizenship"
	desc = "Proof of citizenship to a vault."
	icon_state = "id"
	item_state = "card-doctor"
	assignment = "citizenship"
	uses_overlays = FALSE

/obj/item/card/id/dendoctor
	name = "doctor's name badge"
	desc = "A plastic-sealed name badge certifying the medical expertise of its holder."
	icon_state = "doctor"
	item_state = "card-doctor"
	assignment = "name badge"
	uses_overlays = FALSE

/obj/item/card/id/chief
	name = "crimson identification card"
	desc = "A red card which shows dedication and leadership to Vault safety and security."
	icon_state = "chief"
	item_state = "sec_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	uses_overlays = FALSE

/obj/item/card/id/sec
	name = "red identification card"
	desc = "A keycard which shows placement within the Security department."
	icon_state = "sec"
	item_state = "sec_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	uses_overlays = FALSE

/obj/item/card/id/vfe
	name = "identification card"
	desc = "A keycard that shows your place in the Vault's hierarchy."
	icon_state = "id"
	item_state = "card-doctor"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	uses_overlays = FALSE

/obj/item/card/id/selfassign
	name = "identification card"
	icon_state = "budgetcard"
	item_state = "silver_id"
	desc = "An old, almost illegible card that can easily be written over with anything. Perhaps some devices might recognise it?"
	uses_overlays = FALSE

/obj/item/card/id/selfassign/attack_self(mob/user)
	if(isliving(user))
		var/mob/living/living_user = user
		if(alert(user, "Action", "Pre-War Identification Card", "Show", "Modify") == "Modify")
			registered_name = living_user.real_name
			assignment = living_user.job
			update_label()
			to_chat(user, "<span class='notice'>You modify the ID card.</span>")
			return
	..()

/obj/item/card/id/fadedvaultid
	name = "faded id card"
	desc = "A faded and worn Vault-Tech issued ID card. Broken beyond use, it's instead kept as a reminder to something."
	icon_state = "fadedvaultid"
	item_state = "fadedvaultid"
	uses_overlays = FALSE

/*
OTHER BELOW
*/

/obj/item/card/id/MDfakepermit
	name = "faded medical license"
	desc = "a revoked medical license. This is why we do not remove people's skeletons "
	access = list()
	uses_overlays = FALSE

/obj/item/card/id/brand
	name = "slave brand"
	desc = "A brand for identifying slaves."
	icon_state = "skin"
	item_state = "slave"
	assignment = "slave brand"
	uses_overlays = FALSE

/obj/item/card/id/brand/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

/obj/item/card/id/brokenholodog
	name = "broken holotag"
	desc = "A would-be advanced holographic dogtag, if it was working. Kept as a reminder to something."
	icon_state = "brokenholodog"
	item_state = "brokenholodog"
	uses_overlays = FALSE

// DFS
/obj/item/card/id/dfs_raider_tags
	name = "frail rusted keychain"
	desc = "A set of keys, each marked with odd pins. They feel like they could fall apart."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_DFS)

/obj/item/card/id/dfs_boss_raider_tags
	name = "hardened rusted keychain"
	desc = "A set of keys, each marked with odd pins. They feel sturdy."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_DFS, ACCESS_DFS_BOSS)

// GMB
/obj/item/card/id/gmb_keys
	name = "frail rusted keychain"
	desc = "A set of keys, each marked with odd pins. They feel like they could fall apart."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_GMB)

/obj/item/card/id/gmb_commander_keys
	name = "hardened rusted keychain"
	desc = "A set of keys, each marked with odd pins. They feel sturdy."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_GMB, ACCESS_GMB_BOSS, ACCESS_GMB_MOTORPOOL)

// LBJ
/obj/item/card/id/lbj_raider_tags
	name = "frail rusted keychain"
	desc = "A set of keys, each marked with odd pins. They feel like they could fall apart."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_LBJ)

// Town
/obj/item/card/id/hilltop_keys
	name = "frail keychain"
	desc = "A set of keys, each marked with odd pins. They feel like they could fall apart."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_TOWN)

/obj/item/card/id/hilltop_leadership_keys
	name = "hardened rusted keychain"
	desc = "A set of keys, each marked with odd pins. They feel sturdy."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_TOWN, ACCESS_TWN_RESTRICT)

/obj/item/card/id/tavern_keys
	name = "frail keychain"
	desc = "A set of keys, each marked with odd pins. They feel like they could fall apart."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_TOWN, ACCESS_TOWN_BAR, ACCESS_TWN_PRIVATE)

/obj/item/card/id/spare_tavern_keys
	name = "staff tavern key"
	desc = "Intended to open a number of doors in the tavern. Nothing more. Nothing less."
	icon_state = "key"
	item_state = "key"
	assignment = "old key"
	uses_overlays = FALSE
	access = list(ACCESS_TWN_PRIVATE)
