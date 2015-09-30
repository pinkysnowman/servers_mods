-- This is inspired by the landrush mod by Bremaweb

areas.hud = {}

minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local pos = vector.round(player:getpos())
		local a = areas:getAreasAtPos(pos)
		local areaString = ""
		local first = true
		for id, area in pairs(areas:getAreasAtPos(pos)) do
			if not first then
				areaString = areaString..", "
			else 
				first = false
			end
			local ownertxt = area.owner
			local nametxt = area.name
			if area.open then
				ownertxt = ownertxt.."/open"
			end
			if id == 1 then 
				areaString = areaString 
				first = true 
			else
				if ownertxt == "" then
					areaString = "       "..areaString.." \""..nametxt.."\"\n       "
					first = true
				else
					areaString = areaString.." "..id.."  \""..nametxt.."\"\n\t\t\t\t ("..ownertxt..")\n"
				end
			end
		end
		if not areas.hud[name] then
			areas.hud[name] = {}
			areas.hud[name].areasId = player:hud_add({
				hud_elem_type = "text",
				name = "Areas",
				number = 0xFFFFFF,
				position = {x=.07, y=.925},
				direction = 0,
				text = "Angel and Sunflower's Server\n "..areaString,
				scale = {x=200, y=60},
				alignment = {x=1, y=1},
			})
			areas.hud[name].oldAreas = areaString
			return
		elseif areas.hud[name].oldAreas ~= areaString then
			player:hud_change(areas.hud[name].areasId, "text",
					"Angel and Sunflower's Server\n "..areaString)
			areas.hud[name].oldAreas = areaString
		end
	end
end)

minetest.register_on_leaveplayer(function(player)
	areas.hud[player:get_player_name()] = nil
end)

