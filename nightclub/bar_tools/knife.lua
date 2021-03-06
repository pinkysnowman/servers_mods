
-- This file supplies knives

minetest.register_node("nightclub:knife", {
	description = "Knife",
	drawtype = "nodebox",
	tiles = {
		'tool.png', -- up
		'tool.png',  -- down
		'tool_left.png',  -- left side
		'tool_right.png',  -- right side
		'tool_top.png',  -- tip
		'tool_bottom.png',  -- handle tip
	},
	paramtype = "light",
	light_source = 8,
	walkable = false,
	buildable_to = true,
	sounds = default.node_sound_wood_defaults(),
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.45, -0.473, 0.1, -0.35, -0.477, 0.15},  -- tip
			{-0.45, -0.48, -0.18, -0.3, -0.47, 0.1},  -- blade
			{-0.45, -0.45, -0.4, -0.38, -0.5, -0.18},  -- handle
			},
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.45, -0.473, 0.1, -0.35, -0.477, 0.15},  -- tip
			{-0.45, -0.48, -0.18, -0.3, -0.47, 0.1},  -- blade
			{-0.45, -0.45, -0.4, -0.38, -0.5, -0.18},  -- handle
			},
		},
})
