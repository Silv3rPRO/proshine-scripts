-- Copyright © 2016 Silv3r <silv3r@openmailbox.org>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Route 20 (near Cinnabar)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Cinnabar Island and Route 20.
You need a pokémon with surf.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Cinnabar" then
			moveToMap("Cinnabar Island")
		elseif getMapName() == "Cinnabar Island" then
			moveToMap("Route 20")
		elseif getMapName() == "Route 20" then
			moveToWater()
		end
	else
		if getMapName() == "Route 20" then
			moveToMap("Cinnabar Island")
		elseif getMapName() == "Cinnabar Island" then
			moveToMap("Pokecenter Cinnabar")
		elseif getMapName() == "Pokecenter Cinnabar" then
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
	if getActivePokemonNumber() == 1 then
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
