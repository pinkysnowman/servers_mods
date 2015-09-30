
-- This file supplies bar stools

minetest.register_node("nightclub:bar_stool", {
	description = "Bar stool",
	drawtype = "nodebox",
	tiles = {
		'stool_top.png', -- top
		'back.png',  -- bottom
		'stool_side.png',  -- side
		'stool_side.png',  -- side
		'stool_side.png',  -- back
		'stool_side.png',  -- front
	},
	paramtype = "light",
	light_source = 4,
	paramtype2 = "facedir",
	buildable_to = true,
	walkable = false,
	sounds = default.node_sound_wood_defaults(),
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.3, -0.1, -0.15, 0.2, -0.15},  -- upper left front leg
			{-0.2, -0.5, -0.2, -0.15, -0.2, -0.15},  -- lower left front leg

			{-0.1, -0.3, 0.1, -0.15, 0.2, 0.15},  -- upper left rear leg
			{-0.2, -0.5, 0.2, -0.15, -0.2, 0.15},  -- lower left rear leg

			{ 0.1, -0.3, -0.1, 0.15, 0.2, -0.15},  -- upper right front leg
			{ 0.2, -0.5, -0.2, 0.15, -0.2, -0.15},  -- lower right front leg

			{ 0.1, -0.3, 0.1, 0.15, 0.2, 0.15},  -- upper right rear leg
			{ 0.2, -0.5, 0.2, 0.15, -0.2, 0.15},  -- lower right rear leg

			{-0.15, -0.25, -0.2, -0.2, -0.19, 0.2},  -- left brace
			{ 0.15, -0.25, -0.2, 0.2, -0.19, 0.2},  -- right brace

			{-0.2, -0.25, -0.15, 0.2, -0.19, -0.2},  -- front brace
			{-0.2, -0.25, 0.15, 0.2, -0.19, 0.2},  -- back brace

			{-0.22, 0.16, -0.22, 0.22, 0.23, 0.22},  -- seat edge
			{-0.2, 0.23, -0.2, 0.2, 0.25, 0.2},  -- seat top
			},
		},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1, -0.3, -0.1, -0.15, 0.2, -0.15},  -- upper left front leg
			{-0.2, -0.5, -0.2, -0.15, -0.2, -0.15},  -- lower left front leg

			{-0.1, -0.3, 0.1, -0.15, 0.2, 0.15},  -- upper left rear leg
			{-0.2, -0.5, 0.2, -0.15, -0.2, 0.15},  -- lower left rear leg

			{ 0.1, -0.3, -0.1, 0.15, 0.2, -0.15},  -- upper right front leg
			{ 0.2, -0.5, -0.2, 0.15, -0.2, -0.15},  -- lower right front leg

			{ 0.1, -0.3, 0.1, 0.15, 0.2, 0.15},  -- upper right rear leg
			{ 0.2, -0.5, 0.2, 0.15, -0.2, 0.15},  -- lower right rear leg

			{-0.15, -0.25, -0.2, -0.2, -0.19, 0.2},  -- left brace
			{ 0.15, -0.25, -0.2, 0.2, -0.19, 0.2},  -- right brace

			{-0.2, -0.25, -0.15, 0.2, -0.19, -0.2},  -- front brace
			{-0.2, -0.25, 0.15, 0.2, -0.19, 0.2},  -- back brace

			{-0.22, 0.16, -0.22, 0.22, 0.23, 0.22},  -- seat edge
			{-0.2, 0.23, -0.2, 0.2, 0.25, 0.2},  -- seat top
			},
		},
})
