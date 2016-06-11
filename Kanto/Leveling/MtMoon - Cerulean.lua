-- Copyright © 2016 Silv3r <silv3r@openmailbox.org>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Mt. Moon Exit (near Cerulean)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Cerulean and the exit of the Mt. Moon.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Cerulean" then
			moveToMap("Cerulean City")
		elseif getMapName() == "Cerulean City" then
			moveToMap("Route 4")
		elseif getMapName() == "Route 4" then
			moveToMap("Mt. Moon Exit")
		elseif getMapName() == "Mt. Moon Exit" then
			moveToMap("Mt. Moon B1F")
		elseif getMapName() == "Mt. Moon B1F" then
			moveToRectangle(34, 18, 40, 21)
		end
	else
		if getMapName() == "Mt. Moon B1F" then
			moveToMap("Mt. Moon Exit")
		elseif getMapName() == "Mt. Moon Exit" then
			moveToMap("Route 4")
		elseif getMapName() == "Route 4" then
			moveToMap("Cerulean City")
		elseif getMapName() == "Cerulean City" then
			moveToMap("Pokecenter Cerulean")
		elseif getMapName() == "Pokecenter Cerulean" then
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
