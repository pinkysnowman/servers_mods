
-- This file supplies champaigne

minetest.register_node("nightclub:champaigne", {
	description = "Champaigne",
	drawtype = "nodebox",
	tiles = {
		'champaigne_top.png', -- top
		'gin_bottom.png',  -- bottom
		'champaigne.png',  -- side
		'champaigne.png',  -- side
		'champaigne.png',  -- back
		'champaigne_label.png',  -- front
	},
	paramtype = "light",
	light_source = 4,
	paramtype2 = "facedir",
	buildable_to = true,
	walkable = false,
	use_texture_alpha = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.09, 0.45, -0.09, 0.09, 0.48, 0.09},  -- lip
			{-0.085, 0.1, -0.085, 0.085, 0.5, 0.085},  -- stem
			{-0.23, 0, -0.23, 0.23, 0.1, 0.23},  -- taper
			{-0.28, -0.2, -0.28, 0.28, 0, 0.28},  -- upper
			{-0.3, -0.45, -0.3, 0.3, -0.2, 0.3},  -- body
			{-0.29, -0.5, -0.29, 0.29, -0.45, 0.29},  -- bottom
			},
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
			},
		},
})
