/datum/controller/subsystem/mapping
	var/list/map_load_marks = list()

/datum/controller/subsystem/mapping/preloadTemplates()
	for(var/template in subtypesof(/datum/map_template))
		var/datum/map_template/T = new template
		map_templates[T.id] = T

/datum/map_template/New(var/list/paths = null, var/rename = null)
	if(paths && !islist(paths))
		crash_with("Non-list paths passed into map template constructor.")
	if(paths && !mappaths)
		mappaths = paths
	if(!paths && mappaths)
		paths = mappaths
	if(mappaths)
		preload_size(mappaths)
	if(rename)
		name = rename
	if(!name && id)
		name = id
	if(!id && name)
		id = name

/obj/effect/landmark/map_load_mark/Initialize()
	. = ..()
	LAZYADD(SSmapping.map_load_marks,src)

/obj/effect/landmark/map_load_mark/Destroy()
	. = ..()
	LAZYREMOVE(SSmapping.map_load_marks,src)

/datum/controller/subsystem/misc_late/Initialize()
	GLOB.using_map.build_exoplanets()
	var/decl/asset_cache/asset_cache = decls_repository.get_decl(/decl/asset_cache)
	asset_cache.load()
	GLOB.using_map.load_marks()
	. = ..()

//This is probably a dumb and inefficient way to do this, but whatever, it will be optimized
/datum/map/proc/load_marks()
	var/list/sites = SSmapping.map_load_marks
	report_progress("Mapping: Loading marks")
	if(!LAZYLEN(sites)) //This should never happen unless the map failed to load
		report_progress("Mapping error: No sites")
		return

	if(!LAZYLEN(SSmapping.map_templates))
		report_progress("Mapping error: No templates")
		return

	for(var/M in sites) //Start it up
		var/obj/effect/landmark/map_load_mark/mark = M
		if(!istype(mark))
			report_progress("Mapping error: bad map marker")
			continue

		if(!LAZYLEN(mark.templates))
			report_progress("Mapping error: No templates on mark")
			continue

		var/datum/map_template/template = SSmapping.map_templates[pick(mark.templates)] //Find our actual existing template, it should be pre-loaded if it's in /maps/templates/
		if(istype(template))

			template.load(get_turf(mark),FALSE) //Fire it up. Should use bottom left corner
			LAZYREMOVE(SSmapping.map_load_marks,mark)
			qdel(mark) //Get rid of the mark
			report_progress("Mapping: [template.name] loaded.")
		else
			report_progress("Mapping: Template error [template.name].")