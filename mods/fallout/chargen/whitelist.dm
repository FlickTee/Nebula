#define WHITELISTFILE "data/whitelist.txt"

is_species_whitelisted(mob/M, var/species_name)
	var/datum/species/S = get_species_by_key(species_name)
	return is_alien_whitelisted(M, S)

//todo: admin aliens
is_alien_whitelisted(mob/M, var/species)
	if(!M || !species)
		return 0
	if(!config.usealienwhitelist)
		return 1
	if(check_rights(R_ADMIN, 0, M))
		return 1

	if(istype(species,/decl/language))
		var/decl/language/L = species
		if(!(L.flags & (WHITELISTED|RESTRICTED)))
			return 1
		return whitelist_lookup(L.name, M.ckey)

	if(istype(species,/datum/species))
		var/datum/species/S = species
		if(!(S.spawn_flags & (SPECIES_IS_WHITELISTED|SPECIES_IS_RESTRICTED)))
			return 1
		return whitelist_lookup(S.get_root_species_name(M), M.ckey)

	return 0

whitelist_lookup(var/item, var/ckey)
	if(!alien_whitelist)
		return 0

	if(config.usealienwhitelistSQL)
		//SQL Whitelist
		if(!(ckey in alien_whitelist))
			return 0;
		var/list/whitelisted = alien_whitelist[ckey]
		if(lowertext(item) in whitelisted)
			return 1
	else
		//Config File Whitelist
		for(var/s in alien_whitelist)
			if(findtext(s,"[ckey] - [item]"))
				return 1
			if(findtext(s,"[ckey] - All"))
				return 1
	return 0

#undef WHITELISTFILE
