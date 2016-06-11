-- Copyright © 2016 Silv3r <silv3r@openmailbox.org>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Route 2 (near Pewter)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Pewter City and Route 2.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Pewter" then
			moveToMap("Pewter City")
		elseif getMapName() == "Pewter City" then
			moveToMap("Route 2")
		elseif getMapName() == "Route 2" then
			moveToRectangle(7, 10, 21, 15)
		end
	else
		if getMapName() == "Route 2" then
			moveToMap("Pewter City")
		elseif getMapName() == "Pewter City" then
			moveToMap("Pokecenter Pewter")
		elseif getMapName() == "Pokecenter Pewter" then
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
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
