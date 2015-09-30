minetest.register_abm({
	nodenames = {"default:water_flowing"},
	neighbors = {"default:water_source"},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		if pos.y < 0 then return end
		local posa = {x=pos.x, y=pos.y+1, z=pos.z}
		local posu = {x=pos.x, y=pos.y-1, z=pos.z}
		local na =  minetest.get_node(posa).name
		local nu =  minetest.get_node(posu).name
		if na == "default:water_flowing" then
			if nu == "default:water_source" then
				minetest.add_particlespawner({
					amount = 100,
					time = 12,
					minpos = {x=pos.x-0.5,y=pos.y,z=pos.z-0.5},
					maxpos = {x=pos.x+0.5,y=pos.y+0.3,z=pos.z+0.5},
					minvel = {x=-0.6, y=0.3, z=-0.6},
			 		maxvel = {x=0.6, y=0.6, z=0.6},
			 		minacc = {x=0, y=-0.1, z=0},
			  		maxacc = {x=-0.3, y=-0.3, z=-0.3},
			  		minexptime = 2,
			  		maxexptime = 2,
			  		minsize = 5,
			 		maxsize = 9,
			 		collisiondetection = true,
			  		vertical = false,
			  		texture = "water_mist_mist.png",
				})
			-- elseif minetest.get_node(posu).name ~= "default:water_source" 
			-- and minetest.get_node(posu).name ~= "default:water_flowing" then
			-- 	minetest.add_particlespawner({
			-- 		amount = 3,
			-- 		time = 7,
			-- 		minpos = {x=pos.x-0.5,y=pos.y+0.7,z=pos.z-0.5},
			-- 		maxpos = {x=pos.x+0.5,y=pos.y+0.7,z=pos.z+0.5},
			-- 		minvel = {x=-0.4, y=0.0, z=-0.4},
			--  		maxvel = {x=0.4, y=0.1, z=0.4},
			--  		minacc = {x=0, y=0.5, z=0},
			--   		maxacc = {x=0, y=0.5, z=0},
			--   		minexptime = 0.7,
			--   		maxexptime = 0.7,
			--   		minsize = 0.5,
			--  		maxsize = 0.5,
			--  		collisiondetection = true,
			--   		vertical = false,
			--   		texture = "water_mist_mist.png",
			-- 	})
			end
		end
	end
})
