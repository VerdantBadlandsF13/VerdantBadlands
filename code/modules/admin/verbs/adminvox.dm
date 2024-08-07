// Pulled from Yog. Thanks, lads! - Carl
/client/proc/admin_vox()
	set category = "Admin.Round Interaction"
	set name = "Force AI Vox"
	set hidden = 0

	if(!check_rights(R_ADMIN))
		return

	var/message = input(src, "WARNING: This WILL be heard by the entire server.", "Announcement") as text

	if(!message)
		return

	var/voxType = input(src, "Which voice?", "VOX") in list("Male", "Female", "Military")


	var/list/words = splittext(trim(message), " ")//Turns the received text into an array of words
	var/list/incorrect_words = list()//Stores all the words that we can't say, so we can complain about it later

	if(words.len > 30)
		// While normally the length of an array is something you can only read and never write,
		//in DM, len is actually how you manage the size of the array. Editing it to value to like this is actually totally doable.
		words.len = 30

	var/list/voxlist
	if(voxType == "Female") // The if for this is OUTSIDE the for-loop, for optimization.
		//Putting it inside makes it check for it every single damned time it parses a word,
		//Which might be super shitty if someone removes the length limit above at some point.
		voxlist = GLOB.vox_sounds
	else if(voxType == "Male") // If we're doing the yog-ly male AI vox voice
		voxlist = GLOB.vox_sounds_male
	else if(voxType == "Military") // If we're doing the also yog-ly male AI vox voice but from Black Mesa
		voxlist = GLOB.vox_sounds_mil
	else
		to_chat(src,span_notice("Unknown or unsupported vox type. Yell at a coder about this."), confidential=TRUE)
		return

	for(var/word in words) // For each word
		word = lowertext(trim(word)) // We store the words as lowercase, so lowercase the word and trim off any weirdness like newlines
		if(!word) // If we accidentally captured a space or something weird like that
			words -= word // Scratch this one off the list
			continue // and skip over it
		if(!voxlist[word])
			incorrect_words += word

	if(incorrect_words.len)
		to_chat(src, span_notice("These words are not available on the announcement system: [english_list(incorrect_words)]."), confidential=TRUE)
		return

	var/pitch = 0
	if(alert("Select a playback speed: ",,"Default","Custom...") == "Custom...")
		pitch = input("Input a custom playback speed (preferably as a number between 0 and 2)","AI Vox Command") as num
		if(isnull(pitch)) pitch = 0

	log_admin("[key_name(src)] made an admin AI vocal announcement with the following message: [message].")
	message_admins("[key_name(src)] made an admin AI vocal announcement with the following message: [message].")
	var/z_level = 2 // Default value should be the station's z-level
	//TODO: Make a define for the station's z-level
	if(src.mob && src.mob.loc) // If the admin has a mob who exists somewhere
		z_level = src.mob.loc.z // Play it on their mob's z-level
	for(var/word in words) // The forloop that actually plays the sounds, hopefully
		play_vox_word(word, z_level, null, voxType, pitch)
