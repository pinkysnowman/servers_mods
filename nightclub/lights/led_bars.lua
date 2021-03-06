
-- This file supplies LED bars

-- on ceiling

minetest.register_node('nightclub:led_bars', {
	description = ("LED bars"),
	drawtype = "nodebox",
	tiles = {
		'back.png', -- top
		{name="dance_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},  -- bottom
		'back.png',  -- ends
		'back.png',  -- ends
		{name="led_sides_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},  -- side
		{name="led_sides_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},  -- side
	},
        node_box = {
                type = "fixed",
                fixed = {
			{ -0.48, 0.35, -0.3, 0.48, 0.5, -0.2 },
			{ -0.48, 0.35, 0.3, 0.48, 0.5, 0.2 },
        	},
	},

        selection_box = {
                type = "fixed",
                fixed = {
			{ -0.48, 0.35, -0.3, 0.48, 0.5, 0.3 },
        	},
	},

	sunlight_propagates = false,
	paramtype = "light",
	light_source = 9,
	paramtype2 = "facedir",
	buildable_to = true,
	sounds = default.node_sound_glass_defaults(),
	groups = { snappy = 3 },
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'nightclub:led_bars_wall', param2 = fdir})
			else
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'nightclub:led_bars', param2 = fdir})
			end
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return minetest.item_place_node(itemstack, placer, pointed_thing)
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end
})

-- on wall

minetest.register_node('nightclub:led_bars_wall', {
	description = ("LED bars on wall"),
	drawtype = "nodebox",
	tiles = {
		{name="led_sides_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},  -- side
		{name="led_sides_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},  -- side
		'back.png', -- ends
		'back.png',  -- ends
		'back.png',  -- back
		{name="dance_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},  -- front
	},
        node_box = {
                type = "fixed",
                fixed = {
			{ -0.48, 0.3, 0.35, 0.48, 0.2, 0.5 },
			{ -0.48, -0.3, 0.35, 0.48, -0.2, 0.5 },
        	},
	},
        selection_box = {
                type = "fixed",
                fixed = {
			{ -0.48, -0.3, 0.35, 0.48, 0.3, 0.5 },
        	},
	},
	sunlight_propagates = false,
	paramtype = "light",
	light_source = 9,
	paramtype2 = "facedir",
	buildable_to = true,
	sounds = default.node_sound_glass_defaults(),
	groups = { snappy = 3, not_in_creative_inventory=1 },
	on_place = function(itemstack, placer, pointed_thing)

		local node = minetest.env:get_node(pointed_thing.under)
		if not minetest.registered_nodes[node.name] or not minetest.registered_nodes[node.name].on_rightclick then

			local above = pointed_thing.above
			local under = pointed_thing.under
			local pitch = placer:get_look_pitch()
			local node = minetest.env:get_node(above)

			if node.name ~= "air" then return end

			if above.x ~= under.x or above.z ~= under.z then 
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'nightclub:led_bars_wall', param2 = fdir})
			else
				local fdir = minetest.dir_to_facedir(placer:get_look_dir())
				minetest.env:add_node(above, {name = 'nightclub:led_bars', param2 = fdir})
			end
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return minetest.item_place_node(itemstack, placer, pointed_thing)
		else
			minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer)
		end
	end,
	drop = 'nightclub:led_bars'
})

