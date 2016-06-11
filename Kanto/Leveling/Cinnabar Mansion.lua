-- Copyright © 2016 Silv3r <silv3r@openmailbox.org>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the LICENSE file for more details.

name = "Leveling: Cinnabar Mansion"
author = "Silv3r"
description = [[This script will train the first pokémon of your team.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between the Cinnabar Mansion and the pokécenter.]]

function onPathAction()
	if isPokemonUsable(1) then
		if getMapName() == "Pokecenter Cinnabar" then
			moveToMap("Cinnabar Island")
		elseif getMapName() == "Cinnabar Island" then
			moveToMap("Cinnabar mansion 1")
		elseif getMapName() == "Cinnabar mansion 1" then
			moveNearExit("Cinnabar Island")
		end
	else
		if getMapName() == "Cinnabar mansion 1" then
			moveToMap("Cinnabar Island")
		elseif getMapName() == "Cinnabar Island" then
			moveToMap("Pokecenter Cinnabar")
		elseif getMapName() == "Pokecenter Cinnabar" then
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
