visible = 1 -- set this to 0 to take blocks out of creative inventory.

local colbox_type1 = { --top blocks
	type = "fixed",
	fixed = {
			{-.49, -.5, 0.05, .5, .6, .52}
	}
}
local colbox_type2 = { --columns
	type = "fixed",
	fixed = {
			{-.2, -.5, -.2, .5, .5, .5}
	}
}
local colbox_type3 = { --bottom blocks
	type = "fixed",
	fixed = {
			{-.5, -.5, -.16, .5, .5, .25}
	}
}
local colbox_type4 = { --corner
	type = "fixed",
	fixed = {
			{-.5, -.5, 0, .5, .5, .5},
			{0, -.5, -.5, .5, .5, .5}
	}
}
local colbox_type5 = { --corner
	type = "fixed",
	fixed = {
			{-.5, -.5, -.5, .5, .5, .5},
	}
}
local colbox_type6 = { --corner
	type = "fixed",
	fixed = {
			{-.5, -.5, -.3, .5, .5, .5},
	}
}

local block_type1 = { -- desc2, typ, obj, colbox, drops, grup
{"Retaining Wall Left", 		"left", 	"block1_l_t",		colbox_type1, "left",   {cracky=2,not_in_creative_inventory=0}},
{"Retaining Wall Middle", 		"middle",	"block1_m_t",		colbox_type1, "middle", {cracky=2,not_in_creative_inventory=0}},
{"Retaining Wall Right", 		"right",	"block1_r_t",		colbox_type1, "right",  {cracky=2,not_in_creative_inventory=0}},
{"Retaining Wall Corner", 		"corner",	"block1_c_t",		colbox_type4, "corner", {cracky=2,not_in_creative_inventory=0}},
{"Retaining Wall Left Bot", 		"bleft", 	"block1_l_b",		colbox_type3, "left",   {not_in_creative_inventory=visible}},
{"Retaining Wall Middle Bot", 		"bmiddle",	"block1_m_b",		colbox_type3, "middle", {not_in_creative_inventory=visible}},
{"Retaining Wall Right Bot", 		"bright",	"block1_r_b",		colbox_type3, "right",  {not_in_creative_inventory=visible}},
{"Retaining Wall Corner Bot", 		"bcorner",	"block1_c_b",		colbox_type4, "corner", {not_in_creative_inventory=visible}},
{"Column Inside Corner",     "column_ic_t",	"column_ic_t",	colbox_type5, "column_ic_t",  {cracky=2,not_in_creative_inventory=0}},
{"Column Outside Corner",    "column_oc_t",	"column_oc_t",	colbox_type2, "column_oc_t",  {cracky=2,not_in_creative_inventory=0}},
{"Column Middle", 	     "column_m_t",	"column_m_t",	colbox_type6, "column_m_t",   {cracky=2,not_in_creative_inventory=0}},
{"Column Inside Corner Bot", "bcolumn_ic_t",	"column_ic_b",	colbox_type5, "column_ic_b",  {not_in_creative_inventory=visible}},
{"Column Outside Corner Bot","bcolumn_oc_t",	"column_oc_b",	colbox_type2, "column_oc_b",  {not_in_creative_inventory=visible}},
{"Column Middle Bot", 	     "bcolumn_m_t",	"column_m_b",	colbox_type6, "column_m_b",   {not_in_creative_inventory=visible}},
}

local block_mat = { -- desc1, mat, img, img2, img3
	{"Cement", "cement", "mylandscaping_block_top.png","","mylandscaping_block_face.png"},
	{"Tan Cement", "cement_tan", "mylandscaping_block_top.png","^[colorize:#b8882a:75", "mylandscaping_block_face.png"},
	{"Grey Cement", "cement_grey", "mylandscaping_block_top.png","^[colorize:#000000:100", "mylandscaping_block_face.png"},
	{"Dark Grey Cement", "cement_darkgrey", "mylandscaping_block_top.png","^[colorize:#000000:200", "mylandscaping_block_face.png"},
	{"Red Cement", "cement_red", "mylandscaping_block_top.png","^[colorize:#500000:125","mylandscaping_block_face.png"},
}

for i in ipairs (block_type1) do
	local desc2 = block_type1[i][1]
	local typ = block_type1[i][2]
	local obj = block_type1[i][3]
	local colbox = block_type1[i][4]
	local drops = block_type1[i][5]
	local grup = block_type1[i][6]


	
	for i in ipairs (block_mat) do
		local desc1 = block_mat[i][1]
		local mat = block_mat[i][2]
		local img = block_mat[i][3]
		local img2 = block_mat[i][4]
		local img3 = block_mat[i][5]




		minetest.register_node('mylandscaping:rwall_'..typ.."_"..mat, {
			description = desc2,
			drawtype = 'mesh',
			mesh = 'mylandscaping_'..obj..'.obj',
			tiles = {{name=img..img2}, {name=img3..img2}},
			groups = grup,
			paramtype = 'light',
			paramtype2 = 'facedir',
			sounds = default.node_sound_stone_defaults(),
			drop = 'mylandscaping:rwall_'..drops.."_"..mat,
			selection_box = colbox,
			collision_box = colbox,


		after_place_node = function(pos, placer, itemstack, pointed_thing)
			for i in ipairs (block_mat) do
				local colors = block_mat[i][2]
				local nodeu = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
				local nodea = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
				local node = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
				if nodeu.name == "mylandscaping:rwall_"..typ.."_"..colors then
				   minetest.set_node(pos,{name="mylandscaping:rwall_"..typ.."_"..mat,param2=nodeu.param2})
				   minetest.set_node({x=pos.x,y=pos.y-1,z=pos.z},{name="mylandscaping:rwall_b"..typ.."_"..colors,param2=nodeu.param2})
				end
				if nodea.name == "mylandscaping:rwall_"..typ..mat then
				   minetest.set_node(pos,{name="mylandscaping:rwall_b"..typ.."_"..mat,param2=node.param2})
				end
			end
		end,

		after_destruct = function(pos, oldnode)
			for i in ipairs (block_mat) do
				local colors = block_mat[i][2]
				local node = minetest.get_node(pos).name
				local nodeu = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
				local nodeu2 = minetest.get_node({x=pos.x,y=pos.y-2,z=pos.z})
				local nodea = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})

				if nodeu.name == "mylandscaping:rwall_b"..typ.."_"..colors and
				   nodea.name == "air" then
				   minetest.set_node({x=pos.x,y=pos.y-1,z=pos.z},{name="mylandscaping:rwall_"..typ.."_"..colors,param2=nodeu.param2})
				end
			end


		end,

		})

	end
end



