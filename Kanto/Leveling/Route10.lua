-- Copyright © 2016 Silv3r <silv3r@proshine-bot.com>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Route 10 (near the Pokecenter)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere on Route 10.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Route 10" then
			moveToMap("Route 10")
		elseif getMapName() == "Route 10" then
			moveToRectangle(13, 10, 20,11)
		end
	else
		if getMapName() == "Route 10" then
			moveToMap("Pokecenter Route 10")
		elseif getMapName() == "Pokecenter Route 10" then
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
