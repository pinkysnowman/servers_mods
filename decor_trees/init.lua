decor_trees = {}




local tree_types = {
	{"Cherry", "cherry"},
	{"Maple",  "maple"},
	{"Smoke",  "smoke"},
	{"Holly",  "holly"},
} 

local bush_type = {
	
}







function decor_trees.register_tree(desc, tree_name, height, radius, leaf_chance, leaf_decay, trunk_nodebox)

	local trunk, draw_type, tree_mesh, trunk_selbox

	minetest.register_node("decor_trees:"..tree_name.."_leaves", {
		description = desc.." Leaves",
		drawtype = "plantlike",
		visual_scale = 1.3,
		tiles = {"decor_trees_"..tree_type.."_leaves.png"},
		paramtype = "light",
		waving = 1,
		is_ground_content = false,
		groups = {snappy=3, leafdecay=leaf_decay, flammable=2, leaves=1},
		drop = {
			max_items = 1,
			items = {
				{
					-- player will get sapling with 1/20 chance
					items = {"decor_trees:"..tree_name.."_sapling"},
					rarity = 20,
				},
				{
					-- player will get leaves only if he get no saplings,
					-- this is because max_items is 1
					items = {"decor_trees:"..tree_name.."_leaves"},
				}
			}
		},
		sounds = default.node_sound_leaves_defaults(),
	})

	if trunk_nodebox then 
		trunk = trunk_nodebox 
		draw_type = "nodebox"
		tree_mesh = ""
		trunk_selbox = trunk_nodebox
 	else 
		trunk = trunk_small
		draw_type = "nodebox"
		tree_mesh = "homedecor_round_pole.obj"
		trunk_selbox = { -0.125, -0.5, -0.125, 0.125, 0.5, 0.125 }
	end

	minetest.register_node("decor_trees:"..tree_name.."_tree", {
	description = desc.."Tree",
	tiles = {"decortrees_"..tree_name.."_tree_top.png", "decortrees_"..tree_name.."_tree_top.png", "decortrees_"..tree_name.."_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	paramtype = "light",
	drawtype = draw_type,
	node_box = {
            type = "fixed",
            fixed = trunk_nodebox,
    },		
	selection_box = {
            type = "fixed",
            fixed = trunk_selbox,
    },
    collision_box = {
            type = "fixed",
            fixed = trunk_selbox,
    },
})


end