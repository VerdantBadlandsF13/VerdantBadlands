//FALLOUT
/obj/item/radio/headset/headset_overseer
	name = "\proper the overseer's radio headset"
	desc = "This is used by the vault overseer.\nChannels are as follows: :v - vault, :c - command, :s - security, :e - engineering, :m - medical, :n - science."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_overseer
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vault
	name = "\proper vault radio headset"
	desc = "A vault-tec radio.\nChannels are as follows: :v - vault."
	keyslot = new /obj/item/encryptionkey/headset_vault
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vaultsec
	name = "security radio headset"
	desc = "This is used by your elite security force.\nTo access the security channel, use :s. To access the vault channel, use :v."
	icon_state = "sec_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vaultsec/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_cent
	name = "\improper Vault-Tec headset"
	desc = "A headset used by the upper echelons of Vault-Tec.\nTo access the Vault-Tec channel, use :y."
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
	desc = "A headset especially for emergency response personnel. Protects ears from flashbangs.\nTo access the Vault-Tec channel, use :y."
	icon_state = "cent_headset_alt"
	item_state = "cent_headset_alt"
	keyslot = null
