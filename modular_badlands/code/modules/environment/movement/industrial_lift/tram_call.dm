/obj/machinery/button/tram
	name = "tram caller"
	desc = "A button for calling the tram. It has a speakerbox in it with some internals."
	icon_state = "launcher"
	skin = "launcher"
	device_type = /obj/item/assembly/control/tram
	req_access = list()
	id = 1

/obj/machinery/button/tram/setup_device()
	var/obj/item/assembly/control/tram/tram_device = device
	tram_device.initial_id = id
	. = ..()

/obj/machinery/button/tram/examine(mob/user)
	. = ..()
	. += "<span class='notice'>There's a small inscription on the button...</span>"
	. += "<span class='notice'>THIS CALLS THE TRAM! IT DOES NOT OPERATE IT! The console on the tram tells it where to go!</span>"
