--Ice Bricks--
minetest.register_node("icebricks:ice_bricks", {
	description = "Ice Bricks",
	tiles = {"ice_bricks.png"},
	use_texture_alpha = true,
	drawtype = "glasslike",
	is_ground_content = true,
	paramtype = "light",
	drop = "default:ice 4",
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

--crafting -- 
minetest.register_craft({
	output = 'icebricks:ice_bricks',
	recipe = {
		{'default:ice', 'default:ice'},
		{'default:ice', 'default:ice'},
	}
})