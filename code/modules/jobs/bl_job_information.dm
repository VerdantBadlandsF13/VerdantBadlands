/*
This file contains stuff. Things, even.
All related to viewing job specifics easier.
*/

/*
The actual information.
*/
/datum/job/proc/ShowJobStuff(mob/M, rank)
	var/datum/job/job = SSjob.GetJob(rank)

	var/list/dat = list("<center>")

	dat += "<h1>Special Information</h1>"

	dat += "\n<b>- - - - - -</b>"

	if(job)

		dat += "<FONT color='red'><b>[job.forbids]</b>"
		dat += "<FONT color='green'><b>[job.enforces]</b>"

		dat += "\n<b>- - - - - -</b>"

		dat += "<FONT color='blue'><B>[job.description]</b>"

		dat += "\n<b>- - - - - -</b>"

		if(req_admin_notify)
			dat += "<b>You are playing a job that is important for Game Progression. If you have to disconnect immediately, please notify the admins via adminhelp. Otherwise put your locker gear back into the spawn location and head to a matrix.</b>"

			dat += "\n<b>- - - - - -</b>"

		if(roleplay_exclusive_notify)
			dat += "<b>You are playing a job that is important for roleplay. In the event of an offensive raid, you are not permitted to participate in an attack. Please refrain from running dungeons when possible.</b>"

			dat += "\n<b>- - - - - -</b>"

	var/datum/browser/popup = new(M, "mob_occupation", "Special Information", 640, 400) // Set up the popup browser window
	popup.set_content(dat)
	popup.open()

/*
This is the proc used to display the above.
*/
/datum/job/proc/job_help_message(mob/M)
	to_chat(M, "<span class='revenminor'>Your role in the wasteland has additional information attached to it. <a href=?src=[REF(src)];ShowJobStuff=1>(Click Here)</a></span>")

/datum/job/Topic(href, href_list)
	if(href_list["ShowJobStuff"])
		ShowJobStuff(src)
