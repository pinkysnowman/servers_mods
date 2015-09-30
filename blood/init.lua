local WATER_ALPHA = 220
local WATER_VISC = 2

minetest.register_node("blood:blood_flowing", {
	description = "Flowing Blood",
	inventory_image = minetest.inventorycube("default_water.png^[colorize:#aa0000:225"),
	drawtype = "flowingliquid",
	tiles = {"default_water.png^[colorize:#aa0000:225"},
	special_tiles = {
		{
			image="default_water_flowing_animated.png^[colorize:#aa0000:225",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
		{
			image="default_water_flowing_animated.png^[colorize:#aa0000:225",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "blood:blood_flowing",
	liquid_alternative_source = "blood:blood_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=120, r=100, g=000, b=000},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1, freezes=1, melt_around=1},
})

minetest.register_node("blood:blood_source", {
	description = "Blood Source",
	inventory_image = minetest.inventorycube("default_water.png^[colorize:#aa0000:225"),
	drawtype = "liquid",
	tiles = {
		{name="default_water_source_animated.png^[colorize:#aa0000:225", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name="default_water_source_animated.png^[colorize:#aa0000:225",
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
			backface_culling = false,
		}
	},
	alpha = WATER_ALPHA,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "blood:blood_flowing",
	liquid_alternative_source = "blood:blood_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=120, r=100, g=000, b=000},
	groups = {water=3, liquid=3, puts_out_fire=1, freezes=1},
})