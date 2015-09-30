if not minetest.get_modpath("technic") then
	minetest.register_node(":technic:blast_resistant_concrete", {
		description = "Blast-resistant Concrete Block",
		tile_images = {"technic_blast_resistant_concrete_block.png",},
		groups={cracky=1, level=3, concrete=1},
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_node(":technic:stainless_steel_block", {
		description = "Stainless Steel Block",
		tiles = { "technic_stainless_steel_block.png" },
		is_ground_content = true,
		groups = {cracky=1, level=2},
		sounds = default.node_sound_stone_defaults()
	})

end

minetest.register_node("msr:steel_beam", {
	description = "Steel Beam",
	tiles = { "default_steel_block.png^[colorize:#500000:200" },
	is_ground_content = true,
	groups = {cracky=1, level=2},
	sounds = default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4, -0.5, -0.5, 0.4, -0.4, 0.5},
			{-0.1, -0.4, -0.5, 0.1, 0.5, 0.5}
		}
	}
})

minetest.register_node("msr:steel_beam_small", {
	description = "Steel Beam",
	tiles = { "default_steel_block.png^[colorize:#500000:200" },
	is_ground_content = true,
	groups = {cracky=1, level=2},
	sounds = default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4, -0.5, -0.5, 0.4, -0.4, 0.5},
			{-0.4,  0.5, -0.5, 0.4,  0.4, 0.5},
			{-0.1, -0.4, -0.5, 0.1,  0.4, 0.5}
		}
	}
})

minetest.register_node("msr:steel_beam_extrasmall", {
	description = "Steel Beam",
	tiles = { "default_steel_block.png^[colorize:#500000:200" },
	is_ground_content = true,
	groups = {cracky=1, level=2},
	sounds = default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, 0.4375, -0.5, 0.1875, 0.5, 0.5},
			{-0.02, 0.0625, -0.5, 0.02, 0.4375, 0.5},
			{-0.1875, 0, -0.5, 0.1875, 0.0625, 0.5},
		}
	}
})

minetest.register_node("msr:steel_beam_extrasmall_lower", {
	description = "Steel Beam",
	tiles = { "default_steel_block.png^[colorize:#500000:200" },
	is_ground_content = true,
	groups = {cracky=1, level=2},
	sounds = default.node_sound_stone_defaults(),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.4375, -0.5, 0.1875, -0.5,    0.5},
			{-0.02,   -0.0625, -0.5, 0.02,   -0.4375, 0.5},
			{-0.1875,  0,      -0.5, 0.1875, -0.0625, 0.5},
		}
	}
})
