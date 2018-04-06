-- Copyright © 2018 Silv3r <silv3r@proshine-bot.com>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Capture: Ditto, Route 8 (near Lavender Town)"
author = "Silv3r"
description = [[Ditto - Route 8 - Lavender Town
This script will try to capture Ditto and shinies.
Click 'Show Options' to display the two options:
- It can optionally train the first Pokémon of your team by attacking the opponents.
- It can also use Hypnosis or Sleep Powder before capturing the opponent.
Start anywhere between Lavender Town and Route 8.]]

setOptionName(1, "Train first Pokemon")
setOptionDescription(1, "Attack the wild Pokemon you do not want to capture.")
setOption(1, false)

setOptionName(2, "Use Sleep")
setOptionDescription(2, "Use sleep powder or hypnosis before capturing.")
setOption(2, true)

function getSleepRemainingPP()
	if hasMove(1, "Hypnosis") then
		return getRemainingPowerPoints(1, "Hypnosis")
	end
	if hasMove(1, "Sleep Powder") then
		return getRemainingPowerPoints(1, "Sleep Powder")
	end
	return -1
end

function onPathAction()
	if getOption(2) and getSleepRemainingPP() == -1 then
		return fatal("Error: The first pokemon must have Hypnosis or Sleep Powder if 'Use Sleep' is enabled.")
	end
	if isPokemonUsable(1) or (getOption(2) and getSleepRemainingPP() == 0) then
		if getMapName() == "Pokecenter Lavender" then
			moveToMap("Lavender Town")
		elseif getMapName() == "Lavender Town" then
			moveToMap("Route 8")
		elseif getMapName() == "Route 8" then
			moveToGrass()
		end
	else
		if getMapName() == "Route 8" then
			moveToMap("Lavender Town")
		elseif getMapName() == "Lavender Town" then
			moveToMap("Pokecenter Lavender")
		elseif getMapName() == "Pokecenter Lavender" then
			usePokecenter()
		end
	end
end

function onBattleAction()
	if isWildBattle() and (isOpponentShiny() or getOpponentName() == "Ditto") then
		if getOption(2) and getOpponentStatus() != "SLEEP" then
			if useMove("Hypnosis") or useMove("Sleep Powder") then
				return
			end
		end
		if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
			return
		end
	end
	if getActivePokemonNumber() == 1 and getOption(1) then
		return attack() or sendUsablePokemon() or run() or sendAnyPokemon() or useAnyMove()
	else
		return run() or attack() or sendUsablePokemon() or sendAnyPokemon() or useAnyMove()
	end
end
