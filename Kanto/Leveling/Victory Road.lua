-- Copyright © 2016 Silv3r <silv3r@proshine-bot.com>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Victory Road (near Indigo Plateau)"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between the exit of the Victory Road and the Indigo Plateau.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Indigo Plateau Center" then
			moveToMap("Indigo Plateau")
		elseif getMapName() == "Indigo Plateau" then
			moveToMap("Victory Road Kanto 3F")
		elseif getMapName() == "Victory Road Kanto 3F" then
			moveToRectangle(46, 14, 47, 22)
		end
	else
		if getMapName() == "Victory Road Kanto 3F" then
			moveToMap("Indigo Plateau")
		elseif getMapName() == "Indigo Plateau" then
			moveToMap("Indigo Plateau Center")
		elseif getMapName() == "Indigo Plateau Center" then
			talkToNpcOnCell(4, 22)
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
