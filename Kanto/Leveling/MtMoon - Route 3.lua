-- Copyright © 2016 Silv3r <silv3r@proshine-bot.com>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Mt. Moon Entrance (near Route 3)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Route 3 and the entrance of the Mt. Moon.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Route 3" then
			moveToMap("Route 3")
		elseif getMapName() == "Route 3" then
			moveToMap("Mt. Moon 1F")
		elseif getMapName() == "Mt. Moon 1F" then
			moveNearExit("Route 3")
		end
	else
		if getMapName() == "Mt. Moon 1F" then
			moveToMap("Route 3")
		elseif getMapName() == "Route 3" then
			moveToMap("Pokecenter Route 3")
		elseif getMapName() == "Pokecenter Route 3" then
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
