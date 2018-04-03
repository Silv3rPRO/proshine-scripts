-- Copyright © 2016 Silv3r <silv3r@proshine-bot.com>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "SpAttack EV: Route 6, Water (near Vermilion)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving special attack EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Vermilion City and Route 6.
You need a pokémon with surf.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Vermilion" then
			moveToMap("Vermilion City")
		elseif getMapName() == "Vermilion City" then
			moveToMap("Route 6")
		elseif getMapName() == "Route 6" then
			moveToRectangle(15, 35, 30, 41)
		end
	else
		if getMapName() == "Route 6" then
			moveToMap("Vermilion City")
		elseif getMapName() == "Vermilion City" then
			moveToMap("Pokecenter Vermilion")
		elseif getMapName() == "Pokecenter Vermilion" then
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
	if getActivePokemonNumber() == 1 and isOpponentEffortValue("SpAttack") then
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
