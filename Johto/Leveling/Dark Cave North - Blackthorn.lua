-- Copyright © 2016 Silv3r <silv3r@proshine-bot.com>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Dark Cave North (near Blackthorn)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Blackthorn City and Dark Cave North.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Blackthorn" then
			moveToMap("Blackthorn City")
		elseif getMapName() == "Blackthorn City" then
			moveToMap("Route 45")
		elseif getMapName() == "Route 45" then
			moveToMap("Dark Cave North")
		elseif getMapName() == "Dark Cave North" then
			moveNearExit("Route 45")
		end
	else
		if getMapName() == "Dark Cave North" then
			moveToMap("Route 45")
		elseif getMapName() == "Route 45" then
			moveToMap("Blackthorn City")
		elseif getMapName() == "Blackthorn City" then
			moveToMap("Pokecenter Blackthorn")
		elseif getMapName() == "Pokecenter Blackthorn" then
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
