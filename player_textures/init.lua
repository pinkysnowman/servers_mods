minetest.register_on_joinplayer(function(player)
	local filename = minetest.get_modpath("player_textures").."/textures/player_"..player:get_player_name()
	local f = io.open(filename..".png")
	if f then
		f:close()
		default.player_set_textures(player, {"player_"..player:get_player_name()..".png","trans.png"})
	end
end)

minetest.register_chatcommand("sc", {
	description = "",
	func = function(name,param)
		local player = minetest.env:get_player_by_name(name)
		if player == nil then
			return false
		end
		if true then
			local filename = minetest.get_modpath("player_textures").."/textures/player_"..player:get_player_name()
			local f = io.open(filename..".png")
			if f then
				f:close()
				player:set_properties({
				textures = {"player_"..player:get_player_name()..".png^[colorize:#"..param..":200","trans.png"},
				})
			end
			
		end
	end,
})

minetest.register_chatcommand("si", {
	description = "Sets your player model to the female one",
	func = function(name,param)
		local player = minetest.env:get_player_by_name(name)
		if player == nil then
			return false
		end
		if true then
			local filename = minetest.get_modpath("player_textures").."/textures/player_"..player:get_player_name()..".png"
			local f = io.open(filename)
			if f then
				f:close()
				if param == "" then
					param = "trans.png"
				end
				player:set_properties({
				textures = {"player_"..player:get_player_name()..".png",param},
				visual_size = {x=1, y=1},
				})
			end
		end
	end,
})

print("[MOD] [player_textures] Loaded!")
