-- Copyright © 2016 Silv3r <silv3r@openmailbox.org>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Speed EV: Route 4 (near Cerulean)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving speed EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Cerulean City and Route 4.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Cerulean" then
			moveToMap("Cerulean City")
		elseif getMapName() == "Cerulean City" then
			moveToMap("Route 4")
		elseif getMapName() == "Route 4" then
			moveToRectangle(71, 20, 79, 28)
		end
	else
		if getMapName() == "Route 4" then
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
		return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball")
	end
	if getActivePokemonNumber() == 1 and isOpponentEffortValue("Speed") then
		return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
	end
end
