-- Copyright © 2016 Silv3r <silv3r@openmailbox.org>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Attack + Health EV: Ilex Forest (near Azalea)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving attack or health EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Azalea and Ilex Forest.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Azalea" then
			moveToMap("Azalea Town")
		elseif getMapName() == "Azalea Town" then
			moveToMap("Ilex Forest Stop House")
		elseif getMapName() == "Ilex Forest Stop House" then
			moveToMap("Ilex Forest")
		elseif getMapName() == "Ilex Forest" then
			moveNearExit("Ilex Forest Stop House")
		end
	else
		if getMapName() == "Ilex Forest" then
			moveToMap("Ilex Forest Stop House")
		elseif getMapName() == "Ilex Forest Stop House" then
			moveToMap("Azalea Town")
		elseif getMapName() == "Azalea Town" then
			moveToMap("Pokecenter Azalea")
		elseif getMapName() == "Pokecenter Azalea" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() then
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if getActivePokemonNumber() == 1 and
		(isOpponentEffortValue("Attack") or isOpponentEffortValue("Health")) then
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
