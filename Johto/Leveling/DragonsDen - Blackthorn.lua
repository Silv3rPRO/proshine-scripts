-- Copyright © 2016 Silv3r <silv3r@proshine-bot.com>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Dragon's Den (near Blackthorn)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Blackthorn City and the Dragon's Den.
You need a pokémon with surf to reach the cave.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Blackthorn" then
			moveToMap("Blackthorn City")
		elseif getMapName() == "Blackthorn City" then
			moveToMap("Dragons Den Entrance")
		elseif getMapName() == "Dragons Den Entrance" then
			moveToMap("Dragons Den")
		elseif getMapName() == "Dragons Den" then
			moveNearExit("Dragons Den Entrance")
		end
	else
		if getMapName() == "Dragons Den" then
			moveToMap("Dragons Den Entrance")
		elseif getMapName() == "Dragons Den Entrance" then
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
