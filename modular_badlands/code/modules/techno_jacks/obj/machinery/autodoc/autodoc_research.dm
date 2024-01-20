
/datum/design/board/autodoc
	name = "Machine Design (Auto-Doc Mark IX)"
	desc = "Allows for the construction of circuit boards used to build a Auto-Doc Mark IX."
	id = "autodoc"
	build_path = /obj/item/circuitboard/machine/autodoc
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL
	category = list ("Medical Machinery")

/obj/item/circuitboard/machine/autodoc
	name = "circuit board (Auto-Doc Mark IX)"
	build_path = /obj/machinery/autodoc
	req_components = list(
							/obj/item/stock_parts/capacitor = 2,
							/obj/item/stock_parts/scanning_module = 1,
							/obj/item/stock_parts/manipulator = 2,
							/obj/item/stock_parts/micro_laser = 2,
							/obj/item/stock_parts/matter_bin = 1,
							/obj/item/stack/sheet/glass = 1)

/datum/techweb_node/autodoc
	id = "autodoc"
	display_name = "Complex Anatomical Automation"
	description = "Advanced automation and complex anatomical knowhow combined to make advanced surgical things!"
	prereq_ids = list("exp_surgery", "bio_process", "adv_datatheory", "adv_engi", "high_efficiency")
	design_ids = list("autodoc")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 15000)
