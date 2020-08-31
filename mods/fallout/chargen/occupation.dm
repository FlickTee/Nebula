//used for pref.alternate_option
#define JOB_LEVEL_NEVER  4
#define JOB_LEVEL_LOW    3
#define JOB_LEVEL_MEDIUM 2
#define JOB_LEVEL_HIGH   1


/datum/job
	var/is_whitelisted_role = FALSE
	var/hidden_unless_whitelisted = FALSE


/datum/category_item/player_setup_item/occupation/content(mob/user, limit = 16, list/splitJobs, splitLimit = 1)

	if(!SSmapping || !SSjobs.job_lists_by_map_name)
		return

	var/datum/species/S = preference_species()
	. = list()
	. += "<style>.Points,a.Points{background: #cc5555;}</style>"
	. += "<style>a.Points:hover{background: #55cc55;}</style>"
	. += "<tt><center>"
	. += "<font size=3><b>Select and configure your occupation preferences. Unavailable occupations are crossed out.</b></font>"
	. += "<br>"

	// Display everything.
	for(var/D in SSdepartments.departments) //Should return each department ref

		var/datum/department/dept = SSdepartments.departments[D] //find our actual department datum
		var/list/dept_data = SSjobs.positions_by_department[dept.reference] //Build a list of job titles for each dept

		if(!dept_data) //Woops, it's empty
			continue

		if(isnull(pref.hiding_maps[dept.reference]))
			pref.hiding_maps[dept.reference] = TRUE

		. += "<hr><table width = '100%''><tr>"
		. += "<td width = '50%' align = 'right'><font size = 3><b>[capitalize(dept.reference)]</b></td>"
		. += "<td width = '50%' align = 'right''><a href='?src=\ref[src];toggle_map=[dept.reference]'>[pref.hiding_maps[dept.reference] ? "Show" : "Hide"]</a></font></td>"
		. += "</tr></table>"

		if(!pref.hiding_maps[dept.reference])

			. += "<hr/>"
			. += "<table width='100%' cellpadding='1' cellspacing='0'><tr><td width='20%'>" // Table within a table for alignment, also allows you to easily add more columns.
			. += "<table width='100%' cellpadding='1' cellspacing='0'>"

			//The job before the current job.
			var/datum/job/lastJob
			var/index = -1
			if(splitLimit) limit = round((LAZYLEN(dept_data)+1)/2)

			for(var/j in dept_data)
				var/datum/job/job = SSjobs.titles_to_datums[j] //We need to convert titles into actual job datums here to use them
				var/datum/mil_rank/player_rank
				var/datum/mil_branch/player_branch
				var/branch_string = ""
				var/rank_branch_string = ""
				var/branch_rank = job.allowed_branches ? job.get_branch_rank(S) : mil_branches.spawn_branches(S)
				if(GLOB.using_map && (GLOB.using_map.flags & MAP_HAS_BRANCH) && LAZYLEN(branch_rank))
					player_branch = mil_branches.get_branch(pref.branches[job.title])
					if(player_branch)
						if(LAZYLEN(branch_rank) > 1)
							branch_string += "<td width='10%' align='left'><a href='?src=\ref[src];char_branch=1;checking_job=\ref[job]'>[player_branch.name_short || player_branch.name]</a></td>"
						else
							branch_string += "<td width='10%' align='left'>[player_branch.name_short || player_branch.name]</td>"
				if(!branch_string)
					branch_string = "<td>-</td>"
				if(player_branch)
					var/ranks = branch_rank[player_branch.name] || mil_branches.spawn_ranks(player_branch.name, S)
					if(LAZYLEN(ranks))
						player_rank = mil_branches.get_rank(player_branch.name, pref.ranks[job.title])
						if(player_rank)
							if(LAZYLEN(ranks) > 1)
								rank_branch_string += "<td width='10%' align='left'><a href='?src=\ref[src];char_rank=1;checking_job=\ref[job]'>[player_rank.name_short || player_rank.name]</a></td>"
							else
								rank_branch_string += "<td width='10%' align='left'>[player_rank.name_short || player_rank.name]</td>"
				if(!rank_branch_string)
					rank_branch_string = "<td>-</td>"
				rank_branch_string = "[branch_string][rank_branch_string]"

				var/title = job.title
				var/title_link = length(job.alt_titles) ? "<a href='?src=\ref[src];select_alt_title=\ref[job]'>[pref.GetPlayerAltTitle(job)]</a>" : job.title
				if((job.head_position) || (title == "AI"))//Bold head jobs
					title_link = "<b>[title_link]</b>"

				var/help_link = "</td><td width = '10%' align = 'center'><a href='?src=\ref[src];job_info=[title]'>?</a></td>"
				lastJob = job

				var/species_name = S.get_root_species_name()
				var/bad_message = ""
				if(job.total_positions == 0 && job.spawn_positions == 0)
					bad_message = "<b>\[UNAVAILABLE]</b>"
				else if(jobban_isbanned(user, title))
					bad_message = "<b>\[BANNED]</b>"
				else if(job.is_whitelisted_role && !whitelist_lookup(user.ckey,job.title) && !job.hidden_unless_whitelisted)
					bad_message = "<b>\[WHITELISTED]</b>"
				else if(!job.player_old_enough(user.client))
					var/available_in_days = job.available_in_days(user.client)
					bad_message = "\[IN [(available_in_days)] DAYS]"
				else if(LAZYACCESS(job.minimum_character_age, species_name) && user.client && (user.client.prefs.age < job.minimum_character_age[species_name]))
					bad_message = "\[MIN CHAR AGE: [job.minimum_character_age[species_name]]]"
				else if(!job.is_species_allowed(S))
					bad_message = "<b>\[SPECIES RESTRICTED]</b>"
				else if(!S.check_background(job, user.client.prefs))
					bad_message = "<b>\[BACKGROUND RESTRICTED]</b>"
				else
					var/special_block = job.check_special_blockers(user.client.prefs)
					if(special_block)
						bad_message = "<b>\[[uppertext(special_block)]]</b>"

				var/current_level = JOB_LEVEL_NEVER
				if(pref.job_high == job.title)
					current_level = JOB_LEVEL_HIGH
				else if(job.title in pref.job_medium)
					current_level = JOB_LEVEL_MEDIUM
				else if(job.title in pref.job_low)
					current_level = JOB_LEVEL_LOW

				var/skill_link = ""
//				if(pref.points_by_job[job] && (!job.available_by_default || current_level != JOB_LEVEL_NEVER))
//					skill_link = "<a class = 'Points' href='?src=\ref[src];set_skills=[title]'>Set Skills</a>"
//				else
//					skill_link = "<a href='?src=\ref[src];set_skills=[title]'>View Skills</a>"
//				skill_link = "<td>[skill_link]</td>"

				// Begin assembling the actual HTML.
				index += 1
				if((index >= limit) || (job.title in splitJobs))
					if((index < limit) && (lastJob != null))
						//If the cells were broken up by a job in the splitJob list then it will fill in the rest of the cells with
						//the last job's selection color. Creating a rather nice effect.
						for(var/i = 0, i < (limit - index), i += 1)
							. += "<tr bgcolor='[lastJob.selection_color]'><td width='40%' align='right'><a>&nbsp</a></td><td><a>&nbsp</a></td></tr>"
					. += "</table></td><td width='20%'><table width='100%' cellpadding='1' cellspacing='0'>"
					index = 0

				. += "<tr bgcolor='[job.selection_color]'>"
				if(rank_branch_string && rank_branch_string != "")
					. += "[rank_branch_string]"
				. += "<td width='30%' align='left'>"

				if(bad_message)
					. += "<del>[title_link]</del>[help_link][skill_link]<td>[bad_message]</td></tr>"
					continue
				else if((GLOB.using_map.default_assistant_title in pref.job_low) && (title != GLOB.using_map.default_assistant_title))
					. += "<font color=grey>[title_link]</font>[help_link][skill_link]<td></td></tr>"
					continue
				else
					. += "[title_link][help_link][skill_link]"

				. += "<td>"
				if(title == GLOB.using_map.default_assistant_title)//Assistant is special
					var/yes_link = "Yes"
					var/no_link = "No"
					if(title in pref.job_low)
						yes_link = "<font color='#55cc55'>[yes_link]</font>"
						no_link = "<font color='black'>[no_link]</font>"
					else
						yes_link = "<font color='black'>[yes_link]</font>"
						no_link = "<font color='#55cc55'>[no_link]</font>"
					. += "<a href='?src=\ref[src];set_job=[title];set_level=[JOB_LEVEL_LOW]'>[yes_link]</a><a href='?src=\ref[src];set_job=[title];set_level=[JOB_LEVEL_NEVER]'>[no_link]</a>"
				else if(!job.available_by_default)
					. += "<font color = '#cccccc'>Not available at roundstart.</font>"
				else
					var/level_link
					switch(current_level)
						if(JOB_LEVEL_LOW)
							level_link = "<font color='#cc5555'>Low</font>"
						if(JOB_LEVEL_MEDIUM)
							level_link = "<font color='#eecc22'>Medium</font>"
						if(JOB_LEVEL_HIGH)
							level_link = "<font color='#55cc55'>High</font>"
						else
							level_link = "<font color=black>Never</font>"
					. += "<a href='?src=\ref[src];set_job=[title];inc_level=-1'>[level_link]</a>"
				. += "</td></tr>"
			. += "</td></tr></table>"
			. += "</center></table><center>"
	. += "<hr/>"
	switch(pref.alternate_option)
		if(GET_RANDOM_JOB)
			. += "<u><a href='?src=\ref[src];job_alternative=1'>Get random job if preferences unavailable</a></u>"
		if(BE_ASSISTANT)
			. += "<u><a href='?src=\ref[src];job_alternative=1'>Be wastelander if preference unavailable</a></u>"
		if(RETURN_TO_LOBBY)
			. += "<u><a href='?src=\ref[src];job_alternative=1'>Return to lobby if preference unavailable</a></u>"
	. += "<a href='?src=\ref[src];reset_jobs=1'>\[Reset\]</a></center>"
	. += "<hr/>"
	. += "</tt><br>"
	. = jointext(.,null)


/datum/category_item/player_setup_item/occupation/OnTopic(href, href_list, user)
	if(href_list["reset_jobs"])
		ResetJobs()
		return TOPIC_REFRESH

	else if(href_list["toggle_map"])
		var/mapname = href_list["toggle_map"]
		pref.hiding_maps[mapname] = !pref.hiding_maps[mapname]
		return TOPIC_REFRESH

	else if(href_list["job_alternative"])
		if(pref.alternate_option == GET_RANDOM_JOB || pref.alternate_option == BE_ASSISTANT)
			pref.alternate_option += 1
		else if(pref.alternate_option == RETURN_TO_LOBBY)
			pref.alternate_option = 0
		return TOPIC_REFRESH

	else if(href_list["select_alt_title"])
		var/datum/job/job = locate(href_list["select_alt_title"])
		if (job)
			var/choices = list(job.title) + job.alt_titles
			var/choice = input("Choose an title for [job.title].", "Choose Title", pref.GetPlayerAltTitle(job)) as anything in choices|null
			if(choice && CanUseTopic(user))
				SetPlayerAltTitle(job, choice)
				return (pref.equip_preview_mob ? TOPIC_REFRESH_UPDATE_PREVIEW : TOPIC_REFRESH)

	else if(href_list["set_job"])
		var/set_job = href_list["set_job"]
		var/set_to
		if(href_list["set_level"])
			set_to = text2num(href_list["set_level"])
		if(href_list["inc_level"])
			set_to = GetCurrentJobLevel(set_job) + text2num(href_list["inc_level"])
			if(set_to < JOB_LEVEL_HIGH)
				set_to = JOB_LEVEL_NEVER
			else if(set_to > JOB_LEVEL_NEVER)
				set_to = JOB_LEVEL_HIGH
		if(SetJob(user, set_job, set_to))
			return (pref.equip_preview_mob ? TOPIC_REFRESH_UPDATE_PREVIEW : TOPIC_REFRESH)

	else if(href_list["char_branch"])
		var/datum/job/job = locate(href_list["checking_job"])
		if(istype(job))
			var/datum/species/S = preference_species()
			var/list/options = job.allowed_branches ? job.get_branch_rank(S) : mil_branches.spawn_branches(S)
			var/choice = input(user, "Choose your branch of service.", CHARACTER_PREFERENCE_INPUT_TITLE) as null|anything in options
			if(choice && CanUseTopic(user) && mil_branches.is_spawn_branch(choice, S))
				pref.branches[job.title] = choice
				pref.ranks -= job.title
				pref.skills_allocated = pref.sanitize_skills(pref.skills_allocated)		// Check our skillset is still valid
				validate_branch_and_rank()
				return (pref.equip_preview_mob ? TOPIC_REFRESH_UPDATE_PREVIEW : TOPIC_REFRESH)
			return TOPIC_REFRESH

	else if(href_list["char_rank"])
		var/datum/job/job = locate(href_list["checking_job"])
		if(istype(job))
			var/datum/mil_branch/branch = mil_branches.get_branch(pref.branches[job.title])
			var/datum/species/S = preference_species()
			var/list/branch_rank = job.allowed_branches ? job.get_branch_rank(S) : mil_branches.spawn_branches(S)
			var/list/options = branch_rank[branch.name] || mil_branches.spawn_ranks(branch.name, S)
			var/choice = input(user, "Choose your rank.", CHARACTER_PREFERENCE_INPUT_TITLE) as null|anything in options
			if(choice && CanUseTopic(user) && mil_branches.is_spawn_rank(branch.name, choice, preference_species()))
				pref.ranks[job.title] = choice
				pref.skills_allocated = pref.sanitize_skills(pref.skills_allocated)		// Check our skillset is still valid
				validate_branch_and_rank()
				return (pref.equip_preview_mob ? TOPIC_REFRESH_UPDATE_PREVIEW : TOPIC_REFRESH)
			return TOPIC_REFRESH
	else if(href_list["set_skills"])
		var/rank = href_list["set_skills"]
		var/datum/job/job = SSjobs.get_by_title(rank, TRUE)
		if(job)
			open_skill_setup(user, job)

	//From the skills popup

	else if(href_list["hit_skill_button"])
		var/decl/hierarchy/skill/S = locate(href_list["hit_skill_button"])
		var/datum/job/J = locate(href_list["at_job"])
		if(!istype(S) || !istype(J))
			return
		var/value = text2num(href_list["newvalue"])
		update_skill_value(J, S, value)
		pref.ShowChoices(user) //Manual refresh to allow us to focus the panel, not the main window.
		panel.set_content(generate_skill_content(J))
		panel.open()
		winset(user, panel.window_id, "focus=1") //Focuses the panel.

	else if(href_list["skillinfo"])
		var/decl/hierarchy/skill/S = locate(href_list["skillinfo"])
		if(!istype(S))
			return
		var/HTML = list()
		HTML += "<h2>[S.name]</h2>"
		HTML += "[S.desc]<br>"
		var/i
		for(i=1, i <= length(S.levels), i++)
			var/level_name = S.levels[i]
			HTML +=	"<br><b>[level_name]</b>: [S.levels[level_name]]<br>"
		show_browser(user, jointext(HTML, null), "window=\ref[user]skillinfo")

	else if(href_list["job_info"])

		var/rank = href_list["job_info"]
		var/datum/job/job = SSjobs.get_by_title(rank)

		var/dat = list()

		dat += "<p style='background-color: [job.selection_color]'><br><br><p>"
		if(job.alt_titles)
			dat += "<i><b>Alternative titles:</b> [english_list(job.alt_titles)].</i>"
		send_rsc(user, job.get_job_icon(), "job[ckey(rank)].png")
		dat += "<img src=job[ckey(rank)].png width=96 height=96 style='float:left;'>"
		if(LAZYLEN(job.department_refs))
			dat += "<b>Department:</b> [SSdepartments.departments[job.primary_department].title]."
			if(job.head_position)
				dat += "You are in charge of this department."

		dat += "You answer to <b>[job.supervisors]</b> normally."

		if(job.allowed_branches)
			dat += "You can be of following ranks:"
			for(var/T in job.allowed_branches)
				var/datum/mil_branch/B = mil_branches.get_branch_by_type(T)
				dat += "<li>[B.name]: [job.get_ranks(B.name)]"
		dat += "<hr style='clear:left;'>"
		if(config.wikiurl)
			dat += "<a href='?src=\ref[src];job_wiki=[rank]'>Open wiki page in browser</a>"

		var/description = job.get_description_blurb()
		if(description)
			dat += html_encode(description)
		var/datum/browser/popup = new(user, "Job Info", "[capitalize(rank)]", 430, 520, src)
		popup.set_content(jointext(dat,"<br>"))
		popup.open()

	else if(href_list["job_wiki"])
		var/rank = href_list["job_wiki"]
		open_link(user,"[config.wikiurl][rank]")

	return ..()


#undef JOB_LEVEL_NEVER
#undef JOB_LEVEL_LOW
#undef JOB_LEVEL_MEDIUM
#undef JOB_LEVEL_HIGH
