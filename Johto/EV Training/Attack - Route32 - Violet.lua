-- Copyright © 2016 Silv3r <silv3r@proshine-bot.com>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Attack EV: Route 32 (near Violet City)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving attack EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Violet City and Route 32.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Violet City" then
			moveToMap("Violet City")
		elseif getMapName() == "Violet City" then
			moveToMap("Route 32")
		elseif getMapName() == "Route 32" then
			moveToGrass()
		end
	else
		if getMapName() == "Route 32" then
			moveToMap("Violet City")
		elseif getMapName() == "Violet City" then
			moveToMap("Pokecenter Violet City")
		elseif getMapName() == "Pokecenter Violet City" then
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
	if getActivePokemonNumber() == 1 and isOpponentEffortValue("Attack") then
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
