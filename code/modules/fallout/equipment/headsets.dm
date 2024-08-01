//FALLOUT
/obj/item/radio/headset/headset_overseer
	name = "\proper the overseer's radio headset"
	desc = "This is used by the vault overseer.\nChannels are as follows: :v - vault, :c - command, :s - security, :e - engineering, :m - medical, :n - science."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_overseer
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE
	factionized = TRUE
	linked_faction = FACTION_VLT

/obj/item/radio/headset/headset_vault
	name = "\proper vault radio headset"
	desc = "A vault-tec radio.\nChannels are as follows: :v - vault."
	keyslot = new /obj/item/encryptionkey/headset_vault
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE
	factionized = TRUE
	linked_faction = FACTION_VLT

/obj/item/radio/headset/headset_vault/eng
	keyslot = new /obj/item/encryptionkey/headset_vault_engineer

/obj/item/radio/headset/headset_vault/med
	keyslot = new /obj/item/encryptionkey/headset_vault_medical

/obj/item/radio/headset/headset_vault/sci
	keyslot = new /obj/item/encryptionkey/headset_vault_science

/obj/item/radio/headset/headset_vaultsec
	name = "security radio headset"
	desc = "This is used by your elite security force.\nTo access the security channel, use :s. To access the vault channel, use :v."
	icon_state = "sec_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE
	factionized = TRUE
	linked_faction = FACTION_VLT

/obj/item/radio/headset/headset_vaultsec/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_cent
	name = "\improper Vault-Tec headset"
	desc = "A headset used by the upper echelons of Vault-Tec.\nTo access the Vault-Tec channel, use :v."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_com
	keyslot2 = new /obj/item/encryptionkey/headset_cent

/obj/item/radio/headset/headset_cent/empty
	keyslot = null
	keyslot2 = null

/obj/item/radio/headset/headset_cent/commander
	keyslot = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/headset_cent/alt
	name = "\improper Vault-Tec bowman headset"
	desc = "A headset especially for emergency response personnel. Protects ears from flashbangs.\nTo access the Vault-Tec channel, use :v."
	icon_state = "cent_headset_alt"
	item_state = "cent_headset_alt"
	keyslot = null

// GMB
/obj/item/radio/headset/headset_gmb
	name = "pre-war headset"
	desc = "An old, almost broken headset. You can hear crackling from the ear piece.\nTo access the GMB channel, use :g"
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_gmb
	frequency = FREQ_GMB
	freerange = TRUE
	freqlock = TRUE
	factionized = TRUE
	linked_faction = FACTION_GMB

// DFS
/obj/item/radio/headset/headset_dfs
	name = "pre-war headset"
	desc = "An old, almost broken headset. You can hear crackling from the ear piece.\nTo access the DFS channel, use :d"
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_dfs
	frequency = FREQ_DFS
	freerange = TRUE
	freqlock = TRUE
	factionized = TRUE
	linked_faction = FACTION_DFS

// DFS
/obj/item/radio/headset/headset_town
	name = "pre-war headset"
	desc = "An old, almost broken headset. You can hear crackling from the ear piece.\nTo access the town's private channel, use :h"
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_town
	frequency = FREQ_TWN
	freerange = TRUE
	freqlock = TRUE
	factionized = TRUE
	linked_faction = FACTION_TWN
